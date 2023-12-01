--�帣�� '��ť���͸�'�� ���� �������� ������ ���� �̸��� �˻�4
SELECT NAME
FROM CUSTOMER C, RESERVED R, VIDEO V
WHERE C.CUSTOMER_ID = R.CUSTOMER_ID AND R.VIDEO_ID = V.VIDEO_ID
    AND GENRE  = '��ť���͸�';


--�帣�� '��ť���͸�'�� ���� �������� ��� ������ ���� �̸��� �˻�
SELECT NAME
FROM CUSTOMER C
WHERE NOT EXISTS(
    (SELECT VIDEO_ID 
    FROM VIDEO
    WHERE UPPER(GENRE) = 'ACTION') -- �帣�� '��ť���͸�'�� VIDEO_ID (UNCORRELATED)
    MINUS
    (SELECT VIDEO_ID
    FROM RESERVED 
    WHERE CUSTOMER_ID = C.CUSTOMER_ID) -- EACH CUSTOMER�� RESERVED�� VIDEO_ID(CORRELATED)
)


