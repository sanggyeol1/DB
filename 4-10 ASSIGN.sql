
-- 1. ������ ������ ������ ���� �������� ID�� �˻��϶�.
SELECT VIDEO_ID
FROM VIDEO
WHERE TITLE = 'The Lord of the Rings';

-- 2. ����� ���� �������� ID�� �˻��϶�.
SELECT VIDEO_ID
FROM RESERVED;

-- 3. ������� ���� ���� �������� ID�� �˻��϶�.
SELECT *
FROM (SELECT VIDEO_ID
FROM VIDEO)
MINUS
(SELECT VIDEO_ID
FROM RESERVED);

-- 4. ����� ��� ���� �������� ������ �˻��϶�.
SELECT DISTINCT TITLE
FROM RESERVED R, VIDEO V
WHERE R.VIDEO_ID = V.VIDEO_ID;

-- 5. ���� �������� ������ ���� �̸��� �˻��϶�.
SELECT DISTINCT NAME
FROM CUSTOMER C, RESERVED R
WHERE C.CUSTOMER_ID = R.CUSTOMER_ID;

-- 6. �帣�� '�׼�'�� ���� �������� ������ ���� �̸��� �˻��϶�.
SELECT C.ADDRESS
FROM CUSTOMER C, RESERVED R, VIDEO V
WHERE C.CUSTOMER_ID = R.CUSTOMER_ID AND R.VIDEO_ID = V.VIDEO_ID
AND GENRE = 'Action';

-- 7. �帣�� '��ť���͸�'�� ���� �������� ��� ������ ���� �̸��� �˻��϶�.
SELECT NAME
FROM CUSTOMER C
WHERE NOT EXISTS(
    (
    SELECT VIDEO_ID
    FROM VIDEO
    WHERE GENRE = 'Documentary'
    ) -- �帣�� ��ť���͸��� ���� �������� ID
    MINUS
    (
    SELECT VIDEO_ID
    FROM RESERVED R
    WHERE C.CUSTOMER_ID = R.CUSTOMER_ID
    ) --�� ���� ������ ������������ ID
)













      
      
      
      
       





