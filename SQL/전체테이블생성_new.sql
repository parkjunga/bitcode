-- 전체 테이블 조회
show tables;

-- 특정 테이블 조회
select * from tb_user; -- 회원
select * from tb_language_code; -- 언어 분류 코드
select * from tb_stsfc_code; -- 만족도 코드
select * from tb_code_board; -- 코드 게시판
select * from tb_qna_board; -- Q&A 게시판
select * from tb_news; -- 뉴스 게시판
select * from tb_code_file; -- 코드 게시판 첨부 파일
select * from tb_qna_file; -- Q&A 게시판 첨부 파일
select * from tb_rank_code; -- 등급 코드
select * from tb_code_comment; -- 코드 게시판 댓글
select * from tb_qna_comment; -- Q&A 게시판 댓글
select * from tb_attendance; -- 출석 체크
select * from tb_news_comment; -- 뉴스 게시판 댓글
select * from tb_document; -- 내문서(클라우드)
select * from tb_code_like; -- 코드 게시판 좋아요
select * from tb_qna_like; -- Q&A 게시판 좋아요
--------------------------------------------------------------------
-- fk 항목에는 on delete cascade on update cascade 옵션 붙이기
--------------------------------------------------------------------
-- 회원정보 테이블
--------------------------------------------------------------------
create table tb_user (
    `id`            varchar(30)     not null         comment '아이디', 
    `name`          varchar(30)     not null         comment '이름', 
    `nick_name`     varchar(30)     not null         comment '닉네임', 
    `password`      varchar(200)    not null         comment '비밀번호', 
    `email`         varchar(50)     not null         comment '이메일', 
    `point`         int(10)         default 0        comment '포인트', 
    `auth`          char(1)         default 'U'      comment '권한', 
    `birthday`      char(8)         not null         comment '생년월일', 
    `pattern_at`    char(1)         default 'N'      comment '패턴사용여부', 
    `pattern_pass`  int(30)         default '12369'   comment '패턴비밀번호', 
    primary key (id)
) engine=innodb default charset=utf8;

alter table tb_user comment '회원정보';
--------------------------------------------------------------------
-- 코드테이블
--------------------------------------------------------------------
-- 언어 코드
--------------------------------------------------------------------
create table tb_language_code (
    `language_code`  char(2)        not null    comment '언어코드', 
    `language_name`  varchar(30)    not null    comment '언어명', 
    primary key (language_code)
) engine=innodb default charset=utf8;

alter table tb_language_code comment '언어종류 코드표';
--------------------------------------------------------------------
-- 만족도 코드
--------------------------------------------------------------------
create table tb_stsfc_code (
    `stsfc_code`  char(2)        not null    comment '만족도코드', 
    `stsfc_step`  varchar(30)    not null    comment '만족도', 
    primary key (stsfc_code)
) engine=innodb default charset=utf8;

alter table tb_stsfc_code comment '답변만족도 코드표';
--------------------------------------------------------------------
-- 코드공유 게시판 테이블
--------------------------------------------------------------------
create table tb_code_board (
    `no`             int(10)          auto_increment         comment '글번호', 
    `group_no`       int(10)          not null               comment '글그룹번호', 
    `group_order`    int(2)           default 0              comment '그룹내에서순서', 
    `depth`          int(2)           default 0              comment '답글의깊이', 
    `id`             varchar(30)      not null               comment '아이디', 
    `language_code`  char(2)          not null               comment '언어코드', 
    `title`          varchar(100)     not null               comment '제목', 
    `content`        varchar(4000)    not null               comment '내용', 
    `reg_date`       datetime         default now()          comment '등록일', 
    `view_cnt`       int(10)          default 0              comment '조회수', 
    `like_cnt`       int(10)          default 0              comment '추천수', 
    primary key (no)
) engine=innodb default charset=utf8;

alter table tb_code_board comment '코드공유게시판';

alter table tb_code_board add constraint fk_tb_code_board_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade;

alter table tb_code_board add constraint fk_tb_code_board_language_code_tb_language_code_language_code foreign key (language_code)
 references tb_language_code (language_code)  on delete cascade on update cascade;
--------------------------------------------------------------------
-- Q&A 게시판 테이블
--------------------------------------------------------------------
create table tb_qna_board (
    `no`             int(10)          auto_increment   comment '글번호', 
    `group_no`       int(10)          not null         comment '글그룹번호', 
    `group_order`    int(2)           default 0        comment '그룹내에서순서', 
    `depth`          int(2)           default 0        comment '답글의깊이', 
    `id`             varchar(30)      not null         comment '아이디', 
    `language_code`  char(2)          not null         comment '언어코드', 
    `title`          varchar(100)     not null         comment '제목', 
    `content`        varchar(4000)    not null         comment '내용', 
    `reg_date`       datetime         default now()    comment '등록일', 
    `view_cnt`       int(10)          default 0        comment '조회수', 
    `like_cnt`       int(10)          default 0        comment '추천수', 
    `stsfc_code`     char(2)          null             comment '만족도코드', 
    `answer_at`      char(1)          default 'N'      comment '답변여부', 
    `read_ans`       char(1)          not null         comment '답변읽음여부', 
    primary key (no)
) engine=innodb default charset=utf8;

alter table tb_qna_board comment 'Q&A게시판';

alter table tb_qna_board add constraint fk_tb_qna_board_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade;

alter table tb_qna_board add constraint fk_tb_qna_board_stsfc_code_tb_stsfc_code_stsfc_code foreign key (stsfc_code)
 references tb_stsfc_code (stsfc_code)  on delete cascade on update cascade;

alter table tb_qna_board add constraint fk_tb_qna_board_language_code_tb_language_code_language_code foreign key (language_code)
 references tb_language_code (language_code)  on delete cascade on update cascade;
--------------------------------------------------------------------
-- IT News 테이블
--------------------------------------------------------------------
create table tb_news (
    `article_no`        int(10)          auto_increment    comment '뉴스번호', 
    `article_type`      varchar(100)     not null          comment '뉴스종류', 
    `article_title`     varchar(100)     not null          comment '뉴스제목', 
    `article_summary`   varchar(4000)    not null          comment '뉴스요약', 
    `article_content`   varchar(4000)    not null          comment '뉴스내용', 
    `article_reporter`  varchar(100)     not null          comment '뉴스기자', 
    `article_thumb`     varchar(100)         null          comment '뉴스썸네일', 
    `article_url`       varchar(100)     not null          comment '뉴스링크', 
    `article_date`      varchar(100)     not null          comment '뉴스날짜', 
    primary key (article_no)
) engine=innodb default charset=utf8;

alter table tb_news comment 'it뉴스 테이블';
--------------------------------------------------------------------
-- 코드공유 게시판 첨부파일 테이블
--------------------------------------------------------------------
create table tb_code_file (
    `file_no`      int(10)         auto_increment    comment '파일번호', 
    `no`           int(10)         not null          comment '글번호', 
    `file_path`    varchar(100)    not null          comment '파일경로', 
    `ori_name`     varchar(100)    not null          comment '원본이름', 
    `system_name`  varchar(100)    not null          comment '시스템이름', 
    `file_size`    int(10)         not null          comment '파일크기', 
    primary key (file_no)
) engine=innodb default charset=utf8;

alter table tb_code_file comment '코드공유게시판 첨부파일';

alter table tb_code_file add constraint fk_tb_code_file_no_tb_code_board_no foreign key (no)
 references tb_code_board (no)  on delete cascade on update cascade;
--------------------------------------------------------------------
-- Q&A 게시판 첨부파일 테이블
--------------------------------------------------------------------
create table tb_qna_file (
    `file_no`      int(10)         auto_increment    comment '파일번호', 
    `no`           int(10)         not null          comment '글번호', 
    `file_path`    varchar(100)    not null          comment '파일경로', 
    `ori_name`     varchar(100)    not null          comment '원본이름', 
    `system_name`  varchar(100)    not null          comment '시스템이름', 
    `file_size`    int(10)         not null          comment '파일크기', 
    primary key (file_no)
) engine=innodb default charset=utf8;

alter table tb_qna_file comment 'Q&A게시판 첨부파일';

alter table tb_qna_file add constraint fk_tb_qna_file_no_tb_qna_board_no foreign key (no)
 references tb_qna_board (no)  on delete cascade on update cascade;


-- tb_rank_code table create sql
create table tb_rank_code (
    `rank_code`  char(2)        not null    comment '회원등급코드', 
    `rank_name`  varchar(30)    not null    comment '회원등급명', 
    primary key (rank_code)
) engine=innodb default charset=utf8;

alter table tb_rank_code comment '회원등급 코드표';
--------------------------------------------------------------------
-- 코드공유게시판 댓글 테이블
--------------------------------------------------------------------
create table tb_code_comment (
    `no`           int(10)          not null          comment '글번호', 
    `id`           varchar(30)      not null          comment '아이디', 
    `content`      varchar(4000)    not null          comment '댓글내용', 
    `comment_no`   int(10)          auto_increment    comment '댓글번호', 
    `reg_date`     datetime         default now()     comment '댓글등록일', 
    `group_no`     int(10)          not null          comment '댓글그룹번호', 
    `group_order`  int(2)           default 0         comment '그룹내에서순서', 
    `depth`        int(2)           default 0         comment '댓글의깊이', 
    primary key (comment_no)
) engine=innodb default charset=utf8;

alter table tb_code_comment comment '코드공유게시판 댓글';

alter table tb_code_comment add constraint fk_tb_code_comment_no_tb_code_board_no foreign key (no)
 references tb_code_board (no)  on delete cascade on update cascade;

alter table tb_code_comment add constraint fk_tb_code_comment_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade;
--------------------------------------------------------------------
-- Q&A게시판 댓글 테이블
--------------------------------------------------------------------
create table tb_qna_comment (
    `no`           int(10)          not null          comment '글번호', 
    `id`           varchar(30)      not null          comment '아이디', 
    `content`      varchar(4000)    not null          comment '댓글내용', 
    `comment_no`   int(10)          auto_increment    comment '댓글번호', 
    `reg_date`     datetime         default now()     comment '댓글등록일', 
    `group_no`     int(10)          not null          comment '댓글그룹번호', 
    `group_order`  int(2)           default 0         comment '그룹내에서순서', 
    `depth`        int(2)           default 0         comment '댓글의깊이', 
    primary key (comment_no)
) engine=innodb default charset=utf8;

alter table tb_qna_comment comment 'Q&A게시판 댓글';

alter table tb_qna_comment add constraint fk_tb_qna_comment_no_tb_qna_board_no foreign key (no)
 references tb_qna_board (no)  on delete cascade on update cascade;

alter table tb_qna_comment add constraint fk_tb_qna_comment_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade;
--------------------------------------------------------------------
-- 출석체크 테이블
--------------------------------------------------------------------
create table tb_attendance (
    `att_id`    int(10)        not null    comment '출석체크번호', 
    `id`        varchar(30)    not null    comment '아이디', 
    `att_date`  datetime       not null    comment '출석체크한날', 
    primary key (att_id)
) engine=innodb default charset=utf8;

alter table tb_attendance comment '출석체크 테이블';

alter table tb_attendance add constraint fk_tb_attendance_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade;
--------------------------------------------------------------------
-- IT News 게시판 댓글 테이블
--------------------------------------------------------------------
create table tb_news_comment (
    `article_no`  int(10)         not null    comment '뉴스번호', 
    `comment_no`  int(10)         auto_increment    comment '댓글번호', 
    `id`          varchar(30)     not null    comment '아이디', 
    `content`     varchar(400)    not null    comment '댓글내용', 
    primary key (comment_no)
) engine=innodb default charset=utf8;

alter table tb_news_comment comment 'it 뉴스 댓글 테이블';

alter table tb_news_comment add constraint fk_tb_news_comment_article_no_tb_news_article_no foreign key (article_no)
 references tb_news (article_no)  on delete cascade on update cascade;

alter table tb_news_comment add constraint fk_tb_news_comment_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade; 
 
--------------------------------------------------------------------
-- 내문서 테이블
--------------------------------------------------------------------
create table tb_document (
    `no`           int(10)         auto_increment    comment '파일번호', 
    `id`           varchar(30)     not null          comment '아이디', 
    `file_path`    varchar(100)    not null          comment '파일경로', 
    `ori_name`     varchar(100)    not null          comment '원본이름', 
    `system_name`  varchar(100)    not null          comment '시스템이름', 
    `file_size`    int(10)         not null          comment '파일크기', 
    `share_yn`     varchar(2)      default 'N'       comment '공유여부', 
    primary key (no)
) engine=innodb default charset=utf8;

alter table tb_document comment '내문서(클라우드)';

alter table tb_document add constraint fk_tb_document_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade;
--------------------------------------------------------------------
-- 코드공유 게시판 첨부파일 테이블
--------------------------------------------------------------------
create table tb_code_like (
    `like_no`     int(10)        auto_increment     comment '추천번호', 
    `no`          int(10)        not null           comment '글번호', 
    `id`          varchar(30)    not null           comment '아이디', 
    `like_check`  int(2)         null               comment '추천유무', 
    primary key (like_no)
) engine=innodb default charset=utf8;

alter table tb_code_like comment '코드공유게시판 추천';

alter table tb_code_like add constraint fk_tb_code_like_no_tb_code_board_no foreign key (no)
 references tb_code_board (no)  on delete cascade on update cascade;

alter table tb_code_like add constraint fk_tb_code_like_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade;
--------------------------------------------------------------------
-- Q&A 게시판 추천 게시판 테이블
--------------------------------------------------------------------
create table tb_qna_like (
    `like_no`  int(10)        not null    auto_increment comment '추천번호', 
    `no`       int(10)        not null    comment '글번호', 
    `id`       varchar(30)    not null    comment '아이디', 
    primary key (like_no)
) engine=innodb default charset=utf8;

alter table tb_qna_like comment 'qna게시판 추천';

alter table tb_qna_like add constraint fk_tb_qna_like_id_tb_user_id foreign key (id)
 references tb_user (id)  on delete cascade on update cascade;

alter table tb_qna_like add constraint fk_tb_qna_like_no_tb_qna_board_no foreign key (no)
 references tb_qna_board (no)  on delete cascade on update cascade;



