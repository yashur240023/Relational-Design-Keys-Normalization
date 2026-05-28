# Relational-Design-Keys-Normalization
# CodeJudge Database Design — Part 1

## Objective

This project converts the raw CodeJudge CSV dataset into a structured relational database design using DBMS principles such as:

* relational modeling
* entities and relationships
* keys and constraints
* normalization
* SQL schema design

The goal is to transform semi-structured raw CSV data into a normalized and maintainable relational database schema.

---

# Repository Structure

```text
├── README.md
├── schema.sql
├── schema_explanation.md
├── keys_and_relationships.md
├── normalization_notes.md
├── assumptions.md
└── erd.md
```

---

# Main Entities Identified

The following major entities were identified from the dataset:

* Students
* Courses
* Batches
* Enrollments
* Problems
* Test Cases
* Contests
* Contest Problems
* Submissions
* Submission Results
* Attendance
* Sessions
* Regrade Requests
* Plagiarism Flags

---

# Database Design Goals

The schema was designed to:

* reduce redundancy
* improve consistency
* enforce referential integrity
* support efficient querying
* maintain normalization up to approximately 3NF

---

# Key Features

* Primary and foreign key constraints
* Composite keys where required
* UNIQUE and CHECK constraints
* Proper many-to-many relationship handling
* Normalized relational structure
* SQL DDL schema included

---

# Normalization Summary

The final schema design satisfies:

* 1NF → atomic columns and no repeating groups
* 2NF → removal of partial dependency
* 3NF → removal of transitive dependency

---

# ERD

The relationship diagram is available in:

```text
erd.md
```

---

# Assumptions

Some assumptions were made because raw CSV files may contain:

* duplicate rows
* missing values
* inconsistent identifiers
* denormalized data

All assumptions are documented in:

```text
assumptions.md
```
