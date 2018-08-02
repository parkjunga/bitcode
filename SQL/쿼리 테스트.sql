-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;
select * from tb_qna_board;
select * from tb_code_board;
select * from tb_stsfc_code;
select * from tb_news;

-- 테이블 삭제
drop table tb_user;
drop table tb_news;
drop table tb_news_comment;

delete from tb_user
	where id = 'id1';
	
-- insert 유저 (비번은 암호화되서 들어가야 하기때문에 회원가입을 통해 데이터 생성 요망!!)
insert into tb_user (
	id, name, nick_name, password, email, birthday
) values (
	'sun', '김선영', '떠뇽', '1111', 'sun@daum.net', '19990000'
);

-- delete 유저
delete from tb_user
	where id = 'sun';

delete from tb_news_comment;
	
-- delete Q&A 게시판
delete from tb_qna_board
	where no = 47;
	
delete from tb_code_board
	where no = 325;

-- update 유저
update tb_user
		set auth = 'S'
		where id = 'admin';
		
select point 
	from tb_user
	where id = 'asd';

update tb_user
		set birthday = '20000404'
		where id = 'hong1qweqwe';
		
-- update 답글여부
update tb_qna_board
	set answer_at = 'Y'
	where no = 38;

-- 문의글 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board;

-- C 문의글 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board
	where language_code ='21';

-- Java 문의글 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board
	where language_code ='22';

-- JavaScript 문의글 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board
	where language_code ='23';

-- Python 문의글 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board
	where language_code ='24';

-- ASP 문의글 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board
	where language_code ='25';

-- PHP 문의글 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board
	where language_code ='26';
	
-- 문의글에 대한 답변 갯수 (답글 제외)	
select count(distinct group_no)
	from tb_qna_board
	where answer_at = 'Y';
	
select * from tb_qna_board
	where no = 261;
	
select *
	from tb_code_board
	order by group_no desc, group_order asc;

select language_name as name, language_code as code
   	from tb_language_code
   	order by language_code;	

-- 답글 여부 확인   	
select *
	from tb_qna_board
	where id = 'sun'
	and depth = 0
	and answer_at = 'Y';
	
-- 읽지 않은 답글 확인
select *
	from tb_qna_board
	where id = 'sun'
	and depth = 0
	and group_no = 91
	and read_ans = 'N';
	
-- 내 문의글 출력
select s.stsfc_step, s.stsfc_code, q.no, q.id, q.title
	from tb_stsfc_code s
	inner join tb_qna_board q
	on q.stsfc_code = s.stsfc_code
	where id = 'yoo';

--
select *
	from tb_qna_board
	where id = 'asd';