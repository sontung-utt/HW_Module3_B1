create database school;
use school;

create table class(
classId int auto_increment primary key,
className varchar(10) not null,
amountStudent int not null,
courseId int not null
);

create table student(
studentId int auto_increment primary key,
studentName varchar(100) not null,
classId int not null,
studentAge int not null,
address varchar(255) not null,
email varchar(50) unique not null,
phone varchar(10) unique not null,
foreign key (classId) references class(classId)
);

create table course(
courseId int auto_increment primary key,
courseName varchar(20) not null
);

alter table class add constraint fk_course foreign key (courseId) references course(courseId);
alter table student add constraint ck_age check (studentAge >= 18);
alter table student modify address varchar(155); 
alter table student add column mark double not null;
alter table class drop column amountStudent;

insert into course(courseId, courseName)
values
(1,"Khóa 1"),
(2,"Khóa 2"),
(3,"Khóa 3"),
(4,"Khóa 4"),
(5,"Khóa 5");

insert into class (classId, className, courseId) 
values
(1,"C04",4),
(2,"C03",3),
(3,"D01",4),
(4,"D02",2),
(5,"A05",5),
(6,"A02",1),
(7,"B03",2);

insert into student (studentId, studentName, classId, studentAge, address, email, phone, mark)
values
(1,"Tùng",3,20,"Lê Trọng Tấn - Thanh Xuân","sontungtst0411@gmail.com","0988485463",6),
(2,"Hải",1,21,"Đại Mỗ - Hà Đông","thehai123@gmail.com","0976328728",8),
(3,"Đức",7,20,"Cự Lộc - Thanh Xuân","ducbeo12345@gmail.com","0937438738",10),
(4,"Anh",4,23,"Nghi Tàm - Tây Hồ","anhquangx@gmail.com","0938438334",9),
(5,"Long",7,20,"Trung Văn - Hà Đông","tieuquit31@gmail.com","0983827323",8),
(6,"Phương",3,22,"Triều Khúc - Thanh Xuân","phuongtran3010@gmail.com","0938743833",7.5),
(7,"Oanh",4,21,"Kim Mã - Ba Đình","oanhoanh1809@gmail.com","0987383248",6.5);

update student
set mark = 8.5
where studentId = 3;

alter table student add column gender varchar(5) not null default "Nam";

select * from student;
update student 
set gender = "Nữ"
where studentId in (6,7);


