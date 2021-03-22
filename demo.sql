/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.56-MariaDB : Database - asset
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`asset` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `asset`;

/*Table structure for table `assets` */

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `school_code` varchar(100) DEFAULT NULL COMMENT '校区id',
  `school_name` varchar(100) DEFAULT NULL COMMENT '校区名称',
  `manager` varchar(100) DEFAULT NULL COMMENT '管理人',
  `storage_name` varchar(100) DEFAULT NULL COMMENT '存放点',
  `storage_code` varchar(100) DEFAULT NULL COMMENT '存放点编号',
  `asset_no` varchar(100) DEFAULT NULL COMMENT '资产编号',
  `asset_name` varchar(100) DEFAULT NULL COMMENT '资产名称',
  `user_id` int(11) DEFAULT NULL COMMENT '粘贴人员id',
  `status` int(1) DEFAULT NULL COMMENT '状态 0 待确认 1 已完成  2  已取消',
  `deleted` int(1) DEFAULT NULL COMMENT '是否删除 0 未删除 1 已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `assets` */

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_code` varchar(60) DEFAULT NULL COMMENT '任务code(自已生成)',
  `task_id` varchar(60) DEFAULT NULL COMMENT '任务id(推送过来的id)',
  `job_date` datetime DEFAULT NULL COMMENT '任务日期',
  `company_name` varchar(60) DEFAULT NULL COMMENT '单位名称',
  `company_code` varchar(60) DEFAULT NULL COMMENT '单位编码',
  `status` tinyint(1) DEFAULT NULL COMMENT ' 0 待确认 1 已确认  2 已取消   3进行中  4.已完成  5 已结束',
  `deleted` tinyint(1) DEFAULT NULL COMMENT '是否删除 0 未删除  1 已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_commit` tinyint(1) DEFAULT NULL COMMENT '0 未完成 1 已完成',
  `request_num` int(11) DEFAULT NULL COMMENT '返回结果数',
  `update_by` varchar(60) DEFAULT NULL COMMENT '更新人',
  `is_push` tinyint(1) DEFAULT NULL COMMENT '0 未推送 1 已推送',
  `job_name` varchar(100) DEFAULT NULL COMMENT '活动名称',
  `complete_assigned` tinyint(1) DEFAULT '0' COMMENT '0 未完成分配  1 已完成完成分配',
  `push_date` datetime DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `job` */

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_info` text COMMENT '消息提示',
  `task_id` varchar(100) DEFAULT NULL COMMENT '任务id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_check` tinyint(1) DEFAULT NULL COMMENT '查看 0 未查看  1 已查看',
  `is_detele` tinyint(1) DEFAULT NULL COMMENT '逻辑删除，0：未删除，1：已删除',
  `type` tinyint(1) DEFAULT NULL COMMENT '1 盘点任务通知  2 数据推送信息',
  `synchronous_status` tinyint(1) DEFAULT NULL COMMENT '同步状态 0 成功 1 失败',
  `synchronous_type` tinyint(1) DEFAULT NULL COMMENT '同步方式  0 自动同步  1 手工同步',
  `successful` text COMMENT '成功时数据',
  `error` text COMMENT '失败时数据',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `update_by` varchar(30) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notification` */

/*Table structure for table `request_url` */

DROP TABLE IF EXISTS `request_url`;

CREATE TABLE `request_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method_code` varchar(60) DEFAULT NULL COMMENT '方法code',
  `url` varchar(60) DEFAULT NULL COMMENT '请求地址',
  `method` varchar(60) DEFAULT NULL COMMENT '请求方法',
  `request_way` varchar(30) DEFAULT NULL COMMENT '请求方式',
  `comment` varchar(100) DEFAULT NULL COMMENT '接口注释',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_status` tinyint(1) DEFAULT NULL COMMENT '是否启用  0 启用 1 停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `request_url` */

/*Table structure for table `rfid` */

DROP TABLE IF EXISTS `rfid`;

CREATE TABLE `rfid` (
  `rfid_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL COMMENT '资产id',
  `job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `rfid_code` varchar(100) DEFAULT NULL COMMENT '标签编号',
  `rfid_category` varchar(11) DEFAULT NULL COMMENT '标签类别',
  `is_use` tinyint(1) DEFAULT NULL COMMENT '使用情况 0 未使用 1 已使用',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型 1 主要 2 备用',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0 正常 1 报废',
  `user_id` int(11) DEFAULT NULL COMMENT '(当type= 2 时才不为null 备用标签分配)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(30) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '更新人',
  `action` tinyint(1) DEFAULT NULL COMMENT '0 正常（新增） 1 替换（修改）',
  `rfid_old` varchar(100) DEFAULT NULL COMMENT '发生替换时对应的上一个rfid',
  `deleted` int(1) DEFAULT '0' COMMENT '0 未删除  1 已删除',
  PRIMARY KEY (`rfid_id`),
  KEY `INDEX_STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rfid` */

/*Table structure for table `sys_department` */

DROP TABLE IF EXISTS `sys_department`;

CREATE TABLE `sys_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL COMMENT '部门名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  `level` int(11) DEFAULT NULL COMMENT '部门层级',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态，0：禁用，1：启用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sys_department_name_uindex` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门';

/*Data for the table `sys_department` */

insert  into `sys_department`(`id`,`name`,`parent_id`,`level`,`state`,`sort`,`remark`,`version`,`create_time`,`update_time`) values (1,'技术部',NULL,1,1,359544077,'fe8c9cbac0c54395ac411335a31f4888',15,'2019-10-25 09:46:49','2019-11-13 19:56:07'),(2,'研发部',NULL,1,1,0,NULL,0,'2019-11-01 20:45:43',NULL),(20,'前端开发部',2,2,1,0,NULL,0,'2019-11-01 20:48:38',NULL),(21,'后台开发部',2,2,1,0,NULL,0,'2019-11-01 20:48:38',NULL),(22,'测试部',2,2,1,0,NULL,0,'2019-11-01 20:48:38',NULL),(201,'前端一组',20,3,1,0,NULL,0,'2019-11-01 20:48:38',NULL),(202,'前端二组',20,3,1,0,NULL,0,'2019-11-01 20:48:38',NULL),(203,'后台一组',21,3,1,0,NULL,0,'2019-11-01 20:48:38',NULL),(204,'后台二组',21,3,1,0,NULL,0,'2019-11-01 20:48:38',NULL),(205,'测试一组',22,3,1,0,NULL,0,'2019-11-01 20:48:38',NULL);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '权限名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  `url` varchar(200) DEFAULT NULL COMMENT '路径',
  `code` varchar(100) NOT NULL COMMENT '唯一编码',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `type` int(11) NOT NULL COMMENT '类型，1：菜单，2：按钮',
  `level` int(11) NOT NULL COMMENT '层级，1：第一级，2：第二级，N：第N级',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态，0：禁用，1：启用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_permission_code_uindex` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=90205 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`parent_id`,`url`,`code`,`icon`,`type`,`level`,`state`,`sort`,`remark`,`version`,`create_time`,`update_time`) values (10,'实施管理',NULL,'merchant','sys:merchant:management','',1,1,0,0,'',0,'2019-10-26 11:15:48',NULL),(20,'资产管理',NULL,NULL,'sys:agent:management','',1,1,0,0,'',0,'2019-10-26 11:15:48',NULL),(30,'账号管理',NULL,NULL,'sys:model:management','',1,1,0,0,'',0,'2019-10-26 11:18:40',NULL),(40,'订单管理',NULL,NULL,'sys:orders:management','',1,1,0,0,NULL,0,'2020-06-28 16:39:19',NULL),(50,'提现管理',NULL,'cashOut','sys:withdrawal:management','',1,1,0,0,NULL,0,'2020-06-28 16:41:44',NULL),(60,'消息推送',NULL,'news','sys:message:management','',1,1,0,0,NULL,0,'2020-06-28 16:44:34',NULL),(70,'报表管理',NULL,'','sys:report:management','',1,1,0,0,NULL,0,'2020-06-28 16:44:34',NULL),(80,'意见反馈',NULL,'feedback','sys:report','',1,1,0,0,NULL,0,'2020-06-28 16:44:34',NULL),(90,'账号管理',NULL,NULL,'sys:user:management','',1,1,0,0,'',0,'2019-10-26 11:15:48',NULL),(101,'创建',10,'','sys:merchant:management:create',NULL,0,3,0,0,NULL,0,'2020-07-24 15:11:13',NULL),(102,'通过',10,'','sys:merchant:management:pass',NULL,0,3,0,0,NULL,0,'2020-07-24 15:11:13',NULL),(103,'不通过',10,'','sys:merchant:management:nopass',NULL,0,3,0,0,NULL,0,'2020-07-24 15:11:13',NULL),(104,'修改',10,'','sys:merchant:management:update',NULL,0,3,0,0,NULL,0,'2020-07-24 15:11:13',NULL),(201,'经纪人审核',20,'agentReview','sys:agentApply',NULL,0,2,0,0,NULL,0,'2020-06-28 17:07:56',NULL),(202,'经纪人列表',20,'agent','sys:agentList',NULL,0,2,0,0,NULL,0,'2020-06-28 17:08:09',NULL),(203,'黑名单',20,'agentBlack','sys:agentDisable',NULL,0,2,0,0,NULL,0,'2020-06-28 17:10:56',NULL),(301,'艺人审核',30,'modelManReview','sys:modelApply',NULL,0,2,0,0,NULL,0,'2020-06-28 17:39:16',NULL),(302,'艺人列表',30,'modelMan','sys:modelList',NULL,0,2,0,0,NULL,0,'2020-06-28 17:39:40',NULL),(303,'黑名单',30,'modelManBlack','sys:modelDisable',NULL,0,2,0,0,NULL,0,'2020-06-28 17:40:08',NULL),(401,'订单审核',40,'orderReview','sys:ordermanager:page',NULL,0,2,0,0,NULL,0,'2020-07-04 12:59:17',NULL),(402,'订单查看',40,'orderView','sys:ordermanager:check',NULL,0,2,0,0,NULL,0,'2020-07-22 15:43:41',NULL),(403,'订单取消',40,'orderCancel','sys:ordermanager:cannel',NULL,0,2,0,0,NULL,0,'2020-07-22 15:43:41',NULL),(404,'付款审核',40,'orderPay','sys:ordermanager:apply',NULL,0,2,0,0,NULL,0,'2020-07-22 15:44:03',NULL),(501,'提现列表查询',50,NULL,'sys:withdrawal:list',NULL,0,3,0,0,NULL,0,'2020-06-28 17:52:41',NULL),(502,'确认',50,NULL,'sys:withdrawal:affirm',NULL,0,3,0,0,NULL,0,'2020-06-28 17:53:42',NULL),(503,'详情',50,NULL,'sys:withdrawal:info',NULL,0,3,0,0,NULL,0,'2020-06-28 17:53:58',NULL),(504,'导出',50,NULL,'sys:withdrawal:export',NULL,0,3,0,0,NULL,0,'2020-07-20 17:10:23',NULL),(601,'查询',60,NULL,'sys:message:list',NULL,0,3,0,0,NULL,0,'2020-07-24 15:11:06',NULL),(602,'新增',60,NULL,'sys:message:add',NULL,0,3,0,0,NULL,0,'2020-07-24 15:11:39',NULL),(701,'活动明细',70,'ativity','sys:report:campaign',NULL,0,2,0,0,NULL,0,'2020-06-28 17:56:47',NULL),(702,'经纪人明细',70,'agentPart','sys:report:agent',NULL,0,2,0,0,NULL,0,'2020-07-21 11:57:03',NULL),(801,'查询',80,NULL,'sys:opinion:list',NULL,0,3,0,0,NULL,0,'2020-07-30 18:34:45',NULL),(901,'账号管理',90,'account','sys:user',NULL,1,2,0,0,NULL,0,'2020-06-28 16:57:25',NULL),(902,'权限管理',90,'jurisdiction','sys:role',NULL,1,2,0,0,NULL,0,'2020-06-28 16:57:25',NULL),(20101,'审核列表查询',201,NULL,'sys:agentApply:list',NULL,0,3,0,0,NULL,0,'2020-06-28 17:13:12',NULL),(20102,'审核通过',201,NULL,'sys:agentApply:pass',NULL,0,3,0,0,NULL,0,'2020-06-28 17:30:49',NULL),(20103,'审核不通过',201,NULL,'sys:agentApply:nopass',NULL,0,3,0,0,NULL,0,'2020-06-28 17:31:41',NULL),(20104,'详情',201,NULL,'sys:agentApply:userInfo',NULL,0,3,0,0,NULL,0,'2020-06-28 17:32:52',NULL),(20201,'列表查询',202,NULL,'sys:agent:list',NULL,0,3,0,0,NULL,0,'2020-06-28 17:33:57',NULL),(20202,'详情',202,NULL,'sys:agent:info',NULL,0,3,0,0,NULL,0,'2020-06-28 17:34:24',NULL),(20203,'封号',202,NULL,'sys:agent:disable',NULL,0,3,0,0,NULL,0,'2020-06-28 17:37:06',NULL),(20301,'黑名单列表',203,NULL,'sys:agent:listDisable',NULL,0,3,0,0,NULL,0,'2020-06-28 17:37:38',NULL),(30101,'审核列表查询',301,NULL,'sys:modelApply:list',NULL,0,3,0,0,NULL,0,'2020-06-28 17:42:39',NULL),(30102,'审核通过',301,NULL,'sys:modelApply:pass',NULL,0,3,0,0,NULL,0,'2020-06-28 17:42:46',NULL),(30103,'审核不通过',301,NULL,'sys:modelApply:nopass',NULL,0,3,0,0,NULL,0,'2020-06-28 17:43:30',NULL),(30104,'艺人关联经纪人',301,NULL,'sys:modelApply:relation',NULL,0,3,0,0,NULL,0,'2020-06-28 17:44:46',NULL),(30105,'模特详情',301,NULL,'sys:modelApply:info',NULL,0,3,0,0,NULL,0,'2020-07-29 16:40:15',NULL),(30201,'列表查询',302,NULL,'sys:model:list',NULL,0,3,0,0,NULL,0,'2020-06-28 17:46:29',NULL),(30202,'封号',302,NULL,'sys:model:disable',NULL,0,3,0,0,NULL,0,'2020-06-28 17:48:46',NULL),(30203,'详情',302,NULL,'sys:model:info',NULL,0,3,0,0,NULL,0,'2020-06-28 17:49:49',NULL),(30301,'黑名单列表',303,NULL,'sys:model:listDisable',NULL,0,3,0,0,NULL,0,'2020-06-28 17:50:48',NULL),(40101,'通过',401,NULL,'sys:ordermanager:approval:pass',NULL,0,3,0,0,NULL,0,'2020-07-22 15:51:20',NULL),(40102,'不通过',401,NULL,'sys:ordermanager:approval:nopass',NULL,0,3,0,0,NULL,0,'2020-07-22 15:51:20',NULL),(40103,'详情',401,NULL,'sys:ordermanager:approval:detail',NULL,0,3,0,0,NULL,0,'2020-07-22 15:52:20',NULL),(40201,'取消',402,NULL,'sys:ordermanager:check:cannel',NULL,0,3,0,0,NULL,0,'2020-07-22 15:48:37',NULL),(40202,'详情',402,NULL,'sys:ordermanager:check:detail',NULL,0,3,0,0,NULL,0,'2020-07-22 15:48:37',NULL),(40301,'详情',403,NULL,'sys:ordermanager:cannel:detail',NULL,0,3,0,0,NULL,0,'2020-07-22 15:54:32',NULL),(40401,'确认',404,NULL,'sys:ordermanager:apply:commit',NULL,0,3,0,0,NULL,0,'2020-07-22 15:56:56',NULL),(40402,'详情',404,NULL,'sys:ordermanager:apply:detail',NULL,0,3,0,0,NULL,0,'2020-07-22 15:56:56',NULL),(40403,'修改金额',404,NULL,'sys:ordermanager:apply:update',NULL,0,3,0,0,NULL,0,'2020-07-22 15:56:56',NULL),(70101,'导出',701,NULL,'sys:report:campaign:export',NULL,0,3,0,0,NULL,0,'2020-07-22 16:04:05',NULL),(70102,'详情',701,NULL,'sys:report:campaign:detail',NULL,0,3,0,0,NULL,0,'2020-07-22 16:04:05',NULL),(70201,'查询',702,NULL,'sys:report:select',NULL,0,3,0,0,NULL,0,'2020-06-28 17:56:47',NULL),(70202,'详情',702,NULL,'sys:agentReport:info',NULL,0,3,0,0,NULL,0,'2020-07-21 11:57:03',NULL),(70203,'导出',702,NULL,'sys:report:export',NULL,0,3,0,0,NULL,0,'2020-07-21 11:57:45',NULL),(90101,'账号列表查询',901,NULL,'sys:user:page',NULL,0,3,0,0,NULL,0,'2020-06-28 17:58:34',NULL),(90102,'创建',901,NULL,'sys:user:add',NULL,0,3,0,0,NULL,0,'2020-06-28 17:58:57',NULL),(90103,'修改',901,NULL,'sys:user:update',NULL,0,3,0,0,NULL,0,'2020-06-28 17:59:35',NULL),(90104,'删除',901,NULL,'sys:user:delete',NULL,0,3,0,0,NULL,0,'2020-06-28 18:00:52',NULL),(90105,'重置密码',901,NULL,'sys:user:reset:password',NULL,0,3,0,0,NULL,0,'2020-06-28 18:11:09',NULL),(90201,'查询',902,NULL,'sys:role:page',NULL,0,3,0,0,NULL,0,'2020-06-28 18:13:24',NULL),(90202,'创建',902,NULL,'sys:role:add',NULL,0,3,0,0,NULL,0,'2020-06-28 18:14:25',NULL),(90203,'修改',902,NULL,'sys:role:update',NULL,0,3,0,0,NULL,0,'2020-06-28 18:15:12',NULL),(90204,'删除',902,NULL,'sys:role:delete',NULL,0,3,0,0,NULL,0,'2020-06-28 18:15:50',NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `code` varchar(100) DEFAULT NULL COMMENT '角色唯一编码',
  `type` int(11) DEFAULT NULL COMMENT '角色类型',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '角色状态，0：启用，1： 禁用',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除，0：未删除，1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sys_role_name_uindex` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`code`,`type`,`state`,`remark`,`version`,`create_time`,`update_time`,`deleted`) values (1,'管理员','admin',NULL,0,'管理员拥有所有权限',0,'2020-10-10 11:17:23',NULL,0),(2,'组长','test',NULL,0,'测试人员拥有部分权限',0,'2020-10-12 14:54:28',NULL,0),(34,'组员','group',NULL,0,'组长管理人员',0,'2020-10-12 14:54:16',NULL,0);

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限id',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态，0：禁用，1：启用',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `permission_id` (`permission_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=542 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色权限关系';

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`id`,`role_id`,`permission_id`,`state`,`remark`,`version`,`create_time`,`update_time`) values (412,1,20203,0,NULL,0,'2020-10-10 12:23:20',NULL),(413,1,20202,0,NULL,0,'2020-10-10 12:23:20',NULL),(414,1,20201,0,NULL,0,'2020-10-10 12:23:20',NULL),(415,1,20301,0,NULL,0,'2020-10-10 12:23:20',NULL),(416,1,20,0,NULL,0,'2020-10-10 12:23:20',NULL),(417,1,201,0,NULL,0,'2020-10-10 12:23:20',NULL),(418,1,20101,0,NULL,0,'2020-10-10 12:23:20',NULL),(419,1,20103,0,NULL,0,'2020-10-10 12:23:20',NULL),(420,1,20102,0,NULL,0,'2020-10-10 12:23:20',NULL),(421,1,20104,0,NULL,0,'2020-10-10 12:23:20',NULL),(422,1,203,0,NULL,0,'2020-10-10 12:23:20',NULL),(423,1,202,0,NULL,0,'2020-10-10 12:23:20',NULL),(424,1,10,0,NULL,0,'2020-10-10 12:23:20',NULL),(425,1,101,0,NULL,0,'2020-10-10 12:23:20',NULL),(426,1,103,0,NULL,0,'2020-10-10 12:23:20',NULL),(427,1,102,0,NULL,0,'2020-10-10 12:23:20',NULL),(428,1,104,0,NULL,0,'2020-10-10 12:23:20',NULL),(429,1,602,0,NULL,0,'2020-10-10 12:23:20',NULL),(430,1,601,0,NULL,0,'2020-10-10 12:23:20',NULL),(431,1,60,0,NULL,0,'2020-10-10 12:23:20',NULL),(432,1,30202,0,NULL,0,'2020-10-10 12:23:20',NULL),(433,1,30203,0,NULL,0,'2020-10-10 12:23:20',NULL),(434,1,30201,0,NULL,0,'2020-10-10 12:23:20',NULL),(435,1,30301,0,NULL,0,'2020-10-10 12:23:20',NULL),(436,1,30,0,NULL,0,'2020-10-10 12:23:20',NULL),(437,1,301,0,NULL,0,'2020-10-10 12:23:20',NULL),(438,1,30101,0,NULL,0,'2020-10-10 12:23:20',NULL),(439,1,30103,0,NULL,0,'2020-10-10 12:23:20',NULL),(440,1,30102,0,NULL,0,'2020-10-10 12:23:20',NULL),(441,1,30104,0,NULL,0,'2020-10-10 12:23:20',NULL),(442,1,303,0,NULL,0,'2020-10-10 12:23:20',NULL),(443,1,302,0,NULL,0,'2020-10-10 12:23:20',NULL),(444,1,404,0,NULL,0,'2020-10-10 12:23:20',NULL),(445,1,40401,0,NULL,0,'2020-10-10 12:23:20',NULL),(446,1,40402,0,NULL,0,'2020-10-10 12:23:20',NULL),(447,1,40403,0,NULL,0,'2020-10-10 12:23:20',NULL),(448,1,40103,0,NULL,0,'2020-10-10 12:23:20',NULL),(449,1,40102,0,NULL,0,'2020-10-10 12:23:20',NULL),(450,1,40101,0,NULL,0,'2020-10-10 12:23:20',NULL),(451,1,403,0,NULL,0,'2020-10-10 12:23:20',NULL),(452,1,40301,0,NULL,0,'2020-10-10 12:23:20',NULL),(453,1,402,0,NULL,0,'2020-10-10 12:23:20',NULL),(454,1,40201,0,NULL,0,'2020-10-10 12:23:20',NULL),(455,1,40202,0,NULL,0,'2020-10-10 12:23:20',NULL),(456,1,401,0,NULL,0,'2020-10-10 12:23:20',NULL),(457,1,40,0,NULL,0,'2020-10-10 12:23:20',NULL),(458,1,80,0,NULL,0,'2020-10-10 12:23:20',NULL),(459,1,702,0,NULL,0,'2020-10-10 12:23:20',NULL),(460,1,701,0,NULL,0,'2020-10-10 12:23:20',NULL),(461,1,70102,0,NULL,0,'2020-10-10 12:23:20',NULL),(462,1,70101,0,NULL,0,'2020-10-10 12:23:20',NULL),(463,1,70203,0,NULL,0,'2020-10-10 12:23:20',NULL),(464,1,70202,0,NULL,0,'2020-10-10 12:23:20',NULL),(465,1,70,0,NULL,0,'2020-10-10 12:23:20',NULL),(466,1,70201,0,NULL,0,'2020-10-10 12:23:20',NULL),(467,1,902,0,NULL,0,'2020-10-10 12:23:20',NULL),(468,1,90202,0,NULL,0,'2020-10-10 12:23:20',NULL),(469,1,90204,0,NULL,0,'2020-10-10 12:23:20',NULL),(470,1,90201,0,NULL,0,'2020-10-10 12:23:20',NULL),(471,1,90203,0,NULL,0,'2020-10-10 12:23:20',NULL),(472,1,901,0,NULL,0,'2020-10-10 12:23:20',NULL),(473,1,90102,0,NULL,0,'2020-10-10 12:23:20',NULL),(474,1,90104,0,NULL,0,'2020-10-10 12:23:20',NULL),(475,1,90,0,NULL,0,'2020-10-10 12:23:20',NULL),(476,1,90101,0,NULL,0,'2020-10-10 12:23:20',NULL),(477,1,90105,0,NULL,0,'2020-10-10 12:23:20',NULL),(478,1,90103,0,NULL,0,'2020-10-10 12:23:20',NULL),(479,1,502,0,NULL,0,'2020-10-10 12:23:20',NULL),(480,1,504,0,NULL,0,'2020-10-10 12:23:20',NULL),(481,1,503,0,NULL,0,'2020-10-10 12:23:20',NULL),(482,3,501,0,NULL,0,'2020-10-10 20:17:21',NULL),(483,3,50,0,NULL,0,'2020-10-10 20:17:18',NULL),(540,2,30105,0,NULL,0,'2020-10-10 20:17:11',NULL),(541,2,801,0,NULL,0,'2020-10-10 20:17:08',NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickname` varchar(30) DEFAULT NULL COMMENT '用户名',
  `username` varchar(20) DEFAULT NULL COMMENT ' 姓名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐值',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `head` varchar(200) DEFAULT NULL COMMENT '头像',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态，0：禁用，1：启用，2：锁定',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `deleted` int(11) NOT NULL COMMENT '逻辑删除，0：未删除，1：已删除',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `update_by` varchar(100) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别，0：女，1：男，默认1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`nickname`,`username`,`password`,`salt`,`phone`,`head`,`remark`,`state`,`role_id`,`deleted`,`version`,`create_by`,`create_time`,`email`,`update_by`,`update_time`,`department_id`,`gender`) values (1,'admin','admin','11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d','666','15888889900','http://localhost:8888/api/resource/201908201013068.png','Administrator Account',0,1,0,1,NULL,'2020-10-10 12:14:52',NULL,NULL,'2020-07-24 14:21:16',NULL,NULL),(2,'test','test','34783fb724b259beb71a1279f7cd93bdcfd92a273d566f926419a37825c500df','087c2e9857f35f1e243367f3b89b81c1','15888889901','http://localhost:8888/api/resource/201908201013068.png','Tester Account',0,34,0,1,NULL,'2020-10-29 14:51:49',NULL,'admin',NULL,NULL,NULL),(3,'admin1','admin1','11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d','666','15888889902','http://localhost:8888/api/resource/201908201013068.png','Administrator Account',0,34,0,1,NULL,'2020-10-12 21:28:35',NULL,NULL,NULL,NULL,NULL),(111,'test01','wangjie','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','15838013422',NULL,NULL,0,1,0,0,'admin','2020-10-22 12:47:07',NULL,'admin','2020-10-22 12:47:07',NULL,NULL),(112,'测试13','测试13','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','15838013423',NULL,NULL,1,34,1,0,'admin','2020-10-10 16:46:03',NULL,NULL,NULL,NULL,NULL),(113,'测试4','测试4','ae374d91ce7cf6e2ca41fdaf79c39f2ea9c20b26c91456c57512f7bfd998aa0e','123456','15838013424',NULL,NULL,1,2,1,0,'admin','2020-10-10 16:46:06',NULL,'admin',NULL,NULL,NULL),(114,'测试','测试','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','15838013422',NULL,NULL,0,2,0,0,'admin','2020-10-10 20:12:00',NULL,NULL,NULL,NULL,NULL),(115,'测试1','测试1','8235c034a4de9f2dc4e113894f1556cdc03d2ab0a53f6def7d3446427c60424a','123456','15838013422',NULL,NULL,0,34,0,0,'admin','2020-10-12 14:47:08',NULL,NULL,NULL,NULL,NULL),(116,'candy','翁','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','18616119842',NULL,NULL,1,2,0,0,'admin','2020-10-19 18:50:36',NULL,NULL,NULL,NULL,NULL),(117,'candy2','翁2','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','13918186324',NULL,NULL,1,2,1,0,'admin','2020-10-19 18:59:00',NULL,NULL,NULL,NULL,NULL),(118,'测试199','测试199','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','15838013422',NULL,NULL,1,34,1,0,'admin','2020-10-19 19:26:13',NULL,NULL,NULL,NULL,NULL),(119,'wang0123','wangwang','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','15377083679',NULL,NULL,1,2,1,0,'admin','2020-10-19 19:34:06',NULL,NULL,NULL,NULL,NULL),(120,'wangwang','wangwang','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','15377083679',NULL,NULL,1,2,1,0,'admin','2020-10-20 11:28:52',NULL,NULL,NULL,NULL,NULL),(121,'cc','翁2','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','13918186324',NULL,NULL,0,1,1,0,'admin','2020-10-20 14:38:00',NULL,NULL,NULL,NULL,NULL),(122,'ping','张','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589','123456','18616119842',NULL,NULL,1,2,0,0,'admin','2020-10-22 16:42:27',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `passwords` varchar(100) DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0 正常 1 禁用',
  `deleted` tinyint(1) DEFAULT NULL COMMENT '删除: 0 未删除 1 已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(30) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '更新人',
  `salt` varchar(30) DEFAULT NULL COMMENT '密码盐值',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_phone`,`passwords`,`status`,`deleted`,`create_time`,`create_by`,`update_time`,`update_by`,`salt`) values (1,'admin','73659625869','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:51:36','admin','2020-09-28 11:51:53',NULL,'123456'),(2,'master','34155867292','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:51:38','admin','2020-09-28 11:51:55',NULL,'123456'),(3,'slave','18314468894','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:51:39','admin','2020-09-28 11:51:56',NULL,'123456'),(4,'jean','08415173614','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:51:41','admin','2020-09-28 11:51:58',NULL,'123456'),(5,'tom','83525067995','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:51:43','admin','2020-09-28 11:51:59',NULL,'123456'),(6,'mary','18993501681','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:58:19','admin','2020-09-28 11:58:51',NULL,'123456'),(7,'jan','70408517102','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:58:21','admin','2020-09-28 11:58:53',NULL,'123456'),(8,'jams','80685862149','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:58:22','admin','2020-09-28 11:58:55',NULL,'123456'),(9,'kobe','46069376570','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:58:24','admin','2020-09-28 11:58:56',NULL,'123456'),(10,'jd','82749303976','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:58:25','admin','2020-09-28 11:58:57',NULL,'123456'),(11,'sugar','88640381002','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:58:27','admin','2020-09-28 11:58:59',NULL,'123456'),(12,'admin_001','23348686340','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 11:58:29','admin','2020-09-28 11:59:01',NULL,'123456'),(13,'admin_002','97607918549','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 12:02:10','admin','2020-09-28 12:02:14',NULL,'123456'),(14,'admin_003','00543826616','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 12:23:23','admin','2020-09-28 12:23:29',NULL,'123456'),(15,'admin_004','02262825787','958d51602bbfbd18b2a084ba848a827c29952bfef170c936419b0922994c0589',0,0,'2020-09-28 12:23:25','admin','2020-09-28 12:23:31',NULL,'123456');

/*Table structure for table `user_job_role` */

DROP TABLE IF EXISTS `user_job_role`;

CREATE TABLE `user_job_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `role` tinyint(1) DEFAULT NULL COMMENT '角色 0 粘贴人员   1 组长',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(60) DEFAULT NULL COMMENT '创建人',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0 生效 1 未生效',
  `deleted` tinyint(1) DEFAULT NULL COMMENT '删除状态 0未删除  1 已删除',
  `is_complete_task` tinyint(1) DEFAULT '0' COMMENT '组员是否完成任务  0 未完成 1 已完成',
  `is_down_load` tinyint(1) DEFAULT '0' COMMENT '是否下载 0 未下载  1 已下载',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_job_role` */

/*Table structure for table `v_new_user_role` */

DROP TABLE IF EXISTS `v_new_user_role`;

/*!50001 DROP VIEW IF EXISTS `v_new_user_role` */;
/*!50001 DROP TABLE IF EXISTS `v_new_user_role` */;

/*!50001 CREATE TABLE  `v_new_user_role`(
 `user_name` varchar(20) ,
 `user_id` bigint(20) ,
 `job_id` int(11) ,
 `role` tinyint(1) ,
 `is_down_load` tinyint(1) 
)*/;

/*Table structure for table `v_user_job` */

DROP TABLE IF EXISTS `v_user_job`;

/*!50001 DROP VIEW IF EXISTS `v_user_job` */;
/*!50001 DROP TABLE IF EXISTS `v_user_job` */;

/*!50001 CREATE TABLE  `v_user_job`(
 `id` int(11) ,
 `job_code` varchar(60) ,
 `job_date` datetime ,
 `company_code` varchar(60) ,
 `company_name` varchar(60) ,
 `task_id` varchar(60) ,
 `created` datetime ,
 `updated` varchar(60) ,
 `updatet` datetime ,
 `is_commit` tinyint(1) ,
 `job_status` tinyint(1) ,
 `asset_id` int(11) ,
 `job_id` int(11) ,
 `school_code` varchar(100) ,
 `school_name` varchar(100) ,
 `manager` varchar(100) ,
 `storage_name` varchar(100) ,
 `storage_code` varchar(100) ,
 `asset_no` varchar(100) ,
 `asset_name` varchar(100) ,
 `user_id` int(11) ,
 `status` int(1) ,
 `deleted` int(1) ,
 `create_time` datetime ,
 `create_by` varchar(100) ,
 `update_by` varchar(100) ,
 `update_time` datetime 
)*/;

/*Table structure for table `v_user_role` */

DROP TABLE IF EXISTS `v_user_role`;

/*!50001 DROP VIEW IF EXISTS `v_user_role` */;
/*!50001 DROP TABLE IF EXISTS `v_user_role` */;

/*!50001 CREATE TABLE  `v_user_role`(
 `user_name` varchar(30) ,
 `user_id` int(11) ,
 `job_id` int(11) ,
 `role` tinyint(1) 
)*/;

/*Table structure for table `view_name` */

DROP TABLE IF EXISTS `view_name`;

/*!50001 DROP VIEW IF EXISTS `view_name` */;
/*!50001 DROP TABLE IF EXISTS `view_name` */;

/*!50001 CREATE TABLE  `view_name`(
 `id` int(11) ,
 `job_code` varchar(60) ,
 `job_date` datetime ,
 `company_code` varchar(60) ,
 `company_name` varchar(60) ,
 `asset_id` int(11) ,
 `job_id` int(11) ,
 `school_code` varchar(100) ,
 `school_name` varchar(100) ,
 `manager` varchar(100) ,
 `storage_name` varchar(100) ,
 `storage_code` varchar(100) ,
 `asset_no` varchar(100) ,
 `asset_name` varchar(100) ,
 `user_id` int(11) ,
 `status` int(1) ,
 `deleted` int(1) ,
 `create_time` datetime ,
 `create_by` varchar(100) ,
 `update_by` varchar(100) ,
 `update_time` datetime 
)*/;

/*View structure for view v_new_user_role */

/*!50001 DROP TABLE IF EXISTS `v_new_user_role` */;
/*!50001 DROP VIEW IF EXISTS `v_new_user_role` */;

/*!50001 CREATE  VIEW `v_new_user_role` AS (select `ur`.`username` AS `user_name`,`ur`.`id` AS `user_id`,`ujb`.`job_id` AS `job_id`,`ujb`.`role` AS `role`,`ujb`.`is_down_load` AS `is_down_load` from (`sys_user` `ur` left join `user_job_role` `ujb` on((`ur`.`id` = `ujb`.`user_id`))) where ((`ujb`.`deleted` = 0) and (`ujb`.`status` = 0))) */;

/*View structure for view v_user_job */

/*!50001 DROP TABLE IF EXISTS `v_user_job` */;
/*!50001 DROP VIEW IF EXISTS `v_user_job` */;

/*!50001 CREATE  VIEW `v_user_job` AS (select `job`.`job_id` AS `id`,`job`.`job_code` AS `job_code`,`job`.`job_date` AS `job_date`,`job`.`company_code` AS `company_code`,`job`.`company_name` AS `company_name`,`job`.`task_id` AS `task_id`,`job`.`create_time` AS `created`,`job`.`update_by` AS `updated`,`job`.`update_time` AS `updatet`,`job`.`is_commit` AS `is_commit`,`job`.`status` AS `job_status`,`assets`.`asset_id` AS `asset_id`,`assets`.`job_id` AS `job_id`,`assets`.`school_code` AS `school_code`,`assets`.`school_name` AS `school_name`,`assets`.`manager` AS `manager`,`assets`.`storage_name` AS `storage_name`,`assets`.`storage_code` AS `storage_code`,`assets`.`asset_no` AS `asset_no`,`assets`.`asset_name` AS `asset_name`,`assets`.`user_id` AS `user_id`,`assets`.`status` AS `status`,`assets`.`deleted` AS `deleted`,`assets`.`create_time` AS `create_time`,`assets`.`create_by` AS `create_by`,`assets`.`update_by` AS `update_by`,`assets`.`update_time` AS `update_time` from (`job` left join `assets` on((`job`.`job_id` = `assets`.`job_id`)))) */;

/*View structure for view v_user_role */

/*!50001 DROP TABLE IF EXISTS `v_user_role` */;
/*!50001 DROP VIEW IF EXISTS `v_user_role` */;

/*!50001 CREATE  VIEW `v_user_role` AS (select `ur`.`user_name` AS `user_name`,`ur`.`user_id` AS `user_id`,`ujb`.`job_id` AS `job_id`,`ujb`.`role` AS `role` from (`user` `ur` left join `user_job_role` `ujb` on((`ur`.`user_id` = `ujb`.`user_id`))) where ((`ujb`.`deleted` = 0) and (`ujb`.`status` = 0))) */;

/*View structure for view view_name */

/*!50001 DROP TABLE IF EXISTS `view_name` */;
/*!50001 DROP VIEW IF EXISTS `view_name` */;

/*!50001 CREATE  VIEW `view_name` AS (select `job`.`job_id` AS `id`,`job`.`job_code` AS `job_code`,`job`.`job_date` AS `job_date`,`job`.`company_code` AS `company_code`,`job`.`company_name` AS `company_name`,`assets`.`asset_id` AS `asset_id`,`assets`.`job_id` AS `job_id`,`assets`.`school_code` AS `school_code`,`assets`.`school_name` AS `school_name`,`assets`.`manager` AS `manager`,`assets`.`storage_name` AS `storage_name`,`assets`.`storage_code` AS `storage_code`,`assets`.`asset_no` AS `asset_no`,`assets`.`asset_name` AS `asset_name`,`assets`.`user_id` AS `user_id`,`assets`.`status` AS `status`,`assets`.`deleted` AS `deleted`,`assets`.`create_time` AS `create_time`,`assets`.`create_by` AS `create_by`,`assets`.`update_by` AS `update_by`,`assets`.`update_time` AS `update_time` from (`job` left join `assets` on((`job`.`job_id` = `assets`.`job_id`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
