-- 전체 테이블 조회
show tables;
--------------------------------------------------------------------
select * from tb_qna_board;
select * from tb_code_board;

-- 변경
alter table tb_code_board change group_order group_order int(2) default 0 comment '글그룹번호';
alter table tb_code_board change depth depth int(2) default 0 comment '그룹내에서순서';

alter table tb_code_comment change group_order group_order int(2) default 0 comment '댓글그룹번호';
alter table tb_code_comment change depth depth int(2) default 0 comment '그룹내에서순서';

alter table tb_qna_board change group_order group_order int(2) default 0 comment '글그룹번호';
alter table tb_qna_board change depth depth int(2) default 0 comment '그룹내에서순서';

alter table tb_qna_comment change group_order group_order int(2) default 0 comment '댓글그룹번호';
alter table tb_qna_comment change depth depth int(2) default 0 comment '그룹내에서순서';

alter table tb_user change auth auth char(1) default 'U' comment '권한';

alter table tb_user change password password varchar(200) not null comment '비밀번호';
alter table tb_user change birthday birthday char(8) not null comment '생년월일';

alter table tb_news_comment change comment_no comment_no int(10) auto_increment comment '댓글번호';

alter table tb_user change pattern_pass pattern_pass int(30) default '12369' comment '패턴비밀번호';


-- 추가
alter table tb_qna_board add answer_at char(1) default 'N' comment '답변여부';
alter table tb_user add pattern_at char(1) default 'N' comment '패턴사용여부';
alter table tb_user add pattern_pass int(30) default '1234' comment '패턴비밀번호';

-- foreign key 설정
set foreign_key_checks = 0;
show engine innodb status;  

alter table tb_qna_board add foreign key (id) references tb_user(id) on delete cascade on update cascade;
alter table tb_qna_board add foreign key (language_code) references tb_language_code(language_code) on delete cascade on update cascade;

alter table tb_code_board add foreign key (id) references tb_user(id) on delete cascade on update cascade;
alter table tb_code_board add foreign key (language_code) references tb_language_code(language_code) on delete cascade on update cascade;

commit;

