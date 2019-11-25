/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2019/11/25 15:48:15                          */
/*==============================================================*/


alter table "t_appendix_infomation"
   drop constraint FK_T_APPEND_MAIL_APPE_T_MAIL_I;

alter table "t_appendix_infomation"
   drop constraint FK_T_APPEND_USER_APPE_T_USERS_;

alter table "t_mail_infomation"
   drop constraint FK_T_MAIL_I_USER_MAIL_T_USERS_;

alter table "t_page_elements"
   drop constraint FK_T_PAGE_E_PAGE_ELEM_T_PAGE_I;

alter table "t_user_action_log"
   drop constraint FK_T_USER_A_ELEMENT_L_T_PAGE_E;

alter table "t_user_action_log"
   drop constraint FK_T_USER_A_USER_LOG__T_USERS_;

alter table "t_user_login_log"
   drop constraint FK_T_USER_L_USER_LOGI_T_USERS_;

drop index "mail_appendix_r_FK";

drop index "user_appendix_r_FK";

drop table "t_appendix_infomation" cascade constraints;

drop index "user_mail_r_FK";

drop table "t_mail_infomation" cascade constraints;

drop index "page_element_r_FK";

drop table "t_page_elements" cascade constraints;

drop table "t_page_information" cascade constraints;

drop index "element_log_r_FK";

drop index "user_log_r_FK";

drop table "t_user_action_log" cascade constraints;

drop index "user_login_r_FK";

drop table "t_user_login_log" cascade constraints;

drop table "t_users_information" cascade constraints;

/*==============================================================*/
/* Table: "t_appendix_infomation"                               */
/*==============================================================*/
create table "t_appendix_infomation" 
(
   "appendix_id"        VARCHAR2(1024)       not null,
   "user_id"            VARCHAR2(1024),
   "email_id"           VARCHAR2(1024),
   "appendix_type"      VARCHAR2(2),
   "file_name"          VARCHAR2(100),
   "file_size"          NUMBER(2),
   constraint PK_T_APPENDIX_INFOMATION primary key ("appendix_id")
);

/*==============================================================*/
/* Index: "user_appendix_r_FK"                                  */
/*==============================================================*/
create index "user_appendix_r_FK" on "t_appendix_infomation" (
   "user_id" ASC
);

/*==============================================================*/
/* Index: "mail_appendix_r_FK"                                  */
/*==============================================================*/
create index "mail_appendix_r_FK" on "t_appendix_infomation" (
   "email_id" ASC
);

/*==============================================================*/
/* Table: "t_mail_infomation"                                   */
/*==============================================================*/
create table "t_mail_infomation" 
(
   "email_id"           VARCHAR2(1024)       not null,
   "user_id"            VARCHAR2(1024),
   "email_type"         CHAR(10)             not null,
   "to_mail"            VARCHAR2(20)         not null,
   "in_mail"            VARCHAR2(20)         not null,
   "subject"            VARCHAR2(200)        not null,
   "wcc"                VARCHAR2(200),
   "content"            VARCHAR2(2000),
   "date"               DATE                 not null,
   "flag_read"          CHAR(2)              not null
      constraint CKC_FLAG_READ_T_MAIL_I check ("flag_read" in ('0','1')),
   "flag_status"        INTEGER              not null
      constraint CKC_FLAG_STATUS_T_MAIL_I check ("flag_status" in (0,1,2,3)),
   constraint PK_T_MAIL_INFOMATION primary key ("email_id")
);

/*==============================================================*/
/* Index: "user_mail_r_FK"                                      */
/*==============================================================*/
create index "user_mail_r_FK" on "t_mail_infomation" (
   "user_id" ASC
);

/*==============================================================*/
/* Table: "t_page_elements"                                     */
/*==============================================================*/
create table "t_page_elements" 
(
   "element_id"         VARCHAR2(1024)       not null,
   "page_id"            VARCHAR2(1024),
   "element_name"       VARCHAR2(200),
   "describe"           VARCHAR2(400),
   constraint PK_T_PAGE_ELEMENTS primary key ("element_id")
);

/*==============================================================*/
/* Index: "page_element_r_FK"                                   */
/*==============================================================*/
create index "page_element_r_FK" on "t_page_elements" (
   "page_id" ASC
);

/*==============================================================*/
/* Table: "t_page_information"                                  */
/*==============================================================*/
create table "t_page_information" 
(
   "page_id"            VARCHAR2(1024)       not null,
   "element_name"       VARCHAR2(200),
   "describe"           VARCHAR2(400),
   constraint PK_T_PAGE_INFORMATION primary key ("page_id")
);

/*==============================================================*/
/* Table: "t_user_action_log"                                   */
/*==============================================================*/
create table "t_user_action_log" 
(
   "日志id"               VARCHAR2(1024)       not null,
   "element_id"         VARCHAR2(1024),
   "user_id"            VARCHAR2(1024),
   "login_time"         TIMESTAMP            not null,
   "visit_type"         CHAR(10)             not null,
   "cost_time"          NUMBER               not null,
   constraint PK_T_USER_ACTION_LOG primary key ("日志id")
);

/*==============================================================*/
/* Index: "user_log_r_FK"                                       */
/*==============================================================*/
create index "user_log_r_FK" on "t_user_action_log" (
   "user_id" ASC
);

/*==============================================================*/
/* Index: "element_log_r_FK"                                    */
/*==============================================================*/
create index "element_log_r_FK" on "t_user_action_log" (
   "element_id" ASC
);

/*==============================================================*/
/* Table: "t_user_login_log"                                    */
/*==============================================================*/
create table "t_user_login_log" 
(
   "login_id"           VARCHAR2(1024)       not null,
   "user_id"            VARCHAR2(1024),
   "login_time"         TIMESTAMP,
   "cost_time"          NUMBER,
   "login_ip"           VARCHAR2(20),
   "login_method"       VARCHAR2(2),
   "prov_name"          VARCHAR2(100),
   "city_name"          VARCHAR2(100),
   constraint PK_T_USER_LOGIN_LOG primary key ("login_id")
);

/*==============================================================*/
/* Index: "user_login_r_FK"                                     */
/*==============================================================*/
create index "user_login_r_FK" on "t_user_login_log" (
   "user_id" ASC
);

/*==============================================================*/
/* Table: "t_users_information"                                 */
/*==============================================================*/
create table "t_users_information" 
(
   "user_id"            VARCHAR2(1024)       not null,
   "user_name"          VARCHAR2(20)         not null,
   "password"           VARCHAR2(16)         not null,
   "register_date"      DATE                 not null,
   "email"              VARCHAR2(30)         not null,
   "serv_num"           VARCHAR2(13)         not null,
   "sex"                CHAR(2)              not null,
   "age"                NUMBER               not null,
   "status"             CHAR(2),
   constraint PK_T_USERS_INFORMATION primary key ("user_id")
);

alter table "t_appendix_infomation"
   add constraint FK_T_APPEND_MAIL_APPE_T_MAIL_I foreign key ("email_id")
      references "t_mail_infomation" ("email_id");

alter table "t_appendix_infomation"
   add constraint FK_T_APPEND_USER_APPE_T_USERS_ foreign key ("user_id")
      references "t_users_information" ("user_id");

alter table "t_mail_infomation"
   add constraint FK_T_MAIL_I_USER_MAIL_T_USERS_ foreign key ("user_id")
      references "t_users_information" ("user_id");

alter table "t_page_elements"
   add constraint FK_T_PAGE_E_PAGE_ELEM_T_PAGE_I foreign key ("page_id")
      references "t_page_information" ("page_id");

alter table "t_user_action_log"
   add constraint FK_T_USER_A_ELEMENT_L_T_PAGE_E foreign key ("element_id")
      references "t_page_elements" ("element_id");

alter table "t_user_action_log"
   add constraint FK_T_USER_A_USER_LOG__T_USERS_ foreign key ("user_id")
      references "t_users_information" ("user_id");

alter table "t_user_login_log"
   add constraint FK_T_USER_L_USER_LOGI_T_USERS_ foreign key ("user_id")
      references "t_users_information" ("user_id");

