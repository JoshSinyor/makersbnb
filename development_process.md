# MakersBNB Challenge



## Index

1. Parsing User Stories
..[x] User Story 01
..[x] User Story 02
..[x] User Story 03
..[x] User Story 04
..[x] User Story 05
..[x] User Story 06
..[x] User Story 07
2. Database Domain Modelling
3. Feature & Unit Testing

## Parsing User Stories

Nouns are **bold**. Actions are *italic*. Attributes are **_bold italics_**

#### User Story 01

  As a user,
  So that I can list my house,
  I’d like to be able to *create a* **listing** of a **space**.

#### User Story 02

  As a user,
  So that I can make money from all of my properties,
  I would like to be able to *list multiple locations*.

#### User Story 03

  As a user,
  So that other users can admire my space and want to stay there,
  I want to be able to _provide a **name**, **description** and **price**_ for my **space**.

#### User Story 04

  As a user,
  So that other users can consider when they might be able to visit,
  I want to be able to **offer a range of _dates_** when the **space** is **_unoccupied_**.

#### User Story 05

  As a user,
  So I can rent a space,
  I’d like to be able to _request_ a **space** and it to be _approved by the _**owner**_.

#### User Story 06

  As a user,
  So that I don’t get double-booked,
  I want to make sure that a **space** can’t _be **booked** more than once_.

#### User Story 07

  As a user,
  So that my space is still available to other prospective clients,
  I would like my **space** to _not be **booked** out_ until a **user** _confirms a booking request_.

## Database Domain Modelling

The above user stories parse into several classes. In basic Class Responsibility Collaborator modelling, there are two obvious classes - **User**, and ****.

Class: **User**
Responsibility | Collaborators
--- | ---
Knows own `username` | Peep
Knows own `password` |
Knows own `e-mail` |
Knows own `firstname` |
Knows own `lastname` |

Class: **Peep**
Responsibility | Collaborators
--- | ---
Knows own `uuid` | User
Knows own `timestamp` |
Knows own `content` |

Each class needs its own table, each with columns corresponding to the responsibilities of each class.

Table: **Chitterati**
``uuid`` | ``email`` | ``password`` | ``firstname`` | ``lastname`` | ``username`` | ``pfp_url``
--- | --- | --- | --- | --- | --- | ---
1 | adam@makers.tech | password2 | Adam | Anderson | gardenofadam | https://www.example.com/anderson_adam.jpg
2 | bailey@makers.tech | 12345 | Bailey | Brown | deniedbailey | https://www.example.com/brown_bailey.jpg
3 | carol@makers.tech | qwerty | Carol | Clark | clarkcent | https://www.example.com/clark_carol.jpg
4 | duncan@makers.tech | hunter2 | Duncan | Davis | duncandisorderly | https://www.example.com/davis_duncan.jpg
5 | ellen@makers.tech | asdfghjkl | Ellen | Ellis | ellsbells | https://www.example.com/ellis_ellen.jpg

Table: **Peeps**
``upid`` | ``uuid`` | ``timestamp`` | ``content``
--- | --- | --- | ---
1 | 3 | 2021-01-15 10:05:55 | "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
2 | 5 | 2021-01-17 11:42:31 | "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
3 | 4 | 2021-01-19 15:11:29 | "Why is everyone speaking in Latin?"
4 | 4 | 2021-01-19 15:12:35 | "Did I miss an e-mail on this?"
5 | 1 | 2021-01-31 15:23:21 | "Duis aute irure dolor in reprehenderit in voluptate velit."

## Feature & Unit Testing

Taking for example User Story 01 (``I want to post a message (peep) to chitter``), this presupposes the existence of Chitter, a user, and the ability to post content to it. Creating these follows the TDD process:
1. Composition of pseudocode.
2. Composition of feature tests.
3. Composition of unit tests.
4. Composition of code.
5. Running of feature and unit tests.
6. Refactoring, and if necessary correction of code.
