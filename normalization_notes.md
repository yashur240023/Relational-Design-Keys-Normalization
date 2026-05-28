# Normalization Notes

# Repeated or Redundant Data

## Example 1

Course names repeated in multiple batch rows.

### Problem

Wastes storage and causes update anomalies.

### Solution

Separate `courses` table.

---

## Example 2

Student information repeated in attendance records.

### Problem

Student email or name changes require multiple updates.

### Solution

Store student data separately and reference through foreign keys.

---

## Example 3

Problem metadata repeated in submissions.

### Problem

Difficulty or title duplication across submission records.

### Solution

Store problem information in `problems` table.

---

# Separating Data into New Tables

## Example 1: Contest Problems Mapping

A contest contains multiple problems.

### Improvement

Created `contest_problems` table.

### Benefit

Supports many-to-many relationship cleanly.

---

## Example 2: Submission Results

Each submission may execute against many test cases.

### Improvement

Created `submission_results`.

### Benefit

Improves scalability and normalization.

---

# Functional Dependencies

## Example 1

```text
student_id → student_name, email, phone
```

Student details depend only on `student_id`.

---

## Example 2

```text
problem_id → title, difficulty, topic
```

Problem metadata depends only on `problem_id`.

---

# Partial Dependency Example

In contest_problems:

```text
(contest_id, problem_id) → score
```

Score depends on entire composite key.

---

# Normal Form Analysis

# First Normal Form (1NF)

Satisfied because:

* no repeating groups
* atomic attributes used
* each row uniquely identifiable

---

# Second Normal Form (2NF)

Satisfied because:

* non-key attributes fully depend on primary keys
* partial dependencies removed

---

# Third Normal Form (3NF)

Satisfied because:

* transitive dependencies minimized
* descriptive attributes moved into separate tables

---

# Trade-Offs

## Advantages

* lower redundancy
* better integrity
* easier maintenance

## Disadvantages

* more joins required
* slightly higher query complexity

These trade-offs are acceptable for a transactional system like CodeJudge.
