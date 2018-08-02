-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;
--------------------------------------------------------------------
-- 코드테이블
--------------------------------------------------------------------
-- 회원등급 코드표
insert into tb_rank_code (rank_code, rank_name)
	values ('01', '하수');
insert into tb_rank_code (rank_code, rank_name)
	values ('02', '중수');
insert into tb_rank_code (rank_code, rank_name)
	values ('03', '고수');
--------------------------------------------------------------------
-- 만족도 코드표
insert into tb_stsfc_code (stsfc_code, stsfc_step)
	values ('11', '불만족');
insert into tb_stsfc_code (stsfc_code, stsfc_step)
	values ('12', '보통');
insert into tb_stsfc_code (stsfc_code, stsfc_step)
	values ('13', '만족');
--------------------------------------------------------------------
-- 언어 코드표
insert into tb_language_code (language_code, language_name)
	values ('21', 'C');
insert into tb_language_code (language_code, language_name)
	values ('22', 'JAVA');
insert into tb_language_code (language_code, language_name)
	values ('23', 'JavaScript');
insert into tb_language_code (language_code, language_name)
	values ('24', 'Python');
insert into tb_language_code (language_code, language_name)
	values ('25', 'ASP');
insert into tb_language_code (language_code, language_name)
	values ('26', 'PHP');
--------------------------------------------------------------------
	
commit;
