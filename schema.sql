CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    duration INT,
    difficulty_level VARCHAR(20)
);

CREATE TABLE batches (
    batch_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    mentor_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(20),
    batch_id INT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE problems (
    problem_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    difficulty VARCHAR(20),
    topic VARCHAR(100),
    CHECK (difficulty IN ('Easy','Medium','Hard'))
);

CREATE TABLE test_cases (
    testcase_id INT PRIMARY KEY,
    problem_id INT NOT NULL,
    input_data TEXT,
    expected_output TEXT,
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE contests (
    contest_id INT PRIMARY KEY,
    contest_name VARCHAR(150) UNIQUE NOT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

CREATE TABLE contest_problems (
    contest_id INT,
    problem_id INT,
    score INT DEFAULT 100,
    PRIMARY KEY (contest_id, problem_id),
    FOREIGN KEY (contest_id) REFERENCES contests(contest_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE submissions (
    submission_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    problem_id INT NOT NULL,
    language VARCHAR(50),
    submission_time TIMESTAMP NOT NULL,
    status VARCHAR(30),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE submission_results (
    result_id INT PRIMARY KEY,
    submission_id INT NOT NULL,
    testcase_id INT NOT NULL,
    execution_time FLOAT,
    verdict VARCHAR(20),
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (testcase_id) REFERENCES test_cases(testcase_id)
);

CREATE TABLE sessions (
    session_id INT PRIMARY KEY,
    batch_id INT NOT NULL,
    session_topic VARCHAR(200),
    session_date DATE,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    session_id INT NOT NULL,
    attendance_status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    CHECK (attendance_status IN ('Present','Absent'))
);

CREATE TABLE regrade_requests (
    request_id INT PRIMARY KEY,
    submission_id INT NOT NULL,
    requested_by INT,
    reason TEXT,
    request_time TIMESTAMP,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (requested_by) REFERENCES students(student_id)
);

CREATE TABLE plagiarism_flags (
    flag_id INT PRIMARY KEY,
    submission_id INT NOT NULL,
    similarity_score FLOAT,
    flagged_at TIMESTAMP,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    CHECK (similarity_score BETWEEN 0 AND 100)
);
