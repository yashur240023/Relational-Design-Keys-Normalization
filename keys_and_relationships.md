# Keys and Relationships

# Primary Keys

| Table              | Primary Key   |
| ------------------ | ------------- |
| students           | student_id    |
| courses            | course_id     |
| batches            | batch_id      |
| enrollments        | enrollment_id |
| problems           | problem_id    |
| test_cases         | testcase_id   |
| contests           | contest_id    |
| submissions        | submission_id |
| submission_results | result_id     |
| sessions           | session_id    |
| attendance         | attendance_id |
| regrade_requests   | request_id    |
| plagiarism_flags   | flag_id       |

---

# Composite Keys

| Table            | Composite Key            |
| ---------------- | ------------------------ |
| contest_problems | (contest_id, problem_id) |

Reason:

* Prevents duplicate problem entries within the same contest.

---

# Candidate Keys

| Table    | Candidate Key |
| -------- | ------------- |
| students | email         |
| courses  | course_name   |
| contests | contest_name  |

These columns can uniquely identify records.

---

# Alternate Keys

| Table    | Alternate Key |
| -------- | ------------- |
| students | email         |
| courses  | course_name   |

These are candidate keys not chosen as primary keys.

---

# Foreign Keys

| Child Table        | Foreign Key   | Parent Table |
| ------------------ | ------------- | ------------ |
| students           | batch_id      | batches      |
| batches            | course_id     | courses      |
| enrollments        | student_id    | students     |
| enrollments        | course_id     | courses      |
| test_cases         | problem_id    | problems     |
| contest_problems   | contest_id    | contests     |
| contest_problems   | problem_id    | problems     |
| submissions        | student_id    | students     |
| submissions        | problem_id    | problems     |
| submission_results | submission_id | submissions  |
| submission_results | testcase_id   | test_cases   |
| sessions           | batch_id      | batches      |
| attendance         | student_id    | students     |
| attendance         | session_id    | sessions     |
| regrade_requests   | submission_id | submissions  |
| plagiarism_flags   | submission_id | submissions  |

---

# NOT NULL Constraints

The following fields should not allow NULL values:

* student_name
* email
* course_name
* batch_id
* problem title
* submission_time
* verdict
* attendance_status

Reason:
These attributes are essential for record validity.

---

# UNIQUE Constraints

| Table    | Column       |
| -------- | ------------ |
| students | email        |
| courses  | course_name  |
| contests | contest_name |

Reason:
Avoid duplicate records.

---

# CHECK Constraints

## Example Constraints

```sql
CHECK (difficulty IN ('Easy','Medium','Hard'))
```

```sql
CHECK (attendance_status IN ('Present','Absent'))
```

```sql
CHECK (similarity_score BETWEEN 0 AND 100)
```

Reason:
Improves data integrity and prevents invalid values.

---

# Relationship Types

## One-to-Many

* One course → many batches
* One batch → many students
* One problem → many test cases
* One submission → many submission results

## Many-to-Many

* Students ↔ Courses via enrollments
* Contests ↔ Problems via contest_problems
