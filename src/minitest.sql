CREATE DATABASE StudentManagers;
use StudentManagers;
create table Address (
address_id int not null auto_increment primary key,
Address_address VARCHAR(255) not null default 'Hà Nội'
);
create table Classes (
classes_id int not null auto_increment primary key,
classes_language VARCHAR(255),
classes_name VARCHAR(255) not null default 'C0223G1',
classes_description text
);
create table Students (
students_id int not null auto_increment primary key,
students_fullName VARCHAR(255) not null,
address_id int not null,
students_age int,
students_phone VARCHAR(255) not null unique,
classes_id int not null,
foreign key (address_id) references Address(address_id),
foreign key (classes_id) references Classes(classes_id)
);
create table Courses (
courses_id int not null auto_increment primary key,
courses_name VARCHAR(255) not null,
courses_description text
);
create table Points (
points_id int not null auto_increment primary key,
course_id int not null,
students_id int not null,
points_point float
);
INSERT INTO Address(Address_address)
VALUES
    ('Nam Định '),
    ('Hà Nội '),
    ('Bắc Ninh '),
    ('Thái Nguyên '),
    ('Thái Bình ');
INSERT INTO Courses (courses_name, courses_description)
VALUES
    ('Database Management Systems', 'Introduction to database management systems'),
    ('Web Application Development', 'Introduction to web application development'),
    ('Object-Oriented Programming', 'Introduction to object-oriented programming'),
    ('Data Structures and Algorithms', 'Introduction to data structures and algorithms'),
    ('Computer Networks', 'Introduction to computer networks');
INSERT INTO Classes (classes_name,classes_language, classes_description)
VALUES
    ('Database Management', 'English', 'Class on database management systems'),
    ('Web Development', 'English', 'Class on web application development'),
    ('Object-Oriented Programming', 'English', 'Class on object-oriented programming'),
    ('Data Structures and Algorithms', 'English', 'Class on data structures and algorithms'),
    ('Computer Networks', 'English', 'Class on computer networks');
INSERT INTO Students (students_fullName, address_id, students_age, students_phone, classes_id)
VALUES
    ('Nguyễn Văn Đạt', 1, 20, '123-456-7890', 1),
    ('Nguyễn Viết Sơn', 2, 22, '456-789-0123', 2),
    ('Nguyễn Viết Hùng', 3, 21, '789-012-3456', 3),
    ('Nguyễn Tiến Bịp', 4, 23, '012-345-6789', 4),
    ('Trần Xuân Mạnh', 5, 20, '345-678-9012', 5),
    ('Trần Viết Anh', 1, 22, '678-901-2345', 1),
    ('Trịnh Minh Anh', 2, 21, '901-234-5678', 2),
    ('Trần Minh Ngọc', 3, 23, '234-567-8901', 3),
    ('Trần Viết Hùng', 4, 20, '567-890-1234', 4),
    ('Hà Minh Anh', 5, 22, '890-123-4567', 5);
INSERT INTO Points (course_id, students_id, points_point)
VALUES
    (1, 1, 8.5),
    (1, 2, 7.5),
    (1, 3, 9),
    (2, 4, 8),
    (2, 5, 7),
    (2, 6, 9.5),
    (3, 7, 8),
    (3, 8, 7.5),
    (3, 9, 9),
    (4, 10, 8.5),
    (4, 1, 7.5),
    (4, 2, 9),
    (5, 3, 8),
    (5, 4, 7.5),
    (5, 5, 9);

SELECT * FROM Students WHERE students_fullName LIKE 'Nguyễn%';

SELECT * FROM Students WHERE students_fullName LIKE '%Anh';

SELECT * FROM Students WHERE students_age between 18 and 25;

SELECT * FROM Students WHERE students_id IN (5,10,12,13);

SELECT classes_id, COUNT(*) AS number_of_students FROM Students GROUP BY classes_id;

SELECT Address_address, COUNT(*) AS number_of_students_Province FROM Students GROUP BY Address_address;

SELECT Courses.courses_name, AVG(Points.points_point) AS medium_score FROM Courses JOIN Points ON Courses.courses_id = Points.course_id GROUP BY courses_name;

SELECT AVG(points_point) FROM Points;
SELECT MAX(points_point) FROM Points;

SELECT course_id, AVG(points_point) AS avg_point
FROM Points
GROUP BY course_id
HAVING AVG(points_point) = (SELECT MAX(avg_point) FROM (SELECT course_id, AVG(points_point) AS avg_point FROM Points GROUP BY course_id) AS temp);

SELECT * FROM address,courses,classes,students,points;