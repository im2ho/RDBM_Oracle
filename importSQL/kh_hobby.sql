//������̺� ����
DROP TABLE Hobbies;
//NUMBER : �Ҽ��� �����ڸ����� OK
//INT : �Ҽ��� ���ϴ� ����X (������ �����͸� ����)
CREATE TABLE Hobbies (
    MNO INT PRIMARY KEY,
    Hobby VARCHAR2(100)
);

/*������� ��� ������ ����
INSERT INTO Hobbies (MNO, Hobby)
    VALUES (1, '����');
�̷��� 30���� �� �Ǵ� ����� �����͸� ������ �߰��� ���ΰ�? ��
SELECT�� �������!
*/

//DUAL ��¼�� UNION ALL 2���̻�..?
INSERT INTO Hobbies (MNO, Hobby)
SELECT 1, 'å�б�' FROM DUAL UNION ALL
SELECT 2, '����' FROM DUAL UNION ALL
SELECT 3, '����' FROM DUAL UNION ALL
SELECT 4, '�ڵ�' FROM DUAL UNION ALL
SELECT 5, '����' FROM DUAL UNION ALL
SELECT 6, '��α�' FROM DUAL UNION ALL
SELECT 7, '����' FROM DUAL UNION ALL
SELECT 8, '����' FROM DUAL UNION ALL
SELECT 9, '���߱�' FROM DUAL UNION ALL
SELECT 10, '����ŷ' FROM DUAL UNION ALL
SELECT 11, '���' FROM DUAL UNION ALL
SELECT 12, '������' FROM DUAL UNION ALL
SELECT 13, '����' FROM DUAL UNION ALL
SELECT 14, '����������' FROM DUAL UNION ALL
SELECT 15, '�౸' FROM DUAL UNION ALL
SELECT 16, '�䰡' FROM DUAL UNION ALL
SELECT 17, '����' FROM DUAL UNION ALL
SELECT 18, '����' FROM DUAL UNION ALL
SELECT 19, '�״Ͻ�' FROM DUAL UNION ALL
SELECT 20, '����' FROM DUAL UNION ALL
SELECT 21, '����' FROM DUAL; //������ �����ʹ� ALL�Ұ� ��� �� DUAL�ϰ� �����ݷ����� ������

GRANT DBA TO khstore;