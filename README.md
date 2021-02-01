# MakersBNB Challenge

This repository supports [Makers](https://makers.tech/) Week 5 group challenge 'makersbnb'.

1. **Installation:** This project requires Ruby 3.0.0. Install Ruby 3.0.0, fork this repository, and run ``bundle``.
2. **Licensing:** This project is licensed under the [GNU GPL v.3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).
3. **Authors:** This repository is a joint project between its collaborators.

---

## Table of Contents

#### 1. Parsing User Stories
- [x] User Story 01
- [x] User Story 02
- [x] User Story 03
- [x] User Story 04
- [x] User Story 05
- [x] User Story 06
- [x] User Story 07
- [x] User Story 08
- [x] User Story 09
- [x] User Story 10
- [x] User Story 11
- [ ] User Story 12
- [ ] User Story 13
- [ ] User Story 14
- [ ] User Story 15
- [ ] User Story 16
- [ ] User Story 17
- [ ] User Story 18
- [ ] User Story 19
- [ ] User Story 20

#### 2. Database Domain Modelling
- [ ] Users Table
- [ ] Spaces Table
- [ ] User Story 03

#### 3. Feature & Unit Testing

---

## Parsing User Stories

### Headline Specifications

Actions are *italic*. Nouns are **bold**. Attributes of nouns are **_bold italics_**.

##### User Story 01

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So that I can list my house,<br>
&nbsp;&nbsp;&nbsp;I’d like to be able to *create a* **listing** of a **space**.

##### User Story 02

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So that I can make money from all of my properties,<br>
&nbsp;&nbsp;&nbsp;I would like to be able to *list multiple spaces*.<br>

##### User Story 03

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So that other users can admire my space and want to stay there,<br>
&nbsp;&nbsp;&nbsp;I want to be able to _provide a **name**, **description** and **price**_ for my **space**.

##### User Story 04

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So that other users can consider when they might be able to visit,<br>
&nbsp;&nbsp;&nbsp;I want to be able to **offer a range of _dates_** when the **space** is **_unoccupied_**.

##### User Story 05

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So I can rent a space,<br>
&nbsp;&nbsp;&nbsp;I’d like to be able to _request_ a **space** and it to be _approved by the **owner**_.

##### User Story 06

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So that I don’t get double-booked,<br>
&nbsp;&nbsp;&nbsp;I want to make sure that a **space** can’t _be **booked** more than once_.

##### User Story 07

&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;So that my space is still available to other prospective clients,<br>
&nbsp;&nbsp;&nbsp;I would like my **space** to _not be **booked** out_ until a **user** _confirms a booking request_.

---

### 'Nice to Have' Specifications

##### User Story 08
&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;To confirm my account has been created,<br>
&nbsp;&nbsp;&nbsp;I would like _to be sent_ an **e-mail** after _signing up_.

##### User Story 09
&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;To make sure my space has been registered correctly,<br>
&nbsp;&nbsp;&nbsp;I would like _to be sent_ an **e-mail** after _creating a new space_.

##### User Story 10
&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;To make sure my space was updated correctly,<br>
&nbsp;&nbsp;&nbsp;I would like _to be sent_ an **e-mail** after _updating a space_ with changes.

##### User Story 11
&nbsp;&nbsp;&nbsp;As a user,<br>
&nbsp;&nbsp;&nbsp;To make sure I know when a user books my space,<br>
&nbsp;&nbsp;&nbsp;I would like _to be sent_ an **e-mail** after a _user confirms booking_ my **space**.

---

## Database Domain Modelling

The above user stories parse into several classes. In basic Class Responsibility Collaborator modelling, there are three obvious classes - **User**, **Space**, and **Booking**.

Class: **Space**

Responsibility | Collaborators
--- | ---
Knows owner | User
Knows own name |
Knows own description |
Knows own price |
Knows own availability |
Knows own bookings |

Class: **User**

Responsibility | Collaborators
--- | ---
Knows own name |
Knows own username |
Knows own e-mail |
Knows own password |
Knows own telephone number |
Knows own spaces | Space

Class: **Booking**

Responsibility | Collaborators
--- | ---


Each class needs its own table, each with columns corresponding to the responsibilities of each class.

Table:

---

## Feature & Unit Testing

Taking for example User Story 01 (``I’d like to be able to create a listing of a space.``), this presupposes the existence of a user, a space, and the ability to list it.

Creating these follows the TDD process:
1. Composition of pseudocode.
2. Composition of feature tests.
3. Composition of unit tests.
4. Composition of code.
5. Running of feature and unit tests.
6. Refactoring, and if necessary correction of code.
