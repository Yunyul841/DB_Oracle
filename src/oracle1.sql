create table users(
no int primary key,
name varchar2(10),
addr varchar2(10),
point number,
grade varchar2(1),
jumin varchar2(8));
insert into users values (1,'kimsu','suwon',99.12,1,'820405-1');
insert into users values (2,'leesu','suwon city',89.00,2,'970805-2');
insert into users values (3,'choihee','seoul',88.21,1,'910204-2');
insert into users values (4,'leesil','suwon',77.62,4,'850405-1');
insert into users values (5,'james','seoul',60.22,1,'871105-1');
insert into users values (6,'parksuji','suwon',90.12,3,'880405-2');
insert into users values (7,'kimrae','yougin',89.96,3,'820105-1');
insert into users values (8,'sangJin','youngin',99.31,3,'990420-2');
insert into users values (9,'Leechan','incheon',79.12,2,'970605-2');
insert into users values (10,'kimmi','incheon',79.92,1,'810505-1');
insert into users values (11,'ryusu','seoul',85.32,4,'861205-2');
insert into users values (12,'Gosu',null,82.13,4,'810715-1');
1. 모든 사람들의 이름과 점수와 생년월일을 검색하시오. 
select name, point, jumin from users;

2. 80점 이상의 사람의 이름과 주소, 점수를 검색하시오.
select name,addr,point from users where point >= 80;

3. 이름이 kim으로 시작되는 사람의 이름과 주소와 점수를 검색하시오
select name,addr,point from users where name like 'kim%';

4. 현재 점수에서 +10으로 보정한 점수를 출력하시오. (단,원본 데이터에 반영되지 않습니다.)
select name,point+10 from users; 

5. 1학년의 점수를 +1점씩 올려서 출력하세요. (단, 원본 데이터에 반영되지 않습니다.)
select point+1 from users where grade = 1;

6. B등급을 획득한 사람의 이름, 주소, 점수를 출력하세요 (B등급 80점 이상 90점 미만입니다)
select name, addr, point from users where point >= 80 and point < 90;

7. 쿼리 결과 중 NULL은 실제 입력하지 않은 값입니다.
  주소를 입력하지 않은 학생의 이름과, 주소, 학년, 점수, 주민번호를 출력하세요
select name, addr, grade, point, jumin from users where addr is  null;

8. 4학년의 점수를 10%로 올린 점수를 계산하세요. (단, 원본데이터는 반영되지 않는다)
select point*1.1 from users where grade = 4; 

9. 점수가 낮은 학생부터 출력하세요.  번호, 이름, 주소, 포인트
select no, name, addr, point from users order by point Asc;

10. 학년을 오름차순으로 정렬하시오, 단 학년이 동일 할 경우 포인트가 높은 사람이 먼저 출력됩니다.
    출력은 번호, 이름, 학년, 포인트
select no,name,grade,point from users order by grade Asc , point Desc;

11. 현재의 점수에서 -10을 보정한 결과 80점 이상인 사람의 이름과 점수, 보정한 결과 점수를 출력하세요.?
select name,point,point-10 from users where point-10 >= 80;

12. 2학년의 모든 학생을 출력하시오 . 출력 컬럼명은
    이름 주소 학년으로 출력하시오. 여기서 이름은 name컬럼, 주소는 addr컬럼, 학년은 grade컬럼을 의미
select name 이름,addr 주소,grade 학년 from users where grade = 2;

13. 학생은 총 몇명입니까? 
select count(*) from users;

14. 1학년은 총 몇명입니까?
select count(*) from users where grade = 1;

15. 모든 학생의 이름과 학년을 출력하시오. 단 이름은 모두 소문자로만 출력하시오. 
select lower(name),grade from users;

16. 2학년 학생의 이름과 학년을 출력하시오. 보안을 위해서 주소는 앞글자 2글자만 출력하시오. 
select name,grade,substr(addr,1,2) from users where grade = 2;

17. 모든 학생의 점수의 일의 자리는 절삭하시오. - 반올림 없음 (단, 원본 데이터에 반영되지 않습니다.) 절삭함수 
select trunc(point,-1) from users;

18. 모든 학생의 점수를 반올림하여 출력하시오. (단, 원본 데이터에 반영되지 않습니다.)
select round(point) from users;

19. 2학년은 모두 몇명입니까?
select count(*) from users where grade = 2;

20. 1학년중 80점 이상은 몇명입니까?
select count(*) from users where point >= 80 and grade = 1;

21. 3학년의 평균은 몇점입니까?
select avg(point) from users where grade = 3;

22. 전체 학생 중 최고점은 몇점입니까?
select max(point) from users;

23. 2학년 중 가장 낮은 점수를 획득한 점수는 몇점입니까?
select min(point) from users  where grade = 2;

select grade,count(*) 인원수 from users group by grade;

1.그룹별 인원수 출력하되 학년을 오름차순으로 정렬
select grade,count(*) 인원수 from users group by grade order by grade asc;
2.그룹별 최고점과 최저점을 출력하시오.
select grade, max(point) 최고점, min(point)최저점 from users group by grade;
3.그룹별 최고점을 획득한 사람의 이름은?
select grade, max(point) 최고점, name from users group by grade;
--(3번문제는 에러뜸 이유는 name는 단일행이여서 (그룹화가 되어있지 않아서))

1. 3학년과 4학년 각각 그룹의 인원수를 출력하시오.
select grade, count(*) from users where grade=3 or grade=4 group by grade;
2. 1학년과 2학년의 최고점과 최저점의 점수 차이를 출력하시오.
select max(point)-min(point)from users where grade=1 or grade=2 group by grade;
3. 주민번호 2자리는 태어난 년도이다. 같은 년도에 태어난 사람을 카운팅 하시오 이떄 태어난 년도와 인원수로 출력한다.
select substr(jumin,1,2) 태어난년도, count(*)인원수 from users group by substr(jumin,1,2);

다음 문제를 쿼리문으로 완성하세요
그룹의 인원이 3명 이상인 그룹의 인원수를 출력하시오.
--where :: 행별, 개별 조건 having :: 그룹별, 그룹 조건
select grade, count(*) from users group by grade having count(*)>=3;
그룹의 인원이 3명 이상인 그룹의 평균를 출력하시오.
select grade, avg(point) from users group by grade having avg(point)>=
(select avg(point) from users); --서브쿼리
/*
결과값이 전체평균임. 그 그룹의 조건을 완성
avg(point)>=서브쿼리결과값(전체평균)
서브쿼리는 본쿼리 안에 소괄로 시작하는 select문
서브쿼리의 결과값을 본쿼리의 활용한다.
*/
/*
select에서 서브 쿼리를 활용하면 > 스칼라 서브쿼리
from에서 서브 쿼리를 활용하면 > 인라이뷰 서브쿼리 
select avg(point) from users;
select * from users;
*/
select m.name, m.addr from (select * from users)m;

1. 가장 높은 점수를 획득한 사람의 이름과 점수는 ?
select name, point from users where point = (select max(point) from users);
