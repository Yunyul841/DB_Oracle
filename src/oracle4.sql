create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --자동차 번호
c_name varchar2(10),  -- 자동차 종류
 id varchar2(8));
 
 
insert into users values ('1111','kim','수원');
insert into users values ('2222','lee','서울');
insert into users values ('3333','park','대전');
insert into users values ('4444','choi','대전');

insert into carinfo values ('1234','중형','1111');
insert into carinfo values ('3344','소형','1111');
insert into carinfo values ('5566','중형','3333');
insert into carinfo values ('6677','중형','3333');
insert into carinfo values ('7788','중형','4444');
insert into carinfo values ('8888','중형','5555');

select * from users;
select * from carinfo;

위 자료를 회원이 등록한 자동차 정보이다.

1. 회원의 이름과 주소를 출력하시오.
select name,addr from users;
2. 회원의 이름과 소유한 자동차 번호를 출력하시오.
select a.name, b.c_num from users a, carinfo b where a.id = b.id;
3. 자동차 번호가 7788인 소유자의 이름과 주소를 출력하시오.
select a.name, a.addr from users a, carinfo b where a.id=b.id and b.c_num='7788';
4. 자동차를 소유하지 않은 사람의 이름과 주소를 출력하시오.
select a.name,a.addr from users a
left outer join carinfo b 
on a.id = b.id 
where b.c_num is null;
5. 회원수별 등록한 자동차 수를 출력하시오.

6. 2대 이상을 소유한 회원의 이름과 소유한 자동차 수를 출력하시오.

7. 자동차는 등록되어 있는데 소유자가 없는 자동차 번호를 출력하시오.
