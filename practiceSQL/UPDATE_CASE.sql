--ALTER TABLE ũ�� �ø���
ALTER TABLE book MODIFY isbn VARCHAR2(50);

UPDATE bookcafe SET title = '������߻��' WHERE title='�¹���';
UPDATE bookcafe SET title = '����' WHERE title='����';
UPDATE bookcafe SET title = '�� �ٸ� ���' WHERE title='�� �ٸ� ����';
UPDATE bookcafe SET title = '�����ϱ� ȯ�ڴ�' WHERE title='�����ϱ� û���̴�';
UPDATE bookcafe SET title = 'BITCH ������' WHERE title='���� ������';

--book_id 7 ~ 10�� ����ƿ����� å�̸� ����
UPDATE bookcafe SET title = '�� �ƴϾ� �����', author='C.S.���̽�'
WHERE book_id BETWEEN 7 AND 10;

--UPDATE�� �̿��ؼ� ������ �����ϴ� ���
UPDATE bookcafe
SET title =
    CASE
        WHEN title = 'The Great Gatsby' THEN '��İ� ������'
        WHEN title = 'To Kill a Mockingbird' THEN '�޹��� �츮��'
        WHEN title = 'The Catcher in the Ry' THEN 'ȣ�л� ���ְڴ�'
        WHEN title = '�ٶ��� ����' THEN '��ȥ'
        WHEN title = '������ ���� �뷡' THEN '���ҳ��� �뷡'
        WHEN title = '�̷��� ����' THEN '������ ��ȸ'
        WHEN title = '���� ���� �ʸ� ����' THEN '���� ���� �ʸ� ����'
        WHEN title = '�ҳ���' THEN '����'
        WHEN title = '�츮���� �ູ�� �ð�' THEN '�����'
        WHEN title = '���Ǿ��' THEN '������'
        ELSE title
    END;

