create table tb_user (
    `id`         varchar(30)    primary key    comment '아이디', 
    `name`       varchar(30)    not null       comment '이름', 
    `nick_name`  varchar(30)    not null       comment '닉네임', 
    `password`   varchar(200)    not null       comment '비밀번호', 
    `email`      varchar(50)    not null       comment '이메일', 
    `point`      int(10)        default 0      comment '포인트', 
    `auth`       char(1)        not null       comment '권한', 
    `birthday`   varchar(8)     not null       comment '생년월일'
) default charset=utf8;

		select stsfc_code, id, group_no
		from tb_qna_board 
		where id = #{id} and
			  no = #{no} and
			  group_order = #{groupOrder}

		select *
		from tb_news_comment c
		inner
		join tb_user u
		 on c.id = u.id
		where article_no = 2323;
			  
			  
		
		

alter table tb_user comment '회원정보';
-----------------------------------------------------------------------------------------------------
--  유저

select * from tb_user;
where id = 'dbwldus';

delete from tb_user
where id = '811325256';

	update tb_user
   set nick_name = 'test3'
 where id = 'test3';
-----------------------------------------------------------------------------------------------------
INSERT INTO tb_user(id, name, nick_name, password, email, point, auth, birthday)
	VALUES('id1', 'hong', 'hongGilDong', 'id1', 'hong@naver.com', 10, 'U', 19880101);

	
select * from tb_qna_board;
select * from tb_user;
where id ='yoo';

		select *
		from tb_qna_board 
		 where id = 'yoo' 
		  and answer_at = 'y'

		  
		select *
		from tb_qna_board q
		 where depth = 1;
	
	
			select *
		from tb_qna_board q
		inner 
		join tb_user u
		on q.id = u.id
		where u.auth = 'S' 
			  and answer_at ='Y'	 
		 
		 
		 
		select t.group_no
		from tb_qna_board t
		(select *
		from tb_qna_board
		 where id = 'yoo' 
		) q
		inner 
		join tb_user u
		on q.id = u.id
		 where answer_at = 'y' and
		  auth = 'S'; 

		  
		select *
		from tb_qna_board 
		inner 
		join tb_user u
		on q.id = u.id
		 where auth = 'S' and answer_at ='Y';
		 
		 
		 
		 
<!-- 		select s.stsfc_step, s.stsfc_code -->
<!-- 		from tb_stsfc_code s -->
<!-- 		inner  -->
<!-- 		join tb_qna_board q -->
<!-- 		on q.stsfc_code = s.stsfc_code -->
<!-- 		where group_no = #{group_no} -->		 
		 
		  
		select *
		from tb_qna_board 
		 where group_no = 210 and
		  group_order = 1;
			  
		select *
		from tb_qna_board 
		 where group_no = 210 and
		  group_order = 0;	
		  
		  
		select *
		from tb_qna_board 
			where  group_no = 249
			and
			  group_order = 0;		
			  
			  
			       update tb_qna_board
           set stsfc_code = '11'
			 where no = 251 and
			  group_no = 249 and
			  depth = 1;
			  
		select s.stsfc_step, s.stsfc_code, q.no, q.id, q.title
		from tb_stsfc_code s
		inner 
		join tb_qna_board q
		on q.stsfc_code = s.stsfc_code
		where group_no = 246;
	
		
		select s.stsfc_step, s.stsfc_code, q.no, q.id, q.title
		from tb_stsfc_code s
		inner 
		join tb_qna_board q
		on q.stsfc_code = s.stsfc_code
		where id = yoo;		  
			  
			  
		delete 
		from tb_qna_board 
		  where id= 'admin' and
		   group_no = 249;
		
		   
		 select *
		from tb_qna_board 
		  where 
		  group_no = 247 and
			   depth = 0;
			  
	select s.stsfc_step, q.no, q.id, q.title, q.content
	from tb_stsfc_code s
	inner 
	join tb_qna_board q
	on q.stsfc_code = s.stsfc_code
	where id = 'yoo';
		  
INSERT INTO tb_qna_board(id, name, nick_name, password, email, point, auth, birthday)
	VALUES('id2', '홍길동', '길동이', 'id2', 'hong2@naver.com', 10, 'U', 19880102);
		 
		select *
		from tb_qna_board q
		inner
		join tb_language_code c
		on
		q.language_code = c.language_code
		inner 
		join tb_user u
		on q.id = u.id
		where q.id = 'yoo';		 
   
 select * from tb_user
 	where id = 'id3';
 	
 	

 
 delete from tb_qna_board
 	where id = 'yoo';
-----------------------------------------------------------------------------------------------------
--delete 유저
delete from tb_qna_board
	where id = 'yoo';

	
select * from tb_attendance;
	where id = 'yoo';

-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user;

-- 테이블 삭제
drop table tb_user purge;
drop table tb_news purge;


--
delete from tb_attendance
	where id = 'wldus';	

select * from tb_stsfc_code;
select * from tb_qna_board;

select *
  from tb_qna_board
 where id = 'bitcode'; 
 -------------------------------------------------------------------
 ---만족----------------------
 
select s.stsfc_step, s.stsfc_code, q.no, q.id, q.title
from tb_stsfc_code s
inner 
join tb_qna_board q
on q.stsfc_code = s.stsfc_code;

----------------
		select id
		  from tb_attendance
		 where id = #{id} and
		 	   to_char(att_date, 'yyyy-mm-dd') = to_char(#{attDate}, 'yyyy-mm-dd')

-----------오늘 날짜 비교-------------------
		select *
		  from tb_attendance
		 where id = 'yoo' and
		 	   att_date <= str_to_date(now(),'%Y-%m-%d');
---------오늘날짜 2222-------------------------------------------------
		select id
		  from tb_attendance
		 where id = 'yoo' and
		 	   date_format(att_date, '%e%c%Y') = date_format(now(), '%e%c%Y')
		 	   
-----------------------------
--
delete from tb_attendance;
	where att_id = 115;		 	   
		 	   
select * from tb_user;
	where id = 'yoo';		 	   
		 	   
	----------------------------------------------------	 	   
		 	   
where date_format(record_date, '%e%c%Y') = date_format(now(), '%e%c%Y')
WHERE date <= str_to_date(now(),'%Y-%m-%d');


--- 만족 카운트
select count(*)
from tb_stsfc_code
where stsfc_step = '만족'; 
-----------------------------
select *
from tb_stsfc_code s
inner 
join tb_qna_board q
on q.stsfc_code = s.stsfc_code;
where s.stsfc_step = '만족'; 


---불만족 
select count(*)
from tb_stsfc_code s
inner 
join tb_qna_board q
on q.stsfc_code = s.stsfc_code
where s.stsfc_code = 11;

--보통
select count(*)
from tb_stsfc_code s
inner 
join tb_qna_board q
on q.stsfc_code = s.stsfc_code
where s.stsfc_code = 12;
--만족
select count(*)
from tb_stsfc_code s
inner 
join tb_qna_board q
on q.stsfc_code = s.stsfc_code
where s.stsfc_code = 13;

select * from tb_attendance;

------------------------------------------------------------- 
 
INSERT INTO tb_attendance(att_id, id, att_date)
	VALUES(105, 'yoo', 20180719);
	INSERT INTO tb_attendance(att_id, id, att_date)
	VALUES(106, 'yoo', 20180720);
	INSERT INTO tb_attendance(att_id, id, att_date)
	VALUES(109, 'yoo', 20180723);
---------------------------------------
update tb_qna_board
   set stsfc_code = 13
 where id = 'bitcode' and
 	   no = 217;	
-----------------------------------------------------

 	   
INSERT INTO tb_stsfc_code(stsfc_code, stsfc_step)
	VALUES(13, '만족');
------------------------------------------------------------------------------------------------------
-- 출석체크 테이블
--------------------------------------------------------------------
create table tb_attendance (
    `att_id`    int(10)        auto_increment primary key    comment '출석체크번호', 
    `id`        varchar(30)    comment '아이디' references tb_user (id)  on delete cascade on update cascade, 
    `att_date`  datetime       default now()    comment '출석체크한날'
) default charset=utf8;

alter table tb_attendance comment '출석체크 테이블';

--------------------------------------------------------------------
create table tb_stsfc_code (
    `stsfc_code`  char(2)        primary key    comment '만족도코드', 
    `stsfc_step`  varchar(30)    not null    comment '만족도' 
) default charset=utf8;

alter table tb_stsfc_code comment '답변만족도 코드표';


commit;
