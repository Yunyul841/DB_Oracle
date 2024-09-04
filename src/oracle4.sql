create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --�ڵ��� ��ȣ
c_name varchar2(10),  -- �ڵ��� ����
 id varchar2(8));
 
 
insert into users values ('1111','kim','����');
insert into users values ('2222','lee','����');
insert into users values ('3333','park','����');
insert into users values ('4444','choi','����');

insert into carinfo values ('1234','����','1111');
insert into carinfo values ('3344','����','1111');
insert into carinfo values ('5566','����','3333');
insert into carinfo values ('6677','����','3333');
insert into carinfo values ('7788','����','4444');
insert into carinfo values ('8888','����','5555');

select * from users;
select * from carinfo;

�� �ڷḦ ȸ���� ����� �ڵ��� �����̴�.

1. ȸ���� �̸��� �ּҸ� ����Ͻÿ�.
select name,addr from users;
2. ȸ���� �̸��� ������ �ڵ��� ��ȣ�� ����Ͻÿ�.
select a.name, b.c_num from users a, carinfo b where a.id = b.id;
3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�.
select a.name, a.addr from users a, carinfo b where a.id=b.id and b.c_num='7788';
4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.
select a.name,a.addr from users a
left outer join carinfo b 
on a.id = b.id 
where b.c_num is null;
5. ȸ������ ����� �ڵ��� ���� ����Ͻÿ�.

6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.

7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.
