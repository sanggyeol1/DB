--��� ����� �޿��� ��, �ְ�޿�, �����޿�, ��ձ޿��� ���϶�
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM EMPLOYEE;


--RESEARCH�μ����� �ٹ��ϴ� ����� �޿��� ��, �ְ�޿�, �����޿�, ��ձ޿��� ���϶�
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER
      AND UPPER(DNAME) = 'RESEARCH';

--RESEARCH�μ����� �ٹ��ϴ� �� ����� ���� ���Ͽ���
SELECT COUNT(*)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER
      AND UPPER(DNAME) = 'RESEARCH';
      
--�� �μ��� ���ؼ� �μ���ȣ, �μ��̸�, �� �μ��� ���� ������� ���� ��ձ޿��� �˻��϶�.
SELECT DNO, Dname, COUNT(*), ROUND(AVG(SALARY))
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER
GROUP BY DNO, DNAME; -- GROUPPING ATTRIBUTE�� �ִ°͸� SELECT����

--�� ������Ʈ�� ���ؼ� ������Ʈ ��ȣ, �̸�, �� ������Ʈ���� �ٹ��ϴ� ����� ���� �˻��϶�.
SELECT PNUMBER, PNAME, COUNT(*)
FROM PROJECT, WORKS_ON
WHERE PNO = PNUMBER
GROUP BY PNUMBER, PNAME; -- GROUPING ATTRIBUTE�� �ִ°͸� SELECT����

--2���̻��� �ٹ��ϴ� �� ������Ʈ�� ���Ͽ� ������Ʈ ��ȣ, �̸�, �� ������Ʈ���� �ٹ��ϴ�
--����� ���� �˻��϶�.

SELECT PNUMBER, PNAME, COUNT(*)
FROM PROJECT, WORKS_ON
WHERE PNO = PNUMBER
GROUP BY PNUMBER, PNAME
HAVING COUNT(ESSN) >= 3; -- �����Լ�, GROUPING ATTRIBUTE�� �̿��� ���ǹ��� ��� ����
--=>HAVING: GROUP�� ���� ���ǹ��̱� ������ ????? �����ʿ�








