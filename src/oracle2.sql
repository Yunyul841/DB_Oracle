create table muser(
id int,
reg_num varchar2(8) not null,
name varchar2(10 char),
grade int,
salary int,
time int);

create sequence muser_no
increment by 1
start with 10
;
insert into muser values(muser_no.nextval,'870205-1','이승진',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','박이진',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','최이수',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','류진아',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','오현식',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','정승우',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','이재수',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','박지영',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','정은아',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','정재영',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','이신수',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','이발끈',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','이욱이',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','지승아',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','현진수',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','최이런',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','이천안',1,10000,31);
select * from muser;
drop table muser ;


1 grade가 3인 사람은 모두 몇명인가요?
select count(*) 
from muser
where grade = 3;

--select grade, count(*) from muser group by grade;(그룹화)

2 grade가 1,2,4인 사람들의 salary의 평균을 구하시오.
select avg(salary) 
from muser 
where grade in (1,2,4);  -- in 연산자는 or의 의미가 있다.
--where grade=1 or grade=2 or grade=4; 

3 salary가 20000 미만인 사람은 총 몇명입니까?
select count(*)    --컬럼값에 count(*)함수를 사용해야한다.
from muser 
where salary < 20000;
--group by  --그룹의 정의 : 그룹별 집계일 경우

4 salary가 30000 이상인 사람의 salary 평균을 구하시오.
select avg(salary) 
from muser 
where salary >= 30000;

5 77년중에  salary가 가장 적은 사람의 이름과 나이와 salary를 출력하시오.
select name 이름, -- 이름과 나이와 salary
    (extract ( year from sysdate))-
    (decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)
    +substr(reg_num,1,2))나이,
    salary 급여
    from muser
    where substr(reg_num,1,2)=77    --77년생 중에
        and salary = (select min(salary) 
                        from muser
                        where substr(reg_num,1,2)=77);
select 1900+substr(reg_num,1,2) from muser;
select * from muser;
-- 분석 상수로 1900을 보정하면 2000년 이후 출생자는 오류테이터가 옴
-- 조건에 따라 1900또는 2000을 플러스 해 줘야 한다.
-- 검색어 : 오라클 조건문 > decode
select substr(reg_num,1,2) from muser;
select substr(reg_num,1,2) a,
        decode(substr(reg_num,1,2),'1',1900,'2',1900,2000) b from muser;
select substr(reg_num,1,2) a,  
        decode(substr(reg_num,1,2),'1',1900,'2',1900,2000) b,
         decode(substr(reg_num,1,2),'1',1900,'2',1900,2000)
         +substr(reg_num,1,2) c
from muser;    

--오류 낼 수 있는 쿼리
--select name, min(salary)
--from

-- 나이 출력한다.
--group by
--order by
/*77년생 쿼리 테스트 실행*/
--select substr(reg_num,1,2)from muser; -- 중간 단계
---- 본쿼리에 적용...
--select -- 이름과 나이와 salary
--from muser
--where where substr(reg_num,1,2)='77'

00 
6 모든 사람의 이름과, 생일(월과 일 예를들어 0205)를 출력하시오.
select name,substr(reg_num,3,4) 
from muser;

7 남자의 평균 급여를 구하시오.
select avg(salary)--평균급여
from muser
where substr(reg_num,8,1) in ('1','3');--남자? 컬럼으로 안된다. 수식이나 함수나 서브쿼리 사용해야한다,

8 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여를 출력하시오
--select name, salary
--from muser
--where  -- 평균급여보다 높은 급여 받는 사람의 유용 선택
    -- 컬럼 자체로 해결? 수식? 함수? 서브쿼리?
    -- 평균급여의 결과값으로 조건을 완성 -> 서브쿼리 사용
--group by
--order by
select name, salary
from muser
where salary > (select avg(salary) 
from muser);
9 전체 평균급여보다 높은 급여를 받는 사람의 이름과, 급여, 평균급여를 출력하시오
select name,salary,(select avg(salary) -- 스칼라 서브 쿼리, 대책안 조인
            from muser) 평균급여
from muser
    where salary > (select avg(salary) 
    from muser);
10 여직원의 평균급여보다 높은 남자직원은 모두 몇명입니까

11 grade별 평균 급여를 출력하세요..O
select grade, avg(salary) 평균급여 
from muser 
group by grade;
12 그룹별 평균급여가 전체 평균보다 높은 그룹을 출력하시오.
select grade,avg(salary)
from muser
--where
group by grade having avg(salary) > (
                                    select avg(salary)
                                    from muser);
--order by
13 직원들의 월급 명세서를 출력하시오. (출력 형태는 이름, 월급(grade*salary*time)O

14 직원들의 성별을 출력하시오. (출력 형태 이름, 성별(성별은 남또는 여로 출력한다)O
    두가지 방법이 있다.
select name 이름, 
            decode(substr(reg_num,8,1),'1','남',3,'남','여') 성별
from muser;
--where 
--group by
--order by

-- 오라클에 조건에 따라 처리하는 문법은 case when then else end
--case when then else end의 구조 분석
--case
--      when 조건1, then 조건1이 참일 경우 실행
--      when 조건1, then 조건2이 참일 경우 실행
--      else 조건1과 조건2가 어느 것도 참이지 않을 경우
--end
select name 이름,
        case 
            when substr(reg_num,8,1) in ('1','3') then '남'
            else '여'
        end 성별
from muser;        
select distinct grade, salary from muser;
-- distinct는 중복된 컬럼을 제거하고 select절에서 한번만 사용이 가능하다.
-- 중복제거 범위는 select에서 지정한 전체 행의 중복이다.
-- # 3번 문제에서 연령별(time컬럼) 급여의 합. over 함수 이용
select distinct 
        time 연령,
        sum(salary) over(partition by time) 총합
from muser;                

-- 오라클에 조건에 따라 처리 하는 문법은 case when then else end
15 time은 근무시간 근무시간이 31이상인 사람의 이름을 출력하시오.O
 
16 짝수년도에 태어난 사람들의 이름을 모두 출력하시오.O
select name 이름 
from muser
where (mod(substr(reg_num,1,2),2)=0);
17 직원들의 생년월일을 출력하시오. (출력 형태는 이름과 생년월일(97년1월2일))O

18 여직원들의 육아를 지원하기 위한 정책으로 time을 2시간가산하기로 했다. 이를 처리 하시오.O

19 나이별 인원수는 몇명입니까O
select substr(reg_num,1,2) 년도, count(*) 인원수 
from muser 
group by substr(reg_num,1,2);

20 2학년그룹과 4학년 그룹은 모두 몇명입니까O
select count(*)
from muser 
where grade in (2,4); -- in연산자는 or의 의미가 있다.
--where grade='2' or grade='4';



