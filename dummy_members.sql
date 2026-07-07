-- 더미 회원 1000명 (id 5 ~ 1004)
-- 비밀번호: test01 (BCrypt)
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (5, 'user5', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (5, '서민혁', NULL, 'user5@test.com', '01012340005', '2005-01-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (6, 'user6', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (6, '안수율', NULL, 'user6@test.com', '01012340006', '1971-02-25', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (7, 'user7', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (7, '김시현', NULL, 'user7@test.com', '01012340007', '1971-02-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (8, 'user8', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (8, '조서준', NULL, 'user8@test.com', '01012340008', '1998-12-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (9, 'user9', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (9, '정재훈', NULL, 'user9@test.com', '01012340009', '2004-01-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (10, 'user10', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (10, '황혜찬', NULL, 'user10@test.com', '01012340010', '1990-09-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (11, 'user11', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (11, '홍라영', NULL, 'user11@test.com', '01012340011', '1996-03-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (12, 'user12', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (12, '한라민', NULL, 'user12@test.com', '01012340012', '1997-08-10', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (13, 'user13', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (13, '안재현', NULL, 'user13@test.com', '01012340013', '1976-12-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (14, 'user14', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (14, '박지민', NULL, 'user14@test.com', '01012340014', '2005-12-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (15, 'user15', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (15, '오성연', NULL, 'user15@test.com', '01012340015', '1975-01-23', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (16, 'user16', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (16, '이혜서', NULL, 'user16@test.com', '01012340016', '1978-03-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (17, 'user17', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (17, '신나민', NULL, 'user17@test.com', '01012340017', '1993-04-22', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (18, 'user18', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (18, '강은서', NULL, 'user18@test.com', '01012340018', '1997-12-01', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (19, 'user19', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (19, '권채혁', NULL, 'user19@test.com', '01012340019', '1972-10-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (20, 'user20', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (20, '서도우', NULL, 'user20@test.com', '01012340020', '1992-01-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (21, 'user21', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (21, '권예은', NULL, 'user21@test.com', '01012340021', '1990-09-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (22, 'user22', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (22, '송지은', NULL, 'user22@test.com', '01012340022', '1993-04-13', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (23, 'user23', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (23, '안은경', NULL, 'user23@test.com', '01012340023', '1974-01-14', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (24, 'user24', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (24, '권채훈', NULL, 'user24@test.com', '01012340024', '1986-12-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (25, 'user25', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (25, '조지서', NULL, 'user25@test.com', '01012340025', '1994-11-08', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (26, 'user26', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (26, '최민현', NULL, 'user26@test.com', '01012340026', '1993-05-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (27, 'user27', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (27, '정라경', NULL, 'user27@test.com', '01012340027', '1994-12-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (28, 'user28', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (28, '박도은', NULL, 'user28@test.com', '01012340028', '1987-09-20', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (29, 'user29', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (29, '류라진', NULL, 'user29@test.com', '01012340029', '1979-01-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (30, 'user30', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (30, '장채우', NULL, 'user30@test.com', '01012340030', '1987-04-05', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (31, 'user31', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (31, '박유은', NULL, 'user31@test.com', '01012340031', '1996-12-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (32, 'user32', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (32, '최민우', NULL, 'user32@test.com', '01012340032', '1993-09-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (33, 'user33', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (33, '최재우', NULL, 'user33@test.com', '01012340033', '1987-01-07', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (34, 'user34', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (34, '오민정', NULL, 'user34@test.com', '01012340034', '2002-04-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (35, 'user35', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (35, '한지빈', NULL, 'user35@test.com', '01012340035', '1974-05-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (36, 'user36', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (36, '한서희', NULL, 'user36@test.com', '01012340036', '2004-06-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (37, 'user37', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (37, '서서훈', NULL, 'user37@test.com', '01012340037', '1972-06-18', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (38, 'user38', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (38, '최나찬', NULL, 'user38@test.com', '01012340038', '1993-09-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (39, 'user39', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (39, '오라영', NULL, 'user39@test.com', '01012340039', '1973-08-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (40, 'user40', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (40, '신민호', NULL, 'user40@test.com', '01012340040', '1992-04-14', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (41, 'user41', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (41, '오지진', NULL, 'user41@test.com', '01012340041', '1999-02-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (42, 'user42', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (42, '박예서', NULL, 'user42@test.com', '01012340042', '1992-06-07', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (43, 'user43', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (43, '조유찬', NULL, 'user43@test.com', '01012340043', '1999-03-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (44, 'user44', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (44, '임라은', NULL, 'user44@test.com', '01012340044', '1974-02-01', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (45, 'user45', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (45, '신다빈', NULL, 'user45@test.com', '01012340045', '1990-02-08', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (46, 'user46', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (46, '최채준', NULL, 'user46@test.com', '01012340046', '1983-07-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (47, 'user47', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (47, '박지훈', NULL, 'user47@test.com', '01012340047', '2002-11-01', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (48, 'user48', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (48, '박하혁', NULL, 'user48@test.com', '01012340048', '2001-06-24', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (49, 'user49', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (49, '장수훈', NULL, 'user49@test.com', '01012340049', '1971-11-23', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (50, 'user50', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (50, '장지아', NULL, 'user50@test.com', '01012340050', '1989-02-25', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (51, 'user51', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (51, '황은호', NULL, 'user51@test.com', '01012340051', '1999-08-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (52, 'user52', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (52, '홍채영', NULL, 'user52@test.com', '01012340052', '2000-04-18', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (53, 'user53', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (53, '신은원', NULL, 'user53@test.com', '01012340053', '1973-08-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (54, 'user54', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (54, '정혜정', NULL, 'user54@test.com', '01012340054', '1975-03-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (55, 'user55', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (55, '홍가율', NULL, 'user55@test.com', '01012340055', '1988-02-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (56, 'user56', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (56, '권유연', NULL, 'user56@test.com', '01012340056', '1989-08-24', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (57, 'user57', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (57, '김라율', NULL, 'user57@test.com', '01012340057', '1984-01-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (58, 'user58', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (58, '안혜현', NULL, 'user58@test.com', '01012340058', '1983-12-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (59, 'user59', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (59, '안성서', NULL, 'user59@test.com', '01012340059', '2001-12-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (60, 'user60', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (60, '조수원', NULL, 'user60@test.com', '01012340060', '2002-07-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (61, 'user61', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (61, '강가영', NULL, 'user61@test.com', '01012340061', '1997-11-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (62, 'user62', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (62, '신예원', NULL, 'user62@test.com', '01012340062', '2003-08-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (63, 'user63', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (63, '홍나진', NULL, 'user63@test.com', '01012340063', '1981-04-05', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (64, 'user64', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (64, '황민아', NULL, 'user64@test.com', '01012340064', '1991-12-03', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (65, 'user65', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (65, '김예서', NULL, 'user65@test.com', '01012340065', '1973-07-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (66, 'user66', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (66, '박채빈', NULL, 'user66@test.com', '01012340066', '1979-05-07', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (67, 'user67', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (67, '권가호', NULL, 'user67@test.com', '01012340067', '1981-02-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (68, 'user68', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (68, '오수혁', NULL, 'user68@test.com', '01012340068', '1981-09-02', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (69, 'user69', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (69, '신민경', NULL, 'user69@test.com', '01012340069', '2003-12-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (70, 'user70', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (70, '오예경', NULL, 'user70@test.com', '01012340070', '1972-05-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (71, 'user71', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (71, '황유빈', NULL, 'user71@test.com', '01012340071', '1985-01-24', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (72, 'user72', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (72, '권서호', NULL, 'user72@test.com', '01012340072', '1997-08-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (73, 'user73', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (73, '임나경', NULL, 'user73@test.com', '01012340073', '1970-06-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (74, 'user74', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (74, '권라훈', NULL, 'user74@test.com', '01012340074', '1990-09-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (75, 'user75', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (75, '강예훈', NULL, 'user75@test.com', '01012340075', '1982-12-02', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (76, 'user76', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (76, '안혜율', NULL, 'user76@test.com', '01012340076', '1993-08-04', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (77, 'user77', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (77, '이라준', NULL, 'user77@test.com', '01012340077', '1985-12-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (78, 'user78', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (78, '윤수율', NULL, 'user78@test.com', '01012340078', '1990-09-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (79, 'user79', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (79, '윤민정', NULL, 'user79@test.com', '01012340079', '1994-05-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (80, 'user80', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (80, '김가영', NULL, 'user80@test.com', '01012340080', '1984-05-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (81, 'user81', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (81, '송수정', NULL, 'user81@test.com', '01012340081', '1974-10-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (82, 'user82', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (82, '최시민', NULL, 'user82@test.com', '01012340082', '1981-07-09', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (83, 'user83', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (83, '황하서', NULL, 'user83@test.com', '01012340083', '1987-01-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (84, 'user84', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (84, '류나혁', NULL, 'user84@test.com', '01012340084', '1992-12-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (85, 'user85', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (85, '장다훈', NULL, 'user85@test.com', '01012340085', '1977-09-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (86, 'user86', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (86, '조혜은', NULL, 'user86@test.com', '01012340086', '1976-11-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (87, 'user87', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (87, '김지아', NULL, 'user87@test.com', '01012340087', '1995-12-24', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (88, 'user88', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (88, '박시준', NULL, 'user88@test.com', '01012340088', '1994-09-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (89, 'user89', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (89, '정예우', NULL, 'user89@test.com', '01012340089', '1985-04-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (90, 'user90', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (90, '강하연', NULL, 'user90@test.com', '01012340090', '1990-12-23', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (91, 'user91', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (91, '이혜훈', NULL, 'user91@test.com', '01012340091', '1993-11-13', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (92, 'user92', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (92, '정민찬', NULL, 'user92@test.com', '01012340092', '1982-07-07', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (93, 'user93', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (93, '한유원', NULL, 'user93@test.com', '01012340093', '1998-04-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (94, 'user94', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (94, '김하연', NULL, 'user94@test.com', '01012340094', '1995-05-13', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (95, 'user95', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (95, '김도혁', NULL, 'user95@test.com', '01012340095', '1988-09-20', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (96, 'user96', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (96, '서주연', NULL, 'user96@test.com', '01012340096', '1985-09-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (97, 'user97', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (97, '이시혁', NULL, 'user97@test.com', '01012340097', '2002-03-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (98, 'user98', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (98, '임나은', NULL, 'user98@test.com', '01012340098', '2003-04-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (99, 'user99', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (99, '최가원', NULL, 'user99@test.com', '01012340099', '1978-11-18', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (100, 'user100', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (100, '류채희', NULL, 'user100@test.com', '01012340100', '2004-06-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (101, 'user101', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (101, '최유경', NULL, 'user101@test.com', '01012340101', '1986-10-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (102, 'user102', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (102, '임시은', NULL, 'user102@test.com', '01012340102', '1988-04-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (103, 'user103', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (103, '한주은', NULL, 'user103@test.com', '01012340103', '1996-01-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (104, 'user104', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (104, '한성아', NULL, 'user104@test.com', '01012340104', '1986-07-10', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (105, 'user105', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (105, '안채희', NULL, 'user105@test.com', '01012340105', '1973-01-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (106, 'user106', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (106, '서하원', NULL, 'user106@test.com', '01012340106', '1976-07-07', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (107, 'user107', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (107, '임가연', NULL, 'user107@test.com', '01012340107', '1989-02-05', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (108, 'user108', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (108, '한서연', NULL, 'user108@test.com', '01012340108', '1986-06-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (109, 'user109', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (109, '최도혁', NULL, 'user109@test.com', '01012340109', '1992-08-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (110, 'user110', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (110, '강혜원', NULL, 'user110@test.com', '01012340110', '1992-09-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (111, 'user111', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (111, '임지영', NULL, 'user111@test.com', '01012340111', '1993-02-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (112, 'user112', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (112, '한주훈', NULL, 'user112@test.com', '01012340112', '2004-04-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (113, 'user113', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (113, '윤주서', NULL, 'user113@test.com', '01012340113', '1994-09-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (114, 'user114', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (114, '서지아', NULL, 'user114@test.com', '01012340114', '1993-04-02', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (115, 'user115', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (115, '조서율', NULL, 'user115@test.com', '01012340115', '1970-03-24', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (116, 'user116', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (116, '권주희', NULL, 'user116@test.com', '01012340116', '1971-08-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (117, 'user117', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (117, '최라우', NULL, 'user117@test.com', '01012340117', '1996-04-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (118, 'user118', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (118, '이나현', NULL, 'user118@test.com', '01012340118', '1977-02-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (119, 'user119', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (119, '오나율', NULL, 'user119@test.com', '01012340119', '1995-10-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (120, 'user120', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (120, '황다서', NULL, 'user120@test.com', '01012340120', '1976-11-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (121, 'user121', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (121, '황성율', NULL, 'user121@test.com', '01012340121', '1996-04-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (122, 'user122', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (122, '조준빈', NULL, 'user122@test.com', '01012340122', '1975-05-07', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (123, 'user123', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (123, '윤서혁', NULL, 'user123@test.com', '01012340123', '1994-09-19', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (124, 'user124', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (124, '오수원', NULL, 'user124@test.com', '01012340124', '1993-12-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (125, 'user125', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (125, '최채영', NULL, 'user125@test.com', '01012340125', '1985-08-13', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (126, 'user126', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (126, '류가경', NULL, 'user126@test.com', '01012340126', '1987-03-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (127, 'user127', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (127, '최나정', NULL, 'user127@test.com', '01012340127', '1970-11-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (128, 'user128', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (128, '최나희', NULL, 'user128@test.com', '01012340128', '2004-04-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (129, 'user129', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (129, '임은빈', NULL, 'user129@test.com', '01012340129', '1982-09-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (130, 'user130', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (130, '한준서', NULL, 'user130@test.com', '01012340130', '2002-04-02', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (131, 'user131', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (131, '조유연', NULL, 'user131@test.com', '01012340131', '1993-04-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (132, 'user132', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (132, '최시희', NULL, 'user132@test.com', '01012340132', '1999-07-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (133, 'user133', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (133, '최나우', NULL, 'user133@test.com', '01012340133', '1989-04-21', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (134, 'user134', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (134, '임하율', NULL, 'user134@test.com', '01012340134', '1989-01-19', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (135, 'user135', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (135, '임도우', NULL, 'user135@test.com', '01012340135', '1998-07-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (136, 'user136', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (136, '송하아', NULL, 'user136@test.com', '01012340136', '1994-09-01', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (137, 'user137', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (137, '황가호', NULL, 'user137@test.com', '01012340137', '1993-06-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (138, 'user138', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (138, '강재준', NULL, 'user138@test.com', '01012340138', '2005-07-13', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (139, 'user139', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (139, '서예혁', NULL, 'user139@test.com', '01012340139', '1998-04-14', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (140, 'user140', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (140, '장성영', NULL, 'user140@test.com', '01012340140', '1977-04-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (141, 'user141', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (141, '홍주원', NULL, 'user141@test.com', '01012340141', '1997-09-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (142, 'user142', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (142, '강준율', NULL, 'user142@test.com', '01012340142', '1975-09-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (143, 'user143', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (143, '오나아', NULL, 'user143@test.com', '01012340143', '1989-11-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (144, 'user144', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (144, '오유혁', NULL, 'user144@test.com', '01012340144', '1988-08-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (145, 'user145', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (145, '류주연', NULL, 'user145@test.com', '01012340145', '1983-11-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (146, 'user146', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (146, '이라우', NULL, 'user146@test.com', '01012340146', '1971-08-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (147, 'user147', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (147, '신하아', NULL, 'user147@test.com', '01012340147', '1979-11-25', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (148, 'user148', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (148, '한나희', NULL, 'user148@test.com', '01012340148', '1980-06-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (149, 'user149', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (149, '박은훈', NULL, 'user149@test.com', '01012340149', '1972-06-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (150, 'user150', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (150, '권은은', NULL, 'user150@test.com', '01012340150', '1992-05-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (151, 'user151', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (151, '장예우', NULL, 'user151@test.com', '01012340151', '1977-05-07', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (152, 'user152', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (152, '신예원', NULL, 'user152@test.com', '01012340152', '1976-07-14', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (153, 'user153', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (153, '최민희', NULL, 'user153@test.com', '01012340153', '2005-04-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (154, 'user154', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (154, '윤은우', NULL, 'user154@test.com', '01012340154', '1998-02-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (155, 'user155', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (155, '장은민', NULL, 'user155@test.com', '01012340155', '1997-10-25', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (156, 'user156', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (156, '서채은', NULL, 'user156@test.com', '01012340156', '1988-07-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (157, 'user157', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (157, '김라율', NULL, 'user157@test.com', '01012340157', '1979-03-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (158, 'user158', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (158, '신채정', NULL, 'user158@test.com', '01012340158', '1971-01-22', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (159, 'user159', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (159, '박준진', NULL, 'user159@test.com', '01012340159', '2001-11-22', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (160, 'user160', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (160, '오혜율', NULL, 'user160@test.com', '01012340160', '1982-05-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (161, 'user161', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (161, '김도현', NULL, 'user161@test.com', '01012340161', '1986-05-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (162, 'user162', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (162, '윤혜율', NULL, 'user162@test.com', '01012340162', '1979-10-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (163, 'user163', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (163, '한서율', NULL, 'user163@test.com', '01012340163', '2003-12-05', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (164, 'user164', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (164, '최채민', NULL, 'user164@test.com', '01012340164', '1976-02-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (165, 'user165', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (165, '송혜우', NULL, 'user165@test.com', '01012340165', '1976-06-25', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (166, 'user166', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (166, '권라현', NULL, 'user166@test.com', '01012340166', '1976-07-19', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (167, 'user167', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (167, '송수영', NULL, 'user167@test.com', '01012340167', '2003-03-14', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (168, 'user168', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (168, '오다민', NULL, 'user168@test.com', '01012340168', '2002-07-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (169, 'user169', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (169, '박다율', NULL, 'user169@test.com', '01012340169', '1997-10-27', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (170, 'user170', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (170, '황다민', NULL, 'user170@test.com', '01012340170', '1974-01-23', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (171, 'user171', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (171, '한성혁', NULL, 'user171@test.com', '01012340171', '1972-04-15', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (172, 'user172', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (172, '장다현', NULL, 'user172@test.com', '01012340172', '1986-06-04', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (173, 'user173', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (173, '윤가현', NULL, 'user173@test.com', '01012340173', '1998-12-09', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (174, 'user174', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (174, '장성영', NULL, 'user174@test.com', '01012340174', '2005-08-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (175, 'user175', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (175, '권다진', NULL, 'user175@test.com', '01012340175', '1993-07-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (176, 'user176', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (176, '장재아', NULL, 'user176@test.com', '01012340176', '1997-04-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (177, 'user177', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (177, '류다민', NULL, 'user177@test.com', '01012340177', '1982-05-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (178, 'user178', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (178, '이재민', NULL, 'user178@test.com', '01012340178', '1973-12-07', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (179, 'user179', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (179, '오라호', NULL, 'user179@test.com', '01012340179', '2004-05-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (180, 'user180', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (180, '한도연', NULL, 'user180@test.com', '01012340180', '1992-04-27', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (181, 'user181', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (181, '장재민', NULL, 'user181@test.com', '01012340181', '1978-06-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (182, 'user182', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (182, '정나진', NULL, 'user182@test.com', '01012340182', '1975-04-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (183, 'user183', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (183, '최채혁', NULL, 'user183@test.com', '01012340183', '1999-12-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (184, 'user184', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (184, '안채빈', NULL, 'user184@test.com', '01012340184', '1976-03-01', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (185, 'user185', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (185, '박유경', NULL, 'user185@test.com', '01012340185', '1985-01-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (186, 'user186', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (186, '오지연', NULL, 'user186@test.com', '01012340186', '1978-03-07', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (187, 'user187', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (187, '한가현', NULL, 'user187@test.com', '01012340187', '1990-09-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (188, 'user188', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (188, '박라빈', NULL, 'user188@test.com', '01012340188', '1983-04-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (189, 'user189', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (189, '권재호', NULL, 'user189@test.com', '01012340189', '2000-02-14', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (190, 'user190', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (190, '강은은', NULL, 'user190@test.com', '01012340190', '1976-01-19', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (191, 'user191', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (191, '최준빈', NULL, 'user191@test.com', '01012340191', '1978-12-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (192, 'user192', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (192, '조서호', NULL, 'user192@test.com', '01012340192', '1982-09-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (193, 'user193', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (193, '황서연', NULL, 'user193@test.com', '01012340193', '1989-06-19', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (194, 'user194', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (194, '조나서', NULL, 'user194@test.com', '01012340194', '1979-09-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (195, 'user195', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (195, '윤하영', NULL, 'user195@test.com', '01012340195', '1976-01-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (196, 'user196', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (196, '김다은', NULL, 'user196@test.com', '01012340196', '1997-12-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (197, 'user197', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (197, '신나찬', NULL, 'user197@test.com', '01012340197', '1974-08-23', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (198, 'user198', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (198, '장은혁', NULL, 'user198@test.com', '01012340198', '1991-08-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (199, 'user199', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (199, '장혜진', NULL, 'user199@test.com', '01012340199', '2004-09-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (200, 'user200', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (200, '서지원', NULL, 'user200@test.com', '01012340200', '1981-12-11', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (201, 'user201', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (201, '신수민', NULL, 'user201@test.com', '01012340201', '2001-09-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (202, 'user202', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (202, '김서은', NULL, 'user202@test.com', '01012340202', '1971-11-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (203, 'user203', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (203, '강은빈', NULL, 'user203@test.com', '01012340203', '1993-09-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (204, 'user204', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (204, '서가서', NULL, 'user204@test.com', '01012340204', '2004-07-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (205, 'user205', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (205, '신나찬', NULL, 'user205@test.com', '01012340205', '1980-03-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (206, 'user206', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (206, '박성희', NULL, 'user206@test.com', '01012340206', '1981-06-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (207, 'user207', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (207, '홍나민', NULL, 'user207@test.com', '01012340207', '1988-02-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (208, 'user208', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (208, '강은민', NULL, 'user208@test.com', '01012340208', '1978-09-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (209, 'user209', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (209, '장수훈', NULL, 'user209@test.com', '01012340209', '1982-02-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (210, 'user210', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (210, '윤혜진', NULL, 'user210@test.com', '01012340210', '2000-12-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (211, 'user211', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (211, '안혜영', NULL, 'user211@test.com', '01012340211', '1985-05-14', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (212, 'user212', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (212, '박혜정', NULL, 'user212@test.com', '01012340212', '2004-03-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (213, 'user213', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (213, '권혜훈', NULL, 'user213@test.com', '01012340213', '1997-07-19', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (214, 'user214', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (214, '안주희', NULL, 'user214@test.com', '01012340214', '2004-11-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (215, 'user215', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (215, '윤채찬', NULL, 'user215@test.com', '01012340215', '1974-11-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (216, 'user216', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (216, '최민현', NULL, 'user216@test.com', '01012340216', '1983-09-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (217, 'user217', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (217, '한나아', NULL, 'user217@test.com', '01012340217', '1987-06-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (218, 'user218', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (218, '안민영', NULL, 'user218@test.com', '01012340218', '1972-09-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (219, 'user219', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (219, '이하율', NULL, 'user219@test.com', '01012340219', '1992-12-28', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (220, 'user220', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (220, '강가우', NULL, 'user220@test.com', '01012340220', '1971-03-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (221, 'user221', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (221, '이예빈', NULL, 'user221@test.com', '01012340221', '1976-07-13', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (222, 'user222', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (222, '박준찬', NULL, 'user222@test.com', '01012340222', '1992-10-01', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (223, 'user223', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (223, '최하아', NULL, 'user223@test.com', '01012340223', '1985-07-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (224, 'user224', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (224, '박은찬', NULL, 'user224@test.com', '01012340224', '1973-11-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (225, 'user225', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (225, '장유진', NULL, 'user225@test.com', '01012340225', '1987-01-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (226, 'user226', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (226, '이재훈', NULL, 'user226@test.com', '01012340226', '1977-10-03', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (227, 'user227', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (227, '조지연', NULL, 'user227@test.com', '01012340227', '1971-05-23', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (228, 'user228', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (228, '정지우', NULL, 'user228@test.com', '01012340228', '1979-01-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (229, 'user229', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (229, '류재연', NULL, 'user229@test.com', '01012340229', '1988-06-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (230, 'user230', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (230, '서라아', NULL, 'user230@test.com', '01012340230', '1976-11-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (231, 'user231', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (231, '홍가은', NULL, 'user231@test.com', '01012340231', '1983-06-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (232, 'user232', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (232, '윤민민', NULL, 'user232@test.com', '01012340232', '1988-04-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (233, 'user233', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (233, '장유호', NULL, 'user233@test.com', '01012340233', '1970-07-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (234, 'user234', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (234, '박도현', NULL, 'user234@test.com', '01012340234', '1979-03-10', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (235, 'user235', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (235, '정은훈', NULL, 'user235@test.com', '01012340235', '1973-06-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (236, 'user236', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (236, '장예경', NULL, 'user236@test.com', '01012340236', '1981-08-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (237, 'user237', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (237, '조하영', NULL, 'user237@test.com', '01012340237', '2002-04-11', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (238, 'user238', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (238, '한재호', NULL, 'user238@test.com', '01012340238', '1975-11-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (239, 'user239', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (239, '정유찬', NULL, 'user239@test.com', '01012340239', '1976-05-18', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (240, 'user240', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (240, '권준정', NULL, 'user240@test.com', '01012340240', '1991-09-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (241, 'user241', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (241, '조지현', NULL, 'user241@test.com', '01012340241', '1979-11-07', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (242, 'user242', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (242, '강혜은', NULL, 'user242@test.com', '01012340242', '1975-07-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (243, 'user243', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (243, '신시준', NULL, 'user243@test.com', '01012340243', '1983-11-11', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (244, 'user244', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (244, '최하연', NULL, 'user244@test.com', '01012340244', '2002-07-07', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (245, 'user245', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (245, '장주정', NULL, 'user245@test.com', '01012340245', '1979-03-10', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (246, 'user246', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (246, '신지훈', NULL, 'user246@test.com', '01012340246', '2001-07-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (247, 'user247', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (247, '조시원', NULL, 'user247@test.com', '01012340247', '1982-07-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (248, 'user248', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (248, '장시아', NULL, 'user248@test.com', '01012340248', '1994-01-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (249, 'user249', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (249, '신가빈', NULL, 'user249@test.com', '01012340249', '1999-12-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (250, 'user250', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (250, '조준민', NULL, 'user250@test.com', '01012340250', '2000-04-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (251, 'user251', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (251, '서나준', NULL, 'user251@test.com', '01012340251', '2000-09-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (252, 'user252', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (252, '임수율', NULL, 'user252@test.com', '01012340252', '1982-11-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (253, 'user253', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (253, '송준율', NULL, 'user253@test.com', '01012340253', '1995-04-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (254, 'user254', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (254, '류준원', NULL, 'user254@test.com', '01012340254', '1985-12-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (255, 'user255', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (255, '권나희', NULL, 'user255@test.com', '01012340255', '1998-07-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (256, 'user256', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (256, '김민혁', NULL, 'user256@test.com', '01012340256', '1978-11-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (257, 'user257', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (257, '이나경', NULL, 'user257@test.com', '01012340257', '2000-01-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (258, 'user258', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (258, '조민정', NULL, 'user258@test.com', '01012340258', '1971-08-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (259, 'user259', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (259, '류도아', NULL, 'user259@test.com', '01012340259', '1993-05-02', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (260, 'user260', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (260, '황도희', NULL, 'user260@test.com', '01012340260', '1998-12-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (261, 'user261', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (261, '임다희', NULL, 'user261@test.com', '01012340261', '1970-05-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (262, 'user262', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (262, '류지진', NULL, 'user262@test.com', '01012340262', '1974-03-08', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (263, 'user263', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (263, '박주찬', NULL, 'user263@test.com', '01012340263', '1981-10-04', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (264, 'user264', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (264, '송도영', NULL, 'user264@test.com', '01012340264', '2001-04-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (265, 'user265', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (265, '정민호', NULL, 'user265@test.com', '01012340265', '2003-03-25', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (266, 'user266', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (266, '최하찬', NULL, 'user266@test.com', '01012340266', '1991-01-28', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (267, 'user267', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (267, '서성경', NULL, 'user267@test.com', '01012340267', '2005-05-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (268, 'user268', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (268, '한주서', NULL, 'user268@test.com', '01012340268', '1971-01-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (269, 'user269', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (269, '송서율', NULL, 'user269@test.com', '01012340269', '1970-05-28', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (270, 'user270', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (270, '서채호', NULL, 'user270@test.com', '01012340270', '1992-03-22', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (271, 'user271', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (271, '조성현', NULL, 'user271@test.com', '01012340271', '1992-07-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (272, 'user272', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (272, '류라정', NULL, 'user272@test.com', '01012340272', '1977-02-28', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (273, 'user273', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (273, '류나빈', NULL, 'user273@test.com', '01012340273', '1970-08-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (274, 'user274', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (274, '한다율', NULL, 'user274@test.com', '01012340274', '1987-05-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (275, 'user275', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (275, '권라아', NULL, 'user275@test.com', '01012340275', '1994-07-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (276, 'user276', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (276, '정채준', NULL, 'user276@test.com', '01012340276', '1991-11-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (277, 'user277', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (277, '이혜희', NULL, 'user277@test.com', '01012340277', '1982-06-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (278, 'user278', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (278, '김다빈', NULL, 'user278@test.com', '01012340278', '1977-06-05', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (279, 'user279', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (279, '류성아', NULL, 'user279@test.com', '01012340279', '2004-03-01', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (280, 'user280', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (280, '송지준', NULL, 'user280@test.com', '01012340280', '1971-09-11', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (281, 'user281', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (281, '권라경', NULL, 'user281@test.com', '01012340281', '1994-07-19', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (282, 'user282', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (282, '황지혁', NULL, 'user282@test.com', '01012340282', '1989-11-17', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (283, 'user283', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (283, '홍예원', NULL, 'user283@test.com', '01012340283', '1981-06-10', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (284, 'user284', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (284, '오성율', NULL, 'user284@test.com', '01012340284', '1980-06-23', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (285, 'user285', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (285, '신도빈', NULL, 'user285@test.com', '01012340285', '1996-12-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (286, 'user286', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (286, '서재혁', NULL, 'user286@test.com', '01012340286', '1994-11-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (287, 'user287', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (287, '장준민', NULL, 'user287@test.com', '01012340287', '1985-04-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (288, 'user288', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (288, '김채은', NULL, 'user288@test.com', '01012340288', '1994-02-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (289, 'user289', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (289, '서채영', NULL, 'user289@test.com', '01012340289', '2005-07-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (290, 'user290', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (290, '김준원', NULL, 'user290@test.com', '01012340290', '1979-12-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (291, 'user291', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (291, '최다빈', NULL, 'user291@test.com', '01012340291', '2005-06-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (292, 'user292', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (292, '황채혁', NULL, 'user292@test.com', '01012340292', '1994-11-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (293, 'user293', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (293, '권지민', NULL, 'user293@test.com', '01012340293', '1995-04-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (294, 'user294', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (294, '이시율', NULL, 'user294@test.com', '01012340294', '1973-10-01', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (295, 'user295', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (295, '강혜찬', NULL, 'user295@test.com', '01012340295', '1975-04-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (296, 'user296', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (296, '한은민', NULL, 'user296@test.com', '01012340296', '1979-06-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (297, 'user297', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (297, '안라은', NULL, 'user297@test.com', '01012340297', '1984-01-19', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (298, 'user298', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (298, '강예호', NULL, 'user298@test.com', '01012340298', '1979-06-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (299, 'user299', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (299, '오재찬', NULL, 'user299@test.com', '01012340299', '1985-04-24', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (300, 'user300', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (300, '안도준', NULL, 'user300@test.com', '01012340300', '1988-02-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (301, 'user301', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (301, '황채훈', NULL, 'user301@test.com', '01012340301', '1978-12-02', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (302, 'user302', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (302, '이채서', NULL, 'user302@test.com', '01012340302', '1994-10-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (303, 'user303', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (303, '이은현', NULL, 'user303@test.com', '01012340303', '2004-05-08', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (304, 'user304', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (304, '조다연', NULL, 'user304@test.com', '01012340304', '1995-07-26', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (305, 'user305', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (305, '오은원', NULL, 'user305@test.com', '01012340305', '1990-09-11', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (306, 'user306', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (306, '임유율', NULL, 'user306@test.com', '01012340306', '1972-03-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (307, 'user307', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (307, '신시진', NULL, 'user307@test.com', '01012340307', '1985-12-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (308, 'user308', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (308, '신다아', NULL, 'user308@test.com', '01012340308', '1979-12-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (309, 'user309', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (309, '권예빈', NULL, 'user309@test.com', '01012340309', '1971-10-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (310, 'user310', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (310, '장나율', NULL, 'user310@test.com', '01012340310', '1984-01-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (311, 'user311', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (311, '김하진', NULL, 'user311@test.com', '01012340311', '1978-07-11', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (312, 'user312', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (312, '권채민', NULL, 'user312@test.com', '01012340312', '1998-03-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (313, 'user313', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (313, '권민호', NULL, 'user313@test.com', '01012340313', '1986-07-07', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (314, 'user314', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (314, '장지민', NULL, 'user314@test.com', '01012340314', '1976-02-08', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (315, 'user315', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (315, '황민원', NULL, 'user315@test.com', '01012340315', '1972-09-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (316, 'user316', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (316, '류라준', NULL, 'user316@test.com', '01012340316', '1971-10-09', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (317, 'user317', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (317, '박성민', NULL, 'user317@test.com', '01012340317', '1972-03-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (318, 'user318', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (318, '권채희', NULL, 'user318@test.com', '01012340318', '1971-11-04', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (319, 'user319', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (319, '송라찬', NULL, 'user319@test.com', '01012340319', '1979-07-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (320, 'user320', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (320, '박도찬', NULL, 'user320@test.com', '01012340320', '1984-11-28', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (321, 'user321', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (321, '황라율', NULL, 'user321@test.com', '01012340321', '1997-03-05', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (322, 'user322', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (322, '오시서', NULL, 'user322@test.com', '01012340322', '1993-01-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (323, 'user323', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (323, '한혜원', NULL, 'user323@test.com', '01012340323', '1984-02-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (324, 'user324', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (324, '박재호', NULL, 'user324@test.com', '01012340324', '1991-12-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (325, 'user325', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (325, '정다찬', NULL, 'user325@test.com', '01012340325', '1985-03-11', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (326, 'user326', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (326, '류시희', NULL, 'user326@test.com', '01012340326', '1977-07-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (327, 'user327', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (327, '최하영', NULL, 'user327@test.com', '01012340327', '1999-08-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (328, 'user328', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (328, '박주우', NULL, 'user328@test.com', '01012340328', '1975-08-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (329, 'user329', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (329, '오시정', NULL, 'user329@test.com', '01012340329', '1977-03-07', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (330, 'user330', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (330, '조성진', NULL, 'user330@test.com', '01012340330', '1986-09-07', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (331, 'user331', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (331, '신지영', NULL, 'user331@test.com', '01012340331', '1972-04-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (332, 'user332', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (332, '신채혁', NULL, 'user332@test.com', '01012340332', '1990-06-10', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (333, 'user333', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (333, '정주훈', NULL, 'user333@test.com', '01012340333', '1991-12-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (334, 'user334', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (334, '송예희', NULL, 'user334@test.com', '01012340334', '2003-08-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (335, 'user335', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (335, '신수준', NULL, 'user335@test.com', '01012340335', '2003-10-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (336, 'user336', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (336, '조주서', NULL, 'user336@test.com', '01012340336', '1982-05-06', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (337, 'user337', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (337, '강준연', NULL, 'user337@test.com', '01012340337', '1987-09-23', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (338, 'user338', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (338, '서혜연', NULL, 'user338@test.com', '01012340338', '2001-01-28', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (339, 'user339', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (339, '임지서', NULL, 'user339@test.com', '01012340339', '2004-12-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (340, 'user340', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (340, '오예희', NULL, 'user340@test.com', '01012340340', '1994-06-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (341, 'user341', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (341, '박예영', NULL, 'user341@test.com', '01012340341', '1994-08-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (342, 'user342', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (342, '오혜경', NULL, 'user342@test.com', '01012340342', '2003-08-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (343, 'user343', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (343, '임민빈', NULL, 'user343@test.com', '01012340343', '2002-04-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (344, 'user344', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (344, '신가연', NULL, 'user344@test.com', '01012340344', '1970-06-13', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (345, 'user345', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (345, '윤혜현', NULL, 'user345@test.com', '01012340345', '2005-03-11', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (346, 'user346', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (346, '강준은', NULL, 'user346@test.com', '01012340346', '1981-06-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (347, 'user347', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (347, '오지정', NULL, 'user347@test.com', '01012340347', '1972-11-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (348, 'user348', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (348, '한하민', NULL, 'user348@test.com', '01012340348', '1974-08-21', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (349, 'user349', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (349, '김라은', NULL, 'user349@test.com', '01012340349', '2003-09-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (350, 'user350', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (350, '장은경', NULL, 'user350@test.com', '01012340350', '1980-08-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (351, 'user351', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (351, '송시은', NULL, 'user351@test.com', '01012340351', '1982-03-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (352, 'user352', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (352, '임채준', NULL, 'user352@test.com', '01012340352', '1992-02-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (353, 'user353', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (353, '신은우', NULL, 'user353@test.com', '01012340353', '1984-12-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (354, 'user354', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (354, '조성경', NULL, 'user354@test.com', '01012340354', '1982-12-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (355, 'user355', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (355, '황재준', NULL, 'user355@test.com', '01012340355', '1997-10-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (356, 'user356', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (356, '최예준', NULL, 'user356@test.com', '01012340356', '1981-08-02', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (357, 'user357', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (357, '서재원', NULL, 'user357@test.com', '01012340357', '1998-06-17', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (358, 'user358', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (358, '장나희', NULL, 'user358@test.com', '01012340358', '1983-10-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (359, 'user359', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (359, '권민찬', NULL, 'user359@test.com', '01012340359', '1986-03-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (360, 'user360', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (360, '김다희', NULL, 'user360@test.com', '01012340360', '1987-02-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (361, 'user361', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (361, '윤가연', NULL, 'user361@test.com', '01012340361', '1979-11-17', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (362, 'user362', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (362, '임지정', NULL, 'user362@test.com', '01012340362', '1977-03-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (363, 'user363', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (363, '안라호', NULL, 'user363@test.com', '01012340363', '1986-05-03', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (364, 'user364', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (364, '임라은', NULL, 'user364@test.com', '01012340364', '1986-02-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (365, 'user365', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (365, '오채민', NULL, 'user365@test.com', '01012340365', '2001-06-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (366, 'user366', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (366, '최라훈', NULL, 'user366@test.com', '01012340366', '1986-05-10', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (367, 'user367', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (367, '임수율', NULL, 'user367@test.com', '01012340367', '1991-02-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (368, 'user368', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (368, '권은영', NULL, 'user368@test.com', '01012340368', '1977-11-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (369, 'user369', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (369, '서재찬', NULL, 'user369@test.com', '01012340369', '1989-05-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (370, 'user370', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (370, '박수희', NULL, 'user370@test.com', '01012340370', '1999-06-24', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (371, 'user371', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (371, '윤준호', NULL, 'user371@test.com', '01012340371', '1980-09-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (372, 'user372', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (372, '안주원', NULL, 'user372@test.com', '01012340372', '1999-05-04', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (373, 'user373', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (373, '한주현', NULL, 'user373@test.com', '01012340373', '2002-01-10', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (374, 'user374', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (374, '임가영', NULL, 'user374@test.com', '01012340374', '2004-04-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (375, 'user375', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (375, '홍채찬', NULL, 'user375@test.com', '01012340375', '1998-10-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (376, 'user376', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (376, '안도혁', NULL, 'user376@test.com', '01012340376', '1975-07-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (377, 'user377', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (377, '최다찬', NULL, 'user377@test.com', '01012340377', '1971-04-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (378, 'user378', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (378, '권민빈', NULL, 'user378@test.com', '01012340378', '1987-07-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (379, 'user379', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (379, '오채우', NULL, 'user379@test.com', '01012340379', '1974-08-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (380, 'user380', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (380, '황성우', NULL, 'user380@test.com', '01012340380', '1993-07-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (381, 'user381', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (381, '조도은', NULL, 'user381@test.com', '01012340381', '2001-10-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (382, 'user382', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (382, '최다희', NULL, 'user382@test.com', '01012340382', '1978-02-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (383, 'user383', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (383, '안채율', NULL, 'user383@test.com', '01012340383', '1991-09-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (384, 'user384', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (384, '권준호', NULL, 'user384@test.com', '01012340384', '1971-03-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (385, 'user385', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (385, '조서원', NULL, 'user385@test.com', '01012340385', '1999-04-11', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (386, 'user386', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (386, '홍혜서', NULL, 'user386@test.com', '01012340386', '1986-08-08', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (387, 'user387', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (387, '안예원', NULL, 'user387@test.com', '01012340387', '1985-02-06', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (388, 'user388', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (388, '홍다훈', NULL, 'user388@test.com', '01012340388', '2000-03-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (389, 'user389', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (389, '이예희', NULL, 'user389@test.com', '01012340389', '1999-05-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (390, 'user390', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (390, '김도준', NULL, 'user390@test.com', '01012340390', '1985-03-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (391, 'user391', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (391, '임도영', NULL, 'user391@test.com', '01012340391', '1985-04-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (392, 'user392', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (392, '류하희', NULL, 'user392@test.com', '01012340392', '1975-06-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (393, 'user393', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (393, '홍재현', NULL, 'user393@test.com', '01012340393', '1981-05-28', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (394, 'user394', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (394, '송은연', NULL, 'user394@test.com', '01012340394', '1976-07-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (395, 'user395', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (395, '홍예준', NULL, 'user395@test.com', '01012340395', '1977-07-19', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (396, 'user396', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (396, '이지혁', NULL, 'user396@test.com', '01012340396', '1976-07-04', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (397, 'user397', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (397, '강서찬', NULL, 'user397@test.com', '01012340397', '2003-04-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (398, 'user398', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (398, '서시빈', NULL, 'user398@test.com', '01012340398', '2003-09-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (399, 'user399', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (399, '오나은', NULL, 'user399@test.com', '01012340399', '1987-02-02', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (400, 'user400', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (400, '권준연', NULL, 'user400@test.com', '01012340400', '2000-01-02', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (401, 'user401', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (401, '김시준', NULL, 'user401@test.com', '01012340401', '2005-12-18', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (402, 'user402', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (402, '최민율', NULL, 'user402@test.com', '01012340402', '1982-07-21', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (403, 'user403', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (403, '송지진', NULL, 'user403@test.com', '01012340403', '1985-09-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (404, 'user404', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (404, '류예서', NULL, 'user404@test.com', '01012340404', '1992-09-02', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (405, 'user405', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (405, '박채빈', NULL, 'user405@test.com', '01012340405', '1997-04-23', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (406, 'user406', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (406, '최지경', NULL, 'user406@test.com', '01012340406', '1977-07-01', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (407, 'user407', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (407, '최주율', NULL, 'user407@test.com', '01012340407', '2000-07-04', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (408, 'user408', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (408, '서다진', NULL, 'user408@test.com', '01012340408', '2002-05-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (409, 'user409', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (409, '김성민', NULL, 'user409@test.com', '01012340409', '1994-05-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (410, 'user410', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (410, '최성훈', NULL, 'user410@test.com', '01012340410', '1979-08-28', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (411, 'user411', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (411, '서주경', NULL, 'user411@test.com', '01012340411', '1974-04-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (412, 'user412', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (412, '박성희', NULL, 'user412@test.com', '01012340412', '1991-05-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (413, 'user413', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (413, '강하은', NULL, 'user413@test.com', '01012340413', '1973-10-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (414, 'user414', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (414, '박가빈', NULL, 'user414@test.com', '01012340414', '1991-09-03', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (415, 'user415', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (415, '류가희', NULL, 'user415@test.com', '01012340415', '1995-08-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (416, 'user416', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (416, '신다준', NULL, 'user416@test.com', '01012340416', '1992-11-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (417, 'user417', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (417, '최나훈', NULL, 'user417@test.com', '01012340417', '1988-04-17', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (418, 'user418', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (418, '강민준', NULL, 'user418@test.com', '01012340418', '2001-06-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (419, 'user419', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (419, '서다은', NULL, 'user419@test.com', '01012340419', '1988-09-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (420, 'user420', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (420, '김지현', NULL, 'user420@test.com', '01012340420', '1999-08-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (421, 'user421', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (421, '장재우', NULL, 'user421@test.com', '01012340421', '2000-04-01', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (422, 'user422', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (422, '이가희', NULL, 'user422@test.com', '01012340422', '2001-06-22', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (423, 'user423', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (423, '홍나혁', NULL, 'user423@test.com', '01012340423', '1982-07-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (424, 'user424', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (424, '조서현', NULL, 'user424@test.com', '01012340424', '1990-10-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (425, 'user425', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (425, '김예혁', NULL, 'user425@test.com', '01012340425', '1987-02-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (426, 'user426', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (426, '장민정', NULL, 'user426@test.com', '01012340426', '1990-10-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (427, 'user427', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (427, '오혜아', NULL, 'user427@test.com', '01012340427', '1974-06-25', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (428, 'user428', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (428, '김지훈', NULL, 'user428@test.com', '01012340428', '1972-02-01', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (429, 'user429', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (429, '박혜혁', NULL, 'user429@test.com', '01012340429', '1982-12-28', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (430, 'user430', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (430, '홍시준', NULL, 'user430@test.com', '01012340430', '1990-12-15', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (431, 'user431', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (431, '류예혁', NULL, 'user431@test.com', '01012340431', '1987-09-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (432, 'user432', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (432, '임수찬', NULL, 'user432@test.com', '01012340432', '1988-03-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (433, 'user433', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (433, '송가준', NULL, 'user433@test.com', '01012340433', '1998-11-10', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (434, 'user434', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (434, '한채정', NULL, 'user434@test.com', '01012340434', '1993-07-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (435, 'user435', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (435, '류채정', NULL, 'user435@test.com', '01012340435', '1978-02-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (436, 'user436', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (436, '강나연', NULL, 'user436@test.com', '01012340436', '1976-01-26', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (437, 'user437', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (437, '조예경', NULL, 'user437@test.com', '01012340437', '1973-09-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (438, 'user438', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (438, '이도율', NULL, 'user438@test.com', '01012340438', '2005-11-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (439, 'user439', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (439, '임은율', NULL, 'user439@test.com', '01012340439', '1974-06-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (440, 'user440', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (440, '강혜원', NULL, 'user440@test.com', '01012340440', '1974-08-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (441, 'user441', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (441, '서은희', NULL, 'user441@test.com', '01012340441', '1976-03-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (442, 'user442', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (442, '서도찬', NULL, 'user442@test.com', '01012340442', '1996-10-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (443, 'user443', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (443, '박다은', NULL, 'user443@test.com', '01012340443', '1991-07-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (444, 'user444', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (444, '류채훈', NULL, 'user444@test.com', '01012340444', '1998-04-19', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (445, 'user445', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (445, '김가경', NULL, 'user445@test.com', '01012340445', '1976-10-22', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (446, 'user446', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (446, '류도연', NULL, 'user446@test.com', '01012340446', '1977-01-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (447, 'user447', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (447, '박라혁', NULL, 'user447@test.com', '01012340447', '1996-04-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (448, 'user448', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (448, '류주혁', NULL, 'user448@test.com', '01012340448', '1987-05-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (449, 'user449', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (449, '류지우', NULL, 'user449@test.com', '01012340449', '1997-07-07', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (450, 'user450', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (450, '서도율', NULL, 'user450@test.com', '01012340450', '1986-06-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (451, 'user451', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (451, '김성호', NULL, 'user451@test.com', '01012340451', '1997-09-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (452, 'user452', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (452, '안서원', NULL, 'user452@test.com', '01012340452', '2000-08-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (453, 'user453', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (453, '임시연', NULL, 'user453@test.com', '01012340453', '1984-08-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (454, 'user454', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (454, '안혜민', NULL, 'user454@test.com', '01012340454', '2002-11-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (455, 'user455', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (455, '박주현', NULL, 'user455@test.com', '01012340455', '1983-09-02', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (456, 'user456', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (456, '장준빈', NULL, 'user456@test.com', '01012340456', '1980-05-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (457, 'user457', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (457, '안재우', NULL, 'user457@test.com', '01012340457', '1998-06-26', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (458, 'user458', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (458, '이가아', NULL, 'user458@test.com', '01012340458', '1996-12-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (459, 'user459', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (459, '박준민', NULL, 'user459@test.com', '01012340459', '2003-10-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (460, 'user460', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (460, '한라연', NULL, 'user460@test.com', '01012340460', '1982-10-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (461, 'user461', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (461, '이주희', NULL, 'user461@test.com', '01012340461', '1999-08-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (462, 'user462', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (462, '강재진', NULL, 'user462@test.com', '01012340462', '1991-10-03', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (463, 'user463', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (463, '송시서', NULL, 'user463@test.com', '01012340463', '2003-04-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (464, 'user464', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (464, '김지호', NULL, 'user464@test.com', '01012340464', '1976-09-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (465, 'user465', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (465, '장성영', NULL, 'user465@test.com', '01012340465', '1984-02-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (466, 'user466', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (466, '강민정', NULL, 'user466@test.com', '01012340466', '1985-07-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (467, 'user467', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (467, '최재율', NULL, 'user467@test.com', '01012340467', '1996-09-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (468, 'user468', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (468, '황은아', NULL, 'user468@test.com', '01012340468', '2002-06-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (469, 'user469', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (469, '강혜민', NULL, 'user469@test.com', '01012340469', '1987-12-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (470, 'user470', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (470, '조재훈', NULL, 'user470@test.com', '01012340470', '1983-02-04', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (471, 'user471', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (471, '송라현', NULL, 'user471@test.com', '01012340471', '1974-12-17', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (472, 'user472', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (472, '최시경', NULL, 'user472@test.com', '01012340472', '1991-08-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (473, 'user473', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (473, '박도희', NULL, 'user473@test.com', '01012340473', '1992-06-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (474, 'user474', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (474, '박가호', NULL, 'user474@test.com', '01012340474', '1972-08-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (475, 'user475', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (475, '홍라훈', NULL, 'user475@test.com', '01012340475', '2001-09-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (476, 'user476', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (476, '홍성현', NULL, 'user476@test.com', '01012340476', '1984-09-28', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (477, 'user477', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (477, '안수서', NULL, 'user477@test.com', '01012340477', '1998-05-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (478, 'user478', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (478, '최가현', NULL, 'user478@test.com', '01012340478', '1987-10-05', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (479, 'user479', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (479, '권가원', NULL, 'user479@test.com', '01012340479', '1991-06-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (480, 'user480', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (480, '김주우', NULL, 'user480@test.com', '01012340480', '1973-09-01', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (481, 'user481', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (481, '이예훈', NULL, 'user481@test.com', '01012340481', '1998-11-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (482, 'user482', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (482, '장민영', NULL, 'user482@test.com', '01012340482', '1993-03-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (483, 'user483', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (483, '류준연', NULL, 'user483@test.com', '01012340483', '1996-01-13', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (484, 'user484', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (484, '윤민은', NULL, 'user484@test.com', '01012340484', '1989-03-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (485, 'user485', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (485, '장혜호', NULL, 'user485@test.com', '01012340485', '1973-11-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (486, 'user486', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (486, '정은원', NULL, 'user486@test.com', '01012340486', '1996-06-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (487, 'user487', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (487, '안예준', NULL, 'user487@test.com', '01012340487', '1995-01-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (488, 'user488', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (488, '박예빈', NULL, 'user488@test.com', '01012340488', '1970-04-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (489, 'user489', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (489, '이도호', NULL, 'user489@test.com', '01012340489', '2005-05-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (490, 'user490', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (490, '서시서', NULL, 'user490@test.com', '01012340490', '1990-12-24', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (491, 'user491', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (491, '정시훈', NULL, 'user491@test.com', '01012340491', '2004-03-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (492, 'user492', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (492, '윤라율', NULL, 'user492@test.com', '01012340492', '2002-01-28', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (493, 'user493', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (493, '장가정', NULL, 'user493@test.com', '01012340493', '1975-02-11', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (494, 'user494', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (494, '강성은', NULL, 'user494@test.com', '01012340494', '1995-11-14', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (495, 'user495', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (495, '권주호', NULL, 'user495@test.com', '01012340495', '1999-02-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (496, 'user496', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (496, '홍다은', NULL, 'user496@test.com', '01012340496', '1989-04-18', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (497, 'user497', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (497, '장은정', NULL, 'user497@test.com', '01012340497', '1988-04-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (498, 'user498', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (498, '오도서', NULL, 'user498@test.com', '01012340498', '1990-06-19', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (499, 'user499', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (499, '홍라서', NULL, 'user499@test.com', '01012340499', '1998-10-24', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (500, 'user500', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (500, '류하율', NULL, 'user500@test.com', '01012340500', '1991-12-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (501, 'user501', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (501, '정유현', NULL, 'user501@test.com', '01012340501', '1998-01-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (502, 'user502', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (502, '류재혁', NULL, 'user502@test.com', '01012340502', '1998-02-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (503, 'user503', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (503, '권혜율', NULL, 'user503@test.com', '01012340503', '1970-07-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (504, 'user504', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (504, '조라찬', NULL, 'user504@test.com', '01012340504', '1982-09-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (505, 'user505', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (505, '한도정', NULL, 'user505@test.com', '01012340505', '1999-10-05', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (506, 'user506', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (506, '윤지찬', NULL, 'user506@test.com', '01012340506', '1973-11-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (507, 'user507', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (507, '한주진', NULL, 'user507@test.com', '01012340507', '2001-10-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (508, 'user508', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (508, '권나혁', NULL, 'user508@test.com', '01012340508', '1982-04-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (509, 'user509', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (509, '임민원', NULL, 'user509@test.com', '01012340509', '1975-11-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (510, 'user510', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (510, '정민빈', NULL, 'user510@test.com', '01012340510', '1989-08-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (511, 'user511', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (511, '장혜연', NULL, 'user511@test.com', '01012340511', '1981-09-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (512, 'user512', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (512, '임은찬', NULL, 'user512@test.com', '01012340512', '1994-12-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (513, 'user513', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (513, '윤도은', NULL, 'user513@test.com', '01012340513', '1990-08-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (514, 'user514', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (514, '송민준', NULL, 'user514@test.com', '01012340514', '1980-09-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (515, 'user515', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (515, '송주연', NULL, 'user515@test.com', '01012340515', '1978-08-03', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (516, 'user516', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (516, '황채우', NULL, 'user516@test.com', '01012340516', '1975-05-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (517, 'user517', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (517, '김유정', NULL, 'user517@test.com', '01012340517', '1973-11-09', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (518, 'user518', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (518, '류지원', NULL, 'user518@test.com', '01012340518', '1975-03-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (519, 'user519', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (519, '류예경', NULL, 'user519@test.com', '01012340519', '1985-08-20', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (520, 'user520', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (520, '조혜빈', NULL, 'user520@test.com', '01012340520', '1991-05-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (521, 'user521', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (521, '송시찬', NULL, 'user521@test.com', '01012340521', '1992-06-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (522, 'user522', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (522, '서시경', NULL, 'user522@test.com', '01012340522', '1983-10-09', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (523, 'user523', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (523, '안다찬', NULL, 'user523@test.com', '01012340523', '1976-12-10', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (524, 'user524', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (524, '서다준', NULL, 'user524@test.com', '01012340524', '1971-08-09', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (525, 'user525', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (525, '김혜원', NULL, 'user525@test.com', '01012340525', '1977-01-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (526, 'user526', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (526, '서성희', NULL, 'user526@test.com', '01012340526', '1988-07-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (527, 'user527', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (527, '오채서', NULL, 'user527@test.com', '01012340527', '1999-11-22', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (528, 'user528', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (528, '박시훈', NULL, 'user528@test.com', '01012340528', '1998-08-06', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (529, 'user529', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (529, '임수준', NULL, 'user529@test.com', '01012340529', '1984-06-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (530, 'user530', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (530, '김지혁', NULL, 'user530@test.com', '01012340530', '2003-09-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (531, 'user531', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (531, '홍나아', NULL, 'user531@test.com', '01012340531', '1977-05-02', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (532, 'user532', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (532, '한은우', NULL, 'user532@test.com', '01012340532', '1984-07-07', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (533, 'user533', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (533, '권서훈', NULL, 'user533@test.com', '01012340533', '1972-09-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (534, 'user534', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (534, '한라우', NULL, 'user534@test.com', '01012340534', '1991-05-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (535, 'user535', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (535, '박주은', NULL, 'user535@test.com', '01012340535', '1992-03-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (536, 'user536', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (536, '송도희', NULL, 'user536@test.com', '01012340536', '1974-08-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (537, 'user537', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (537, '임성영', NULL, 'user537@test.com', '01012340537', '1992-10-19', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (538, 'user538', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (538, '장준혁', NULL, 'user538@test.com', '01012340538', '1975-02-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (539, 'user539', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (539, '장준원', NULL, 'user539@test.com', '01012340539', '1999-01-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (540, 'user540', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (540, '한가은', NULL, 'user540@test.com', '01012340540', '1996-08-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (541, 'user541', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (541, '최지우', NULL, 'user541@test.com', '01012340541', '1995-04-23', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (542, 'user542', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (542, '류혜준', NULL, 'user542@test.com', '01012340542', '1979-07-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (543, 'user543', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (543, '이가우', NULL, 'user543@test.com', '01012340543', '2004-10-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (544, 'user544', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (544, '황도현', NULL, 'user544@test.com', '01012340544', '1977-08-14', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (545, 'user545', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (545, '서혜준', NULL, 'user545@test.com', '01012340545', '1976-08-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (546, 'user546', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (546, '윤혜혁', NULL, 'user546@test.com', '01012340546', '1977-09-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (547, 'user547', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (547, '한도원', NULL, 'user547@test.com', '01012340547', '1983-12-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (548, 'user548', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (548, '권재현', NULL, 'user548@test.com', '01012340548', '1983-10-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (549, 'user549', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (549, '신은서', NULL, 'user549@test.com', '01012340549', '1973-07-02', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (550, 'user550', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (550, '임나진', NULL, 'user550@test.com', '01012340550', '1975-06-06', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (551, 'user551', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (551, '정수현', NULL, 'user551@test.com', '01012340551', '1987-05-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (552, 'user552', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (552, '강주준', NULL, 'user552@test.com', '01012340552', '1991-10-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (553, 'user553', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (553, '권지찬', NULL, 'user553@test.com', '01012340553', '1999-10-26', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (554, 'user554', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (554, '윤은경', NULL, 'user554@test.com', '01012340554', '1980-11-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (555, 'user555', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (555, '한지우', NULL, 'user555@test.com', '01012340555', '2000-11-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (556, 'user556', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (556, '안성은', NULL, 'user556@test.com', '01012340556', '1991-11-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (557, 'user557', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (557, '오라원', NULL, 'user557@test.com', '01012340557', '1984-05-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (558, 'user558', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (558, '임가율', NULL, 'user558@test.com', '01012340558', '2004-02-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (559, 'user559', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (559, '강재현', NULL, 'user559@test.com', '01012340559', '1991-08-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (560, 'user560', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (560, '장서호', NULL, 'user560@test.com', '01012340560', '1992-11-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (561, 'user561', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (561, '최재원', NULL, 'user561@test.com', '01012340561', '1998-08-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (562, 'user562', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (562, '장재찬', NULL, 'user562@test.com', '01012340562', '2001-03-10', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (563, 'user563', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (563, '조수훈', NULL, 'user563@test.com', '01012340563', '2004-06-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (564, 'user564', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (564, '송라원', NULL, 'user564@test.com', '01012340564', '1971-02-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (565, 'user565', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (565, '정시아', NULL, 'user565@test.com', '01012340565', '1987-06-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (566, 'user566', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (566, '권하진', NULL, 'user566@test.com', '01012340566', '1995-05-09', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (567, 'user567', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (567, '장민진', NULL, 'user567@test.com', '01012340567', '1970-06-03', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (568, 'user568', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (568, '송서정', NULL, 'user568@test.com', '01012340568', '1984-12-18', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (569, 'user569', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (569, '이도호', NULL, 'user569@test.com', '01012340569', '1987-06-20', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (570, 'user570', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (570, '조서혁', NULL, 'user570@test.com', '01012340570', '1995-02-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (571, 'user571', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (571, '오다율', NULL, 'user571@test.com', '01012340571', '1990-08-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (572, 'user572', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (572, '윤다원', NULL, 'user572@test.com', '01012340572', '1986-03-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (573, 'user573', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (573, '임도현', NULL, 'user573@test.com', '01012340573', '1989-04-02', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (574, 'user574', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (574, '안민정', NULL, 'user574@test.com', '01012340574', '2005-08-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (575, 'user575', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (575, '송나은', NULL, 'user575@test.com', '01012340575', '1994-04-19', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (576, 'user576', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (576, '최주희', NULL, 'user576@test.com', '01012340576', '1994-08-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (577, 'user577', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (577, '안주훈', NULL, 'user577@test.com', '01012340577', '1991-05-05', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (578, 'user578', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (578, '한지은', NULL, 'user578@test.com', '01012340578', '1997-07-07', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (579, 'user579', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (579, '서재영', NULL, 'user579@test.com', '01012340579', '1982-03-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (580, 'user580', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (580, '홍수진', NULL, 'user580@test.com', '01012340580', '1979-09-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (581, 'user581', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (581, '신재훈', NULL, 'user581@test.com', '01012340581', '2004-11-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (582, 'user582', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (582, '류성민', NULL, 'user582@test.com', '01012340582', '1985-07-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (583, 'user583', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (583, '류예찬', NULL, 'user583@test.com', '01012340583', '1999-09-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (584, 'user584', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (584, '오성경', NULL, 'user584@test.com', '01012340584', '2003-07-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (585, 'user585', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (585, '윤예연', NULL, 'user585@test.com', '01012340585', '2003-01-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (586, 'user586', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (586, '서나서', NULL, 'user586@test.com', '01012340586', '1972-03-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (587, 'user587', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (587, '한다연', NULL, 'user587@test.com', '01012340587', '1995-10-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (588, 'user588', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (588, '오지현', NULL, 'user588@test.com', '01012340588', '1985-02-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (589, 'user589', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (589, '이재훈', NULL, 'user589@test.com', '01012340589', '1991-07-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (590, 'user590', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (590, '신준아', NULL, 'user590@test.com', '01012340590', '1994-12-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (591, 'user591', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (591, '김주율', NULL, 'user591@test.com', '01012340591', '1999-08-07', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (592, 'user592', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (592, '윤민율', NULL, 'user592@test.com', '01012340592', '1982-07-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (593, 'user593', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (593, '한예호', NULL, 'user593@test.com', '01012340593', '1978-01-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (594, 'user594', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (594, '황주훈', NULL, 'user594@test.com', '01012340594', '1987-05-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (595, 'user595', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (595, '장하경', NULL, 'user595@test.com', '01012340595', '2004-05-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (596, 'user596', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (596, '송시빈', NULL, 'user596@test.com', '01012340596', '1973-03-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (597, 'user597', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (597, '권민연', NULL, 'user597@test.com', '01012340597', '1976-06-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (598, 'user598', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (598, '임예은', NULL, 'user598@test.com', '01012340598', '1983-04-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (599, 'user599', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (599, '최가경', NULL, 'user599@test.com', '01012340599', '2002-07-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (600, 'user600', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (600, '류다경', NULL, 'user600@test.com', '01012340600', '2003-06-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (601, 'user601', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (601, '안민원', NULL, 'user601@test.com', '01012340601', '1988-04-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (602, 'user602', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (602, '황라서', NULL, 'user602@test.com', '01012340602', '1997-07-24', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (603, 'user603', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (603, '박수율', NULL, 'user603@test.com', '01012340603', '1986-05-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (604, 'user604', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (604, '권시빈', NULL, 'user604@test.com', '01012340604', '1980-07-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (605, 'user605', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (605, '안유준', NULL, 'user605@test.com', '01012340605', '1990-11-09', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (606, 'user606', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (606, '류혜우', NULL, 'user606@test.com', '01012340606', '1976-05-24', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (607, 'user607', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (607, '김도서', NULL, 'user607@test.com', '01012340607', '1990-03-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (608, 'user608', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (608, '안채정', NULL, 'user608@test.com', '01012340608', '1977-05-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (609, 'user609', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (609, '황재찬', NULL, 'user609@test.com', '01012340609', '1980-04-02', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (610, 'user610', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (610, '권다훈', NULL, 'user610@test.com', '01012340610', '1987-02-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (611, 'user611', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (611, '안재경', NULL, 'user611@test.com', '01012340611', '1983-02-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (612, 'user612', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (612, '황지은', NULL, 'user612@test.com', '01012340612', '1984-03-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (613, 'user613', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (613, '조나원', NULL, 'user613@test.com', '01012340613', '1972-08-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (614, 'user614', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (614, '안민준', NULL, 'user614@test.com', '01012340614', '1976-02-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (615, 'user615', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (615, '김라정', NULL, 'user615@test.com', '01012340615', '2003-03-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (616, 'user616', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (616, '안하영', NULL, 'user616@test.com', '01012340616', '1971-02-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (617, 'user617', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (617, '송다연', NULL, 'user617@test.com', '01012340617', '1991-06-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (618, 'user618', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (618, '윤유경', NULL, 'user618@test.com', '01012340618', '1973-05-07', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (619, 'user619', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (619, '류재민', NULL, 'user619@test.com', '01012340619', '1986-11-07', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (620, 'user620', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (620, '한수율', NULL, 'user620@test.com', '01012340620', '2000-01-15', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (621, 'user621', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (621, '한도우', NULL, 'user621@test.com', '01012340621', '1987-05-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (622, 'user622', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (622, '정수경', NULL, 'user622@test.com', '01012340622', '1990-02-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (623, 'user623', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (623, '안다연', NULL, 'user623@test.com', '01012340623', '1987-08-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (624, 'user624', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (624, '신예찬', NULL, 'user624@test.com', '01012340624', '1992-11-10', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (625, 'user625', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (625, '권성정', NULL, 'user625@test.com', '01012340625', '1994-02-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (626, 'user626', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (626, '이시진', NULL, 'user626@test.com', '01012340626', '1999-03-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (627, 'user627', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (627, '박나은', NULL, 'user627@test.com', '01012340627', '1984-02-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (628, 'user628', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (628, '이예빈', NULL, 'user628@test.com', '01012340628', '1978-08-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (629, 'user629', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (629, '윤예민', NULL, 'user629@test.com', '01012340629', '1999-08-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (630, 'user630', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (630, '장채연', NULL, 'user630@test.com', '01012340630', '1978-12-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (631, 'user631', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (631, '정유민', NULL, 'user631@test.com', '01012340631', '2003-11-03', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (632, 'user632', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (632, '최혜현', NULL, 'user632@test.com', '01012340632', '1988-01-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (633, 'user633', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (633, '서민경', NULL, 'user633@test.com', '01012340633', '1996-02-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (634, 'user634', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (634, '김나민', NULL, 'user634@test.com', '01012340634', '1993-04-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (635, 'user635', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (635, '권은호', NULL, 'user635@test.com', '01012340635', '2000-10-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (636, 'user636', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (636, '이서서', NULL, 'user636@test.com', '01012340636', '1998-05-25', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (637, 'user637', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (637, '홍시율', NULL, 'user637@test.com', '01012340637', '1974-06-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (638, 'user638', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (638, '박수민', NULL, 'user638@test.com', '01012340638', '1975-07-03', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (639, 'user639', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (639, '박시율', NULL, 'user639@test.com', '01012340639', '1995-12-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (640, 'user640', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (640, '장가우', NULL, 'user640@test.com', '01012340640', '1987-05-11', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (641, 'user641', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (641, '류다연', NULL, 'user641@test.com', '01012340641', '1973-12-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (642, 'user642', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (642, '홍성훈', NULL, 'user642@test.com', '01012340642', '1972-07-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (643, 'user643', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (643, '신가빈', NULL, 'user643@test.com', '01012340643', '1971-06-08', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (644, 'user644', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (644, '안민은', NULL, 'user644@test.com', '01012340644', '1974-04-14', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (645, 'user645', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (645, '신나민', NULL, 'user645@test.com', '01012340645', '1991-04-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (646, 'user646', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (646, '김가아', NULL, 'user646@test.com', '01012340646', '1991-03-13', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (647, 'user647', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (647, '류유호', NULL, 'user647@test.com', '01012340647', '1994-03-06', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (648, 'user648', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (648, '서시원', NULL, 'user648@test.com', '01012340648', '2001-01-13', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (649, 'user649', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (649, '류라원', NULL, 'user649@test.com', '01012340649', '1979-06-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (650, 'user650', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (650, '장다호', NULL, 'user650@test.com', '01012340650', '2004-02-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (651, 'user651', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (651, '홍혜현', NULL, 'user651@test.com', '01012340651', '1997-12-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (652, 'user652', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (652, '안수혁', NULL, 'user652@test.com', '01012340652', '1973-11-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (653, 'user653', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (653, '신유찬', NULL, 'user653@test.com', '01012340653', '1972-05-10', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (654, 'user654', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (654, '임라민', NULL, 'user654@test.com', '01012340654', '1984-10-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (655, 'user655', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (655, '송가빈', NULL, 'user655@test.com', '01012340655', '1999-11-09', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (656, 'user656', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (656, '조지희', NULL, 'user656@test.com', '01012340656', '1983-07-21', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (657, 'user657', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (657, '김성율', NULL, 'user657@test.com', '01012340657', '1980-11-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (658, 'user658', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (658, '류시우', NULL, 'user658@test.com', '01012340658', '1999-12-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (659, 'user659', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (659, '윤지정', NULL, 'user659@test.com', '01012340659', '1997-04-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (660, 'user660', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (660, '신준아', NULL, 'user660@test.com', '01012340660', '2002-06-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (661, 'user661', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (661, '정은율', NULL, 'user661@test.com', '01012340661', '1984-12-13', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (662, 'user662', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (662, '류재은', NULL, 'user662@test.com', '01012340662', '1987-12-21', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (663, 'user663', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (663, '장재희', NULL, 'user663@test.com', '01012340663', '1985-08-15', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (664, 'user664', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (664, '류주서', NULL, 'user664@test.com', '01012340664', '1974-01-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (665, 'user665', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (665, '홍시은', NULL, 'user665@test.com', '01012340665', '1985-01-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (666, 'user666', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (666, '류채은', NULL, 'user666@test.com', '01012340666', '1974-01-14', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (667, 'user667', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (667, '권서민', NULL, 'user667@test.com', '01012340667', '2000-09-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (668, 'user668', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (668, '한채경', NULL, 'user668@test.com', '01012340668', '1988-08-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (669, 'user669', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (669, '홍도희', NULL, 'user669@test.com', '01012340669', '1985-04-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (670, 'user670', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (670, '송도민', NULL, 'user670@test.com', '01012340670', '2005-06-11', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (671, 'user671', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (671, '황유훈', NULL, 'user671@test.com', '01012340671', '1975-06-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (672, 'user672', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (672, '이지영', NULL, 'user672@test.com', '01012340672', '1980-06-08', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (673, 'user673', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (673, '홍혜찬', NULL, 'user673@test.com', '01012340673', '2001-02-10', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (674, 'user674', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (674, '임서준', NULL, 'user674@test.com', '01012340674', '1980-01-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (675, 'user675', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (675, '윤다현', NULL, 'user675@test.com', '01012340675', '1982-05-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (676, 'user676', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (676, '장재현', NULL, 'user676@test.com', '01012340676', '1985-12-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (677, 'user677', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (677, '강유빈', NULL, 'user677@test.com', '01012340677', '1986-09-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (678, 'user678', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (678, '류준경', NULL, 'user678@test.com', '01012340678', '1980-10-07', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (679, 'user679', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (679, '정지혁', NULL, 'user679@test.com', '01012340679', '1984-06-28', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (680, 'user680', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (680, '박도찬', NULL, 'user680@test.com', '01012340680', '1984-07-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (681, 'user681', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (681, '오라희', NULL, 'user681@test.com', '01012340681', '1987-12-27', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (682, 'user682', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (682, '최지민', NULL, 'user682@test.com', '01012340682', '2000-09-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (683, 'user683', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (683, '황서정', NULL, 'user683@test.com', '01012340683', '2003-02-02', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (684, 'user684', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (684, '송가혁', NULL, 'user684@test.com', '01012340684', '2000-05-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (685, 'user685', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (685, '홍유영', NULL, 'user685@test.com', '01012340685', '1977-05-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (686, 'user686', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (686, '서주영', NULL, 'user686@test.com', '01012340686', '2005-01-20', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (687, 'user687', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (687, '홍도정', NULL, 'user687@test.com', '01012340687', '1987-01-10', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (688, 'user688', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (688, '서나훈', NULL, 'user688@test.com', '01012340688', '1986-08-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (689, 'user689', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (689, '류서원', NULL, 'user689@test.com', '01012340689', '1992-03-01', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (690, 'user690', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (690, '권혜원', NULL, 'user690@test.com', '01012340690', '1995-04-14', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (691, 'user691', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (691, '서서율', NULL, 'user691@test.com', '01012340691', '1987-01-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (692, 'user692', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (692, '한나진', NULL, 'user692@test.com', '01012340692', '1977-04-22', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (693, 'user693', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (693, '송민율', NULL, 'user693@test.com', '01012340693', '1990-06-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (694, 'user694', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (694, '장민정', NULL, 'user694@test.com', '01012340694', '1984-03-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (695, 'user695', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (695, '이다훈', NULL, 'user695@test.com', '01012340695', '1979-06-24', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (696, 'user696', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (696, '강서정', NULL, 'user696@test.com', '01012340696', '1997-02-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (697, 'user697', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (697, '이수진', NULL, 'user697@test.com', '01012340697', '1994-12-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (698, 'user698', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (698, '홍도준', NULL, 'user698@test.com', '01012340698', '1981-03-08', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (699, 'user699', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (699, '윤서원', NULL, 'user699@test.com', '01012340699', '2001-03-06', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (700, 'user700', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (700, '임서민', NULL, 'user700@test.com', '01012340700', '1982-02-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (701, 'user701', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (701, '안도찬', NULL, 'user701@test.com', '01012340701', '2002-05-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (702, 'user702', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (702, '박시영', NULL, 'user702@test.com', '01012340702', '1980-03-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (703, 'user703', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (703, '황예원', NULL, 'user703@test.com', '01012340703', '1976-10-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (704, 'user704', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (704, '장서아', NULL, 'user704@test.com', '01012340704', '1971-11-06', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (705, 'user705', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (705, '장지준', NULL, 'user705@test.com', '01012340705', '1992-10-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (706, 'user706', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (706, '정재호', NULL, 'user706@test.com', '01012340706', '1998-01-04', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (707, 'user707', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (707, '홍하준', NULL, 'user707@test.com', '01012340707', '2003-04-27', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (708, 'user708', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (708, '권재연', NULL, 'user708@test.com', '01012340708', '1973-11-08', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (709, 'user709', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (709, '윤채희', NULL, 'user709@test.com', '01012340709', '1989-10-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (710, 'user710', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (710, '강준희', NULL, 'user710@test.com', '01012340710', '1974-11-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (711, 'user711', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (711, '이다호', NULL, 'user711@test.com', '01012340711', '1988-11-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (712, 'user712', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (712, '최서희', NULL, 'user712@test.com', '01012340712', '1989-05-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (713, 'user713', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (713, '신채아', NULL, 'user713@test.com', '01012340713', '2000-06-06', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (714, 'user714', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (714, '장주호', NULL, 'user714@test.com', '01012340714', '2003-11-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (715, 'user715', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (715, '송재율', NULL, 'user715@test.com', '01012340715', '1984-09-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (716, 'user716', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (716, '박다민', NULL, 'user716@test.com', '01012340716', '1994-11-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (717, 'user717', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (717, '안수정', NULL, 'user717@test.com', '01012340717', '1988-07-10', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (718, 'user718', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (718, '류가찬', NULL, 'user718@test.com', '01012340718', '1983-04-04', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (719, 'user719', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (719, '한성민', NULL, 'user719@test.com', '01012340719', '1975-07-21', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (720, 'user720', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (720, '이서우', NULL, 'user720@test.com', '01012340720', '1985-08-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (721, 'user721', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (721, '박혜영', NULL, 'user721@test.com', '01012340721', '1984-07-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (722, 'user722', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (722, '이유빈', NULL, 'user722@test.com', '01012340722', '1996-12-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (723, 'user723', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (723, '서다민', NULL, 'user723@test.com', '01012340723', '1989-11-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (724, 'user724', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (724, '최가빈', NULL, 'user724@test.com', '01012340724', '1999-08-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (725, 'user725', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (725, '한시찬', NULL, 'user725@test.com', '01012340725', '1974-10-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (726, 'user726', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (726, '이유빈', NULL, 'user726@test.com', '01012340726', '1981-03-22', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (727, 'user727', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (727, '안다아', NULL, 'user727@test.com', '01012340727', '1987-03-13', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (728, 'user728', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (728, '신민호', NULL, 'user728@test.com', '01012340728', '1998-08-05', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (729, 'user729', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (729, '김혜현', NULL, 'user729@test.com', '01012340729', '1980-12-09', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (730, 'user730', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (730, '임수민', NULL, 'user730@test.com', '01012340730', '2001-05-04', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (731, 'user731', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (731, '서유진', NULL, 'user731@test.com', '01012340731', '2004-04-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (732, 'user732', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (732, '정지아', NULL, 'user732@test.com', '01012340732', '1995-09-05', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (733, 'user733', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (733, '송은정', NULL, 'user733@test.com', '01012340733', '1970-05-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (734, 'user734', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (734, '조재아', NULL, 'user734@test.com', '01012340734', '1975-12-14', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (735, 'user735', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (735, '조다연', NULL, 'user735@test.com', '01012340735', '1976-11-05', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (736, 'user736', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (736, '신주희', NULL, 'user736@test.com', '01012340736', '2004-01-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (737, 'user737', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (737, '서라아', NULL, 'user737@test.com', '01012340737', '1991-11-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (738, 'user738', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (738, '안라원', NULL, 'user738@test.com', '01012340738', '1999-10-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (739, 'user739', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (739, '김나은', NULL, 'user739@test.com', '01012340739', '1979-11-06', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (740, 'user740', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (740, '황라정', NULL, 'user740@test.com', '01012340740', '1985-04-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (741, 'user741', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (741, '윤준아', NULL, 'user741@test.com', '01012340741', '1983-10-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (742, 'user742', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (742, '이시경', NULL, 'user742@test.com', '01012340742', '1994-03-21', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (743, 'user743', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (743, '최도혁', NULL, 'user743@test.com', '01012340743', '1972-10-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (744, 'user744', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (744, '오하혁', NULL, 'user744@test.com', '01012340744', '1970-09-14', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (745, 'user745', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (745, '윤준원', NULL, 'user745@test.com', '01012340745', '1973-05-02', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (746, 'user746', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (746, '홍다빈', NULL, 'user746@test.com', '01012340746', '1978-11-17', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (747, 'user747', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (747, '권수영', NULL, 'user747@test.com', '01012340747', '1985-05-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (748, 'user748', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (748, '송도훈', NULL, 'user748@test.com', '01012340748', '1997-12-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (749, 'user749', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (749, '윤채원', NULL, 'user749@test.com', '01012340749', '1983-06-28', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (750, 'user750', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (750, '윤수원', NULL, 'user750@test.com', '01012340750', '1972-05-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (751, 'user751', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (751, '신라경', NULL, 'user751@test.com', '01012340751', '1971-08-24', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (752, 'user752', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (752, '조하경', NULL, 'user752@test.com', '01012340752', '1973-06-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (753, 'user753', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (753, '최다진', NULL, 'user753@test.com', '01012340753', '1978-03-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (754, 'user754', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (754, '안혜호', NULL, 'user754@test.com', '01012340754', '1978-04-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (755, 'user755', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (755, '황가훈', NULL, 'user755@test.com', '01012340755', '1979-12-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (756, 'user756', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (756, '정재정', NULL, 'user756@test.com', '01012340756', '1983-08-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (757, 'user757', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (757, '한수희', NULL, 'user757@test.com', '01012340757', '1984-01-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (758, 'user758', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (758, '박하우', NULL, 'user758@test.com', '01012340758', '2000-03-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (759, 'user759', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (759, '신다서', NULL, 'user759@test.com', '01012340759', '1976-06-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (760, 'user760', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (760, '신서은', NULL, 'user760@test.com', '01012340760', '1988-08-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (761, 'user761', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (761, '임혜훈', NULL, 'user761@test.com', '01012340761', '1985-05-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (762, 'user762', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (762, '권민민', NULL, 'user762@test.com', '01012340762', '1971-08-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (763, 'user763', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (763, '강은아', NULL, 'user763@test.com', '01012340763', '1980-08-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (764, 'user764', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (764, '이재찬', NULL, 'user764@test.com', '01012340764', '2005-10-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (765, 'user765', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (765, '정도서', NULL, 'user765@test.com', '01012340765', '1989-12-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (766, 'user766', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (766, '정지혁', NULL, 'user766@test.com', '01012340766', '1999-10-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (767, 'user767', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (767, '황가영', NULL, 'user767@test.com', '01012340767', '1986-01-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (768, 'user768', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (768, '황혜준', NULL, 'user768@test.com', '01012340768', '1999-10-21', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (769, 'user769', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (769, '황민아', NULL, 'user769@test.com', '01012340769', '1973-06-19', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (770, 'user770', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (770, '신유혁', NULL, 'user770@test.com', '01012340770', '1975-05-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (771, 'user771', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (771, '황하아', NULL, 'user771@test.com', '01012340771', '1997-05-10', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (772, 'user772', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (772, '류도희', NULL, 'user772@test.com', '01012340772', '1971-08-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (773, 'user773', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (773, '김나정', NULL, 'user773@test.com', '01012340773', '1998-04-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (774, 'user774', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (774, '황채희', NULL, 'user774@test.com', '01012340774', '1974-12-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (775, 'user775', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (775, '장나호', NULL, 'user775@test.com', '01012340775', '2003-04-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (776, 'user776', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (776, '강민정', NULL, 'user776@test.com', '01012340776', '1998-05-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (777, 'user777', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (777, '이민혁', NULL, 'user777@test.com', '01012340777', '1979-08-19', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (778, 'user778', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (778, '정재호', NULL, 'user778@test.com', '01012340778', '1996-10-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (779, 'user779', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (779, '이예영', NULL, 'user779@test.com', '01012340779', '2002-02-21', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (780, 'user780', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (780, '서시우', NULL, 'user780@test.com', '01012340780', '1982-06-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (781, 'user781', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (781, '송재영', NULL, 'user781@test.com', '01012340781', '1995-11-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (782, 'user782', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (782, '류채연', NULL, 'user782@test.com', '01012340782', '1971-05-26', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (783, 'user783', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (783, '권시혁', NULL, 'user783@test.com', '01012340783', '1972-01-14', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (784, 'user784', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (784, '최하영', NULL, 'user784@test.com', '01012340784', '1993-03-10', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (785, 'user785', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (785, '송은율', NULL, 'user785@test.com', '01012340785', '1989-10-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (786, 'user786', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (786, '이유은', NULL, 'user786@test.com', '01012340786', '2005-03-16', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (787, 'user787', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (787, '류성율', NULL, 'user787@test.com', '01012340787', '1990-06-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (788, 'user788', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (788, '임민아', NULL, 'user788@test.com', '01012340788', '1991-09-03', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (789, 'user789', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (789, '신민은', NULL, 'user789@test.com', '01012340789', '2000-09-07', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (790, 'user790', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (790, '권하우', NULL, 'user790@test.com', '01012340790', '1971-07-28', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (791, 'user791', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (791, '장은은', NULL, 'user791@test.com', '01012340791', '1974-04-19', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (792, 'user792', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (792, '황재빈', NULL, 'user792@test.com', '01012340792', '1992-09-10', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (793, 'user793', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (793, '신재훈', NULL, 'user793@test.com', '01012340793', '2000-06-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (794, 'user794', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (794, '안채아', NULL, 'user794@test.com', '01012340794', '1987-08-25', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (795, 'user795', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (795, '오서훈', NULL, 'user795@test.com', '01012340795', '1998-11-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (796, 'user796', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (796, '최채찬', NULL, 'user796@test.com', '01012340796', '1978-05-16', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (797, 'user797', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (797, '한채영', NULL, 'user797@test.com', '01012340797', '1983-06-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (798, 'user798', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (798, '박성서', NULL, 'user798@test.com', '01012340798', '1998-10-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (799, 'user799', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (799, '김다진', NULL, 'user799@test.com', '01012340799', '1993-01-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (800, 'user800', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (800, '서주준', NULL, 'user800@test.com', '01012340800', '1990-05-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (801, 'user801', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (801, '송준호', NULL, 'user801@test.com', '01012340801', '1990-06-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (802, 'user802', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (802, '홍시정', NULL, 'user802@test.com', '01012340802', '1989-01-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (803, 'user803', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (803, '오혜서', NULL, 'user803@test.com', '01012340803', '1978-08-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (804, 'user804', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (804, '윤성은', NULL, 'user804@test.com', '01012340804', '1989-11-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (805, 'user805', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (805, '오준연', NULL, 'user805@test.com', '01012340805', '1988-09-21', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (806, 'user806', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (806, '최예희', NULL, 'user806@test.com', '01012340806', '1972-11-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (807, 'user807', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (807, '류가빈', NULL, 'user807@test.com', '01012340807', '2005-09-06', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (808, 'user808', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (808, '오성준', NULL, 'user808@test.com', '01012340808', '1978-09-11', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (809, 'user809', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (809, '황수율', NULL, 'user809@test.com', '01012340809', '1980-09-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (810, 'user810', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (810, '황재혁', NULL, 'user810@test.com', '01012340810', '2003-03-05', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (811, 'user811', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (811, '오도영', NULL, 'user811@test.com', '01012340811', '1998-04-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (812, 'user812', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (812, '홍지정', NULL, 'user812@test.com', '01012340812', '1996-07-11', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (813, 'user813', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (813, '한나정', NULL, 'user813@test.com', '01012340813', '1983-08-24', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (814, 'user814', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (814, '오준경', NULL, 'user814@test.com', '01012340814', '1992-05-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (815, 'user815', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (815, '황서민', NULL, 'user815@test.com', '01012340815', '1988-09-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (816, 'user816', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (816, '장서찬', NULL, 'user816@test.com', '01012340816', '1990-01-02', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (817, 'user817', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (817, '강예진', NULL, 'user817@test.com', '01012340817', '1981-01-18', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (818, 'user818', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (818, '강지아', NULL, 'user818@test.com', '01012340818', '2004-09-13', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (819, 'user819', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (819, '정재서', NULL, 'user819@test.com', '01012340819', '1990-02-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (820, 'user820', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (820, '윤재정', NULL, 'user820@test.com', '01012340820', '1993-11-04', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (821, 'user821', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (821, '신나현', NULL, 'user821@test.com', '01012340821', '1993-12-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (822, 'user822', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (822, '한주영', NULL, 'user822@test.com', '01012340822', '1996-10-21', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (823, 'user823', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (823, '신수연', NULL, 'user823@test.com', '01012340823', '1977-03-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (824, 'user824', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (824, '강지연', NULL, 'user824@test.com', '01012340824', '1977-04-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (825, 'user825', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (825, '박가민', NULL, 'user825@test.com', '01012340825', '1989-12-10', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (826, 'user826', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (826, '류성현', NULL, 'user826@test.com', '01012340826', '1985-08-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (827, 'user827', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (827, '송라서', NULL, 'user827@test.com', '01012340827', '2001-04-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (828, 'user828', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (828, '황라원', NULL, 'user828@test.com', '01012340828', '2003-01-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (829, 'user829', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (829, '한혜민', NULL, 'user829@test.com', '01012340829', '1996-11-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (830, 'user830', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (830, '정민원', NULL, 'user830@test.com', '01012340830', '1978-06-21', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (831, 'user831', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (831, '최라율', NULL, 'user831@test.com', '01012340831', '1975-03-14', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (832, 'user832', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (832, '한주은', NULL, 'user832@test.com', '01012340832', '1978-02-26', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (833, 'user833', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (833, '황나훈', NULL, 'user833@test.com', '01012340833', '1999-05-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (834, 'user834', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (834, '윤채찬', NULL, 'user834@test.com', '01012340834', '2002-07-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (835, 'user835', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (835, '이시희', NULL, 'user835@test.com', '01012340835', '2001-03-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (836, 'user836', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (836, '박은준', NULL, 'user836@test.com', '01012340836', '1985-05-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (837, 'user837', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (837, '김민민', NULL, 'user837@test.com', '01012340837', '2002-06-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (838, 'user838', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (838, '장지율', NULL, 'user838@test.com', '01012340838', '1975-09-09', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (839, 'user839', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (839, '황주정', NULL, 'user839@test.com', '01012340839', '1998-11-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (840, 'user840', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (840, '황채우', NULL, 'user840@test.com', '01012340840', '1989-11-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (841, 'user841', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (841, '송도경', NULL, 'user841@test.com', '01012340841', '1986-09-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (842, 'user842', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (842, '서하현', NULL, 'user842@test.com', '01012340842', '1992-03-25', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (843, 'user843', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (843, '류재현', NULL, 'user843@test.com', '01012340843', '1981-07-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (844, 'user844', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (844, '김은아', NULL, 'user844@test.com', '01012340844', '1977-04-06', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (845, 'user845', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (845, '강가서', NULL, 'user845@test.com', '01012340845', '2005-07-21', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (846, 'user846', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (846, '김도아', NULL, 'user846@test.com', '01012340846', '1999-03-17', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (847, 'user847', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (847, '박예희', NULL, 'user847@test.com', '01012340847', '1976-05-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (848, 'user848', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (848, '임준준', NULL, 'user848@test.com', '01012340848', '1991-03-21', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (849, 'user849', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (849, '신민민', NULL, 'user849@test.com', '01012340849', '1983-08-10', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (850, 'user850', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (850, '서민빈', NULL, 'user850@test.com', '01012340850', '2004-07-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (851, 'user851', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (851, '박유영', NULL, 'user851@test.com', '01012340851', '1978-04-21', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (852, 'user852', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (852, '송서빈', NULL, 'user852@test.com', '01012340852', '1998-01-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (853, 'user853', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (853, '정시서', NULL, 'user853@test.com', '01012340853', '2005-05-12', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (854, 'user854', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (854, '한재진', NULL, 'user854@test.com', '01012340854', '2005-06-20', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (855, 'user855', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (855, '최민진', NULL, 'user855@test.com', '01012340855', '2005-03-23', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (856, 'user856', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (856, '김나원', NULL, 'user856@test.com', '01012340856', '1971-07-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (857, 'user857', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (857, '박나율', NULL, 'user857@test.com', '01012340857', '2001-03-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (858, 'user858', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (858, '오수아', NULL, 'user858@test.com', '01012340858', '1984-09-02', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (859, 'user859', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (859, '장가율', NULL, 'user859@test.com', '01012340859', '1974-05-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (860, 'user860', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (860, '최예현', NULL, 'user860@test.com', '01012340860', '2001-04-11', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (861, 'user861', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (861, '박예서', NULL, 'user861@test.com', '01012340861', '1975-12-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (862, 'user862', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (862, '윤은아', NULL, 'user862@test.com', '01012340862', '2001-08-03', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (863, 'user863', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (863, '박재희', NULL, 'user863@test.com', '01012340863', '1999-05-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (864, 'user864', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (864, '조은찬', NULL, 'user864@test.com', '01012340864', '1993-10-19', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (865, 'user865', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (865, '윤채우', NULL, 'user865@test.com', '01012340865', '1990-09-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (866, 'user866', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (866, '윤다준', NULL, 'user866@test.com', '01012340866', '1974-10-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (867, 'user867', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (867, '윤유은', NULL, 'user867@test.com', '01012340867', '1979-05-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (868, 'user868', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (868, '서재연', NULL, 'user868@test.com', '01012340868', '1981-05-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (869, 'user869', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (869, '조시서', NULL, 'user869@test.com', '01012340869', '1987-04-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (870, 'user870', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (870, '황도아', NULL, 'user870@test.com', '01012340870', '1970-12-08', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (871, 'user871', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (871, '김혜준', NULL, 'user871@test.com', '01012340871', '1978-01-23', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (872, 'user872', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (872, '조시현', NULL, 'user872@test.com', '01012340872', '1988-01-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (873, 'user873', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (873, '안유준', NULL, 'user873@test.com', '01012340873', '1996-07-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (874, 'user874', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (874, '최도진', NULL, 'user874@test.com', '01012340874', '1978-10-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (875, 'user875', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (875, '송서호', NULL, 'user875@test.com', '01012340875', '1988-02-05', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (876, 'user876', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (876, '이채준', NULL, 'user876@test.com', '01012340876', '1980-01-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (877, 'user877', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (877, '최채훈', NULL, 'user877@test.com', '01012340877', '1995-10-12', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (878, 'user878', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (878, '한나현', NULL, 'user878@test.com', '01012340878', '1996-09-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (879, 'user879', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (879, '이라율', NULL, 'user879@test.com', '01012340879', '2004-07-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (880, 'user880', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (880, '강준준', NULL, 'user880@test.com', '01012340880', '1977-01-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (881, 'user881', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (881, '최성우', NULL, 'user881@test.com', '01012340881', '1974-02-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (882, 'user882', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (882, '최혜연', NULL, 'user882@test.com', '01012340882', '1996-09-06', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (883, 'user883', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (883, '황하연', NULL, 'user883@test.com', '01012340883', '1994-12-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (884, 'user884', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (884, '윤지율', NULL, 'user884@test.com', '01012340884', '1999-05-18', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (885, 'user885', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (885, '권주희', NULL, 'user885@test.com', '01012340885', '1994-08-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (886, 'user886', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (886, '안성준', NULL, 'user886@test.com', '01012340886', '1977-02-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (887, 'user887', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (887, '정시영', NULL, 'user887@test.com', '01012340887', '2002-07-25', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (888, 'user888', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (888, '장수정', NULL, 'user888@test.com', '01012340888', '1987-08-08', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (889, 'user889', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (889, '장나원', NULL, 'user889@test.com', '01012340889', '1986-10-27', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (890, 'user890', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (890, '임혜영', NULL, 'user890@test.com', '01012340890', '2005-02-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (891, 'user891', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (891, '오재율', NULL, 'user891@test.com', '01012340891', '1972-09-12', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (892, 'user892', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (892, '이채서', NULL, 'user892@test.com', '01012340892', '1998-12-04', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (893, 'user893', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (893, '한다아', NULL, 'user893@test.com', '01012340893', '1989-08-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (894, 'user894', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (894, '한나희', NULL, 'user894@test.com', '01012340894', '1985-10-13', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (895, 'user895', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (895, '황은빈', NULL, 'user895@test.com', '01012340895', '1973-05-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (896, 'user896', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (896, '오다은', NULL, 'user896@test.com', '01012340896', '2002-04-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (897, 'user897', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (897, '최가훈', NULL, 'user897@test.com', '01012340897', '1997-10-15', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (898, 'user898', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (898, '김혜빈', NULL, 'user898@test.com', '01012340898', '1984-11-01', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (899, 'user899', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (899, '김유혁', NULL, 'user899@test.com', '01012340899', '1991-08-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (900, 'user900', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (900, '장주영', NULL, 'user900@test.com', '01012340900', '1982-04-26', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (901, 'user901', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (901, '권예영', NULL, 'user901@test.com', '01012340901', '1985-01-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (902, 'user902', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (902, '홍민율', NULL, 'user902@test.com', '01012340902', '1979-01-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (903, 'user903', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (903, '송지영', NULL, 'user903@test.com', '01012340903', '1989-12-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (904, 'user904', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (904, '정라빈', NULL, 'user904@test.com', '01012340904', '1982-06-14', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (905, 'user905', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (905, '조가빈', NULL, 'user905@test.com', '01012340905', '1975-09-20', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (906, 'user906', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (906, '김준영', NULL, 'user906@test.com', '01012340906', '1999-06-28', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (907, 'user907', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (907, '이혜율', NULL, 'user907@test.com', '01012340907', '1983-03-13', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (908, 'user908', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (908, '임다경', NULL, 'user908@test.com', '01012340908', '1984-05-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (909, 'user909', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (909, '윤가진', NULL, 'user909@test.com', '01012340909', '1986-03-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (910, 'user910', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (910, '김혜희', NULL, 'user910@test.com', '01012340910', '2004-09-23', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (911, 'user911', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (911, '강준영', NULL, 'user911@test.com', '01012340911', '1977-02-19', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (912, 'user912', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (912, '임유정', NULL, 'user912@test.com', '01012340912', '1999-03-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (913, 'user913', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (913, '조채우', NULL, 'user913@test.com', '01012340913', '1982-04-15', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (914, 'user914', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (914, '정민민', NULL, 'user914@test.com', '01012340914', '1985-06-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (915, 'user915', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (915, '오채서', NULL, 'user915@test.com', '01012340915', '2003-02-08', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (916, 'user916', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (916, '권혜경', NULL, 'user916@test.com', '01012340916', '1990-05-07', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (917, 'user917', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (917, '송민희', NULL, 'user917@test.com', '01012340917', '1993-10-09', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (918, 'user918', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (918, '홍가아', NULL, 'user918@test.com', '01012340918', '2000-10-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (919, 'user919', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (919, '윤유진', NULL, 'user919@test.com', '01012340919', '1975-03-24', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (920, 'user920', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (920, '강유경', NULL, 'user920@test.com', '01012340920', '1984-11-15', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (921, 'user921', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (921, '신하희', NULL, 'user921@test.com', '01012340921', '2003-02-11', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (922, 'user922', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (922, '박유영', NULL, 'user922@test.com', '01012340922', '1991-04-02', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (923, 'user923', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (923, '박지경', NULL, 'user923@test.com', '01012340923', '1996-07-13', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (924, 'user924', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (924, '이주아', NULL, 'user924@test.com', '01012340924', '2003-06-03', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (925, 'user925', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (925, '정준진', NULL, 'user925@test.com', '01012340925', '1998-07-10', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (926, 'user926', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (926, '류유연', NULL, 'user926@test.com', '01012340926', '2001-10-12', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (927, 'user927', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (927, '오성찬', NULL, 'user927@test.com', '01012340927', '1981-11-07', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (928, 'user928', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (928, '윤주아', NULL, 'user928@test.com', '01012340928', '1978-04-20', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (929, 'user929', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (929, '류주경', NULL, 'user929@test.com', '01012340929', '1988-06-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (930, 'user930', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (930, '박재우', NULL, 'user930@test.com', '01012340930', '1977-02-19', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (931, 'user931', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (931, '이예은', NULL, 'user931@test.com', '01012340931', '1986-10-17', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (932, 'user932', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (932, '류나경', NULL, 'user932@test.com', '01012340932', '2004-10-25', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (933, 'user933', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (933, '정수현', NULL, 'user933@test.com', '01012340933', '1970-07-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (934, 'user934', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (934, '임수호', NULL, 'user934@test.com', '01012340934', '1986-01-03', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (935, 'user935', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (935, '권민원', NULL, 'user935@test.com', '01012340935', '1987-06-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (936, 'user936', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (936, '장가훈', NULL, 'user936@test.com', '01012340936', '2003-02-18', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (937, 'user937', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (937, '이서혁', NULL, 'user937@test.com', '01012340937', '2002-12-17', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (938, 'user938', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (938, '정재민', NULL, 'user938@test.com', '01012340938', '1984-02-24', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (939, 'user939', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (939, '신재연', NULL, 'user939@test.com', '01012340939', '1977-04-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (940, 'user940', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (940, '정유연', NULL, 'user940@test.com', '01012340940', '1975-10-21', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (941, 'user941', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (941, '오나현', NULL, 'user941@test.com', '01012340941', '1994-01-28', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (942, 'user942', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (942, '최채빈', NULL, 'user942@test.com', '01012340942', '1993-01-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (943, 'user943', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (943, '권예정', NULL, 'user943@test.com', '01012340943', '2005-03-13', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (944, 'user944', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (944, '강주찬', NULL, 'user944@test.com', '01012340944', '1997-10-25', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (945, 'user945', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (945, '권지아', NULL, 'user945@test.com', '01012340945', '1991-02-19', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (946, 'user946', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (946, '장가은', NULL, 'user946@test.com', '01012340946', '1975-11-23', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (947, 'user947', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (947, '윤가원', NULL, 'user947@test.com', '01012340947', '1985-02-15', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (948, 'user948', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (948, '강재혁', NULL, 'user948@test.com', '01012340948', '1984-10-01', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (949, 'user949', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (949, '황민현', NULL, 'user949@test.com', '01012340949', '1997-09-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (950, 'user950', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (950, '임주혁', NULL, 'user950@test.com', '01012340950', '1974-06-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (951, 'user951', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (951, '최하찬', NULL, 'user951@test.com', '01012340951', '1991-08-11', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (952, 'user952', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (952, '권나현', NULL, 'user952@test.com', '01012340952', '2002-02-01', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (953, 'user953', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (953, '윤채현', NULL, 'user953@test.com', '01012340953', '1977-06-06', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (954, 'user954', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (954, '정주경', NULL, 'user954@test.com', '01012340954', '1999-02-20', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (955, 'user955', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (955, '조가민', NULL, 'user955@test.com', '01012340955', '1994-09-03', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (956, 'user956', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (956, '송하민', NULL, 'user956@test.com', '01012340956', '2004-09-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (957, 'user957', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (957, '박성훈', NULL, 'user957@test.com', '01012340957', '1986-09-06', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (958, 'user958', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (958, '홍예혁', NULL, 'user958@test.com', '01012340958', '1994-06-27', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (959, 'user959', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (959, '한준영', NULL, 'user959@test.com', '01012340959', '1991-02-13', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (960, 'user960', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (960, '장지혁', NULL, 'user960@test.com', '01012340960', '2004-10-19', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (961, 'user961', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (961, '김재준', NULL, 'user961@test.com', '01012340961', '1993-10-24', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (962, 'user962', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (962, '한준아', NULL, 'user962@test.com', '01012340962', '1989-10-28', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (963, 'user963', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (963, '서나혁', NULL, 'user963@test.com', '01012340963', '1996-12-28', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (964, 'user964', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (964, '권라진', NULL, 'user964@test.com', '01012340964', '2003-11-15', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (965, 'user965', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (965, '오준현', NULL, 'user965@test.com', '01012340965', '1979-05-10', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (966, 'user966', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (966, '안주준', NULL, 'user966@test.com', '01012340966', '1985-10-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (967, 'user967', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (967, '윤준훈', NULL, 'user967@test.com', '01012340967', '2004-06-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (968, 'user968', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (968, '황시아', NULL, 'user968@test.com', '01012340968', '1992-06-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (969, 'user969', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (969, '안지호', NULL, 'user969@test.com', '01012340969', '1985-03-15', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (970, 'user970', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (970, '신지우', NULL, 'user970@test.com', '01012340970', '1988-08-08', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (971, 'user971', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (971, '권은영', NULL, 'user971@test.com', '01012340971', '1987-11-10', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (972, 'user972', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (972, '오채빈', NULL, 'user972@test.com', '01012340972', '1991-06-09', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (973, 'user973', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (973, '서시준', NULL, 'user973@test.com', '01012340973', '1987-04-09', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (974, 'user974', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (974, '박서진', NULL, 'user974@test.com', '01012340974', '1977-03-14', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (975, 'user975', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (975, '장채우', NULL, 'user975@test.com', '01012340975', '1990-05-19', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (976, 'user976', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (976, '정재정', NULL, 'user976@test.com', '01012340976', '1972-01-18', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (977, 'user977', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (977, '홍시혁', NULL, 'user977@test.com', '01012340977', '2002-03-05', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (978, 'user978', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (978, '김하경', NULL, 'user978@test.com', '01012340978', '1986-11-05', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (979, 'user979', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (979, '홍나율', NULL, 'user979@test.com', '01012340979', '1987-08-07', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (980, 'user980', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (980, '정도은', NULL, 'user980@test.com', '01012340980', '1973-03-04', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (981, 'user981', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (981, '안시영', NULL, 'user981@test.com', '01012340981', '2000-03-22', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (982, 'user982', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (982, '조라정', NULL, 'user982@test.com', '01012340982', '1996-06-22', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (983, 'user983', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (983, '송다정', NULL, 'user983@test.com', '01012340983', '1995-01-22', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (984, 'user984', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (984, '김채혁', NULL, 'user984@test.com', '01012340984', '1982-11-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (985, 'user985', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (985, '황라준', NULL, 'user985@test.com', '01012340985', '1970-12-09', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (986, 'user986', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (986, '류지은', NULL, 'user986@test.com', '01012340986', '1993-09-15', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (987, 'user987', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (987, '황은정', NULL, 'user987@test.com', '01012340987', '1989-09-22', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (988, 'user988', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (988, '최라정', NULL, 'user988@test.com', '01012340988', '1996-03-16', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (989, 'user989', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (989, '신나빈', NULL, 'user989@test.com', '01012340989', '1988-06-25', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (990, 'user990', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (990, '김채경', NULL, 'user990@test.com', '01012340990', '1990-12-10', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (991, 'user991', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (991, '정다서', NULL, 'user991@test.com', '01012340991', '1991-02-16', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (992, 'user992', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (992, '홍다희', NULL, 'user992@test.com', '01012340992', '2004-07-20', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (993, 'user993', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (993, '임서호', NULL, 'user993@test.com', '01012340993', '2002-01-03', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (994, 'user994', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (994, '권민빈', NULL, 'user994@test.com', '01012340994', '1983-03-23', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (995, 'user995', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (995, '강유현', NULL, 'user995@test.com', '01012340995', '1996-06-28', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (996, 'user996', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (996, '강서율', NULL, 'user996@test.com', '01012340996', '1991-11-24', 1, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (997, 'user997', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (997, '안주훈', NULL, 'user997@test.com', '01012340997', '2004-08-25', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (998, 'user998', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (998, '송라경', NULL, 'user998@test.com', '01012340998', '1970-02-10', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (999, 'user999', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GREEN', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (999, '장재은', NULL, 'user999@test.com', '01012340999', '2004-09-21', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (1000, 'user1000', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (1000, '권도영', NULL, 'user1000@test.com', '01012341000', '1988-05-27', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (1001, 'user1001', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (1001, '최은민', NULL, 'user1001@test.com', '01012341001', '2000-04-07', 0, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (1002, 'user1002', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (1002, '서재빈', NULL, 'user1002@test.com', '01012341002', '1976-04-07', 0, 1, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (1003, 'user1003', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'GOLD', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (1003, '조라연', NULL, 'user1003@test.com', '01012341003', '2004-06-27', 1, 0, NOW());

INSERT INTO member (id, login_id, password, grade, status, warning_count, created_at, updated_at) VALUES (1004, 'user1004', '$2a$10$dd0aJzURyXkzEgPuCSUWP.fLSwsCH.S4GeU5MlgDSS0cllMKOlK16', 'WELCOME', 'ACTIVE', 0, NOW(), NOW());
INSERT INTO member_profile (member_id, name, nickname, email, phone, birth_date, marketing_email_agreed, marketing_sms_agreed, updated_at) VALUES (1004, '강민민', NULL, 'user1004@test.com', '01012341004', '1982-10-09', 0, 1, NOW());

SET FOREIGN_KEY_CHECKS = 1;
