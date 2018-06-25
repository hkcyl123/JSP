drop database if exists ks;
create database ks;
use ks;

CREATE  TABLE User (
  UID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,             #用户ID
  Uname VARCHAR(15) NOT NULL UNIQUE ,                       #用户名
  password VARCHAR(20) NOT NULL ,                           #密码
  UEmail VARCHAR(20) NOT NULL ,                             #电子邮箱
  UBirthday VARCHAR(20) NOT NULL ,                          #生日
  USex VARCHAR(4) NOT NULL ,                                #性别
  USatement VARCHAR(45) NULL                                #用户备注
  );

CREATE  TABLE bbssession (
  SID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,             #板块ID
  Sname VARCHAR(45) NOT NULL ,                              #板块名称
  UID INT NOT NULL ,                                        #版主ID
  STopicCount INT NOT NULL  ,                               #发帖数
  constraint fk_1 foreign key(UID) references User(UID) );

CREATE  TABLE bbstopic (
  TID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,             #发帖表ID
  SID INT NOT NULL ,                                        #板块ID
  UID INT NOT NULL ,                                        #发帖人ID
  ReplyCount INT NOT NULL ,                                 #回复数
  Topic VARCHAR(50) NOT NULL ,                              #标题
  TCountents VARCHAR(100) NOT NULL ,                        #正文
  TTime VARCHAR(20) NOT NULL ,                              #时间
  constraint fk_2 foreign key(UID) references User(UID) ,
  constraint fk_3 foreign key(SID) references bbssession(SID));

CREATE  TABLE bbsreply (
  RID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,             #跟帖表ID
  TID INT NOT NULL ,                                        #主贴ID
  UID INT NOT NULL ,                                        #跟帖人ID
  RContent VARCHAR(100) NOT NULL ,                          #跟帖内容
  RTime VARCHAR(20) NOT NULL ,                              #回帖时间
  constraint fk_4 foreign key(TID) references bbstopic(TID) ,
  constraint fk_5 foreign key(UID) references User(UID));

create view v1 as select 
bbstopic.TID as TID ,
bbstopic.SID as SID ,
user.Uname as Uname , 
bbstopic. ReplyCount as ReplyCount ,
bbstopic.Topic as Topic ,
bbstopic.TCountents as TCountents ,
bbstopic.TTime as Time
FROM bbstopic , user
WHERE bbstopic.UID = user.UID ;

create view v2 as select 
bbsreply.RID as RID ,
bbsreply.TID as TID ,
user.Uname as Uname , 
bbsreply. RContent as RContent ,
bbsreply.RTime as RTime 
FROM bbsreply , user
WHERE bbsreply.UID = user.UID ;

INSERT INTO user  
VALUES ("1","黄凯成","123","123","123","123","123") ;
INSERT INTO user  
VALUES ("2","郑佳东","123","123","123","123","123") ;
INSERT INTO user  
VALUES ("3","祝祯浩","123","123","123","123","123") ;
INSERT INTO user  
VALUES ("4","王茂俊","123","123","123","123","123") ;
INSERT INTO user  
VALUES ("5","555","123","123","123","123","123") ;

INSERT INTO bbssession  
VALUES ("1","C","1","123") ;
INSERT INTO bbssession  
VALUES ("2","Java","2","123") ;
INSERT INTO bbssession  
VALUES ("3","Web","3","123") ;
INSERT INTO bbssession  
VALUES ("4","Python","4","123") ;
INSERT INTO bbssession  
VALUES ("5","Andriod","5","123") ;

INSERT INTO bbstopic 
VALUES ("1","1","1","123","123","123","123") ;
INSERT INTO bbstopic  
VALUES ("2","2","2","123","123","123","123") ;
INSERT INTO bbstopic  
VALUES ("3","3","3","123","123","123","123") ;
INSERT INTO bbstopic  
VALUES ("4","4","4","123","123","123","123") ;
INSERT INTO bbstopic  
VALUES ("5","5","5","123","123","123","123") ;

INSERT INTO bbsreply 
VALUES ("1","1","1","123","123") ;
INSERT INTO bbsreply 
VALUES ("2","2","2","123","123") ;
INSERT INTO bbsreply 
VALUES ("3","3","3","123","123") ;
INSERT INTO bbsreply 
VALUES ("4","4","4","123","123") ;
INSERT INTO bbsreply 
VALUES ("5","5","5","123","123") ;