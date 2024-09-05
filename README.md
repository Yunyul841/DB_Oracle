## DB_Oracle


## 목차
[1. 개발 환경](#1-개발-환경)<br>
[2. 자료형 설명](#2-자료형-설명)<br>
[3. 용어 설명](#3-용어-설명)<br>
[4. CRUD](#4-CRUD)<br>
[5. ERD](#5-ERD)<br>
[6. 함수 설명](#6-함수-설명)<br>
[7. 그룹화](#7-그룹화)<br>
[8. JOIN](#8-JOIN)<br>

## 1. 개발 환경
**DBMS** - Data Base Management Sysytem => **Oracle 11g** 프로그램 사용<br>
Oracle 11g 프로그램을 **Sql plus** 사용해 조작 <br>
**Sql Developer** - Oracle에서 제공하는 DB IDE<br>
#### 설정
- 새 데이터베이스 접속
- 접속 이름, 사용자 이름, 비밀번호 설정 (사용자, 비밀번호는 처음 Oracle 설치시 사용했던 걸로)
- 호스트 이름, 포트, SID 설정 (내부에서 사용할 경우 호스트는 localhost 포트는 기본 1521 SID는 전역변수 이름)
- 테스트 후 '상태:성공'이라는 메세지가 뜬다면 접속<br>

<br><br><br>

[목차로](#목차)<br>

## 2. 자료형 설명
- **문자형 데이터 타입**
  - CHAR<br>
  최대 2000 byte의 고정 길이 문자를 저장. 기본(최소) 크기는 1byte. <br>
  처음 정한 크기보다 더 적은 문자열을 입력하면 공백으로 채워짐.
  - VARCHAR2<br>
  최대 4000 byte의 가변 길이 문자를 저장. 최소 사이즈는 1byte 혹은 1 character.<br>
  길이를 가변적으로 정하므로 CHAR 보다 메모리 절약이 가능하다.<br>

- **숫자형 데이터 타입**
  - NUMBER<br>
  0을 포함한 음수와 양수 등의 숫자를 저장. <br>
  1.0 * 10^(-130) ~부터 1.0 * 10^126 미만 까지 저장할 수 있다. <br>
  그 이상의 절댓값을 가진 수는 에러를 반환한다.<br>

- **날짜형 데이터 타입**
  - DATE<br>
  BC 4712년부터 AD 9999년 까지의 날짜를 저장. 7byte로 저장한다.<br>
  Datetime 필드인 YEAR, MONTH, DAY, HOUR, MINUTE, SECOND를 포함한다.<br>
  - TIMESTAMP<br>
   DATE 타입의 확장된 타입이다. 9자리의 밀리초까지 저장이 가능하다.<br>

<br><br><br>

[목차로](#목차)<br>

## 3. 용어 설명
- **릴레이션**<br>
관계 데이터 모델(관계형 데이터베이스)의 테이블을 릴레이션(Relation)이라고 부른다.<br>
튜플(Tuple)과 어트리뷰트(Attribute)로 구성된다.<br>
- **테이블**<br>
테이블은 행과 열로 구성된 데이터 집합이다.*(테이블 != 릴레이션)*<br>
- **튜플**<br>
릴레이션의 행을 의미한다.*( == 레코드)*<br>
- **어트리뷰트**<br>
릴레이션의 열을 말함 '속성' 또는 어트리뷰트라고 한다.*( == 필드)*<br>
- **기본 키, 외래 키**<br>
키는 데이터베이스에서 조건에 만족하는 튜플을 찾거나 순서대로 정렬할 때<br>
다른 튜플들과 구별할 수 있는 유일한 기준이 되는 속성이다.<br>
  - 기본 키<br>
  유일성을 판단하여 튜플을 유일하게 식별, 기본키로 index를 형성하여 저장함<br>
  검색속도가 향상되며 null값 불가함<br>
  - 외래 키 <br>
  테이블을 정규화하기 위해 사용 (데이터 중복을 최소화하기 위해서 테이블을 쪼갠다.)<br>
  자식 릴레이션 컬럼이 부모 릴레이션 컬럼을 참조한다.<br>
  *제약조건 :  CASCADE(부모가 삭제되면 자식도 삭제), SET NULL(부모가 삭제되면 자식은 NULL)*<br>
- **ERD**<br>
개체와 개체의 관계분석 1:1, 1:N, N:M 분석 후 테이블 형성<br>

<br><br><br>

[목차로](#목차)<br>

## 4. CRUD
- **C**
  - CREATE TABLE [테이블명] (<br>
  	컬럼명1 데이터타입() 제약조건,<br>
  	컬럼명2 데이터타입() 제약조건,<br>
  	… );<br>

  - INSERT INTO [테이블명] VALUES (컬럼 값1, 컬럼 값2, ... , 컬럼 값n);<br>

- **R**
  - SELECT [ ] FROM [ ] WHERE [ ] (GROUP BY[ ]) ORDER BY [ ]<br>
  - SELECT 뒤에는 개수를 세는 집계 COUNT가 올 수도 있고 전체를 셀 수 있는 *이 올 수 있다.<br>
    여러 개의 컬럼을 가져오고 싶을 땐 [컬럼1, 컬럼2, … ] 쓰면 된다. <br>

  - SELECT – 화면에 출력<br>
    FROM – 대상 테이블<br>
    WHERE – 대상 테이블로 부터 튜플 선정 조건<br>
    GROUP BY – 그룹화 후 요약<br>
    ORDER BY – 출력할 때 정렬<br>
  
  - 순서 : FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY 순서로 생각 및 분석 <br>

- **U**
  - 특정 튜플을 선택하여 갱신하려면 WHERE절 사용<br>

  - ALTER TABLE [테이블명] ADD (컬럼명 데이터타입 ())<br>
    ALTER TABLE [테이블명] MODIFY (컬럼명 데이터타입 ())<br>
    ALTER TABLE [테이블명] DROP COLUMN 컬럼명<br>
    ALTER TABLE [테이블명] RENAME COLUMN 원래컬럼명 TO 바꿀컬럼명<br>

  - UPDATE [테이블명] SET [컬럼명 = 데이터 값] WHERE [조건]<br>
    -> SET 컬럼명 = 데이터 값 <br>
  - 선택한 컬럼에 기재한 데이터 값으로 데이터 갱신<br>

- **D**
  - 특정 튜플을 선택하여 삭제하려면 WHERE절 사용<br>
  
  - DROP TABLE [테이블명]<br>
  
  - DELETE FROM [테이블명] WHERE [조건]<br>

<br><br><br>

[목차로](#목차)<br>

## 5. ERD
<u>개념적 설계</u> => 논리적 설계 => 물리적 설계<br>
**개념적 설계**에 해당하는 부분<br>
관계는 **1:1, 1:N, N:M**이 있다.<br> 
데이터 정규화를 진행하기 위해 ERD를 설계했다.<br>
(그림 추가하면서 설명)
<br><br><br>

[목차로](#목차)<br>

## 6. 함수 설명
함수는 특정 기능을 제공한다.<br>
내가 직접 만들어 사용하는 것과 이미 만들어진 것을 사용하는 것으로 구분할 수 있다.<br>
함수는 하나하나 다 외우면 좋지만 그럴 수 없기에 <mark>검색하면서 사용</mark>하자<br>
그렇게 사용하면서 몸에 익히자 !<br>

- **만들어 사용**

  - 매개변수<br>
  function (abc) -> 소괄호 안에 있는 abc - 함수를 선언할 때 주는 값<br>

  - 인자<br>
  매개변수 자리에 들어가는 값 - 함수를 호출할 때 입력하는 실제 값<br>

- **내장함수** *(사용 방법은 검색해서)*

  - 집계 함수<br>
  max, min, avg, sum, mod, count, etc.<br>

  - 문자열 함수<br>
  concat, substr, instr, replace, lpad, rpad, trim, ltrim, rtrim, like, etc.<br>

  - 숫자 함수<br>
  trunc, mod, sign, round, ceil, floor, etc.<br>

  - 날짜 함수<br>
  sysdate, extract, months_between, add_months, next_day, last_day, etc.<br>

  - 형변환 함수<br>
  to_char, to_date, to_number, etc.<br>

  - 조건 함수<br>
  decode, case-when-then, etc.<br>

  - NULL 처리 함수<br>
  nvl, nvl2, etc.<br>

<br><br><br>

[목차로](#목차)<br>

## 7. 그룹화
그룹화는 CRUD에 R인 SELECT에서 사용된다.<br>
중요한 문법이라고 생각하기 때문에 추가로 분리해서 정리!<br>

>데이터에 대한 집계를 하기 위해, 여러행의 값을 더하거나, 개수를 세는 등<br>
데이터에 관한 계산을 위해서 그룹화를 한다.<br>
데이터를 그룹화 할 때 <mark>어떤 컬럼값을 기준</mark>으로 그룹 함수를 적용할지 잘 생각해야 한다.<br>

- **문법**
  - SELECT [ ] FROM [ ] WHERE [ ] GROUP BY [ ] HAVING [ ] ORDER BY [ ];<br>

- **해석**
  - WHERE 조건절 : 대상이 되는 데이터를 한번 조건에 맞추어 필터링.

  - GROUP BY : 조건에 맞지 않는 row는 빼버린, 필터링된 대상들을 특정 컬럼을 기준으로 그룹핑.

  - HAVING : 그룹에 대한 조건절. 그룹 중 조건에 맞는 그룹만 남김.

  - ORDER BY : 마지막으로, 적절한 컬럼 또는 집계함수 결과값을 기준으로 정렬함.<br>
       (보통 GROUP BY 기준이 되는 컬럼을 기준으로 정렬함)

<br><br><br>

[목차로](#목차)<br>

## 8. JOIN
*질문)<br> 
테이블을 분리해야할까?*<br>
=><br>
테이블 안에 튜플에 대한 중복이 있다면 테이블을 분리하는 것이 맞다.<br>

>정규화의 기본적인 목표는 테이블 간에 <mark style="background-color:red">중복되는 데이터가 발생하지 않도록</mark> 하는 것 !<br>
중복된 데이터를 허용하지 않음으로써 <u>데이터의 무결성을 유지</u>할 수 있고,<br>
이로 인해 데이터베이스 관리에 필요한 <u>저장 공간을 축소</u>시키는 효과가 있다.<br>
데이터의 중복을 피하기 위해 데이터를 구조화하고, 그 과정에서 테이블을 더 작은 테이블로 분해한다.<br>
-> 그래서 분리된 테이블을 합쳐서 필요한 데이터를 추출할 때 사용하는 것이 <u>**JOIN**</u><br>

### JOIN 종류
<div style = "text-align: center;">
<img src=https://www.thoughtco.com/thmb/xh4MUu8HQyX1JVEcxn2IorWogoo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/0iHiL-d7a0c49a861448cb94477386a6f3f05b.png></img></div><br>

- **FULL JOIN**<br>
두개의 테이블을 모두 합치는 것<br>
결과는 N * M의 수만큼 조인이 되어 튜플이 만들어 진다.<br>
*FULL JOIN은 속도가 많이 느려지기에 절대 현업에서 사용하면 안된다 !*<br>

- **INNER JOIN**<br>
일반적으로 사용하는 조인<br>
A, B 테이블에서 동등한 조건이 있을 때 원하는 컬럼을 가져올 수 있다.<br><br>
ex)<br>
A테이블의 a컬럼의 값이 10,20,30<br>
B테이블의 a컬럼의 값이 10,20,30,40 이면<br>
교집합이 되는 10,20,30의 데이터만 가져올 수 있고,<br>
B테이블의 a컬럼의 값인 40은 가져올 수 없다.<br><br>
**Oracle JOIN**<br>
SELECT [ ] FROM A, B WHERE A.a = B.a;<br>
**ANSI JOIN**<br>
SELECT [ ] FROM A INNER JOIN B ON A.a = B.a;<br>

- **OUTER JOIN**<br>
INNER 조인에서 추가로 원하는 부분들을 더 가져올 수 있다.<br>

  - **LEFT OUTER JOIN**<br>
  A 테이블과 B 테이블이 있을 때 교집합을 기준으로 왼쪽에 있는 값을 추가로 가져온다.<br><br>
  ex)<br>
  A테이블의 a컬럼의 값이 10,20,30,40<br>
  B테이블의 a컬럼의 값이 10,20,30 이면<br>
  교집합이 되는 10,20,30의 데이터를 가져온 후<br> 
  추가로 A테이블의 a컬럼의 값인 40을 가져온다.<br><br>
  **Oracle JOIN**<br>
  ~~SELECT [ ] FROM A, B WHERE A.a = B.a(+);~~<br>
  **ANSI JOIN**<br>
  SELECT [ ] FROM A LEFT OUTER JOIN B ON A.a = B.a;<br>

  - **RIGHT OUTER JOIN**<br>
  A 테이블과 B 테이블이 있을 때 교집합을 기준으로 오른쪽에 있는 값을 추가로 가져온다.<br><br>
  ex)<br>
  A테이블의 a컬럼의 값이 10,20,30<br>
  B테이블의 a컬럼의 값이 10,20,30,40 이면<br>
  교집합이 되는 10,20,30의 데이터를 가져온 후<br> 
  추가로 B테이블의 a컬럼의 값인 40을 가져온다.<br><br>
  **Oracle JOIN**<br>
  ~~SELECT [ ] FROM A, B WHERE A.a(+) = B.a;~~<br>
  **ANSI JOIN**<br>
  SELECT [ ] FROM A RIGHT OUTER JOIN B ON A.a = B.a;<br>

  - **FULL OUTER JOIN**<br>
  말 그대로 A 테이블과 B 테이블이 있을 때 교집합을 기준으로 양쪽에 있는 값을 추가로 가져온다.<br><br>
  ex)<br>
  A테이블의 a컬럼의 값이 10,20,30,50<br>
  B테이블의 a컬럼의 값이 10,20,30,40 이면<br>
  교집합이 되는 10,20,30의 데이터를 가져온 후<br> 
  추가로 A테이블의 a컬럼의 값인 50과 B 테이블의 a컬럼의 값인 40을 가져온다.<br><br>
  **ANSI JOIN(만 가능)**<br>
  SELECT [ ] FROM A FULL OUTER JOIN B ON A.a = B.a;<br><br>

*추가)<br>
INNER JOIN은 null값이 있는 경우 처리하지 못해서 null값이 제외되지만, <br>
OUTER JOIN은 null값을 포함해서 가져온다.*<br>

*질문)<br> 
만약 SELECT 문에 조인과 그룹화가 있다면?*<br>
=><br>
 조인을 한 후에 그룹화를 진행한다.<br>
조인으로 만들어진 데이터들을 가지고 그룹화를 하는 것 !<br>

*질문)<br>
만약 조인을 사용하면서 조건을 추가하고 싶다면?*<br>
=> WHERE절 뒤에 AND를 사용하면 된다.<br>

*질문)<br>
여러개의 테이블을 조인할 때?*<br>
=> <br>
두개의 테이블을 먼저 조인해서 나온 데이터와 조인하고자 하는 새로운 테이블을 조인한다.<br>
이런 방식으로 10개든 100개든 진행 !<br>
**(((((A 조인 B) 조인 C) 조인 D) 조인 E) ... 조인 n)**<br>

<br><br><br>

[목차로](#목차)<br>

