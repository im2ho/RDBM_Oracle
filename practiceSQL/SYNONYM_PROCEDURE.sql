--SYNONYM (동의어)객체에 붙인 별명..
--다른 테이블의 뷰, 저장 프로시저 등과 상호작용 할 때 사용
--데이터베이스 객체에 대한 다른 이름을 제공하는데 사용

--"bookcafe" 테이블에 대한 synonym 생성
CREATE OR REPLACE SYNONYM book_synonym FOR bookcafe; --생성 혹은 덮어쓰기
SELECT * FROM book_synonym;

--book_synonym을 사용하는 저장 프로시저(Stored Procedure) 생성
                           --프로시저 : 함수와 같은 기능... but 특정 로직을 처리하고 결과 값은 반환X

-- 'book_syn'이라는 프로시저 생성
CREATE OR REPLACE PROCEDURE book_syn(
    p_book_id IN NUMBER --IN 매개변수 (입력 파라미터)
)
AS
    v_title VARCHAR2(225);
    v_author VARCHAR2(100);
    v_year NUMBER(4);
    v_isbn VARCHAR2(20);
    
BEGIN --BEGIN 뒤로 동작 명시(PL/SQL 프로그래밍 코딩)
    SELECT title, author, publication_year, isbn
    INTO v_title, v_author, v_year, v_isbn
    FROM book_synonym
    WHERE book_id = p_book_id;

    --화면 출력을 위한 프로시저 PUT_LINE
    --DBMS_OUTPUT.PUT_SINE(출력할 내용);
    --book_syn(7); ???
    DBMS_OUTPUT.PUT_LINE('조회결과');
    DBMS_OUTPUT.PUT_LINE('Book Title : ' || v_title); 
    DBMS_OUTPUT.PUT_LINE('Author : ' || v_author);
    DBMS_OUTPUT.PUT_LINE('Book Title : ' || v_year);
    DBMS_OUTPUT.PUT_LINE('Book Title : ' || v_isbn);
    
END book_syn;
/ -- 해당 블록 종료와 함께 쿼리문이 실행되는 사인 (필수)

--https://velog.io/@ansalstmd/ORACLE-feat.-Stored-Procedure