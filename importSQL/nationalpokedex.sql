/*
DROP TABLE nationalpokedex; --ORACLE������ IF EXISTS �������� �ʱ� ������ PL/SQL ��� �ʿ�

CREATE TABLE NationalPokedex (
    no NUMBER PRIMARY KEY,
    name VARCHAR2(50), --�ܷ�Ű �߰� ��� ���� �ʿ�
    type VARCHAR2(15), --����Ÿ��
    subtype VARCHAR2(15), --����Ÿ��
    base_stats NUMBER --������
);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(1, '�̻��ؾ�', 'Ǯ', '��', 318);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(2, '�̻���Ǯ', 'Ǯ', '��', 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(3, '�̻��ز�', 'Ǯ', '��', 525);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(4, '���̸�', '��', NULL , 309);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(5, '���ڵ�', '��', NULL , 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(6, '���ڸ�', '��', '����', 534);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(7, '���α�', '��', NULL, 314);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(8, '��Ϻα�', '��', NULL, 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(9, '�źϿ�', '��', NULL, 530); 
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(152, 'ġ�ڸ�Ÿ', 'Ǯ', NULL, 318);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(153, '���̸���', 'Ǯ', NULL, 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(154, '�ް��Ͽ�', 'Ǯ', NULL, 525);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(155, '������', '��', NULL, 309);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(156, '��������', 'Ǯ', NULL, 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(157, '���̹�', 'Ǯ', NULL, 534);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(158, '������', '��', NULL, 314);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(159, '��������', '��', NULL, 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(160, '��ũ�δ���', '��', NULL, 530); 
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(252, '��������', 'Ǯ', NULL, 310);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(253, '��������', 'Ǯ', NULL, 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(254, '����ŷ', 'Ǯ', NULL, 530);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(255, '������', '��', NULL, 310);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(256, '��ġ��', '��', '����', 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(257, '��ġ��', '��', '����', 530);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(258, '��¯��', '��', NULL, 310);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(259, '��¯��', '��', '��', 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(260, '��¯��', '��', '��', 535);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(387, '��α�', 'Ǯ', NULL, 318);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(388, '��Ǯ�α�', 'Ǯ', NULL, 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(389, '���α�', 'Ǯ', '��', 525);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(390, '�Ҳɼ���', '��', NULL, 309);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(391, '���̼���', '��', '����', 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(392, '�ʿ���', '��', '����', 534);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(393, '�ص���', '��', NULL, 314);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(394, '������', '��', NULL, 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(395, '���丣Ʈ', '��', '��ö', 530);

--UPDATE nationalpokedex SET subtype='�Ҳ�' WHERE type='��';

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(58, '����', '�Ҳ�', NULL, 350);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(59, '����', '�Ҳ�', NULL, 555);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(25, '��ī��', '����', NULL, 320);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(26, '������', '����', NULL, 485);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(92, '�����', '��Ʈ', '��', 310);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(93, '��콺Ʈ', '��Ʈ', '��', 405);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(94, '����', '��Ʈ', '��', 500);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(104, '������', '��', NULL, 320);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(105, '�ֱ���', '��', NULL, 425); 

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(446, '�԰���', '�븻', NULL, 390);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(143, '�Ḹ��', '�븻', NULL, 540); 

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(144, '������', '����', '����', 580);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(145, '���', '����', '����', 580);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(146, '���̾�', '�Ҳ�', '����', 580);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(147, '�̴�', '�巡��', NULL, 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(148, '�Ŵ�', '�巡��', NULL, 420);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(149, '������', '�巡��', '�̴�', 600);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(150, '����', '������', NULL, 680);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(151, '��', '������', NULL, 600);


INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(228, '����', '��', '�Ҳ�', 330);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(229, '�ﰡ', '��', '�Ҳ�', 500);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(243, '������', '����', NULL, 580);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(244, '������', '�Ҳ�', NULL, 580);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(245, '������', '��', NULL, 580);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(371, '�ư���', '�巡��', NULL, 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(372, '����', '�巡��', NULL, 420);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(373, '������', '�巡��', '����', 600);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(374, '����', '��ö', '������', 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(375, '������', '��ö', '������', 420);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(376, '��Ÿ�׷ν�', '��ö', '������', 600); 

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(382, '���̿���', '��', NULL, 670);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(383, '�׶���', '��', NULL, 670);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(384, '������', '�巡��', '����', 680);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(415, '���ܹ���', '����', '����', 244);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(416, '����', '����', '����', 474);    
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(442, 'ȭ����', '��Ʈ', '��', 485);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(443, '����', '�巡��', '��', 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(444, '�ѹ���Ʈ', '�巡��', '��', 410);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(445, '��ī���ƽ�', '�巡��', '��', 600);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(447, '������', '����', NULL, 285);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(448, '��ī����', '����', '��ö', 525);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(483, '��Ʒ簡', '��ö', '�巡��', 680);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(484, '�ޱ��', '��', '�巡��', 680);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(486, '�����Ⱑ��', '�巡��', NULL, 670);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(487, '���Ƽ��', '�巡��', NULL, 680);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(491, '��ũ����', '��', NULL, 600);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(493, '�Ƹ����콺', '�븻', NULL, 720);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(215, '��Ǫ��', '��', '����', 430);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(461, '��Ǫ�϶�', '��', '����', 510);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(403, '����ũ', '����', NULL, 263);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(404, '���ÿ�', '����', NULL, 363);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(405, '��Ʈ��', '����', NULL, 364);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(131, '������', '��', '����', 535);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(436, '���̷�', '��ö', '������', 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(437, '��Ź��', '��ö', '������', 500);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(453, '�ߵ�����', '��', '����', 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(454, '������', '��', '����', 490);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(470, '���Ǿ�', 'Ǯ', NULL, 525);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(471, '�۷��̽þ�', '����', NULL, 525);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(361, '������', '����', NULL, 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(362, '�����ͽ�', '����', NULL, 480);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(478, '������', '����', '��Ʈ', 480);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(408, '�ΰ�����', '����', NULL, 350);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(409, '���޵�', '����', NULL, 495);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(410, '�����齺', '����', '��ö', 350);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(411, '�ٸ��齺', '����', '��ö', 495);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(449, '������Ÿ��', '��', NULL, 330);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(450, '�ϸ���', '��', NULL, 525);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(343, '���ұ�', '��', '������', 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(344, '���䵵��', '��', '������', 500);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(220, '�ٲٸ�', '����', '��', 250);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(221, '�޲ٸ�', '����', '��', 450);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(473, '����ٸ�', '����', '��', 530);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(216, '������', '�븻', NULL, 330);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(217, '����', '�븻', NULL, 500);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(123, '����ũ', '����', '����', 500);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(212, '�ֻ�', '����', '��ö', 500);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(241, '����ũ', '�븻', NULL, 490);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(246, '������', '����', '��', 300);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(247, '�����', '����', '��', 410);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(248, '�����', '����', '��', 600);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(63, '���̽�', '������', NULL, 310);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(64, '���ֶ�', '������', NULL, 400);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(65, '�ĵ�', '������', NULL, 500);


INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(52, '����', '�븻', NULL, 290);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(53, '�丣�þ�', '�븻', NULL, 440);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(83, '�Ŀ���', '�븻', '����', 377);    

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(236, '���Ű', '����', NULL, 210);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(106, '�ö�Ҹ�', '����', NULL, 455);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(107, 'ȫ����', '����', NULL, 455);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(237, 'ī������', '����', NULL, 455);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(41, '�ֹ�', '��', '����', 245);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(42, '���', '��', '����', 455);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(169, 'ũ�ι�', '��', '����', 535);

INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(249, '����', '������', '����', 680);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(250, 'ĥ����', '�Ҳ�', '����', 680);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(425, '���ǳ��', '��Ʈ', '����', 348);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(426, '�սǶ��̵�', '��Ʈ',  '����', 498);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(434, '���Ȼ�', '��', '��', 329);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(435, '������ũ', '��', '��', 479);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(431, '���˸�', '�븻', NULL, 310);
INSERT INTO nationalpokedex(no, name, type, subtype, base_stats)
VALUES(432, '�����', '�븻', NULL, 452);
*/

SELECT type, COUNT(type) FROM nationalpokedex GROUP BY type;

SELECT * FROM nationalpokedex WHERE base_stats > 500
ORDER BY base_stats DESC;

