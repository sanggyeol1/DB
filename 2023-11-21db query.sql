--WHERE ATT > (SELECT FROM WHERE); SCALA RETURN
--WHERE ATT IN (SELECT FROM WHERE); A SET OF TUPLES RETURN
--WHERE ATT ALL(SELECT FROM WHERE);
--WHERE ATT ANY(SELECT FROM WHERE); 
--WHERE ATT NOT EXIST(SELECT FROM WHERE); RETURN�ϸ� FALSE, RETURN�� ������ TRUE

--WHERE �������� TRUE OR FALSE��
--CORELATION : �ܺ������� ���Կ� ���� IN A QUERY �� ���ϸ� ������谡 �ִ� ��
--WHERE NOT EXIST(S1 MINUS S2); �ܺ� ������ ������ ���� TRUE, FALSE���ΰ� �����ȴ�.


--JOHN SMITH�� �����ϴ� ������Ʈ �ѹ��� �˻��϶�.
SELECT PNO
FROM EMPLOYEE, WORKS_ON
WHERE SSN = ESSN AND UPPER(FNAME) = 'JOHN' AND UPPER(LNAME) = 'SMITH';





--JHON SMITH�� �����ϴ� ������Ʈ�� �����ϴ� ������ FNAME, LNAME�� �˻��϶�.
SELECT FNAME, LNAME
FROM EMPLOYEE, WORKS_ON
WHERE SSN = ESSN
AND PNO IN (SELECT PNO
FROM EMPLOYEE, WORKS_ON
WHERE SSN = ESSN AND UPPER(FNAME) = 'JOHN' AND UPPER(LNAME) = 'SMITH' 
);--�׻� 1,2 �� �����ϹǷ� CORELATION�� ����


--JHON SMITH�� �����ϴ� ������Ʈ�� ��� �����ϴ� ������ FNAME, LNAME�� �˻��϶�.
--'���'�� ���� WHERE NOT EXIST �� ��������.
--2�� FOR���� ����

WHERE NOT EXISTS (
    (SELECT PNO
FROM EMPLOYEE, WORKS_ON
WHERE SSN = ESSN AND UPPER(FNAME) = 'JOHN' AND UPPER(LNAME) = 'SMITH') -- JOHN SMITH�� �ϴ� ������Ʈ
    MINUS
    (SELECT PNO
    FROM WORKS_ON
    WHERE E.SSN = ESSN) -- EACH EMPLOYEE�� �����ϴ� ������Ʈ
);

--6���μ��� ����ϴ� ������Ʈ�� �����ϴ� ����� �̸��� �˻��϶�.
SELECT FNAME, LNAME
FROM EMPLOYEE, PROJECT, WORKS_ON
WHERE PNO = PNUMBER AND ESSN = SSN AND DNO = 6;

--6���μ��� ����ϴ� ������Ʈ�� ��� �����ϴ� ����� �̸��� �˻��϶�
SELECT FNAME, LNAME
FROM EMPLOYEE E
WHERE NOT EXISTS(
    (SELECT PNUMBER
FROM EMPLOYEE, PROJECT
WHERE DNUM = 6) -- 6���μ��� ����ϴ�PROJECT NUMBER
    MINUS
    (SELECT PNO
    FROM WORKS_ON
    WHERE E.SSN = ESSN) -- �� ����� ����ϴ� PROJECT NUMBER
);


--6���μ��� ����ϴ� ������Ʈ NUMBER�� �˻��϶�.
SELECT PNUMBER, PNAME
FROM PROJECT
WHERE DNUM = 6;




--10��, 29��, ������ �ϴ� ���ǰ� ������
--6.123�� �������� 6.45�� ������ �о�� �Ѵ�.
