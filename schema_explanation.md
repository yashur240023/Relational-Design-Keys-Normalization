# Schema Understanding Document

# 1. Students Table

Represents all learners registered in the CodeJudge platform.

## Important Columns

| Column       | Meaning                            |
| ------------ | ---------------------------------- |
| student_id   | Unique identifier for each student |
| student_name | Full name of student               |
| email        | Student email                      |
| phone        | Contact number                     |
| batch_id     | Batch assigned to student          |

## Record Identification

* `student_id` uniquely identifies each student.

## Relationships

* Connected with:

  * enrollments
  * submissions
  * attendance
  * plagiarism flags

## Possible Redundancy

If batch information is repeated for every student row, it creates duplication.

---

# 2. Courses Table

Represents available academic or coding courses.

## Important Columns

| Column           | Meaning                        |
| ---------------- | ------------------------------ |
| course_id        | Unique course identifier       |
| course_name      | Name of course                 |
| duration         | Course duration                |
| difficulty_level | Beginner/Intermediate/Advanced |

## Relationships

* Linked with batches
* Linked with enrollments

## Possible Redundancy

Course names may repeat in multiple batch records if not separated properly.

---

# 3. Batches Table

Represents student groups for a specific course and schedule.

## Important Columns

| Column     | Meaning                 |
| ---------- | ----------------------- |
| batch_id   | Unique batch identifier |
| course_id  | Related course          |
| mentor_id  | Assigned mentor         |
| start_date | Batch start             |
| end_date   | Batch end               |

## Relationships

* Many students belong to one batch.
* One batch belongs to one course.

---

# 4. Problems Table

Stores coding problems available on the platform.

## Important Columns

| Column     | Meaning                   |
| ---------- | ------------------------- |
| problem_id | Unique problem identifier |
| title      | Problem title             |
| difficulty | Problem difficulty        |
| topic      | Problem category          |

## Relationships

* Connected with submissions
* Connected with contests
* Connected with test cases

---

# 5. Test Cases Table

Stores input-output validation cases for problems.

## Important Columns

| Column          | Meaning             |
| --------------- | ------------------- |
| testcase_id     | Unique test case    |
| problem_id      | Related problem     |
| input_data      | Input for execution |
| expected_output | Expected result     |

## Relationships

* Many test cases belong to one problem.

---

# 6. Contests Table

Represents coding competitions conducted on the platform.

## Important Columns

| Column       | Meaning            |
| ------------ | ------------------ |
| contest_id   | Contest identifier |
| contest_name | Contest title      |
| start_time   | Contest start      |
| end_time     | Contest end        |

## Relationships

* Connected with contest_problem mapping.

---

# 7. Contest_Problems Table

Mapping table between contests and problems.

## Purpose

A contest may contain multiple problems and a problem may appear in multiple contests.

## Composite Key

* `(contest_id, problem_id)`

---

# 8. Submissions Table

Stores student code submissions.

## Important Columns

| Column          | Meaning               |
| --------------- | --------------------- |
| submission_id   | Unique submission     |
| student_id      | Student who submitted |
| problem_id      | Problem attempted     |
| language        | Programming language  |
| submission_time | Time submitted        |
| status          | Accepted/Rejected     |

## Relationships

* Connected with submission_results

---

# 9. Submission_Results Table

Stores execution results for individual test cases.

## Important Columns

| Column         | Meaning            |
| -------------- | ------------------ |
| result_id      | Unique result      |
| submission_id  | Related submission |
| testcase_id    | Executed testcase  |
| execution_time | Runtime            |
| verdict        | Pass/Fail          |

---

# 10. Attendance Table

Stores student attendance records.

## Important Columns

| Column            | Meaning               |
| ----------------- | --------------------- |
| attendance_id     | Attendance identifier |
| student_id        | Student reference     |
| session_id        | Session reference     |
| attendance_status | Present/Absent        |

---

# 11. Sessions Table

Represents individual learning sessions.

## Important Columns

| Column        | Meaning            |
| ------------- | ------------------ |
| session_id    | Session identifier |
| batch_id      | Batch reference    |
| session_topic | Topic covered      |
| session_date  | Session date       |

---

# 12. Regrade_Requests Table

Stores requests for reevaluation of submissions.

## Important Columns

| Column        | Meaning            |
| ------------- | ------------------ |
| request_id    | Unique request     |
| submission_id | Related submission |
| requested_by  | Student            |
| reason        | Reason for regrade |

---

# 13. Plagiarism_Flags Table

Stores suspected plagiarism records.

## Important Columns

| Column           | Meaning                  |
| ---------------- | ------------------------ |
| flag_id          | Unique plagiarism record |
| submission_id    | Related submission       |
| similarity_score | Percentage similarity    |
| flagged_at       | Detection timestamp      |

---

# Non-Normalized Areas Observed

Examples include:

* repeating course names across batches
* repeated student details in attendance data
* repeated problem metadata in submissions
* repeated contest details in contest mappings

These issues are resolved through normalization.
