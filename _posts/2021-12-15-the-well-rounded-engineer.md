---
title: The Well Rounded Engineer
slug: the-well-rounded-engineer
date_published: 2021-12-15T15:13:54.000Z
date_updated: 2021-12-15T15:17:54.000Z
layout: post
preamble: What does it mean to have high technical skill as a (software) engineer ? Most of the content of this article is borrowed from a talk by Swanand Pagnis on the very same topic.
---

Most of the content of this article is borrowed from a talk by [Swanand Pagnis](https://twitter.com/_swanand) on the very same topic. You can find the original slides [here](https://speakerdeck.com/swanandp/the-well-rounded-engineer).

> What does it mean to have high technical skill as a (software) engineer ?

If you have started your journey into programming and building things with code, you must have wondered about this question a lot. How do I become a “good” engineer ? How do I grow my technical skillset ?

I tried to look for answers to this question when I started my first year of undergrad. This talk was one of the most moving things I read that made a huge impact in the way I understood technical growth. And it had a ton of awesome resources too. I wanted to share this talk with this community especially with people who are just starting out.

This talk was targeted for an audience who had experience writing web apps — especially backend services. But I’ll try to fill in the context wherever needed so new people in tech can understand this too.

---

### Some First Principles

These are just some basic principles you should definitely try to implement in your learning process to make it more effective.

- Find peers to learn things
- Be accountable
- Hold them accountable
- Get rid of the trial and error method
- Take a very analytical approach
- Learn how to read research papers especially old one’s, focus on papers that describe tech that has stood the test of time
- Take Notes, write down summaries in your own words.

Here are the topics/things you should try to be proficient in if you are looking for that next phase of technical growth.

### Multiple Paradigms

The first one is pretty common and obvious, be proficient in multiple programming paradigms, preferably Object Oriented and Functional. Learning about multiple paradigms opens your mind to a whole variety of ways of writing programs.

- OO Languages: C++, Java, Kotlin, Python, Golang(kinda)
- Functional Languages: Haskell, Clojure

Most languages you will use to learn OOP will also support functional paradigms so you can get started with FP in them too. But learning a purely functional language is really insightful. Some book recommendations and resources for learning about programming paradigms

- Prof. Dan Grossman’s course “Programming Languages” on Coursera.
- [http://learnyouahaskell.com/introduction](http://learnyouahaskell.com/introduction)
- [Programming Paradigms for Dummies: What every Programmer should know](https://www.info.ucl.ac.be/~pvr/VanRoyChapter.pdf)
- [Structure and Interpretation of Computer Programs](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book.html)

### Multiple Types of Databases

Be proficient in using at least two kinds of Databases. SQL and NoSQL.

- SQL Databases: Postgres, MySQL
- NoSQL Databases: MongoDB, DynamoDB, BigTable
- Other: Redis, Neo4j, JanusGraph, Spanner

Being conversant in databases usually mean you can model your data, you are aware of the factors that affect the performance of the db, you can write raw SQL queries.

Being proficient means you understand how to operate that database on scale, you understand idiomatic design patterns, you deeply understand SQL and can look at queries and understand the performance tradeoffs. A lot of being proficient in databases is about understanding tradeoffs. In depth understanding of SQL is a huge competitive advantage.

- [The Art of PostgreSQL](https://theartofpostgresql.com/)
- [High Performance SQL](https://www.oreilly.com/library/view/high-performance-mysql/9781449332471/)
- [https://docs.mongodb.com/](https://docs.mongodb.com/)
- [Redis in Action](https://redis.com/ebook/redis-in-action/)
- [Seven Databases in Seven Weeks](https://pragprog.com/titles/pwrdata/seven-databases-in-seven-weeks-second-edition/)
- [Readings in Database Systems](http://www.redbook.io/)
- [Amazon Aurora: Design Considerations for High Throughput Cloud-Native Relational Databases](https://www.allthingsdistributed.com/files/p1041-verbitski.pdf)
- [DynamoDB Book](https://www.dynamodbguide.com/)

### Multiple Protocols

Be proficient in at least two protocols — preferably TCP/IP and HTTP. Proficiency means understanding how these protocols work, how to debug, design considerations, familiarity with TLS & SSL etc.

These protocols are everywhere on the web and you will deal with them on a daily basis, having a fundamental understanding of these protocols — how they are designed, why they are designed that way goes a long way into helping you making the right decisions when building and debugging

- [RESTful Web Services](https://www.oreilly.com/library/view/restful-web-services/9780596529260/)
- [HTTP: The Definitive Guide](https://www.oreilly.com/library/view/http-the-definitive/1565925092/)
- [RFC 7231: Hypertext Transfer Protocol](https://datatracker.ietf.org/doc/html/rfc7231)

### Data Driven Programming

Data Driven Programming is basically the whole domain of ML/AI. This is a fundamentally different way of writing programs, traditionally we write the steps of the program, ML algorithms and neural nets are all about figuring out these steps from the data itself.

- Traditional programming: Input + Program = Output
- Data Driven Programming: Input + Output = Program

Most of the tools for ML/AI are in Python. But you can also do it in Julia. Just have a go at either TensorFlow or PyTorch, you will learn a ton about how statistics and calculus can be used to do pattern matching and solve problems that are very hard to solve by writing down the instructions.

- [https://pytorch.org/docs/stable/index.html](https://pytorch.org/docs/stable/index.html)
- [https://www.tensorflow.org/api_docs](https://www.tensorflow.org/api_docs)
- [https://www.deeplearningbook.org/](https://www.deeplearningbook.org/)
- [Hands on Machine Learning with Scikit Learn and Tensorflow](https://www.oreilly.com/library/view/hands-on-machine-learning/9781492032632/)
- [The Principles of Deep Learning Theory](https://ai.facebook.com/blog/advancing-ai-theory-with-a-first-principles-understanding-of-deep-neural-networks/)

### Build Tooling, Packaging and Distribution of Software

Understanding how the code you write reaches your users. For python developers this would be to understand use tools like pipenv, virtualenv, poetry etc. For JS devs it would be understand babel and webpack. Understanding these tools and knowing enough to tweak, change what’s needed. Try writing a very simple build tool. Think about opinionated directory structures and building/compiling multiple files together.

- [https://webpack.js.org/](https://webpack.js.org/)
- [https://packaging.python.org/en/latest/tutorials/packaging-projects/](https://packaging.python.org/en/latest/tutorials/packaging-projects/)

### Deployment, Infrastructure and DevOps

This is about how your code is deployed on servers. Read about how containerisation and container orchestration systems works. You have probably heard of Docker and Kubernetes. Dig deep into these ecosystems and learn how to build apps that can be deployed and scaled on Kubernetes.

Understanding the capabilities of Kubernetes will help you work with a variety of cloud technologies that make the modern web possible. This also includes a lot of various practices that enable GitOps and Agile software delivery.

You can also have a look at the various projects incubated by CNCF.

- [https://roadmap.sh/devops](https://roadmap.sh/devops)
- [https://kubernetes.io/docs/home/](https://kubernetes.io/docs/home/)
- [https://docs.docker.com/](https://docs.docker.com/)
- [Containers from Scratch](https://youtu.be/8fi7uSYlOdc)

### System Design and Scaling Techniques

If you are interested in backend development, then this is a very important skill to have. Make an effort to understand the common design pattens and scaling techniques. This is about understanding the design principles that go into building systems that have a certain set of properties — Consistency, Fault Tolerance, Availability etc. Eg:

- Designing distributed caches
- Designing data pipelines
- Designing simple load balancers
- MapReduce and similar data processing patterns etc

Some resources and content around system design

- [Designing Data Intensive Applications](https://www.oreilly.com/library/view/designing-data-intensive-applications/9781491903063/)
- [Designing Distributed Systems](https://azure.microsoft.com/en-in/resources/designing-distributed-systems/)
- [Design It!](https://www.oreilly.com/library/view/design-it/9781680502923/)
- [https://github.com/donnemartin/system-design-primer](https://github.com/donnemartin/system-design-primer)
- [https://github.com/relogX/system-design-questions](https://github.com/relogX/system-design-questions)

### Compilers, Interpreters and Parsers

This is another super interesting field to explore which broadens your understanding of various tools that you use on a daily basis. Start with learning about parsers and slowly move your way up to interpreters and compilers. Don’t start with the Aho, Ullman (the dragon book) directly, it’s a bit too hard for beginners and people who want to get their hands dirty.

Some amazing resources to get started

- [Graham Hutton’s “Higher Order Functions for Parsing”](https://www.cs.nott.ac.uk/~pszgmh/parsing.pdf)
- [Writing a Lisp Interpreter in Python](https://norvig.com/lispy.html)
- [Crafting Interpreters by Robert Nystrom](https://craftinginterpreters.com/)

Once you are confident, take a stab at writing a JSON or YAML parser. Learn about Recursive Descent parsers. You can also try writing these compilers/interpreters in functional languages like Haskell or OCaml.

### Algorithmic Analysis and Algorithmic Problems

Very very important interview skill, this is what is asked in most interviews. This is all the rage you see online regarding “cracking” tech interviews. The whole universe of problems on LeetCode, CodeForces etc. comes under this. The main skill here is the ability to understand and reason about algorithms and algorithmic complexity.

There are enough resources and content online about improving this skill. I’ll add some famous one’s here:

- [https://leetcode.com/](https://leetcode.com/)
- [https://github.com/MTrajK/coding-problems](https://github.com/MTrajK/coding-problems)
- [https://adventofcode.com/](https://adventofcode.com/)
- [https://projecteuler.net/](https://projecteuler.net/)

There are many FAANG bhaiyas and didis on YouTube to guide you on how to acquire this skill and get better at it.

### In Conclusion

I know the list is massive and overwhelming, but you don’t to have to learn all of this in one day or even a year, you can keep learning and expanding your knowledge at your own pace. You can pick special topics and go really deep into what interests you the most.

I’m a big fan and believer of Peter Norvig’s “[Teach Yourself Programming in 10 Years](https://norvig.com/21-days.html)” and I think this is the kind of map someone wanting to grow their technical skill would greatly benefit from. 

There is a lot of advice online on how to clear your interviews and get into companies. Just wanted to shed some light on topics that you need to be good at once you start your job and start building things.
