--SYNONYM (���Ǿ�)��ü�� ���� ����..
--�ٸ� ���̺��� ��, ���� ���ν��� ��� ��ȣ�ۿ� �� �� ���
--�����ͺ��̽� ��ü�� ���� �ٸ� �̸��� �����ϴµ� ���

--"bookcafe" ���̺� ���� synonym ����
CREATE OR REPLACE SYNONYM book_synonym FOR bookcafe; --���� Ȥ�� �����
SELECT * FROM book_synonym;

--book_synonym�� ����ϴ� '����' PRODEDURE(���ν���) ����
--���ν��� : �Լ��� ���� ���... but Ư�� ������ ó���ϰ� ��� ���� ��ȯX

CREATE OR REPLACE PROCEDURE book_syn( -- 'book_syn'�̶�� ���ν��� ����
    p_book_id IN NUMBER --IN �Ű�����
)
IS
    v_title VARCHAR2(225);
    v_author VARCHAR2(100);
    v_year NUMBER(4);
    v_isbn VARCHAR2(20);
    
BEGIN --BEGIN �ڷ� ���� ���
    SELECT title, author, publication_year, isbn
    INTO v_title, v_author, v_year, v_isbn
    FROM book_synonym
    WHERE book_id = p_book_id;
    
    --ȭ�� ����� ���� ���ν��� PUT_LINE
    --DBMS_OUTPUT.PUT_SINE(����� ����);
    --book_syn(7); ???
    DBMS_OUTPUT.PUT_LINE('��ȸ���');
    DBMS_OUTPUT.PUT_LINE('Book Title : ' || v_title); 
    DBMS_OUTPUT.PUT_LINE('Author : ' || v_author);
    DBMS_OUTPUT.PUT_LINE('Book Title : ' || v_year);
    DBMS_OUTPUT.PUT_LINE('Book Title : ' || v_isbn);

    
END book_syn;
/-- �ش� ��� ����� �Բ� �������� ����Ǵ� ���� (�ʼ�)