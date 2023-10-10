--멤버의 아이디 비밀번호 USER_INFO 테이블 생성 및 데이터 삽입 완료 상태
--SELECT : 검색하고자 하는 정보
--JOIN : 무엇을 기준으로 조인할 것인가?
/*
UPDATE hobbies SET hobby = '유도' WHERE mno = 2;
UPDATE user_info SET user_id = 'im2ho' WHERE mno = 2;
UPDATE user_info SET user_pw = 'kh1234' WHERE mno =2;
*/

--JOIN 활용해서 멤버 아이디 비밀번호 함께 검색
SELECT U.user_id, U.user_pw 
FROM userinfo U
JOIN hobbies H ON U.MNO =H.MNO;

--JOIN 활용해서 멤버 아이디 비밀번호 취미 함께 검색
SELECT U.user_id, U.user_pw, H.hobby 
FROM userinfo U
JOIN hobbies H ON U.MNO =H.MNO;

--JOIN 활용해서 멤버 이름 취미 함께 검색
SELECT memberinfo.mname, hobbies.hobby FROM memberinfo
JOIN hobbies ON memberinfo.mno = hobbies.mno;

--테이블 3개 JOIN 내가해냄
SELECT U.user_id, M.mname, H.hobby
FROM memberinfo M
JOIN hobbies H ON m.mno = h.mno
JOIN userinfo U ON m.mno = u.mno;