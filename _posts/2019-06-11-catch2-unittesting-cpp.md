---
title: A guide to using Catch2 for Unit Testing in C++
layout: post
preamble: Almost all programming languages have some library for unit testing. This article is a guide to an awesome C++ header only test framework called catch2.
---

## Unit Testing is awesome.

It helps us detect and fix many bugs in the earlier stages of development and eventually saves a lot of time, money and embarrassment 😬. For those who are unfamiliar with unit testing, as the name suggests,

> Unit testing is a software testing method by which individual units of source code are tested to determine whether they are fit for use. A unit is the smallest possible testable software component, probably an individual function or a class.

It also makes refactoring the code later much easier as one can just run the specific tests and check if the changes made are ready for production or not. Almost all programming languages have some library for unit testing.

This article is a guide to an awesome C++ header only test framework called [Catch2](https://github.com/catchorg/Catch2)

## Why Catch2 ?

_Because it is ridiculously simple to get started with._

There are other C++ testing libraries like Google Test, CppUnit, Cute etc. But they are huge and need a lot of dependencies to get started with.

Catch2 a header only framework, just download the `catch2.hpp` file, do an `#include` and you are good to go. This simplicity and flexibility is a huge bonus for small and medium scale projects. And its open source 😁

## Get Started

- Head straight to [github.com/catchorg/Catch2](https://github.com/catchorg/Catch2) and download the `catch2.hpp` file from the link in the README.
- All you need to do is drop the file somewhere reachable from your project, either in some central location you can set your header search path to find, or directly into your project tree itself!

## Our Test Project

Let us try and write unit tests for this humble Binary Search Project.

```
.
├── build
├── CMakeLists.txt
├── include
│   └── binary_search.hpp
├── src
│   ├── binary_search.cpp
│   └── main.cpp
└── tests
    ├── catch.hpp
    └── test.cpp4 directories, 6 files
```

I added the `catch.hpp` header file in the `tests/` folder and added a `test.cpp` file to write the tests, you can call your file whatever you fancy.

A simple implementation of the Binary Search Algorithm

## Writing the Tests

We only need to add 2 things to the start of the `test.cpp` file

- `#define CONFIG_CATCH_MAIN` , this tells catch to provide a `main()` to this file.
- `#include "catch.hpp"` , pretty obvious.

After getting that out of the way, we can finally write the test conditions. I will show you the example and then explain the code…

test.cpp file with all the test cases

In **Catch**, we introduce the test conditions using the `TEST_CASE` macro. It is just used to group the test cases together for a particular unit of code.

The `REQUIRE` macro checks for the condition provided in the parenthesis. Compiling and running `test.cpp` file will produce the following output…

```
==========================================
All tests passed (6 assertions in 1 test case)
```

And if something goes wrong (I changed a line), then the failing test result looks like…

```
----------------------------------------------
Testing Binary Search
----------------------------------------------
test.cpp:9
..............................................test.cpp:18: FAILED:
  REQUIRE( binary\_search(arr, 176) == 0 )
with expansion:
 -1 == 0\==============================================
test cases: 1 | 1 failed
assertions: 5 | 4 passed | 1 failed
```

This was the basic and most common use of **Catch2.** It will help you get started and start adding unit tests in your code. It does have a lot of other features which are well documented on the GitHub repository.

## Tips for Big Projects

This “one file for all tests” approach may not be the best approach, to keep the guide simple I used a simple project with only one function. But in real world projects you will have a lot of functions, so it will be good to split up the tests in multiple files.

The requirement is that the following block of code…

```
#define CATCH\_CONFIG\_MAIN
#include "catch.hpp"
```

appears in _exactly one_ source file. Use as many additional cpp files (or whatever you call your implementation files) as you need for your tests, partitioned however makes the most sense for your way of working. Each additional file need only `#include "catch.hpp"` - do not repeat the `#define`, you only need one `main()`

## Some Examples

The following code is from the official documentation available [here](https://github.com/catchorg/Catch2/blob/master/docs/tutorial.md). Just to show some of the other cool stuff we can do with Catch2

## Resources

You can find a lot of tutorials and examples on the [GitHub repository](https://github.com/catchorg/Catch2). I will put some helpful links below.

Official Documentation: [https://github.com/catchorg/Catch2/tree/master/docs](https://github.com/catchorg/Catch2/tree/master/docs)

**Some Articles on Unit Testing:**

- [https://medium.com/@lazlojuly/how-to-get-started-with-unit-testing-part-1-7f490bbf560a](https://medium.com/@lazlojuly/how-to-get-started-with-unit-testing-part-1-7f490bbf560a)
- [https://medium.com/@andepaulj/introduction-to-unit-testing-29205240553f](https://medium.com/@andepaulj/introduction-to-unit-testing-29205240553f)
- [https://medium.com/@Cyrdup/unit-testing-youre-doing-it-wrong-407a07692989](https://medium.com/@Cyrdup/unit-testing-youre-doing-it-wrong-407a07692989)
