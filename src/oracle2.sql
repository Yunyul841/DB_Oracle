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
insert into muser values(muser_no.nextval,'870205-1','�̽���',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','������',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','���̼�',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','������',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','������',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','���¿�',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','�����',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','������',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','������',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','���翵',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','�̽ż�',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','�̹߲�',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','�̿���',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','���¾�',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','������',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','���̷�',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','��õ��',1,10000,31);
select * from muser;
drop table muser ;


1 grade�� 3�� ����� ��� ����ΰ���?
select count(*) 
from muser
where grade = 3;

--select grade, count(*) from muser group by grade;(�׷�ȭ)

2 grade�� 1,2,4�� ������� salary�� ����� ���Ͻÿ�.
select avg(salary) 
from muser 
where grade in (1,2,4);  -- in �����ڴ� or�� �ǹ̰� �ִ�.
--where grade=1 or grade=2 or grade=4; 

3 salary�� 20000 �̸��� ����� �� ����Դϱ�?
select count(*)    --�÷����� count(*)�Լ��� ����ؾ��Ѵ�.
from muser 
where salary < 20000;
--group by  --�׷��� ���� : �׷캰 ������ ���

4 salary�� 30000 �̻��� ����� salary ����� ���Ͻÿ�.
select avg(salary) 
from muser 
where salary >= 30000;

5 77���߿�  salary�� ���� ���� ����� �̸��� ���̿� salary�� ����Ͻÿ�.
select name �̸�, -- �̸��� ���̿� salary
    (extract ( year from sysdate))-
    (decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)
    +substr(reg_num,1,2))����,
    salary �޿�
    from muser
    where substr(reg_num,1,2)=77    --77��� �߿�
        and salary = (select min(salary) 
                        from muser
                        where substr(reg_num,1,2)=77);
select 1900+substr(reg_num,1,2) from muser;
select * from muser;
-- �м� ����� 1900�� �����ϸ� 2000�� ���� ����ڴ� ���������Ͱ� ��
-- ���ǿ� ���� 1900�Ǵ� 2000�� �÷��� �� ��� �Ѵ�.
-- �˻��� : ����Ŭ ���ǹ� > decode
select substr(reg_num,1,2) from muser;
select substr(reg_num,1,2) a,
        decode(substr(reg_num,1,2),'1',1900,'2',1900,2000) b from muser;
select substr(reg_num,1,2) a,  
        decode(substr(reg_num,1,2),'1',1900,'2',1900,2000) b,
         decode(substr(reg_num,1,2),'1',1900,'2',1900,2000)
         +substr(reg_num,1,2) c
from muser;    

--���� �� �� �ִ� ����
--select name, min(salary)
--from

-- ���� ����Ѵ�.
--group by
--order by
/*77��� ���� �׽�Ʈ ����*/
--select substr(reg_num,1,2)from muser; -- �߰� �ܰ�
---- �������� ����...
--select -- �̸��� ���̿� salary
--from muser
--where where substr(reg_num,1,2)='77'

00 
6 ��� ����� �̸���, ����(���� �� ������� 0205)�� ����Ͻÿ�.
select name,substr(reg_num,3,4) 
from muser;

7 ������ ��� �޿��� ���Ͻÿ�.
select avg(salary)--��ձ޿�
from muser
where substr(reg_num,8,1) in ('1','3');--����? �÷����� �ȵȴ�. �����̳� �Լ��� �������� ����ؾ��Ѵ�,

8 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿��� ����Ͻÿ�
--select name, salary
--from muser
--where  -- ��ձ޿����� ���� �޿� �޴� ����� ���� ����
    -- �÷� ��ü�� �ذ�? ����? �Լ�? ��������?
    -- ��ձ޿��� ��������� ������ �ϼ� -> �������� ���
--group by
--order by
select name, salary
from muser
where salary > (select avg(salary) 
from muser);
9 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿�, ��ձ޿��� ����Ͻÿ�
select name,salary,(select avg(salary) -- ��Į�� ���� ����, ��å�� ����
            from muser) ��ձ޿�
from muser
    where salary > (select avg(salary) 
    from muser);
10 �������� ��ձ޿����� ���� ���������� ��� ����Դϱ�

11 grade�� ��� �޿��� ����ϼ���..O
select grade, avg(salary) ��ձ޿� 
from muser 
group by grade;
12 �׷캰 ��ձ޿��� ��ü ��պ��� ���� �׷��� ����Ͻÿ�.
select grade,avg(salary)
from muser
--where
group by grade having avg(salary) > (
                                    select avg(salary)
                                    from muser);
--order by
13 �������� ���� ������ ����Ͻÿ�. (��� ���´� �̸�, ����(grade*salary*time)O

14 �������� ������ ����Ͻÿ�. (��� ���� �̸�, ����(������ ���Ǵ� ���� ����Ѵ�)O
    �ΰ��� ����� �ִ�.
select name �̸�, 
            decode(substr(reg_num,8,1),'1','��',3,'��','��') ����
from muser;
--where 
--group by
--order by

-- ����Ŭ�� ���ǿ� ���� ó���ϴ� ������ case when then else end
--case when then else end�� ���� �м�
--case
--      when ����1, then ����1�� ���� ��� ����
--      when ����1, then ����2�� ���� ��� ����
--      else ����1�� ����2�� ��� �͵� ������ ���� ���
--end
select name �̸�,
        case 
            when substr(reg_num,8,1) in ('1','3') then '��'
            else '��'
        end ����
from muser;        
select distinct grade, salary from muser;
-- distinct�� �ߺ��� �÷��� �����ϰ� select������ �ѹ��� ����� �����ϴ�.
-- �ߺ����� ������ select���� ������ ��ü ���� �ߺ��̴�.
-- # 3�� �������� ���ɺ�(time�÷�) �޿��� ��. over �Լ� �̿�
select distinct 
        time ����,
        sum(salary) over(partition by time) ����
from muser;                

-- ����Ŭ�� ���ǿ� ���� ó�� �ϴ� ������ case when then else end
15 time�� �ٹ��ð� �ٹ��ð��� 31�̻��� ����� �̸��� ����Ͻÿ�.O
 
16 ¦���⵵�� �¾ ������� �̸��� ��� ����Ͻÿ�.O
select name �̸� 
from muser
where (mod(substr(reg_num,1,2),2)=0);
17 �������� ��������� ����Ͻÿ�. (��� ���´� �̸��� �������(97��1��2��))O

18 ���������� ���Ƹ� �����ϱ� ���� ��å���� time�� 2�ð������ϱ�� �ߴ�. �̸� ó�� �Ͻÿ�.O

19 ���̺� �ο����� ����Դϱ�O
select substr(reg_num,1,2) �⵵, count(*) �ο��� 
from muser 
group by substr(reg_num,1,2);

20 2�г�׷�� 4�г� �׷��� ��� ����Դϱ�O
select count(*)
from muser 
where grade in (2,4); -- in�����ڴ� or�� �ǹ̰� �ִ�.
--where grade='2' or grade='4';



