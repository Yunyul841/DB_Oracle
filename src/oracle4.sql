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
select a.name, b.c_num 
from users a, carinfo b 
where a.id = b.id;

3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�.

�������� Ǯ��
select a.name, a.addr 
from users a, carinfo b 
where a.id=b.id and b.c_num='7788';

���������� Ǯ��
select name,addr 
from users 
where id=(select id from carinfo where c_num='7788');

4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.
select a.name,a.addr 
from users a  --left table
left outer join carinfo b   --right table // left ���̺��� �̳������ϰ� ���ο� �������� ���� Ʃ�ñ��� ���
on a.id = b.id 
where b.c_num is null;
5. ȸ������ ����� �ڵ��� ���� ����Ͻÿ�.
select u.*, c.*
from users u, carinfo c
where u.id=c.id;

select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.name;   -- ���������� ���� ������ u.id�� �׷�����

select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.id;   -- ���������� ���� ������ u.id�� �׷����� ����
                -- select u.name�� �������̴�..
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id,u.name);   --group by�� ���ռӼ����� ��������.
6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id,u.name) having count(*) >= 2;   --group by�� ���ռӼ����� ��������.

7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.
--��, ���� ���� ���̺�� ���߿� ���� ���̺��� ������ ���..
--���� ���� ���̺��� carinfo, �ι���� ���� ���̺� users
--�ڵ����� ��ϵǾ� �ִµ� �����ڰ� ������? �̳�����
--�̳����ο� �������� ���ϴ� Ʃ���� ���Ѵ�...  �ƿ�������...
--�ƿ��� �����϶��� � ���̺��� left�� �� ���ΰ�?? ù��° left����
select c.c_num
from carinfo c
left outer join users u
on c.id = u.id
where u.id is null;

select c.c_num
from carinfo c,users u
where c.id = u.id(+) and u.id is null;

8. ���� �ڵ����� ����ȣ, ������, �ڵ�����, ������ ����Ͻÿ�.
carinfo ���� �ڵ����� ������ ����... ����ȣ�� carinfo�ذᰡ��������
������� �ڵ������ ������ companycar���̺� ����. �̳�����
select c.c_num, cc.c_com, cc.c_name, cc.c_price
from carinfo c, companycar cc
where c.c_num = cc.c_num;


9. ȸ�翡�����Ŵ� �Ͽ����� 
�������� ���� �ڵ����� ����ȣ, ������, �ڵ��� �̸��� ���   
���̺��� ���� ������ ���� ���ô�.
companycar ���̺� ������ �ڵ��� ������ Ȯ��, �� �ڵ��� �����Ǿ�����
Ȯ���ϱ� ���ؼ� carinfo���̺� Ȯ��..  ������ �ڵ����� �̳�����
������ �ȵ� �ڵ����� �ƿ��� ����.. �̶� campanycar�� left
select c.c_num, c.c_com, c.c_name
from companycar c
left outer join carinfo cc
on c.c_num = cc.c_num
where cc.c_num is null;

10. �ڵ��� ������ 1000���� �̻��� �ڵ����� �ڵ��� ��ȣ�� ����Ͻÿ�.
 �ڵ��� ������ 1000���� �̻��̶�� ������ companycar ���� �ذᰡ��
 ���ϴ� �ڵ��� ��ȣ�� companycar���� �ذᰡ�� �� ���� �ʿ����
 select c_name
 from companycar
 where c_price >=1000;








11. ������ �ڵ��� �߿� ȸ�翡�� ������ �ڵ����� �ƴ� �ڵ��� ��ȣ�� ����Ͻÿ�.
���� ���̺��� carinfo   companycar
outer join  >  carinfo ���̺��� left
select c.c_num
from carinfo c
left outer join companycar c1
on c.c_num = c1.c_num
where c1.c_com is null;






12. ��� ����� ������ ����Ͻÿ�. �̸�, �������� �ڵ�����ȣ, 
�ڵ����̸�
�������̺��� users, carinfo, companycar
�����ؼ� ����� ���� ���̺���
users.name  carinfo.c_num  companycar.c_name
�� ���̺�3���� ����. �̶��� ������ ���ϰ� ������� 2���� �����ϰ�
�� ����� �����̺�� ���� ���̺��� ���� .. ����
select u.name,name NVL(c.c_num,'����'), NVL(cc.c_name,'����') carnum,
NVL(cc.c_name,'����') carnum
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar cc
on c.c_num= cc.c_num;