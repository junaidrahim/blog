---
title: Smart Pointers in C++
layout: post
preamble: Just a stupid cheatsheet for quick vim motions.
---

> Please don’t dig yourself a grave with raw pointers

C++ is not a garbage collected language, that means the responsibility to free the memory allocated on the heap lies entirely on the programmer. In straight forward terms, it means that for every `new` you write, there has to be a `delete` at the right place.

## Issues with Raw Pointers

In any sufficiently large C++ project, objects are copied, moved and passed everywhere in the code. The standard way has been to allocate the objects on the heap and pass around pointers and references to manipulate them.

Now, if we allocate on the heap, we also have to “free” those resources. We use the `new` and `delete` keyword for that in C++, but the real problem comes with the following situations…

- What if we forget to `delete` a pointer ? That would cause a memory leak.
- What if we run `delete` before all the functions modifying that object are completed ?
- What if two functions run `delete` on the same pointer ? Also known as the “Double Free Problem”
- What if some function runs `delete` on a pointer while another function was using it ?

Let’s look at this very simple piece of code that causes a memory leak,

I will use [Valgrind](https://valgrind.org/) to check the binary for memory leaks. The following are the commands to do so

```
$ g++ --std=c++17 --pedantic memory\_leak.cpp -o memory\_leak
$ valgrind --leak-check=full ./memory\_leak
```

You can clearly see that we leaked 40 bytes (4 bytes x 10) of memory because we did not run delete on p

These are some of the issues that come up when we use plain old C style raw pointers.

> The common thread among all these problems is the developer’s failure at calling `delete` at the correct time.

And to be honest, it is quite difficult to manually keep track of all allocations and `delete` them at the right time.

To solve all these problems, the C++11 standard introduced **smart pointers** in the STL.

_NOTE : All the examples are in C++17_

## Smart Pointers in C++

If you try to think about solutions to the problems mentioned above, two ideas might strike you…

- Running `delete` on a pointer when it goes out of scope might solve the issue of memory leaks
- Keeping count of the number of times the pointer to an object is used when it is shared and copied, and running `delete` when the count becomes zero might solve the other issues where multiple functions are modifying the same object.

Well, those are exactly the ideas on which smart pointers are based on.

We have three types of smart pointers in C++11 that we can use, all of these are included in the `memory` header file.

- `std::unique_ptr<T>`
- `std::shared_ptr<T>`
- `std::weak_ptr<T>`

These are the pointers of type `T` . A unique pointer of type `int` would be `std::unique_pointer<int>` and the same follows for all the smart pointers.

To accompany these new pointer types, we also have `std::make_unique<T>()` and `std::make_shared<T>()` functions we can use to create objects of type `T` and wrap them in unique and shared pointers respectively.

## Unique Pointers

A unique pointer is the simplest of the smart pointers, **the memory is freed as soon as a unique pointer goes out of scope**. If we consider doing this with raw pointers, the code would look something like this

```
#include <iostream>

using namespace std;

void DoSomething(){
    int *p = new int[50];

    // do some processing with the array

    delete[] p; // free the memory
}


int main(){
    DoSomething();
    return 0;
}
```

We can achieve the same results using a `std::unique_ptr<int>` without explicitly running `delete`

```
#include <iostream>
#include <memory>

using namespace std;

void DoSomething(){
    unique_ptr<int[]> p = make_unique<int[]>(50);
    // do some processing with the array
} // p is automatically freed when it goes out of scope.


int main(){
    DoSomething();
    return 0;
}
```

The signature of the `make_unique` function is `std::make_unique<T>(...args)` where `T` is the type of the object and `args` are the constructor arguments.

A more realistic example, the explanation is in the comments

```cpp
#include <iostream>
#include <memory>

using namespace std;

class SomeBigObject{
public:
    float data[1000];

    void something() {
        // just something
    }

    void someOtherThing(){
        // just some other thing
    }
};

void ProcessBigObject(const SomeBigObject& o){
    // do some crazy processing with o
}

int main(){
    // create a unique pointer
    // unique_ptr<SomeBigObject> pBigObject(new SomeBigObject()); // you can also do it this way
    unique_ptr<SomeBigObject> pBigObject = make_unique<SomeBigObject>(); // but this is preferred

    // use it like just any other pointer
    pBigObject->something();
    pBigObject->someOtherThing();

    ProcessBigObject(*pBigObject); // pass it as a reference

    // pBigObject is automatically freed when the main function block ends
    // no need to call delete explicitly

    return 0;
}
```

**You cannot make copies of unique pointers.** In the above example, if we added this line of code after line 25

```
unique_ptr<SomeBigObject> pBigObject2 = pBigObject;
// The program would not compile and throw the following error
error: use of deleted function ‘std::unique_ptr<_Tp, _Dp>::unique_ptr(const std::unique_ptr<_Tp, _Dp>&) [with _Tp = SomeBigObject; _Dp = std::default_delete<SomeBigObject>]’
```

Then the compiler will slap you will a massive error because **copying a unique pointer is restricted**. Creating copies would mean that two unique pointers would point to the same object and when the scope ends, we would land in the “double free” problem.

**You can only move unique pointers**, thus there exists only one true owner of the pointer that points to the object. That code would look something like this and it would compile perfectly.

```
unique\_ptr<SomeBigObject> pBigObject2 = std::move(pBigObject);
```

If you have no idea what `std::move` does then learn about move semantics in C++ [here](https://www.youtube.com/watch?v=ehMg6zvXuMY)

Unique pointers offer a simple way to reduce memory leaks. There are some developers that have an ethic of not using the `new` and `delete` keywords at all in their code and just use unique pointers to handle deallocation of memory automatically.

## Shared Pointers

As we saw in unique pointers, there was a restriction that we cannot copy them, for obvious reasons. But there might be scenarios where you might need to create multiple pointers of the same object and “share” them. For cases like that we have shared pointers.

Shared pointers keep something called a **reference count.** It is nothing but a count of how many times a shared pointer has been _copied_, that also includes cases where the pointer was passed to a call by value function.

Reference count is incremented and decremented accordingly as we create more copies of the pointer and they go out of scope. Finally when the reference count hits 0, that’s when the underlying memory is freed.

Thus, a shared pointer can be freely passed around and C++ will take care of the reference count and free the memory when it hits 0.

Take a look at the following example.

```cpp
#include <iostream>
#include <memory>

using namespace std;

class SomeBigObject{
public:
    float data[1000];

    void something() {
        // just something
    }

    void someOtherThing(){
        // just some other thing
    }
};

void SomeFunction(shared_ptr<SomeBigObject>& p){
    shared_ptr<SomeBigObject> p2 = make_shared<SomeBigObject>(); // allocate memory
    p = p2; // copy p2 into the pointer passed (ref count = 2)

    // p and p2 point at the same object
} // the memory at which p2 points will not be freed here,
 //  but the ref count will decrement and be 1


int main(){
    shared_ptr<SomeBigObject> p1;

    SomeFunction(p1);
    // the memory allocated by p2 will be freed when the main function ends

    p1->something();
    p1->someOtherThing();

    return 0;
    // p1 will go out of scope, ref count will go 0
    // and memory will be freed
}
```

It is always advised to use the `make_shared<T>()` function when creating shared pointers because it allocates our object and the control block (the object in which the reference count is stored) at the same time and thus is a bit more efficient.

Shared pointers do have _some overhead_ to them as they maintain the reference count, and it also depends a bit on the compiler and the standard library implementation you’re using, but you do get a good model to manage memory automatically. That’s one less thing the developer needs to worry about.

## Weak Pointers

There is one more type of a smart pointer, called a weak pointer. You can copy shared pointers into weak pointers but it will not increase the reference count of the shared pointer.

Weak pointers are freed when they go out of scope. It is for the cases when you just need a pointer to something for the sake of checking validity. It is when you want just temporary ownership. It is okay if a weak pointer becomes a dangling pointer, you can actually check if a weak pointer is dangling or not.

```cpp
#include <iostream>
#include <memory>

using namespace std;

int main(){
    weak_ptr<int[]> wp;

    {
        shared_ptr<int[]> sp = make_shared<int[]>(10);
        wp = sp; // ref count not incremented
    } // sp is freed, wp is expired

    cout << wp.expired() << endl; // 1 (true)

    return 0;
}

/*
Output
1
*/
```

We create a dummy scope for the shared pointer and as you can see, the shared pointer `sp` expires when the scope ends and `wp` is deemed invalid and we get `wp.expired()` as `true`

## In Conclusion

Memory errors are frequent and expensive. They might cause serious damage if the developers are not careful enough, in such scenarios, it might be wise to **always** use smart pointers to automatically manage memory allocation and drop the habit of explicitly using `new` and `delete`

But we can also make the case that some times we need more granular control over memory and we have `new` and `delete` at our disposal. Isn’t this exactly what makes modern C++ so great, you have options for granular control as well as options for when you want to go in autopilot mode.

Please refer to further reading for more detail on the topic

## Further Reading

- [Smart pointers (Modern C++)](https://docs.microsoft.com/en-us/cpp/cpp/smart-pointers-modern-cpp?view=vs-2019)
- [Dynamic memory management](https://en.cppreference.com/w/cpp/memory)
