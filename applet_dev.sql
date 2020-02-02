--- 创建 applet_dev 数据库
CREATE DATABASE
IF NOT EXISTS `applet_dev` CHARACTER
SET 'utf8mb4'
COLLATE 'utf8mb4_general_ci';

DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  `group_id` varchar(32) NOT NULL COMMENT '群组id',
  `company_id` varchar(32) NOT NULL COMMENT '公司id',
  `department_id` varchar(32) NOT NULL COMMENT '部门id',
  `post_id` varchar(32) NOT NULL COMMENT '岗位id',
  `account` varchar(32) NOT NULL COMMENT '用户账号',
  `salt` varchar(32) NOT NULL COMMENT '盐',
  `password` varchar(32) NOT NULL COMMENT '密码(MD5(密码+盐))',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别(0:未知,1:男,2:女)',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号码',
  `now_money` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '余额',
  `integral` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '积分',
  `last_login_time` timestamp DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(32) DEFAULT NULL COMMENT '最后登录IP地址',
  `locked` tinyint(4) NOT NULL COMMENT '状态(0:正常,1:锁定)',
  `login_count` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  `reserved` varchar(32) DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`user_id`),
  UNIQUE (`account`),
  -- UNIQUE (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员用户表';
INSERT INTO `admin_user` ( user_id, field2,...fieldN )
                       VALUES
                       ( value1, value2,...valueN );

DROP TABLE IF EXISTS `ucenter_user`;
CREATE TABLE `ucenter_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `account` varchar(32) NOT NULL COMMENT '用户账号',
  `salt` varchar(32) NOT NULL COMMENT '盐',
  `password` varchar(32) NOT NULL COMMENT '密码(MD5(密码+盐))',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别(0:未知,1:男,2:女)',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号码',
  `now_money` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '余额',
  `integral` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '积分',
  `last_login_time` timestamp DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(32) DEFAULT NULL COMMENT '最后登录IP地址',
  `locked` tinyint(4) NOT NULL COMMENT '状态(0:正常,1:锁定)',
  `login_count` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  `pay_count` int(10) unsigned DEFAULT '0' COMMENT '用户购买次数',
  `reserved` varchar(32) DEFAULT NULL COMMENT '预留',
  PRIMARY KEY (`user_id`),
  UNIQUE (`account`),
  UNIQUE (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `topic_id` int(11) DEFAULT NULL COMMENT '所属专题',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `author` varchar(50) DEFAULT NULL COMMENT '文章原作者',
  `fromurl` varchar(300) DEFAULT NULL COMMENT '转载来源网址',
  `image` varchar(300) DEFAULT NULL COMMENT '封面图',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `allowcomments` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许评论(0:不允许,1:允许)',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:不通过,0未审核,1:通过)',
  `content` mediumtext COMMENT '内容',
  `user_id` int(10) unsigned NOT NULL COMMENT '发布人id',
  `readnumber` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数量',
  `top` int(11) NOT NULL DEFAULT '0' COMMENT '置顶等级',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(20) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`article_id`),
  KEY `cms_article_orders` (`orders`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';
