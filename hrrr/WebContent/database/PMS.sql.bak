/*
SQLyog Community Edition- MySQL GUI v5.23 RC2
Host - 5.0.27-community : Database - PMS
*********************************************************************
Server version : 5.0.27-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `PMS`;

USE `PMS`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `allocations` */

DROP TABLE IF EXISTS `allocations`;

CREATE TABLE `allocations` (
  `ProjectCode` varchar(20) NOT NULL,
  `ReqID` int(10) NOT NULL,
  `EmpNo` int(10) NOT NULL,
  `Location` varchar(20) default NULL COMMENT 'Onsite/Offshore'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `allocations` */

insert  into `allocations`(`ProjectCode`,`ReqID`,`EmpNo`,`Location`) values ('ABCL',1,1,'Onsite'),('ABCL',3,3,'Offshore'),('JJJJ',1,4,'Offshore'),('ACCAL',1,6,'Offshore'),('JJJJ',1,7,'Offshore'),('JJJJ',1,5,'Onsite'),('JJJJ',1,5,'Offshore'),('JJJJ',2,222,'Offshore'),('JJJJ',2,22,'Offshore'),('JJJJ',2,2,'Onsite');

/*Table structure for table `availability` */

DROP TABLE IF EXISTS `availability`;

CREATE TABLE `availability` (
  `ProjectCode` varchar(20) NOT NULL,
  `Role` varchar(50) default NULL,
  `Location` varchar(50) default NULL,
  `Skill` varchar(100) default NULL,
  `NoEmpOnsite` int(10) default '0',
  `NoEmpOffshore` int(10) default '0',
  `ReqID` int(10) default '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `availability` */

insert  into `availability`(`ProjectCode`,`Role`,`Location`,`Skill`,`NoEmpOnsite`,`NoEmpOffshore`,`ReqID`) values ('ABCL','SE','Mumbai','Programmer',0,1,1),('ABCL','PM','Mumbai','PM',0,0,2),('ACCAL','SE','Bangalore','Testing',1,0,1),('JJJJ','SE','Hyd','Java Programmer',1,2,1),('ABCL','PA','Onsite-US','Test Engineer',1,0,3),('JJJJ','PM','Hyderabad','Project Management',1,2,2),('ABCL','fgdfg','fdgfg','dfgfd',0,0,4),('ABCL','fgdfg','fdgfg','dfgfd',0,0,5),('ABCL','gfh','gfh','gfh',0,0,4),('gg','sdf','dsfd','dfdf',0,0,1);

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `EmpNo` int(10) NOT NULL,
  `EmpName` varchar(100) default NULL,
  `mailId` varchar(100) default NULL,
  `Location` varchar(50) default NULL,
  `ProjectCode` varchar(20) default 'NA',
  `Role` varchar(50) default NULL,
  `Skill` varchar(100) default NULL,
  `Visa` varchar(50) default 'NA',
  `PassportNo` varchar(25) default 'NA',
  `JoiningDate` date default NULL,
  PRIMARY KEY  (`EmpNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `employees` */

insert  into `employees`(`EmpNo`,`EmpName`,`mailId`,`Location`,`ProjectCode`,`Role`,`Skill`,`Visa`,`PassportNo`,`JoiningDate`) values (1,'Raj','Raj01','Mumbai','ABCL','SE','Programmer','NA','G009191','2007-04-04'),(4,'fff','Malinga_M','Bangalore','JJJJ','PM','Project Management','NA','NA','2007-06-01'),(5,'wer','wer','Bangalore','JJJJ','PA','Analyst','H1B','234333','2007-06-01'),(6,'wer','sdf','Chennai','ACCAL','JSE','Programmer','NA','G33938','2007-06-01'),(7,'sdf','sd','Chennai','JJJJ','SE','Programmer','NA','G331938','2007-06-01'),(8,'ee','ww','Bangalore','JJJJ','SE','Programmer','NA','NA','2007-06-01');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `auth` int(2) NOT NULL default '3' COMMENT 'User Role ',
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`userid`,`password`,`auth`) values ('Admin','Admin',0),('HRUser','HRPwd',1),('PMUser','PMPwd',2);

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `ProjectCode` varchar(20) NOT NULL,
  `ProjectManager` varchar(50) default NULL,
  `OnsiteManager` varchar(50) default NULL,
  `ClientName` varchar(50) NOT NULL,
  `ClientLocation` varchar(50) default NULL,
  `DealCost` double(25,2) default '0.00',
  `DealDate` date default NULL,
  `StartDate` date default NULL,
  `Duration` int(10) default '0' COMMENT 'in weeks',
  PRIMARY KEY  (`ProjectCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `projects` */

insert  into `projects`(`ProjectCode`,`ProjectManager`,`OnsiteManager`,`ClientName`,`ClientLocation`,`DealCost`,`DealDate`,`StartDate`,`Duration`) values ('ABCL','Ankur','Rahul','ABC ltd','Mumbai',100000.00,'2007-05-04','2007-06-01',20),('ACCAL','wer','wer','wer','wer',234.00,'2007-08-08','2007-08-08',5),('gg','dfd','dfgf','fdgfd','fdgfd',56456.00,'2000-01-20','2000-01-20',33),('JJJJ','asdf','asdf','sadfsf','sdfsdf',1000.00,'2007-08-08','2007-10-10',10);

/*Table structure for table `requirement` */

DROP TABLE IF EXISTS `requirement`;

CREATE TABLE `requirement` (
  `ProjectCode` varchar(20) NOT NULL,
  `Role` varchar(50) default NULL,
  `Location` varchar(50) default NULL,
  `Skill` varchar(100) default NULL,
  `NoEmpOnsite` int(10) default '0',
  `NoEmpOffshore` int(10) default '0',
  `ReqID` int(10) default '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `requirement` */

insert  into `requirement`(`ProjectCode`,`Role`,`Location`,`Skill`,`NoEmpOnsite`,`NoEmpOffshore`,`ReqID`) values ('ABCL','SE','Mumbai','Programmer',0,2,1),('ABCL','PM','Mumbai','PM',0,4,2),('ACCAL','SE','Bangalore','Testing',2,5,1),('JJJJ','SE','Hyd','Java Programmer',1,2,1),('ABCL','PA','Onsite-US','Test Engineer',1,0,3),('JJJJ','PM','Hyderabad','Project Management',1,2,2),('gg','sdf','dsfd','dfdf',2,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

create table inbox(userid varchar(20),message varchar(100));

create table reply(username varchar(20),message varchar(100));
