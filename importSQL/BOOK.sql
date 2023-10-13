DROP TABLE book;
CREATE TABLE book (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(255) NOT NULL,
    author VARCHAR2(100) NOT NULL,
    publication_year NUMBER(4),
    isbn VARCHAR2(13),
    genre VARCHAR2(50),
    description CLOB,
    price NUMBER(10, 2),
    publication_date DATE,
    created_date DATE DEFAULT SYSDATE,
    updated_date DATE,
    is_available CHAR(1) CHECK (is_available IN ('Y', 'N'))
);

--������ ����
INSERT INTO book (book_id, title, author, publication_year, isbn, genre, description, price, publication_date, updated_date, is_available)
VALUES(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, '978-0743273565', 'Fiction', 'A story of decadence and excess.', 12.99, TO_DATE('1925-04-10', 'YYYY-MM-DD'), NULL, 'Y');
INSERT INTO book (book_id, title, author, publication_year, isbn, genre, description, price, publication_date, updated_date, is_available)
VALUES(2, 'To Kill a Mockingbird', 'Harper Lee', 1960, '978-0446310789', 'Fiction', 'A classic of modern American literature.', 14.99, TO_DATE('1960-07-11', 'YYYY-MM-DD'), NULL, 'Y');
INSERT INTO book (book_id, title, author, publication_year, isbn, genre, description, price, publication_date, updated_date, is_available)
VALUES(3, 'The Catcher in the Rye', 'J.D. Salinger', 1951, '978-0316769488', 'Fiction', 'A controversial novel.', 11.99, TO_DATE('1951-07-16', 'YYYY-MM-DD'), NULL, 'N');

--UNION�� Ȱ���� ������ ����
INSERT INTO book (book_id, title, author, publication_year, isbn, genre, description, price, publication_date, is_available)
SELECT 4, '�¹���', '������', 1997, '978-8936433598', 'Historical Fiction', '�ѱ� ����縦 ������� �� ���ϼҼ�.', 20.99, TO_DATE('1997-05-15', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 5, '����', '�ڰ渮', 1986, '978-8937409054', 'Historical Fiction', '�ѱ��� �ٴ�縦 ������� �� ���ϼҼ�.', 18.99, TO_DATE('1986-03-10', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 6, '�� �ٸ� ����', '������', 1942, '978-8930205551', 'Short Story', '������ �ڿ��� ������� ���� �׸� ������.', 15.99, TO_DATE('1942-10-05', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 7, '���� ���� ��', 'Ȳ����', 1973, '978-8937460148', 'Novel', '������ ������� �� �ΰ��� ��� ����� �׸� �Ҽ�.', 13.99, TO_DATE('1973-07-20', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 8, '�������κ����� ���', '������', 1941, '978-8937462807', 'Poetry', '������ ���ֿ� ����� �ݿ��� ����.', 12.99, TO_DATE('1941-06-15', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 9, '������ �� �״�', '��ȿ��', 2013, '978-8965702024', 'Romance', '�ܰ��ΰ� �ΰ��� ����� �׸� �θǽ� �Ҽ�.', 14.99, TO_DATE('2013-11-16', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 10, '�ܿ�ձ�', '�����', 2014, '978-8965702031', 'Fantasy', '���� �������� ������ ����� �� �ڸ��� �̾߱�.', 16.99, TO_DATE('2014-01-10', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 11, '������ ���� �뷡', '������', 2011, '978-8965702048', 'Fantasy', '����� ����� ����� ��ġ�� �׸� ��Ÿ�� �Ҽ�.', 19.99, TO_DATE('2011-04-20', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 12, '�ظ� ǰ�� ��', '������', 2012, '978-8965702055', 'Historical Fiction', '�հ� ������ ������ ����� �׸� �Ҽ�.', 18.99, TO_DATE('2012-09-15', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 13, '���� ������', '�̵���', 2015, '978-8965702062', 'Sci-Fi', '�̷��� ���б���� ������� �� ���� �Ҽ�.', 17.99, TO_DATE('2015-02-10', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 14, '�ٶ��� ����', '������', 2006, '978-8965702079', 'Fantasy', '��븦 ������� �� ��Ÿ�� ���ϼҼ�.', 20.99, TO_DATE('2006-05-17', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 15, '�̷��� ����', '������', 2016, '978-8965702086', 'Sci-Fi', 'Ÿ�Ӹӽ��� �߽����� �� ���� �Ҽ�.', 15.99, TO_DATE('2016-07-20', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 16, '���� ���� �ʸ� ����', '������', 1992, '978-8936434120', 'Poetry', '����� ���� ������ �� ����.', 12.99, TO_DATE('1992-04-10', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 17, '�����ϱ� û���̴�', '�賭��', 2009, '978-8934938841', 'Essay', 'û���� ���İ� ����� ���� ������.', 14.99, TO_DATE('2009-11-11', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 18, '�ҳ���', 'Ȳ����', 1953, '978-8930207562', 'Short Story', '� ������ �߾�� ����� �׸� ������.', 13.99, TO_DATE('1953-05-15', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 19, '�츮���� �ູ�� �ð�', '������', 2005, '978-8934918874', 'Novel', '��å���� �ô޸��� ������ �������� �̾߱�.', 16.99, TO_DATE('2005-04-20', 'YYYY-MM-DD'), 'Y' FROM dual
UNION ALL
SELECT 20, '���Ǿ��', '�����', 2018, '978-8937464252', 'Novel', '�ѱ� ���빮ȭ�� ������� �� ������ �̾߱�.', 18.99, TO_DATE('2018-10-25', 'YYYY-MM-DD'), 'Y' FROM dual;