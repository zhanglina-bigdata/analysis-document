/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/11/25 17:42:59                          */
/*==============================================================*/


drop table if exists t_appendix_infomation;

drop table if exists t_mail_infomation;

drop table if exists t_page_elements;

drop table if exists t_page_information;

drop table if exists t_user_action_log;

drop table if exists t_user_login_log;

drop table if exists t_users_information;

/*==============================================================*/
/* Table: t_appendix_infomation                                 */
/*==============================================================*/
create table t_appendix_infomation
(
   appendix_id          varchar(1024) not null,
   user_id              varchar(1024),
   email_id             varchar(1024),
   appendix_type        varchar(2),
   file_name            varchar(100),
   file_size            numeric(2,0),
   primary key (appendix_id)
);

/*==============================================================*/
/* Table: t_mail_infomation                                     */
/*==============================================================*/
create table t_mail_infomation
(
   email_id             varchar(1024) not null,
   user_id              varchar(1024),
   email_type           char(10) not null,
   to_mail              varchar(20) not null,
   in_mail              varchar(20) not null,
   subject              varchar(200) not null,
   wcc                  varchar(200),
   content              varchar(2000),
   date                 datetime not null,
   flag_read            char(2) not null,
   flag_status          int not null,
   primary key (email_id)
);

/*==============================================================*/
/* Table: t_page_elements                                       */
/*==============================================================*/
create table t_page_elements
(
   element_id           varchar(1024) not null,
   page_id              varchar(1024),
   element_name         varchar(200),
   "describe"           varchar(400),
   primary key (element_id)
);

/*==============================================================*/
/* Table: t_page_information                                    */
/*==============================================================*/
create table t_page_information
(
   page_id              varchar(1024) not null,
   element_name         varchar(200),
   "describe"           varchar(400),
   primary key (page_id)
);

/*==============================================================*/
/* Table: t_user_action_log                                     */
/*==============================================================*/
create table t_user_action_log
(
   日志id                 varchar(1024) not null,
   element_id           varchar(1024),
   user_id              varchar(1024),
   login_time           timestamp not null,
   visit_type           char(10) not null,
   cost_time            numeric(8,0) not null,
   primary key (日志id)
);

/*==============================================================*/
/* Table: t_user_login_log                                      */
/*==============================================================*/
create table t_user_login_log
(
   login_id             varchar(1024) not null,
   user_id              varchar(1024),
   login_time           timestamp,
   cost_time            numeric(8,0),
   login_ip             varchar(20),
   login_method         varchar(2),
   prov_name            varchar(100),
   city_name            varchar(100),
   primary key (login_id)
);

/*==============================================================*/
/* Table: t_users_information                                   */
/*==============================================================*/
create table t_users_information
(
   user_id              varchar(1024) not null,
   user_name            varchar(20) not null,
   password             varchar(16) not null,
   register_date        datetime not null,
   email                varchar(30) not null,
   serv_num             varchar(13) not null,
   sex                  char(2) not null,
   age                  numeric(8,0) not null,
   status               char(2),
   primary key (user_id)
);

alter table t_appendix_infomation add constraint FK_mail_appendix_r foreign key (email_id)
      references t_mail_infomation (email_id) on delete restrict on update restrict;

alter table t_appendix_infomation add constraint FK_user_appendix_r foreign key (user_id)
      references t_users_information (user_id) on delete restrict on update restrict;

alter table t_mail_infomation add constraint FK_user_mail_r foreign key (user_id)
      references t_users_information (user_id) on delete restrict on update restrict;

alter table t_page_elements add constraint FK_page_element_r foreign key (page_id)
      references t_page_information (page_id) on delete restrict on update restrict;

alter table t_user_action_log add constraint FK_element_log_r foreign key (element_id)
      references t_page_elements (element_id) on delete restrict on update restrict;

alter table t_user_action_log add constraint FK_user_log_r foreign key (user_id)
      references t_users_information (user_id) on delete restrict on update restrict;

alter table t_user_login_log add constraint FK_user_login_r foreign key (user_id)
      references t_users_information (user_id) on delete restrict on update restrict;
