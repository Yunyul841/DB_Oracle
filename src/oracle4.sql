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
select a.name, b.c_num 
from users a, carinfo b 
where a.id = b.id;

3. 자동차 번호가 7788인 소유자의 이름과 주소를 출력하시오.

조인으로 풀기
select a.name, a.addr 
from users a, carinfo b 
where a.id=b.id and b.c_num='7788';

서브쿼리로 풀기
select name,addr 
from users 
where id=(select id from carinfo where c_num='7788');

4. 자동차를 소유하지 않은 사람의 이름과 주소를 출력하시오.
select a.name,a.addr 
from users a  --left table
left outer join carinfo b   --right table // left 테이블에서 이너조인하고 조인에 참여하지 않은 튜플까지 출력
on a.id = b.id 
where b.c_num is null;
5. 회원수별 등록한 자동차 수를 출력하시오.
select u.*, c.*
from users u, carinfo c
where u.id=c.id;

select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.name;   -- 동명이인일 수도 있으니 u.id로 그룹하자

select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.id;   -- 동명이인일 수도 있으니 u.id로 그룹하자 에러
                -- select u.name는 다중행이다..
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id,u.name);   --group by를 복합속성으로 정의하자.
6. 2대 이상을 소유한 회원의 이름과 소유한 자동차 수를 출력하시오.
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id,u.name) having count(*) >= 2;   --group by를 복합속성으로 정의하자.

7. 자동차는 등록되어 있는데 소유자가 없는 자동차 번호를 출력하시오.
--팁, 먼저 보는 테이블과 나중에 보는 테이블의 순서를 기억..
--먼저 보는 테이블은 carinfo, 두번재로 보는 테이블 users
--자동차가 등록되어 있는데 소유자가 누구냐? 이너조인
--이너조인에 참여하지 못하는 튜플을 원한다...  아우터조인...
--아우터 조인일때는 어떤 테이블을 left로 볼 것인가?? 첫번째 left지정
select c.c_num
from carinfo c
left outer join users u
on c.id = u.id
where u.id is null;

select c.c_num
from carinfo c,users u
where c.id = u.id(+) and u.id is null;

8. 배정 자동차의 차번호, 제조사, 자동차명, 가격을 출력하시오.
carinfo 배정 자동차의 정보로 가정... 차번호는 carinfo해결가능하지만
제조사와 자동차명과 가격은 companycar테이블에 있죠. 이너조인
select c.c_num, cc.c_com, cc.c_name, cc.c_price
from carinfo c, companycar cc
where c.c_num = cc.c_num;


9. 회사에서구매는 하였지만 
배정되지 않은 자동차의 차번호, 제조자, 자동차 이름을 출력   
테이블을 보는 순서를 정해 봅시다.
companycar 테이블에 보유한 자동차 정보를 확인, 이 자동차 배정되었는지
확인하기 위해서 carinfo테이블 확인..  배정된 자동차는 이너조인
배정이 안된 자동차는 아우터 조인.. 이때 campanycar를 left
select c.c_num, c.c_com, c.c_name
from companycar c
left outer join carinfo cc
on c.c_num = cc.c_num
where cc.c_num is null;

10. 자동차 가격이 1000만원 이상인 자동차의 자동차 번호를 출력하시오.
 자동차 가격이 1000만원 이상이라는 조건은 companycar 에서 해결가능
 원하는 자동차 번호도 companycar에서 해결가능 즉 조인 필요없음
 select c_name
 from companycar
 where c_price >=1000;








11. 배정된 자동차 중에 회사에서 구매한 자동차가 아닌 자동차 번호를 출력하시오.
관련 테이블은 carinfo   companycar
outer join  >  carinfo 테이블을 left
select c.c_num
from carinfo c
left outer join companycar c1
on c.c_num = c1.c_num
where c1.c_com is null;






12. 모든 사람의 정보를 출력하시오. 이름, 배정받은 자동차번호, 
자동차이름
관련테이블은 users, carinfo, companycar
조인해서 만들고 싶은 테이블은
users.name  carinfo.c_num  companycar.c_name
즉 테이블3개를 조인. 이때는 순서를 정하고 순서대로 2개씩 조인하고
그 결과의 논리테이블과 다음 테이블을 조인 .. 진행
select u.name,name NVL(c.c_num,'없음'), NVL(cc.c_name,'없음') carnum,
NVL(cc.c_name,'없음') carnum
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar cc
on c.c_num= cc.c_num;