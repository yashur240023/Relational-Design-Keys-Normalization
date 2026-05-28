COURSES
---------
PK course_id
course_name

        |
        | 1-M
        v

BATCHES
---------
PK batch_id
FK course_id

        |
        | 1-M
        v

STUDENTS
---------
PK student_id
FK batch_id

        |
        | 1-M
        v

SUBMISSIONS
---------
PK submission_id
FK student_id
FK problem_id

        |
        | 1-M
        v

SUBMISSION_RESULTS
---------
PK result_id
FK submission_id
FK testcase_id


PROBLEMS
---------
PK problem_id

        |
        | 1-M
        v

TEST_CASES
---------
PK testcase_id
FK problem_id


CONTESTS
---------
PK contest_id

        |
        | M-M
        v

CONTEST_PROBLEMS
---------
PK (contest_id, problem_id)
FK contest_id
FK problem_id

PROBLEMS
---------
PK problem_id


SESSIONS
---------
PK session_id
FK batch_id

        |
        | 1-M
        v

ATTENDANCE
---------
PK attendance_id
FK student_id
FK session_id
