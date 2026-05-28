# Assumptions

1. Every student has a unique `student_id`.

2. Student email addresses are unique.

3. A batch belongs to exactly one course.

4. A student may enroll in multiple courses.

5. One problem can appear in multiple contests.

6. Each submission belongs to one student and one problem.

7. One submission may generate multiple testcase execution results.

8. Attendance status is limited to:

   * Present
   * Absent

9. Difficulty levels are limited to:

   * Easy
   * Medium
   * Hard

10. Raw CSV files may contain:

    * duplicate rows
    * missing values
    * inconsistent formatting

11. Staging/raw tables may be used before inserting into normalized tables.

12. Mentor details are assumed external and not fully modeled.

13. Regrade requests are initiated by students only.
