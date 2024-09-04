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
1. ��� ������� �̸��� ������ ��������� �˻��Ͻÿ�. 
select name, point, jumin from users;

2. 80�� �̻��� ����� �̸��� �ּ�, ������ �˻��Ͻÿ�.
select name,addr,point from users where point >= 80;

3. �̸��� kim���� ���۵Ǵ� ����� �̸��� �ּҿ� ������ �˻��Ͻÿ�
select name,addr,point from users where name like 'kim%';

4. ���� �������� +10���� ������ ������ ����Ͻÿ�. (��,���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select name,point+10 from users; 

5. 1�г��� ������ +1���� �÷��� ����ϼ���. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select point+1 from users where grade = 1;

6. B����� ȹ���� ����� �̸�, �ּ�, ������ ����ϼ��� (B��� 80�� �̻� 90�� �̸��Դϴ�)
select name, addr, point from users where point >= 80 and point < 90;

7. ���� ��� �� NULL�� ���� �Է����� ���� ���Դϴ�.
  �ּҸ� �Է����� ���� �л��� �̸���, �ּ�, �г�, ����, �ֹι�ȣ�� ����ϼ���
select name, addr, grade, point, jumin from users where addr is  null;

8. 4�г��� ������ 10%�� �ø� ������ ����ϼ���. (��, ���������ʹ� �ݿ����� �ʴ´�)
select point*1.1 from users where grade = 4; 

9. ������ ���� �л����� ����ϼ���.  ��ȣ, �̸�, �ּ�, ����Ʈ
select no, name, addr, point from users order by point Asc;

10. �г��� ������������ �����Ͻÿ�, �� �г��� ���� �� ��� ����Ʈ�� ���� ����� ���� ��µ˴ϴ�.
    ����� ��ȣ, �̸�, �г�, ����Ʈ
select no,name,grade,point from users order by grade Asc , point Desc;

11. ������ �������� -10�� ������ ��� 80�� �̻��� ����� �̸��� ����, ������ ��� ������ ����ϼ���.?
select name,point,point-10 from users where point-10 >= 80;

12. 2�г��� ��� �л��� ����Ͻÿ� . ��� �÷�����
    �̸� �ּ� �г����� ����Ͻÿ�. ���⼭ �̸��� name�÷�, �ּҴ� addr�÷�, �г��� grade�÷��� �ǹ�
select name �̸�,addr �ּ�,grade �г� from users where grade = 2;

13. �л��� �� ����Դϱ�? 
select count(*) from users;

14. 1�г��� �� ����Դϱ�?
select count(*) from users where grade = 1;

15. ��� �л��� �̸��� �г��� ����Ͻÿ�. �� �̸��� ��� �ҹ��ڷθ� ����Ͻÿ�. 
select lower(name),grade from users;

16. 2�г� �л��� �̸��� �г��� ����Ͻÿ�. ������ ���ؼ� �ּҴ� �ձ��� 2���ڸ� ����Ͻÿ�. 
select name,grade,substr(addr,1,2) from users where grade = 2;

17. ��� �л��� ������ ���� �ڸ��� �����Ͻÿ�. - �ݿø� ���� (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.) �����Լ� 
select trunc(point,-1) from users;

18. ��� �л��� ������ �ݿø��Ͽ� ����Ͻÿ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select round(point) from users;

19. 2�г��� ��� ����Դϱ�?
select count(*) from users where grade = 2;

20. 1�г��� 80�� �̻��� ����Դϱ�?
select count(*) from users where point >= 80 and grade = 1;

21. 3�г��� ����� �����Դϱ�?
select avg(point) from users where grade = 3;

22. ��ü �л� �� �ְ����� �����Դϱ�?
select max(point) from users;

23. 2�г� �� ���� ���� ������ ȹ���� ������ �����Դϱ�?
select min(point) from users  where grade = 2;

select grade,count(*) �ο��� from users group by grade;

1.�׷캰 �ο��� ����ϵ� �г��� ������������ ����
select grade,count(*) �ο��� from users group by grade order by grade asc;
2.�׷캰 �ְ����� �������� ����Ͻÿ�.
select grade, max(point) �ְ���, min(point)������ from users group by grade;
3.�׷캰 �ְ����� ȹ���� ����� �̸���?
select grade, max(point) �ְ���, name from users group by grade;
--(3�������� ������ ������ name�� �������̿��� (�׷�ȭ�� �Ǿ����� �ʾƼ�))

1. 3�г�� 4�г� ���� �׷��� �ο����� ����Ͻÿ�.
select grade, count(*) from users where grade=3 or grade=4 group by grade;
2. 1�г�� 2�г��� �ְ����� �������� ���� ���̸� ����Ͻÿ�.
select max(point)-min(point)from users where grade=1 or grade=2 group by grade;
3. �ֹι�ȣ 2�ڸ��� �¾ �⵵�̴�. ���� �⵵�� �¾ ����� ī���� �Ͻÿ� �̋� �¾ �⵵�� �ο����� ����Ѵ�.
select substr(jumin,1,2) �¾�⵵, count(*)�ο��� from users group by substr(jumin,1,2);

���� ������ ���������� �ϼ��ϼ���
�׷��� �ο��� 3�� �̻��� �׷��� �ο����� ����Ͻÿ�.
--where :: �ະ, ���� ���� having :: �׷캰, �׷� ����
select grade, count(*) from users group by grade having count(*)>=3;
�׷��� �ο��� 3�� �̻��� �׷��� ��ո� ����Ͻÿ�.
select grade, avg(point) from users group by grade having avg(point)>=
(select avg(point) from users); --��������
/*
������� ��ü�����. �� �׷��� ������ �ϼ�
avg(point)>=�������������(��ü���)
���������� ������ �ȿ� �Ұ��� �����ϴ� select��
���������� ������� �������� Ȱ���Ѵ�.
*/
/*
select���� ���� ������ Ȱ���ϸ� > ��Į�� ��������
from���� ���� ������ Ȱ���ϸ� > �ζ��̺� �������� 
select avg(point) from users;
select * from users;
*/
select m.name, m.addr from (select * from users)m;

1. ���� ���� ������ ȹ���� ����� �̸��� ������ ?
select name, point from users where point = (select max(point) from users);
