--����� ���̵� ��й�ȣ USER_INFO ���̺� ���� �� ������ ���� �Ϸ� ����
--SELECT : �˻��ϰ��� �ϴ� ����
--JOIN : ������ �������� ������ ���ΰ�?
/*
UPDATE hobbies SET hobby = '����' WHERE mno = 2;
UPDATE user_info SET user_id = 'im2ho' WHERE mno = 2;
UPDATE user_info SET user_pw = 'kh1234' WHERE mno =2;
*/

--JOIN Ȱ���ؼ� ��� ���̵� ��й�ȣ �Բ� �˻�
SELECT U.user_id, U.user_pw 
FROM userinfo U
JOIN hobbies H ON U.MNO =H.MNO;

--JOIN Ȱ���ؼ� ��� ���̵� ��й�ȣ ��� �Բ� �˻�
SELECT U.user_id, U.user_pw, H.hobby 
FROM userinfo U
JOIN hobbies H ON U.MNO =H.MNO;

--JOIN Ȱ���ؼ� ��� �̸� ��� �Բ� �˻�
SELECT memberinfo.mname, hobbies.hobby FROM memberinfo
JOIN hobbies ON memberinfo.mno = hobbies.mno;

--���̺� 3�� JOIN �����س�
SELECT U.user_id, M.mname, H.hobby
FROM memberinfo M
JOIN hobbies H ON m.mno = h.mno
JOIN userinfo U ON m.mno = u.mno;