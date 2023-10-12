--ALTER TABLE 크기 늘리기
ALTER TABLE book MODIFY isbn VARCHAR2(50);

UPDATE bookcafe SET title = '히말라야산맥' WHERE title='태백산맥';
UPDATE bookcafe SET title = '대지' WHERE title='토지';
UPDATE bookcafe SET title = '또 다른 고양' WHERE title='또 다른 고향';
UPDATE bookcafe SET title = '아프니까 환자다' WHERE title='아프니까 청춘이다';
UPDATE bookcafe SET title = 'BITCH 눈동자' WHERE title='빛의 눈동자';

--book_id 7 ~ 10을 나디아연대기로 책이름 변경
UPDATE bookcafe SET title = '나 아니야 연대기', author='C.S.루이스'
WHERE book_id BETWEEN 7 AND 10;

--UPDATE를 이요해서 쿼리문 변경하는 방법
UPDATE bookcafe
SET title =
    CASE
        WHEN title = 'The Great Gatsby' THEN '대식가 개츠비'
        WHEN title = 'To Kill a Mockingbird' THEN '앵무개 살리기'
        WHEN title = 'The Catcher in the Ry' THEN '호밀빵 맛있겠다'
        WHEN title = '바람의 나라' THEN '귀혼'
        WHEN title = '얼음과 불의 노래' THEN '열불나는 노래'
        WHEN title = '미래의 선택' THEN '과거의 후회'
        WHEN title = '꽃을 보듯 너를 본다' THEN '돈을 보듯 너를 본다'
        WHEN title = '소나기' THEN '폭우'
        WHEN title = '우리들의 행복한 시간' THEN '우행시'
        WHEN title = '몽실언니' THEN '몽실이'
        ELSE title
    END;

