
-- 1. 제목이 반지의 제왕인 비디오 테이프의 ID를 검색하라.
SELECT VIDEO_ID
FROM VIDEO
WHERE TITLE = 'The Lord of the Rings';

-- 2. 예약된 비디오 테이프의 ID를 검색하라.
SELECT VIDEO_ID
FROM RESERVED;

-- 3. 예약되지 않은 비디오 테이프의 ID를 검색하라.
SELECT *
FROM (SELECT VIDEO_ID
FROM VIDEO)
MINUS
(SELECT VIDEO_ID
FROM RESERVED);

-- 4. 예약된 모든 비디오 테이프의 제목을 검색하라.
SELECT DISTINCT TITLE
FROM RESERVED R, VIDEO V
WHERE R.VIDEO_ID = V.VIDEO_ID;

-- 5. 비디오 테이프를 예약한 고객의 이름을 검색하라.
SELECT DISTINCT NAME
FROM CUSTOMER C, RESERVED R
WHERE C.CUSTOMER_ID = R.CUSTOMER_ID;

-- 6. 장르가 '액션'인 비디오 테이프를 예약한 고객의 이름을 검색하라.
SELECT C.ADDRESS
FROM CUSTOMER C, RESERVED R, VIDEO V
WHERE C.CUSTOMER_ID = R.CUSTOMER_ID AND R.VIDEO_ID = V.VIDEO_ID
AND GENRE = 'Action';

-- 7. 장르가 '다큐멘터리'인 비디오 테이프를 모두 예약한 고객의 이름을 검색하라.
SELECT NAME
FROM CUSTOMER C
WHERE NOT EXISTS(
    (
    SELECT VIDEO_ID
    FROM VIDEO
    WHERE GENRE = 'Documentary'
    ) -- 장르가 다큐멘터리인 비디오 테이프의 ID
    MINUS
    (
    SELECT VIDEO_ID
    FROM RESERVED R
    WHERE C.CUSTOMER_ID = R.CUSTOMER_ID
    ) --각 고객이 예약한 비디오테이프의 ID
)













      
      
      
      
       





