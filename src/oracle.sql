create table hm(
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate);

insert into hm values (1, 'ȫ�浿',50,'������',default);
insert into hm values (2, '������',45,'����',default);
insert into hm values (3, '������',43,'����',default);
select * from hm;
select no,name from hm;
select count(*) from hm;
commit;

1.��� ����� �̸��� ������ ����Ͻÿ�.
select name,point from hm;
2.������ 50�� �̸��� ����� �̸��� ������ ����Ͻÿ�.
select name,point from hm where point < 50; 
3.������ 50�� �̸��� ����� ��� ����ΰ���?
select * from hm where point < 50;
4.ȫ�浿�� ������ ���� �ΰ���?
select name,point from hm where name='ȫ�浿';  
5.�������� ��� ������ ����ϼ���.
select*from hm where name='������';

1. ��� �л��� �̸��� ����Ʈ�� �߷��ϵ� ����Ʈ�� ���� ����Ʈ���� 10���� �÷��� ���
select name,point+10 from hm; 
2. ��� �л��� �̸��� ����Ʈ�� �߷��ϵ� Ǯ���� �̸� ��������Ʈ ��������Ʈ 
�̸��� �л��� �̸� ��������Ʈ�� ����� ����Ʈ ��������Ʈ�� +10���ø� ����Ʈ
select name �̸�,point ��������Ʈ, point+10 ��������Ʈ from hm;
select * from hm;
update hm set point=100, name='��Ƽó';
select * from hm;
delete from hm;
update hm set point=100, name='��Ƽó'where name='ȫ�浿';
select * from hm;
delete from hm;
commit;
select concat('�̸�','��') �̸� from dual;
select sysdate from dual;

1. �̸��ڿ� ���� ������ ����Ͻÿ�. ��� ����� �̸��� ����Ʈ�� ����մϴ�.
select concat( name ,'��'), point from hm;

2. ��� ����� �̸��� ����Ʈ�� ������� ����մϴ�.
   �̶� ���Լ����� ���� ����մϴ�. ���� ���߿� ������ ����� ���� ���� ���
   ���� ��¥�� indate
select name,point,indate from hm order by indate desc;
   
3. ����Ʈ�� 50�̻��� ����� �̸��� ������ ����մϴ�.
    no,�̸�,����Ʈ�� ������ ���ڿ��̴�.
select name �̸�, concat(concat(no,name),point)���� from hm where point >= 50; 
4. ��������Ʈ�� 60�̴�. ��� ȸ���� ��������Ʈ�� ���߱� ���ؼ� ������ ����Ʈ�� ������ÿ�
    ����� �̸� ���� ����Ʈ ������ ����Ʈ
select name �̸�, point ��������Ʈ, 60-point ����������Ʈ from hm;
