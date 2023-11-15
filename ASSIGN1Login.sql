CREATE TABLE DEPARTMENT(
    DEPTNO NUMBER NOT NULL,
    DEPTNAME CHAR(10),
    FLOOR NUMBER,
    PRIMARY KEY(DEPTNO));
    
CREATE TABLE EMPLOYEE(
    EMPNO NUMBER NOT NULL,
    EMPNAME CHAR(10) UNIQUE,
    TITLE CHAR(10),
    MANAGER NUMBER,
    SALARY NUMBER,
    HIREDATE DATE,
    DNO NUMBER,
    PRIMARY KEY(EMPNO),
    FOREIGN KEY(MANAGER) REFERENCES EMPLOYEE (EMPNO),
    FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DEPTNO));
    
--INSERT INTO DEPARTMENT VALUES(1, '����', 8);
--INSERT INTO DEPARTMENT VALUES(2, '��ȹ', 10);
--INSERT INTO DEPARTMENT VALUES(3, '����', 9);
--INSERT INTO DEPARTMENT VALUES(4, '�ѹ�', 7);

--INSERT INTO EMPLOYEE VALUES(4377, '�̼���', '����', NULL, 5000000, '1996-01-05', 2);
--INSERT INTO EMPLOYEE VALUES(1234, '���ȣ', '����', 4377, 4200000, '1996-11-23', 1);
--INSERT INTO EMPLOYEE VALUES(3426, '�ڿ���', '����', 1234, 3000000, '1998-07-20', 1);
--INSERT INTO EMPLOYEE VALUES(1365, '����', '���', 3426, 1500000, '2004-02-26', 1);
--INSERT INTO EMPLOYEE VALUES(1099, '�����', '���', 3426, 1800000, '2003-12-21', 1);
--INSERT INTO EMPLOYEE VALUES(3011, '�̼���', '����', 4377, 4300000, '1996-04-30', 3);
--INSERT INTO EMPLOYEE VALUES(2468, '������', '����', 3011, 3500000, '1998-12-17', 3);
--INSERT INTO EMPLOYEE VALUES(2544, '���ؼ�', '�븮', 2468, 2700000, '2002-08-25', 3);
--INSERT INTO EMPLOYEE VALUES(1003, '������', '�븮', 2468, 2600000, '2001-02-19', 2);
--INSERT INTO EMPLOYEE VALUES(3427, '����ö', '���', 1003, 1500000, '2005-10-28', 3);
--INSERT INTO EMPLOYEE VALUES(3228, '������', '����', 4377, 4000000, '1997-03-06', 2);
--INSERT INTO EMPLOYEE VALUES(2106, '��â��', '�븮', 3228, 2500000, '2003-03-05', 2);




--����1:DEPARTMENT �����̼ǿ��� �μ��̸��� �μ���ȣ�� �˻��϶�.
SELECT DEPTNAME, DEPTNO
FROM DEPARTMENT;

--����2:EMPLOYEE �����̼��� ��� ��Ʈ����Ʈ���� �˻��϶�.
SELECT *
FROM EMPLOYEE;

--����3:EMPLOYEE�����̼ǿ��� ���� ��Ʈ����Ʈ�� �˻��϶�.
SELECT TITLE
FROM EMPLOYEE;

--����4: 3���μ��� �ٹ��ϴ� ��� ������� �̸��� ������ �˻��϶�.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE DNO = 3;

--����5:������ ������ ��� ������� �̸��� �˻��϶�.
SELECT EMPNAME
FROM EMPLOYEE
WHERE TITLE = '����';

--����6:2000�� 2��1�� ���Ŀ� �Ի��� ��� ������� �̸��� �Ի����� �˻��϶�
SELECT EMPNAME, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE > '2000-02-01';

--����7:������ ������ �ƴ� ��� ������� �̸��� ������ �˻��϶�.
SELECT EMPNAME, TITLE
FROM EMPLOYEE 
WHERE TITLE <> '����';

--����8:�μ�2�� �ٹ��ϸ鼭 �ſ� 2500000������ ���� �޿��� �޴�
--��� ������� �̸�, ����, �޿��� �˻��϶�.
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE DNO = 2 
      AND SALARY > 2500000;
      
--����9:�޿���2000000������ 3000000�� ������
--��� ������� �̸�, ����, �޿��� �˻��϶�.
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;

--����10:������ ������ �ƴϸ鼭 �޿��� 3000000������ ����
--��� ������� �̸�, ����, �޿��� �˻��϶�.
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE TITLE<>'����' AND SALARY > 3000000;

--����11:������ �븮�̰ų� �����̰ų� ������
--��� ������� �̸�, ����, �μ���ȣ�� �˻��϶�
SELECT EMPNAME, TITLE, DNO
FROM EMPLOYEE
WHERE TITLE IN('�븮', '����', '����');

--����12:2�� �μ��� �ٹ��ϸ鼭, ������ �븮�̰ų� ������
--��� ������� �̸�, ����, �μ���ȣ�� �˻��϶�.
SELECT EMPNAME, TITLE, DNO
FROM EMPLOYEE
WHERE DNO = 2 AND TITLE IN('�븮', '����');

--����13:�达 ���� ���� ��� ����� �̸��� ������ �˻��϶�.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE EMPNAME LIKE '��%';

--����14:���ӻ�簡 ����, �� ���� ���� ����� �̸��� ������ �˻��϶�.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE MANAGER IS NULL;

--����15:��� ������� �޿��� �̸��� �˻��Ͽ� 
--�޿��� ���� ������������ ����
SELECT SALARY, EMPNAME
FROM EMPLOYEE
ORDER BY SALARY;

--����16:��� ������� �޿��� �̸��� �˻��Ͽ� �޿��� ���� 
--������������ �����϶�.
SELECT SALARY, EMPNAME
FROM EMPLOYEE
ORDER BY SALARY DESC;

--����17:��� ������� �޿��� �̸��� �˻��Ͽ� �μ���ȣ�� ���ؼ���
--������������, �޿��� ���ؼ��� ������������ �����϶�.
SELECT SALARY, EMPNAME
FROM EMPLOYEE
ORDER BY DNO, SALARY DESC;

--����18:3���μ��� �ٹ��ϴ� ������� ���� ��� �޿��� �˻��϶�.
SELECT COUNT(*) AS TOTAL, AVG(SALARY) AS AVGSAL
FROM EMPLOYEE
WHERE DNO = 3;

--����19:��� ����鿡 ���ؼ� �̸��� �ٹ��ϴ� �μ��� ���� �˻��϶�
SELECT E.EMPNAME, D.FLOOR
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO;


--����20:���ߺμ��� �ٹ��ϴ� ��� ����鿡 ���� �̸��� ������ �˻��϶�.
SELECT E.EMPNAME, E.TITLE
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
      AND D.DEPTNAME = '����';

--����21:������鿡 ���Ͽ� �̸��� �ٹ��ϴ� �μ��� ���� �˻��϶�.
SELECT EMPNAME, FLOOR
FROM EMPLOYEE INNER JOIN DEPARTMENT 
     ON EMPLOYEE.DNO = DEPARTMENT.DEPTNO;
     
--����22:������ ���� �μ��� �ٹ��ϴ� ������� �̸��� ������ �˻��϶�.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE DNO = (SELECT DNO
             FROM EMPLOYEE
             WHERE EMPNAME = '����');
             
--����23:��ü ������� ��� �޿����� ���� �޴� ������� �̸��� �˻��϶�.
SELECT EMPNAME
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEE);
                
--����24:8���̳� 9���� ��ġ�� �μ��� �ٹ��ϴ� ������� �̸��� �˻�
SELECT EMPNAME
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
      AND FLOOR IN(8,9);
    
SELECT DISTINCT EMPNAME
FROM EMPLOYEE, DEPARTMENT
WHERE DNO IN(SELECT DEPTNO
             FROM DEPARTMENT
             WHERE FLOOR IN(8, 9));
             
--����25:�Ҽӻ���� �Ѹ� ���� �μ��� ���ؼ� �μ���ȣ, �μ��̸�, ���� �˻�
SELECT DEPTNO, DEPTNAME, FLOOR
FROM DEPARTMENT D
WHERE NOT EXISTS
      (SELECT *
       FROM EMPLOYEE E
       WHERE E.DNO = D.DEPTNO);
       
--����26:������� ���� �μ����� �ٹ��ϸ鼭 ���� ������ ����
--������� �̸�, ����, �μ���ȣ�� �˻��϶�.
SELECT EMPNAME, TITLE, DNO
FROM EMPLOYEE E1
WHERE EXISTS
      (SELECT *
       FROM EMPLOYEE E2
       WHERE E2.EMPLOYEE = '������'
             AND E1.TITLE = E2.TITLE
             AND E1.DNO = E2.DNO);
             
--����27:�μ����� �μ��̸��� �޿��� ����� ���Ͽ���
SELECT DEPTNAME, AVG(SALARY) AS AVG_SAL
FROM DEPARTMENT D, EMPLOYEE E
WHERE D.DEPTNO = E.DNO
GROUP BY DEPTNAME;

--����28:�μ��� ���� �������� �޿��� �հ谡 10000000���� 15000000��
--������ �μ��� ���Ͽ� �μ����� �μ��̸��� �޿��� �հ踦 �˻��ض�.
SELECT DEPTNAME, SUM(SALARY)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
GROUP BY DEPTNAME
HAVING SUM(SALARY) BETWEEN 10000000 AND 15000000;












