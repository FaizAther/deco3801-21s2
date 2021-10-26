-- Comments

CREATE TABLE User (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    position INTEGER NOT NULL,
    university_id INTEGER,
    name text NOT NULL,
    type numeric NOT NULL,
    password text NOT NULL,
    description text,
    foreign key (university_id) references University(id)
);

CREATE TABLE Resource (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    location text,
    description text
);

CREATE TABLE University (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name text NOT NULL,
    admin INTEGER NOT NULL,
    description text,
    foreign key (admin) references User(id)
);

CREATE TABLE Faculty (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    position INTEGER NOT NULL,
    university_id INTEGER NOT NULL,
    name text NOT NULL,
    dean INTEGER NOT NULL,
    description text,
    foreign key (university_id) references University(id),
    foreign key (dean) references User(id)
);

CREATE TABLE Course (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    position INTEGER NOT NULL,
    faculty_id INTEGER,
    name text NOT NULL,
    coordinator INTEGER NOT NULL, 
    description text,
    foreign key (coordinator) references User(id),
    foreign key (faculty_id) references Faculty(id)
);

CREATE TABLE Announcement (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    created DATE NOT NULL,
    description text NOT NULL,
    foreign key (course_id) references Course(id)
);

CREATE TABLE Event (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    position INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    name text NOT NULL,
    manager INTEGER NOT NULL,
    resource_id INTEGER,
    type INTEGER NOT NULL,
    description text,
    foreign key (resource_id) references Resource(id),
    foreign key (manager) references User(id),
    foreign key (course_id) references Course(id)
);

CREATE TABLE Attendance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    position INTEGER NOT NULL,
    event_id INTEGER,
    name text NOT NULL,
    marker_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    startdate date NOT NULL,
    description text,
    foreign key (event_id) references Event(id),
    foreign key (marker_id) references User(id),
    foreign key (student_id) references User(id)
);

CREATE TABLE Mark (
    attendance_id INTEGER,
    position INTEGER NOT NULL,
    total INTEGER, 
    received INTEGER,
    resource_id INTEGER,
    duedate date,
    description text,
    foreign key (attendance_id) references Attendance(id),
    foreign key (resource_id) references Resource(id),
    primary key (attendance_id, duedate)
);

CREATE TABLE Invite (
    event_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    description text,
    foreign key (event_id) references Event(id),
    foreign key (user_id) references User(id),
    primary key (event_id, user_id)
);

CREATE TABLE Enrollment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    course_id INTEGER,
    description text,
    foreign key (user_id) references User(id),
    foreign key (course_id) references Course(id)
);
