-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-06-16 23:19:59
-- 服务器版本： 5.1.73
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ibos`
--

-- --------------------------------------------------------

--
-- 表的结构 `ibos_announcement`
--

CREATE TABLE IF NOT EXISTS `ibos_announcement` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型，0为内容，1为链接',
  `sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序号',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `message` text NOT NULL COMMENT '公告内容',
  PRIMARY KEY (`id`),
  KEY `timespan` (`starttime`,`endtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_app`
--

CREATE TABLE IF NOT EXISTS `ibos_app` (
  `appid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `catid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '应用名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '应用图标',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '应用链接',
  `width` mediumint(5) NOT NULL DEFAULT '0' COMMENT '应用宽度',
  `height` mediumint(5) NOT NULL DEFAULT '0' COMMENT '应用高度',
  PRIMARY KEY (`appid`),
  KEY `CATID` (`catid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_approval`
--

CREATE TABLE IF NOT EXISTS `ibos_approval` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '审批流程名称',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核等级,1-5级',
  `level1` text NOT NULL COMMENT '1级审核人uid，逗号隔开',
  `level2` text NOT NULL COMMENT '2级审核人uid，逗号隔开',
  `level3` text NOT NULL COMMENT '3级审核人uid，逗号隔开',
  `level4` text NOT NULL COMMENT '4级审核人uid，逗号隔开',
  `level5` text NOT NULL COMMENT '5级审核人uid，逗号隔开',
  `free` text NOT NULL COMMENT '免审核人uid，逗号隔开',
  `desc` text NOT NULL COMMENT '描述',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_app_category`
--

CREATE TABLE IF NOT EXISTS `ibos_app_category` (
  `catid` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '父类id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '应用分类名称',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '应用分类名称描述',
  `sort` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_app_personal`
--

CREATE TABLE IF NOT EXISTS `ibos_app_personal` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `widget` text NOT NULL COMMENT '板块应用，逗号隔开的应用ID',
  `shortcut` text NOT NULL COMMENT '其它应用，逗号隔开的应用ID',
  PRIMARY KEY (`id`),
  KEY `UID` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_article`
--

CREATE TABLE IF NOT EXISTS `ibos_article` (
  `articleid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `subject` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '内容类型 0为文章 1为图片 2为链接',
  `author` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '作者',
  `approver` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '审批人',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `clickcount` int(10) unsigned NOT NULL DEFAULT '0',
  `attachmentid` text NOT NULL COMMENT '附件ID',
  `commentstatus` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态，1为开启0为关闭',
  `votestatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '投票状态 1为开启0为关闭',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '超链接地址',
  `catid` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章状态，1为公开2为审核3为草稿',
  `deptid` text NOT NULL COMMENT '阅读范围部门',
  `positionid` text NOT NULL COMMENT '职位',
  `uid` text NOT NULL COMMENT '阅读范围人员',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶，1代表置顶，0为不置顶',
  `toptime` int(10) NOT NULL DEFAULT '0' COMMENT '置顶时间',
  `topendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '置顶过期时间',
  `ishighlight` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否高亮',
  `highlightstyle` char(50) NOT NULL DEFAULT '' COMMENT '高亮样式',
  `highlightendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '高亮过期时间',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`articleid`),
  KEY `SUBJECT` (`subject`) USING BTREE,
  KEY `PROVIDER` (`author`) USING BTREE,
  KEY `NEWS_TIME` (`addtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_article_approval`
--

CREATE TABLE IF NOT EXISTS `ibos_article_approval` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `articleid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '新闻id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '签收人id',
  `step` varchar(10) NOT NULL DEFAULT '' COMMENT '签收步骤(1,2,3,4,5对应approval表level1,level2,level3,level4,level5)',
  PRIMARY KEY (`id`),
  KEY `ARTICLEID` (`articleid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_article_back`
--

CREATE TABLE IF NOT EXISTS `ibos_article_back` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `articleid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作者UID',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退回时间',
  `reason` text NOT NULL COMMENT '退回理由',
  PRIMARY KEY (`id`),
  KEY `ARTICLEID` (`articleid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_article_category`
--

CREATE TABLE IF NOT EXISTS `ibos_article_category` (
  `catid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '父分类id',
  `name` char(20) NOT NULL COMMENT '文章分类名称',
  `sort` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `aid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '审批流程id',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_article_picture`
--

CREATE TABLE IF NOT EXISTS `ibos_article_picture` (
  `picid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID ',
  `articleid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '图片所属相册ID ',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '附件所属ID ',
  `sort` mediumint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片上传时间戳',
  `postip` varchar(255) NOT NULL DEFAULT '' COMMENT '图片上传ip',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '图片文件名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标题',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '图片类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片大小',
  `filepath` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  `thumb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有缩略图',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图片状态 1-审核',
  PRIMARY KEY (`picid`),
  KEY `articleid` (`articleid`,`sort`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章图片表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_article_reader`
--

CREATE TABLE IF NOT EXISTS `ibos_article_reader` (
  `readerid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '读者表id',
  `articleid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读者UID',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `readername` varchar(30) NOT NULL,
  PRIMARY KEY (`readerid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=365 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_assignment`
--

CREATE TABLE IF NOT EXISTS `ibos_assignment` (
  `assignmentid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '指派任务id',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '任务主题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '任务描述',
  `designeeuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '指派人uid',
  `chargeuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '负责人uid',
  `participantuid` text NOT NULL COMMENT '参与者uid,逗号隔开字符串',
  `attachmentid` text NOT NULL COMMENT '附件id',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发起时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0:未读,1:进行中,2:已完成,3:已评价,4:取消)',
  `finishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `stamp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '图章',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`assignmentid`),
  KEY `SUBJECT` (`subject`) USING BTREE,
  KEY `DESIGNEEUID` (`designeeuid`) USING BTREE,
  KEY `CHARGEUID` (`chargeuid`) USING BTREE,
  KEY `FINISHTIME` (`finishtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_assignment_apply`
--

CREATE TABLE IF NOT EXISTS `ibos_assignment_apply` (
  `applyid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `assignmentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派任务id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '申请人uid',
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否任务延时申请',
  `delaystarttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请延时开始时间',
  `delayendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请延时结束时间',
  `delayreason` varchar(255) NOT NULL DEFAULT '' COMMENT '申请延时理由',
  `iscancel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否任务取消申请',
  `cancelreason` varchar(255) NOT NULL DEFAULT '' COMMENT '申请取消理由',
  PRIMARY KEY (`applyid`),
  KEY `ASSIGNMENTID` (`assignmentid`) USING BTREE,
  KEY `ISDELAY` (`isdelay`) USING BTREE,
  KEY `ISCANCEL` (`iscancel`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_assignment_log`
--

CREATE TABLE IF NOT EXISTS `ibos_assignment_log` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `assignmentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派任务id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录日志时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人IP地址',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '日志类型：(add-新建,del-删除,edit-修改,view-查看,push-推办任务,finish-完成任务,stamp-评价任务,restart-重启任务,delay-延期,applydelay-申请延期,agreedelay-同意延期,refusedelay-拒绝延期,cancel-取消,applycancel-申请取消,agreecancel-同意取消,refusecancel-拒绝取消)',
  `content` text NOT NULL COMMENT '日志信息',
  PRIMARY KEY (`logid`),
  KEY `ASSIGNMENTID` (`assignmentid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_assignment_remind`
--

CREATE TABLE IF NOT EXISTS `ibos_assignment_remind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `assignmentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派任务id',
  `calendarid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日程的id',
  `remindtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提醒时间，时间戳',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '提醒人uid',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '提醒内容',
  PRIMARY KEY (`id`),
  KEY `A_ID` (`assignmentid`) USING BTREE,
  KEY `C_ID` (`calendarid`) USING BTREE,
  KEY `U_ID` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_atme`
--

CREATE TABLE IF NOT EXISTS `ibos_atme` (
  `atid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，@我的编号',
  `module` char(30) NOT NULL COMMENT '所属模块',
  `table` char(15) NOT NULL COMMENT '存储内容的表名',
  `rowid` int(11) NOT NULL DEFAULT '0' COMMENT '模块内含有@的内容的编号',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '被@的用户编号',
  PRIMARY KEY (`atid`),
  KEY `module2` (`uid`,`table`),
  KEY `module3` (`table`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '所属表id',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_0`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_0` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_1`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_1` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_2`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_2` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_3`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_3` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_4`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_4` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_5`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_5` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_6`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_6` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_7`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_7` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_8`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_8` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_9`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_9` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aid` (`aid`) USING BTREE,
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_edit`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_edit` (
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '当前编辑用户',
  `lastvisit` int(10) NOT NULL DEFAULT '0' COMMENT '时间戳'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_attachment_unused`
--

CREATE TABLE IF NOT EXISTS `ibos_attachment_unused` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间戳',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '附件真实地址',
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '附件描述',
  PRIMARY KEY (`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `ibos_auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `bizrule` text NOT NULL COMMENT '关联到这个项目的业务逻辑',
  `data` text NOT NULL COMMENT '当执行业务规则的时候所传递的额外的数据',
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_auth_item`
--

CREATE TABLE IF NOT EXISTS `ibos_auth_item` (
  `name` varchar(64) NOT NULL COMMENT '项目名字',
  `type` int(10) NOT NULL DEFAULT '0',
  `description` text NOT NULL COMMENT '项目描述',
  `bizrule` text NOT NULL COMMENT '关联到这个项目的业务逻辑',
  `data` text NOT NULL COMMENT '当执行业务规则的时候所传递的额外的数据',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `ibos_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_bg_template`
--

CREATE TABLE IF NOT EXISTS `ibos_bg_template` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `desc` varchar(50) NOT NULL DEFAULT '' COMMENT '背景图描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否选中',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统图片',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '背景图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_cache`
--

CREATE TABLE IF NOT EXISTS `ibos_cache` (
  `cachekey` varchar(255) NOT NULL DEFAULT '',
  `cachevalue` mediumblob NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cachekey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_calendars`
--

CREATE TABLE IF NOT EXISTS `ibos_calendars` (
  `calendarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日程ID',
  `taskid` varchar(50) NOT NULL DEFAULT '' COMMENT '任务ID',
  `isfromdiary` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否来自日志的计划提醒',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `location` varchar(200) NOT NULL DEFAULT '' COMMENT '地点(暂无用)',
  `mastertime` char(10) NOT NULL DEFAULT '' COMMENT '未被实例之前的时间，格式（年月日）：2012-10-01',
  `masterid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '被实例周期性事务的ID',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '详细(未用)',
  `calendartype` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日程类型( 个人 , 部门 )',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `isalldayevent` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否整天日程',
  `hasattachment` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '包含附件',
  `category` varchar(30) NOT NULL DEFAULT '-1' COMMENT '颜色分类',
  `instancetype` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实例类型( 1循环主日程 , 2循环实例 , 异常 , 邀请 )',
  `recurringtype` varchar(255) NOT NULL DEFAULT '' COMMENT '循环类型(年、月、周)',
  `recurringtime` varchar(255) NOT NULL DEFAULT '' COMMENT '循环的具体时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '日程状态（未进行，完成，删除）',
  `recurringbegin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期开始时间',
  `recurringend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期结束时间',
  `attendees` varchar(255) NOT NULL DEFAULT '' COMMENT '参与人地址',
  `attendeenames` varchar(255) NOT NULL DEFAULT '' COMMENT '参与人姓名',
  `otherattendee` varchar(255) NOT NULL DEFAULT '' COMMENT '其它参与人',
  `upuid` varchar(50) NOT NULL DEFAULT '' COMMENT '添加人帐号(上司或自己)',
  `upname` varchar(50) NOT NULL DEFAULT '' COMMENT '更新人姓名',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `recurringrule` varchar(255) NOT NULL DEFAULT '' COMMENT '循环规则',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被锁定，锁定不能操作，只能看(0为未锁定，1为锁定)',
  PRIMARY KEY (`calendarid`),
  KEY `uid` (`uid`,`starttime`,`endtime`,`masterid`,`taskid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=203 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_calendar_record`
--

CREATE TABLE IF NOT EXISTS `ibos_calendar_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日程的id',
  `rid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '来自日志的计划id',
  `did` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日志的id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`) USING BTREE,
  KEY `rid` (`rid`) USING BTREE,
  KEY `did` (`did`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_calendar_rep_record`
--

CREATE TABLE IF NOT EXISTS `ibos_calendar_rep_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日程的id',
  `rid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '来自日志的计划id',
  `repid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '总结的id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`) USING BTREE,
  KEY `rid` (`rid`) USING BTREE,
  KEY `repid` (`repid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_calendar_setup`
--

CREATE TABLE IF NOT EXISTS `ibos_calendar_setup` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `mintime` char(10) NOT NULL DEFAULT '' COMMENT '日程开始时间（小时）',
  `maxtime` char(10) NOT NULL DEFAULT '' COMMENT '日程结束时间（小时）',
  `hiddendays` char(100) NOT NULL DEFAULT '' COMMENT '隐藏日期（星期几）',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_comment`
--

CREATE TABLE IF NOT EXISTS `ibos_comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，评论编号',
  `module` char(30) NOT NULL DEFAULT '' COMMENT '所属模块',
  `table` varchar(50) NOT NULL DEFAULT '' COMMENT '被评论的内容所存储的表',
  `rowid` int(11) NOT NULL DEFAULT '0' COMMENT '应用进行评论的内容的编号',
  `moduleuid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '模块内进行评论的内容的作者的UID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '评论者UID',
  `content` text NOT NULL COMMENT '评论内容',
  `tocid` int(11) NOT NULL DEFAULT '0' COMMENT '被回复的评论的编号',
  `touid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '被回复的评论的作者的UID',
  `data` text NOT NULL COMMENT '所评论的内容的相关参数（序列化存储）',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '标记删除（0：没删除，1：已删除）',
  `from` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客户端类型，0：网站；1：手机网页版；2：android；3：iphone',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '该评论回复数',
  `attachmentid` text NOT NULL COMMENT '附件id',
  PRIMARY KEY (`cid`),
  KEY `module` (`table`,`isdel`,`rowid`) USING BTREE,
  KEY `module2` (`uid`,`isdel`,`table`) USING BTREE,
  KEY `module3` (`uid`,`touid`,`isdel`,`table`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=876 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_contact`
--

CREATE TABLE IF NOT EXISTS `ibos_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `cuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '常联系人id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `cuid` (`cuid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='常联系人表' AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_credit`
--

CREATE TABLE IF NOT EXISTS `ibos_credit` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '积分id',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统自带：1为是；0为否',
  `name` varchar(50) NOT NULL COMMENT '积分名字',
  `initial` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '初始积分',
  `lower` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分下限',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启动：1为启动，0为不启用',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_credit_log`
--

CREATE TABLE IF NOT EXISTS `ibos_credit_log` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `operation` char(3) NOT NULL DEFAULT '',
  `relatedid` int(10) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  `curcredits` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`),
  KEY `operation` (`operation`),
  KEY `relatedid` (`relatedid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_credit_rule`
--

CREATE TABLE IF NOT EXISTS `ibos_credit_rule` (
  `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rulename` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(20) NOT NULL DEFAULT '',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0',
  `cycletime` int(10) NOT NULL DEFAULT '0',
  `rewardnum` smallint(5) NOT NULL DEFAULT '1',
  `norepeat` tinyint(1) NOT NULL DEFAULT '0',
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `action` (`action`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_credit_rule_log`
--

CREATE TABLE IF NOT EXISTS `ibos_credit_rule_log` (
  `clid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则记录id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `rid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '规则ID',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '总积分',
  `cyclenum` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '周期次数',
  `extcredits1` int(10) NOT NULL DEFAULT '0' COMMENT '积分1',
  `extcredits2` int(10) NOT NULL DEFAULT '0' COMMENT '积分2',
  `extcredits3` int(10) NOT NULL DEFAULT '0' COMMENT '积分3',
  `extcredits4` int(10) NOT NULL DEFAULT '0' COMMENT '积分4',
  `extcredits5` int(10) NOT NULL DEFAULT '0' COMMENT '积分5',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录时间',
  PRIMARY KEY (`clid`),
  KEY `dateline` (`dateline`),
  KEY `uid` (`uid`,`rid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_credit_rule_log_field`
--

CREATE TABLE IF NOT EXISTS `ibos_credit_rule_log_field` (
  `clid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `user` text NOT NULL,
  `app` text NOT NULL,
  PRIMARY KEY (`clid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_cron`
--

CREATE TABLE IF NOT EXISTS `ibos_cron` (
  `cronid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `module` varchar(30) NOT NULL DEFAULT '' COMMENT '所属模块',
  `name` char(50) NOT NULL DEFAULT '',
  `filename` char(50) NOT NULL DEFAULT '',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `nextrun` int(10) unsigned NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`cronid`),
  KEY `nextrun` (`available`,`nextrun`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_department`
--

CREATE TABLE IF NOT EXISTS `ibos_department` (
  `deptid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `deptname` char(20) NOT NULL COMMENT '部门名称',
  `pid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `manager` mediumint(8) NOT NULL DEFAULT '0' COMMENT '部门主管',
  `leader` mediumint(8) NOT NULL DEFAULT '0',
  `subleader` mediumint(8) NOT NULL DEFAULT '0',
  `tel` char(15) NOT NULL COMMENT '部门电话',
  `fax` char(15) NOT NULL COMMENT '部门传真',
  `addr` char(100) NOT NULL COMMENT '部门地址',
  `func` char(255) NOT NULL COMMENT '部门职能',
  `sort` mediumint(8) NOT NULL DEFAULT '0' COMMENT '排序ID',
  `isbranch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否作为分支机构',
  PRIMARY KEY (`deptid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_department_related`
--

CREATE TABLE IF NOT EXISTS `ibos_department_related` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `deptid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '部门id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_diary`
--

CREATE TABLE IF NOT EXISTS `ibos_diary` (
  `diaryid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `diarytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日志添加的当日时间',
  `nextdiarytime` int(10) NOT NULL DEFAULT '0' COMMENT '下一个日志添加时间',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `content` text NOT NULL COMMENT '日志内容',
  `attachmentid` text NOT NULL COMMENT '附件ID',
  `shareuid` text NOT NULL COMMENT '分享id',
  `readeruid` text NOT NULL COMMENT '阅读人员',
  `remark` text NOT NULL COMMENT '备注',
  `stamp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '图章',
  `isreview` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已评阅',
  `attention` text NOT NULL COMMENT '谁关注了这篇日志',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`diaryid`),
  UNIQUE KEY `ID` (`diaryid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE,
  KEY `DIA_DATE` (`diarytime`) USING BTREE,
  KEY `DIA_TIME` (`addtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=556 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_diary_attention`
--

CREATE TABLE IF NOT EXISTS `ibos_diary_attention` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '登陆用户UID',
  `auid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '关注哪个用户的UID',
  PRIMARY KEY (`id`),
  KEY `USER_ID` (`uid`) USING BTREE,
  KEY `AT_USER_ID` (`auid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=200 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_diary_record`
--

CREATE TABLE IF NOT EXISTS `ibos_diary_record` (
  `recordid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `diaryid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日志ID',
  `content` char(255) NOT NULL DEFAULT '' COMMENT '记录内容',
  `uid` int(8) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '完成标记(0为未完成1为已完成',
  `planflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '计划标记,1为原计划、0为计划外)',
  `schedule` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '进度',
  `plantime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '计划执行的时间',
  `timeremind` char(10) NOT NULL DEFAULT '' COMMENT '设置时间提醒',
  PRIMARY KEY (`recordid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2322 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_diary_share`
--

CREATE TABLE IF NOT EXISTS `ibos_diary_share` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `deftoid` text NOT NULL COMMENT '分享给谁',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_diary_statistics`
--

CREATE TABLE IF NOT EXISTS `ibos_diary_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `diaryid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日志ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登陆用户UID',
  `stamp` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '图章id',
  `integration` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `scoretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评分时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `DIARY_ID` (`diaryid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE,
  KEY `SCORE_TIME` (`scoretime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=474 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_doc`
--

CREATE TABLE IF NOT EXISTS `ibos_doc` (
  `docid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `subject` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `author` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '作者',
  `approver` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '审批人',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `clickcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `attachmentid` text NOT NULL COMMENT '附件ID',
  `docno` text NOT NULL COMMENT '公文号',
  `commentstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评论状态，1为开启0为关闭',
  `catid` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章状态，1为公开2为审核3为草稿',
  `deptid` text NOT NULL COMMENT '阅读范围部门',
  `positionid` text NOT NULL COMMENT '阅读范围职位',
  `uid` text NOT NULL COMMENT '阅读范围人员',
  `readers` text NOT NULL COMMENT '阅读人uid',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶，1代表置顶，0为不置顶',
  `toptime` int(10) NOT NULL DEFAULT '0' COMMENT '置顶时间',
  `topendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '置顶过期时间',
  `ishighlight` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否高亮',
  `highlightstyle` char(50) NOT NULL DEFAULT '' COMMENT '高亮样式',
  `highlightendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '高亮过期时间',
  `rcid` smallint(5) NOT NULL DEFAULT '0' COMMENT '套红id',
  `ccdeptid` text NOT NULL COMMENT '抄送部门id',
  `ccpositionid` text NOT NULL COMMENT '抄送职位id',
  `ccuid` text NOT NULL COMMENT '抄送uid',
  `version` smallint(5) NOT NULL DEFAULT '1' COMMENT '版本号',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`docid`),
  KEY `SUBJECT` (`subject`) USING BTREE,
  KEY `PROVIDER` (`author`) USING BTREE,
  KEY `NEWS_TIME` (`addtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_doc_approval`
--

CREATE TABLE IF NOT EXISTS `ibos_doc_approval` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `docid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '公文id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '签收人id',
  `step` varchar(10) NOT NULL DEFAULT '' COMMENT '签收步骤(1,2,3,4,5对应approval表level1,level2,level3,level4,level5)',
  PRIMARY KEY (`id`),
  KEY `DOCID` (`docid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_doc_back`
--

CREATE TABLE IF NOT EXISTS `ibos_doc_back` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `docid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作者UID',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '退回时间',
  `reason` text NOT NULL COMMENT '退回理由',
  PRIMARY KEY (`id`),
  KEY `ARTICLEID` (`docid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_doc_category`
--

CREATE TABLE IF NOT EXISTS `ibos_doc_category` (
  `catid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '父分类id',
  `name` char(20) NOT NULL COMMENT '文章分类名称',
  `sort` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `aid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '审批流程id',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_doc_reader`
--

CREATE TABLE IF NOT EXISTS `ibos_doc_reader` (
  `readerid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '读者表id',
  `docid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '阅读者UID',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `readername` varchar(30) NOT NULL,
  `issign` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已签收:1为已签收，0为未签收',
  `signtime` int(10) NOT NULL DEFAULT '0' COMMENT '签收时间',
  `frommobile` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否签收于手机端',
  PRIMARY KEY (`readerid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_doc_version`
--

CREATE TABLE IF NOT EXISTS `ibos_doc_version` (
  `versionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//版本号id',
  `docid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `content` text NOT NULL COMMENT '内容',
  `author` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '作者uid',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `clickcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `commentstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评论状态，1为开启0为关闭',
  `catid` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章状态，1为公开2为审核3为草稿',
  `deptid` text NOT NULL COMMENT '阅读范围部门',
  `positionid` text NOT NULL COMMENT '阅读范围职位',
  `uid` text NOT NULL COMMENT '阅读范围人员',
  `readers` text NOT NULL COMMENT '阅读人uid',
  `rcid` smallint(5) NOT NULL DEFAULT '0' COMMENT '套红id',
  `ccdeptid` text NOT NULL COMMENT '抄送部门id',
  `ccpositionid` text NOT NULL COMMENT '抄送职位id',
  `ccuid` text NOT NULL COMMENT '抄送uid',
  `version` smallint(5) NOT NULL DEFAULT '1' COMMENT '版本号',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `editor` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '修改人uid',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '修改理由',
  PRIMARY KEY (`versionid`),
  KEY `NEWS_TIME` (`addtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_email`
--

CREATE TABLE IF NOT EXISTS `ibos_email` (
  `emailid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `toid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发送给谁',
  `isread` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已阅读 (0为未阅读，1为已阅读)',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记(0为未删除，1为已删除)',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文件夹id',
  `bodyid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '邮件主体id',
  `isreceipt` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '回执标识 (0未回执，1已回执，2不回执)',
  `ismark` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否标为待办 (0为不待办，1为标记待办)',
  `isweb` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否外部邮件 (0不是，1是)',
  PRIMARY KEY (`emailid`),
  UNIQUE KEY `emailid` (`emailid`) USING BTREE,
  KEY `bodyid` (`bodyid`) USING BTREE,
  KEY `toid` (`toid`) USING BTREE,
  KEY `fid` (`fid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=473 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_email_1`
--

CREATE TABLE IF NOT EXISTS `ibos_email_1` (
  `emailid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `toid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发送给谁',
  `isread` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已阅读 (0为未阅读，1为已阅读)',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记(0为未删除，1为已删除)',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文件夹id',
  `bodyid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '邮件主体id',
  `isreceipt` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '回执标识 (0未回执，1已回执，2不回执)',
  `ismark` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否标为待办 (0为不待办，1为标记待办)',
  `isweb` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否外部邮件 (0不是，1是)',
  PRIMARY KEY (`emailid`),
  UNIQUE KEY `emailid` (`emailid`) USING BTREE,
  KEY `bodyid` (`bodyid`) USING BTREE,
  KEY `toid` (`toid`) USING BTREE,
  KEY `fid` (`fid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_email_body`
--

CREATE TABLE IF NOT EXISTS `ibos_email_body` (
  `bodyid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '邮件内容ID',
  `fromid` text NOT NULL COMMENT '发件人ID',
  `toids` text NOT NULL COMMENT '收件人',
  `copytoids` text NOT NULL COMMENT '抄送人',
  `secrettoids` text NOT NULL COMMENT '密送人',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '邮件内容',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `attachmentid` text NOT NULL COMMENT '附件id',
  `issend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已发送(0为未发送，1为已发送)',
  `important` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '重要程度 (0:一般1:重要2:紧急)',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '邮件大小，单位为字节',
  `fromwebmail` varchar(255) NOT NULL COMMENT '外部邮件的来源',
  `towebmail` text NOT NULL COMMENT '发送的外部邮箱，以分号;为分隔',
  `issenderdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否发送者删除(0为未删除1为已删除)',
  `isneedreceipt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要回执(0为不需要1为需要)',
  PRIMARY KEY (`bodyid`),
  UNIQUE KEY `bodyid` (`bodyid`),
  KEY `sendtime` (`sendtime`) USING BTREE,
  KEY `subject` (`subject`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_email_body_1`
--

CREATE TABLE IF NOT EXISTS `ibos_email_body_1` (
  `bodyid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '邮件内容ID',
  `fromid` text NOT NULL COMMENT '发件人ID',
  `toids` text NOT NULL COMMENT '收件人',
  `copytoids` text NOT NULL COMMENT '抄送人',
  `secrettoids` text NOT NULL COMMENT '密送人',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '邮件内容',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `attachmentid` text NOT NULL COMMENT '附件id',
  `issend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已发送(0为未发送，1为已发送)',
  `important` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '重要程度 (0:一般1:重要2:紧急)',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '邮件大小，单位为字节',
  `fromwebmail` varchar(255) NOT NULL COMMENT '外部邮件的来源',
  `towebmail` text NOT NULL COMMENT '发送的外部邮箱，以分号;为分隔',
  `issenderdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否发送者删除(0为未删除1为已删除)',
  `isneedreceipt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要回执(0为不需要1为需要)',
  PRIMARY KEY (`bodyid`),
  UNIQUE KEY `bodyid` (`bodyid`),
  KEY `sendtime` (`sendtime`) USING BTREE,
  KEY `subject` (`subject`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_email_folder`
--

CREATE TABLE IF NOT EXISTS `ibos_email_folder` (
  `fid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统自带；1为是；0为否',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '邮箱名',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `webid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '外部邮箱文件夹id',
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_email_web`
--

CREATE TABLE IF NOT EXISTS `ibos_email_web` (
  `webid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '外部邮箱id',
  `address` varchar(255) NOT NULL COMMENT 'emai地址',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '邮箱密码',
  `smtpserver` varchar(255) NOT NULL COMMENT '发信服务器地址',
  `smtpport` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'smtp服务器端口',
  `smtpssl` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'smtp服务器是否使用ssl',
  `server` varchar(255) NOT NULL DEFAULT '0' COMMENT '服务器地址',
  `port` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '服务器端口',
  `ssl` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '服务器是否使用ssl链接',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '发信昵称',
  `lastrectime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后接收时间',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文件夹id',
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认发信箱(0不是，1是)',
  PRIMARY KEY (`webid`),
  UNIQUE KEY `webid` (`webid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_failedip`
--

CREATE TABLE IF NOT EXISTS `ibos_failedip` (
  `ip` char(7) NOT NULL DEFAULT '',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`,`lastupdate`),
  KEY `lastupdate` (`lastupdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_failedlogin`
--

CREATE TABLE IF NOT EXISTS `ibos_failedlogin` (
  `ip` char(15) NOT NULL DEFAULT '',
  `username` char(32) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_feed`
--

CREATE TABLE IF NOT EXISTS `ibos_feed` (
  `feedid` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '产生动态的用户UID',
  `type` char(50) DEFAULT NULL COMMENT 'feed类型.由发表feed的程序控制',
  `module` char(30) NOT NULL DEFAULT 'microblog' COMMENT 'feed来源的module',
  `table` varchar(50) NOT NULL DEFAULT 'feed' COMMENT '关联资源所在的表',
  `rowid` int(11) NOT NULL DEFAULT '0' COMMENT '关联的来源ID（如文章的id）',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '产生时间戳',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 默认为0',
  `from` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客户端类型，0：网站；1：手机网页版；2：android；3：iphone',
  `commentcount` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `repostcount` int(10) DEFAULT '0' COMMENT '分享数',
  `commentallcount` int(10) DEFAULT '0' COMMENT '全部评论数目',
  `diggcount` int(11) unsigned DEFAULT '0' COMMENT '赞数',
  `isrepost` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否转发 0-否  1-是',
  `view` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '微博可见性 (0全公司可见 1仅自己可见 2我所在的部门可见 3自定义范围)',
  `userid` text NOT NULL COMMENT '可见用户ID',
  `deptid` text NOT NULL COMMENT '可见部门ID',
  `positionid` text NOT NULL COMMENT '可见岗位ID',
  PRIMARY KEY (`feedid`),
  KEY `isdel` (`isdel`,`ctime`),
  KEY `uid` (`uid`,`isdel`,`ctime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=169 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_feed_data`
--

CREATE TABLE IF NOT EXISTS `ibos_feed_data` (
  `feedid` int(11) unsigned NOT NULL COMMENT '关联feed表，feedid',
  `feeddata` text COMMENT '关联feed表，动态数据，序列化保存',
  `clientip` char(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户端IP',
  `feedcontent` text COMMENT '纯微博内容',
  `fromdata` text COMMENT '微博来源',
  PRIMARY KEY (`feedid`),
  KEY `feedid` (`feedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_feed_digg`
--

CREATE TABLE IF NOT EXISTS `ibos_feed_digg` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `feedid` int(11) NOT NULL DEFAULT '0' COMMENT '产生动态的ID',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '赞的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_feed_topic`
--

CREATE TABLE IF NOT EXISTS `ibos_feed_topic` (
  `topicid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '话题ID',
  `topicname` varchar(150) NOT NULL COMMENT '话题标题',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '关联的动态数',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `domain` varchar(100) NOT NULL COMMENT '个性化地址',
  `recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `recommend_time` int(11) DEFAULT '0' COMMENT '推荐时间',
  `des` text COMMENT '详细内容',
  `outlink` varchar(100) DEFAULT NULL COMMENT '关联链接',
  `pic` varchar(255) DEFAULT NULL COMMENT '关联图片',
  `essence` tinyint(1) DEFAULT '0' COMMENT '是否精华',
  `note` varchar(255) DEFAULT NULL COMMENT '摘要',
  `topic_user` varchar(255) DEFAULT NULL COMMENT '话题人物推荐',
  PRIMARY KEY (`topicid`),
  KEY `count` (`count`),
  KEY `recommend` (`recommend`,`lock`,`count`),
  KEY `name` (`topicname`,`count`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_feed_topic_link`
--

CREATE TABLE IF NOT EXISTS `ibos_feed_topic_link` (
  `linkid` int(11) NOT NULL AUTO_INCREMENT,
  `feedid` int(11) NOT NULL DEFAULT '0' COMMENT '动态ID',
  `topicid` int(11) NOT NULL DEFAULT '0' COMMENT '话题ID',
  `type` varchar(255) NOT NULL DEFAULT '0' COMMENT '动态类型ID',
  PRIMARY KEY (`linkid`),
  KEY `topic_type` (`topicid`,`type`),
  KEY `weibo` (`feedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_category`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_category` (
  `catid` mediumint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作流分类id',
  `name` char(20) NOT NULL COMMENT '分类名称',
  `sort` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序id',
  `deptid` text NOT NULL COMMENT '所属部门ID',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_data_8`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_data_8` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `runid` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `beginuser` mediumint(8) unsigned NOT NULL,
  `begin` int(10) NOT NULL,
  `data_58` mediumtext NOT NULL,
  `data_59` mediumtext NOT NULL,
  `data_60` mediumtext NOT NULL,
  `data_61` mediumtext NOT NULL,
  `data_62` mediumtext NOT NULL,
  `data_63` mediumtext NOT NULL,
  `data_64` mediumtext NOT NULL,
  `data_65` mediumtext NOT NULL,
  `data_66` mediumtext NOT NULL,
  `data_69` mediumtext NOT NULL,
  `data_71` mediumtext NOT NULL,
  `data_72` mediumtext NOT NULL,
  `data_73` mediumtext NOT NULL,
  `data_74` mediumtext NOT NULL,
  `data_75` mediumtext NOT NULL,
  `data_76` mediumtext NOT NULL,
  `data_77` mediumtext NOT NULL,
  `data_78` mediumtext NOT NULL,
  `data_79` mediumtext NOT NULL,
  `data_80` mediumtext NOT NULL,
  `data_81` mediumtext NOT NULL,
  `data_82` mediumtext NOT NULL,
  `data_83` mediumtext NOT NULL,
  `data_84` mediumtext NOT NULL,
  `data_85` mediumtext NOT NULL,
  `data_86` mediumtext NOT NULL,
  `data_87` mediumtext NOT NULL,
  `data_88` mediumtext NOT NULL,
  `data_91` mediumtext NOT NULL,
  `data_1` mediumtext NOT NULL,
  `data_2` mediumtext NOT NULL,
  `data_3` mediumtext NOT NULL,
  `data_100` mediumtext NOT NULL,
  `data_4` mediumtext NOT NULL,
  `data_5` mediumtext NOT NULL,
  `data_6` mediumtext NOT NULL,
  `data_7` mediumtext NOT NULL,
  `data_8` mediumtext NOT NULL,
  `data_9` mediumtext NOT NULL,
  `data_10` mediumtext NOT NULL,
  `data_11` mediumtext NOT NULL,
  `data_12` mediumtext NOT NULL,
  `data_13` mediumtext NOT NULL,
  `data_14` mediumtext NOT NULL,
  `data_15` mediumtext NOT NULL,
  `data_16` mediumtext NOT NULL,
  `data_17` mediumtext NOT NULL,
  `data_18` mediumtext NOT NULL,
  `data_19` mediumtext NOT NULL,
  `data_20` mediumtext NOT NULL,
  `data_21` mediumtext NOT NULL,
  `data_22` mediumtext NOT NULL,
  `data_23` mediumtext NOT NULL,
  `data_24` mediumtext NOT NULL,
  `data_25` mediumtext NOT NULL,
  `data_26` mediumtext NOT NULL,
  `data_27` mediumtext NOT NULL,
  `data_28` mediumtext NOT NULL,
  `data_29` mediumtext NOT NULL,
  `data_30` mediumtext NOT NULL,
  `data_31` mediumtext NOT NULL,
  `data_32` mediumtext NOT NULL,
  `data_33` mediumtext NOT NULL,
  `data_34` mediumtext NOT NULL,
  `data_35` mediumtext NOT NULL,
  `data_36` mediumtext NOT NULL,
  `data_37` mediumtext NOT NULL,
  `data_38` mediumtext NOT NULL,
  `data_39` mediumtext NOT NULL,
  `data_40` mediumtext NOT NULL,
  `data_41` mediumtext NOT NULL,
  `data_42` mediumtext NOT NULL,
  `data_43` mediumtext NOT NULL,
  `data_44` mediumtext NOT NULL,
  `data_45` mediumtext NOT NULL,
  `data_101` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `runid` (`runid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_data_20`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_data_20` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `runid` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `beginuser` mediumint(8) unsigned NOT NULL,
  `begin` int(10) NOT NULL,
  `data_1` mediumtext NOT NULL,
  `data_2` mediumtext NOT NULL,
  `data_3` mediumtext NOT NULL,
  `data_5` mediumtext NOT NULL,
  `data_6` mediumtext NOT NULL,
  `data_7` mediumtext NOT NULL,
  `data_8` mediumtext NOT NULL,
  `data_9` mediumtext NOT NULL,
  `data_10` mediumtext NOT NULL,
  `data_14` mediumtext NOT NULL,
  `data_15` mediumtext NOT NULL,
  `data_16` mediumtext NOT NULL,
  `data_17` mediumtext NOT NULL,
  `data_18` mediumtext NOT NULL,
  `data_19` mediumtext NOT NULL,
  `data_20` mediumtext NOT NULL,
  `data_21` mediumtext NOT NULL,
  `data_22` mediumtext NOT NULL,
  `data_23` mediumtext NOT NULL,
  `data_24` mediumtext NOT NULL,
  `data_25` mediumtext NOT NULL,
  `data_26` mediumtext NOT NULL,
  `data_27` mediumtext NOT NULL,
  `data_28` mediumtext NOT NULL,
  `data_43` mediumtext NOT NULL,
  `data_44` mediumtext NOT NULL,
  `data_45` mediumtext NOT NULL,
  `data_100` mediumtext NOT NULL,
  `data_101` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `runid` (`runid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_data_21`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_data_21` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `runid` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `beginuser` mediumint(8) unsigned NOT NULL,
  `begin` int(10) NOT NULL,
  `data_1` mediumtext NOT NULL,
  `data_2` mediumtext NOT NULL,
  `data_3` mediumtext NOT NULL,
  `data_4` mediumtext NOT NULL,
  `data_11` mediumtext NOT NULL,
  `data_12` mediumtext NOT NULL,
  `data_13` mediumtext NOT NULL,
  `data_17` mediumtext NOT NULL,
  `data_18` mediumtext NOT NULL,
  `data_19` mediumtext NOT NULL,
  `data_20` mediumtext NOT NULL,
  `data_21` mediumtext NOT NULL,
  `data_22` mediumtext NOT NULL,
  `data_26` mediumtext NOT NULL,
  `data_27` mediumtext NOT NULL,
  `data_28` mediumtext NOT NULL,
  `data_43` mediumtext NOT NULL,
  `data_44` mediumtext NOT NULL,
  `data_45` mediumtext NOT NULL,
  `data_100` mediumtext NOT NULL,
  `data_104` mediumtext NOT NULL,
  `data_106` mediumtext NOT NULL,
  `data_107` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `runid` (`runid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_form_type`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_form_type` (
  `formid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表单ID',
  `formname` varchar(200) NOT NULL DEFAULT '' COMMENT '表单名称',
  `printmodel` text NOT NULL COMMENT '表单设计信息',
  `printmodelshort` text NOT NULL COMMENT '精简后的表单设计信息',
  `deptid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '表单所属部门',
  `script` text NOT NULL COMMENT '表单拓展脚本',
  `css` text NOT NULL COMMENT '表单扩展样式',
  `itemmax` mediumint(8) NOT NULL DEFAULT '0' COMMENT '最大的项目编号',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '表单所属分类',
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '表单类型 1 - 新表单 0 - 老表单',
  PRIMARY KEY (`formid`),
  KEY `deptid` (`deptid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='设计表单' AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_form_version`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_form_version` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `formid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '表单ID',
  `printmodel` text NOT NULL COMMENT '表单设计信息',
  `printmodelshort` text NOT NULL COMMENT '精简后的表单设计信息',
  `script` text NOT NULL COMMENT '表单拓展脚本',
  `css` text NOT NULL COMMENT '表单扩展样式',
  `time` int(10) NOT NULL DEFAULT '0' COMMENT '版本时间',
  `mark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='设计表单版本库' AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_manage_log`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_manage_log` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `flowid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `flowname` varchar(200) NOT NULL COMMENT '流程名称',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '操作用户唯一标识即用户表主键ID',
  `addtime` mediumint(8) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `ip` varchar(20) NOT NULL COMMENT '操作用户的IP地址',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '日志类型(1-增加,2-修改,3-删除,但实际1、2类型存的比较混乱)',
  `content` text NOT NULL COMMENT '日志内容',
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `time` (`addtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='流程管理日志' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_permission`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_permission` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `flowid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '授权类型(0-所有,1-管理,2-监控,3-查询,4-编辑,5-点评)',
  `scope` text NOT NULL COMMENT '管理范围[selforg-本机构,alldept-所有部门selfdept-本部门,部门ID串]',
  `uid` text NOT NULL COMMENT '按人员设定授权范围',
  `deptid` text NOT NULL COMMENT '按部门设定授权范围',
  `positionid` text NOT NULL COMMENT '按岗位设定授权范围',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理权限' AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_print_tpl`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_print_tpl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '模版ID',
  `flowid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '模版类型(1-打印模版,2-手写呈批单)',
  `name` varchar(100) NOT NULL COMMENT '打印模版名称',
  `content` text NOT NULL COMMENT '打印模版内容',
  `flowprocess` text NOT NULL COMMENT '可使用该模版的步骤',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `flowid` (`flowid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='打印模版' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_process`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_process` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `flowid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '流程ID',
  `processid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '步骤ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '节点类型 (0:步骤节点 1:子流程节点 2:外部流转节点)',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '步骤名称',
  `processitem` text NOT NULL COMMENT '可写字段串',
  `processto` text NOT NULL COMMENT '转交步骤字符串',
  `hiddenitem` text NOT NULL COMMENT '保密字段串',
  `uid` text NOT NULL COMMENT '经办人ID串',
  `deptid` text NOT NULL COMMENT '经办部门ID串',
  `positionid` text NOT NULL COMMENT '经办岗位ID串',
  `setleft` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '节点横坐标',
  `settop` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '节点纵坐标',
  `plugin` text NOT NULL COMMENT '转交调用插件',
  `pluginsave` text NOT NULL COMMENT '保存调用插件',
  `processitemauto` text NOT NULL COMMENT '允许在不可写情况下自动赋值的宏控件',
  `feedback` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许会签 (0:允许会签 1:禁止会签 2:强制会签)',
  `autotype` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '自动选人规则 (1:自动选择流程发起人 2:自动选择本部门主管 3:指定自动选择默认人员 4:自动选择上级主管领导 5:自动选择部门一级主管 6:自动选择上级分管领导 7:按表单字段选择 8:自动选择指定步骤主办人 9:自动选择本部门助理 10:自动选择本部门内符合条件的所有人员，11:自动选择本一级部门内符合条件的所有人员,)',
  `autouserop` text NOT NULL COMMENT '指定自动选择默认人员 - 主办人',
  `autouser` text NOT NULL COMMENT '指定自动选择默认人员 - 经办人',
  `userfilter` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '选人过滤规则 (1:只允许选择本部门经办人 2:只允许选择本岗位经办人 3:只允许选择上级部门经办人 4:只允许选择下级部门经办人 )',
  `timeout` varchar(20) NOT NULL DEFAULT '0' COMMENT '办理时限',
  `timeoutmodify` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许转交时设置办理时限(0:不允许 1:允许)',
  `signlook` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会签意见可见性 (0:总是可见 1:本步骤经办人之间不可见 2: 针对其他步骤不可见)',
  `topdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '主办人相关选项 (0:明确指定主办人 1:先接收者为主办人 2:无主办人会签)',
  `userlock` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许修改主办人相关选项及默认经办人 （0：不允许,1:允许）',
  `mailto` text NOT NULL COMMENT '转交时邮件通知以下人员ID串',
  `syncdeal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许并发( 0:禁止并发 1:允许并发 2:强制并发)',
  `turnpriv` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '强制转交，经办人未办理完毕时是否允许主办人强制转交 (0:不允许 1:允许)',
  `childflow` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '子流程的流程ID',
  `gathernode` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '并发合并选项 (0:非强制合并 1:强制合并)',
  `allowback` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许回退 (0:不允许 1:允许回退上一步骤 2:允许回退之前步骤)',
  `attachpriv` varchar(10) NOT NULL DEFAULT '1,2,3,4,5' COMMENT '公共附件中的office文档详细权限设置',
  `autobaseuser` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '部门针对对象步骤的ID，0为当前步骤.配合自动选人规则使用。当自动选人规则为以下选项时启用(2-自动选择本部门主管,4-自动选择上级主管领导,6-自动选择上级分管领导,9-自动选择本部门助理,)',
  `relationin` text NOT NULL COMMENT '父流程 -> 子流程映射关系',
  `relationout` text NOT NULL COMMENT '子流程->父流程映射关系',
  `timeouttype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:本步骤接收后开始计时 1:上一步骤转交后开始计时',
  `attacheditpriv` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许本步骤经办人编辑附件 (0:不允许 1:允许)',
  `controlmode` text NOT NULL COMMENT '列表控件模式(1-修改模式,2-添加模式,3-删除模式,保存格式如下例：列表控件1,列表控件2,|1`2`3,1`2,)',
  `fileuploadpriv` text NOT NULL COMMENT '附件上传控件的权限(1:新建 2:编辑 3:删除 4: 下载 5:打印)',
  `checkitem` text NOT NULL COMMENT '要进行规则验证的字段',
  PRIMARY KEY (`id`),
  KEY `flowid` (`flowid`),
  KEY `processid` (`processid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=288 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_process_turn`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_process_turn` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `flowid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `processid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '步骤ID',
  `to` mediumint(8) NOT NULL DEFAULT '0' COMMENT '下一步的ID',
  `processout` text COLLATE utf8_bin NOT NULL,
  `conditiondesc` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '不符合条件公式时，给用户的文字描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`flowid`,`processid`,`to`),
  KEY `processid` (`processid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_query_tpl`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_query_tpl` (
  `seqid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tplname` varchar(100) NOT NULL DEFAULT '' COMMENT '模板名称',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `flowid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `viewextfields` text NOT NULL COMMENT '扩展显示字段',
  `sumfields` text NOT NULL COMMENT '可见字段里的统计字段',
  `groupbyfields` text NOT NULL COMMENT '分组字段',
  `flowconditions` text NOT NULL COMMENT '流程过滤条件',
  `condformula` varchar(200) NOT NULL COMMENT '查询条件公式',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`seqid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='流程查询模板' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_rule`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_rule` (
  `ruleid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `flowid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '委托人ID',
  `toid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '被委托人ID',
  `begindate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0-关闭,1-开启)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `createuser` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `updateuser` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改人',
  PRIMARY KEY (`ruleid`),
  KEY `flowid` (`flowid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `begindate` (`begindate`) USING BTREE,
  KEY `enddate` (`enddate`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='工作委托' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_run`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_run` (
  `runid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流程实例ID',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '流程实例名称',
  `flowid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '流程ID',
  `beginuser` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '流程发起人ID',
  `begindept` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程发起人部门ID',
  `begintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '流程实例创建时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '流程实例结束时间',
  `attachmentid` text NOT NULL COMMENT '附件ID串',
  `delflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记(0-未删除,1-已删除)删除后流程实例可在工作销毁中确实删除或还原',
  `focususer` text NOT NULL COMMENT '关注该流程的用户',
  `parentrun` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父流程ID',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否归档(0-否,1-是)',
  `forceover` text NOT NULL COMMENT '强制结束信息',
  `worklevel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '工作等级 0-普通 1-重要 2-紧急',
  PRIMARY KEY (`runid`),
  KEY `runid` (`runid`) USING BTREE,
  KEY `flowid` (`flowid`) USING BTREE,
  KEY `runname` (`name`) USING BTREE,
  KEY `begintime` (`begintime`) USING BTREE,
  KEY `endtime` (`endtime`) USING BTREE,
  KEY `user and run` (`beginuser`,`runid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='流程实例基本信息' AUTO_INCREMENT=92 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_run_feedback`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_run_feedback` (
  `feedid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `runid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程实例ID',
  `processid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程实例步骤ID[实际步骤号]',
  `flowprocess` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程步骤号[设计流程中的步骤号]',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `content` text NOT NULL COMMENT '会签意见内容',
  `attachmentid` text CHARACTER SET gbk NOT NULL COMMENT '附件ID串',
  `edittime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最近一次会签意见的保存时间',
  `feedflag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会签意见类型(1-点评意见,其他-会签意见)',
  `signdata` text NOT NULL COMMENT '手写签批意见',
  `replyid` mediumint(8) NOT NULL COMMENT '回复的是哪条意见ID',
  PRIMARY KEY (`feedid`),
  KEY `runid` (`runid`) USING BTREE,
  KEY `processid` (`processid`) USING BTREE,
  KEY `replyid` (`replyid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会签意见' AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_run_log`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_run_log` (
  `logid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `runid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程实例ID',
  `runname` varchar(200) NOT NULL DEFAULT '' COMMENT '流程实例名称',
  `flowid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `processid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程实例步骤ID[流程实例实际步骤号]',
  `flowprocess` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程步骤ID[设计流程步骤号]',
  `uid` mediumint(8) NOT NULL COMMENT '操作人ID',
  `toid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '被操作人ID',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人IP地址',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '日志类型：(1-新建、转交、回退、收回,2-委托,3-删除,4-销毁,5-还原被终止的流程,6-编辑数据,7-流转过程中修改经办权限,)',
  `content` text NOT NULL COMMENT '日志信息',
  PRIMARY KEY (`logid`),
  KEY `runid` (`runid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `runname` (`runname`) USING BTREE,
  KEY `flowid` (`flowid`) USING BTREE,
  KEY `time` (`time`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='流程实例日志' AUTO_INCREMENT=391 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_run_process`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_run_process` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `runid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程实例ID',
  `processid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程实例步骤ID',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户ID',
  `processtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '工作接收时间',
  `delivertime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '工作转交/办结时间',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '步骤状态(1-未接收,2-办理中,3-转交下一步，下一步经办人无人接收,4-已办结,5-自由流程预设步骤,6-已挂起,)',
  `flowprocess` mediumint(8) NOT NULL DEFAULT '0' COMMENT '步骤ID[设计流程中的步骤号]',
  `opflag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否主办(0-经办,1-主办)',
  `topflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主办人选项(0-指定主办人,1-先接收者主办,2-无主办人会签,)',
  `parent` text NOT NULL COMMENT '上一步骤ID',
  `childrun` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '子流程的流程实例ID',
  `freeitem` text NOT NULL COMMENT '步骤可写字段[仅自由流程且只有主办人生效]',
  `otheruser` text NOT NULL COMMENT '工作委托用户ID串',
  `timeoutflag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否超时(1-超时,其他-不超时)',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '工作创建时间',
  `fromuser` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '工作移交用户ID',
  `activetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '取消挂起的时间',
  `comment` text NOT NULL COMMENT '批注',
  `processdept` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '超时统计查询增加部门',
  `isfallback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是回退步骤',
  PRIMARY KEY (`id`),
  KEY `processflag` (`flag`) USING BTREE,
  KEY `runid` (`runid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `processid` (`runid`,`processid`) USING BTREE,
  KEY `ruid` (`runid`,`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='流程实例步骤信息' AUTO_INCREMENT=425 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_timer`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_timer` (
  `tid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `flowid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程ID',
  `uid` text NOT NULL COMMENT '发起人ID串',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '提醒类型(1-仅此一次,2-按日,3-按周,4-按月,5-按年,)',
  `reminddate` varchar(10) NOT NULL DEFAULT '' COMMENT '提醒日期(1-仅此一次，存具体日期,2-按日，为空,3-按周，存星期几,4-按月，存每月几号,5-按年，存每年几月几号,)',
  `remindtime` varchar(20) NOT NULL COMMENT '提醒时间',
  `lasttime` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次提醒时间',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设计流程定时设置' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_type`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_type` (
  `flowid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流程主键ID',
  `name` varchar(200) NOT NULL COMMENT '流程名',
  `formid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '表单ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '流程类型(1:固定流程 2:自由流程)',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '流程排序号',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '流程分类ID',
  `autonum` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '自动编号计数器',
  `autolen` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '自动编号显示长度',
  `autoname` text NOT NULL COMMENT '自动文号表达式',
  `desc` text NOT NULL COMMENT '流程说明',
  `autoedit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建工作时是否允许手工修改文号：(0:不允许，1:允许)',
  `allowattachment` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许附件 (1:允许 0:不允许)',
  `allowversion` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许版本控制 （0:不允许 1:允许）',
  `newuser` text NOT NULL COMMENT '自由流程新建权限：分为按用户、部门、岗位三种授权方式，形成“用户ID串|部门ID串|岗位ID串”格式的字符串，这三种字符串都是逗号分隔的字符串',
  `queryitem` text NOT NULL COMMENT '查询字段串',
  `deptid` text NOT NULL COMMENT '所属部门ID',
  `freepreset` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许预设步骤 （1:允许，0:否）',
  `freeother` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '委托类型 【0:禁止委托,1:仅允许委托当前步骤经办人(本步骤的实际经办人，该步骤可能指定了五个人，但是转交时选择了三个),2:自由委托，3:按步骤设置的经办权限(跟1的区别是按照定义的经办人来委托)】',
  `listfieldstr` text NOT NULL COMMENT '列表查询字段串查询页面仅查询该流程时生效',
  `forcepreset` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否强制修改文号(1-是,其他-否),新建工作时是否允许手工修改文号为(2-允许在自动文号前输入前缀,3-允许在自动文号后输入后缀,4-允许在自动文号前后输入前缀和后缀,时可设置该选项)',
  `modelid` text NOT NULL COMMENT '流程对应模块ID',
  `modelname` text NOT NULL COMMENT '流程对应模块名称',
  `attachmentid` text NOT NULL COMMENT '说明文档附件ID串',
  `usestatus` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '工作流前台状态。(1:可见,所有用户都可以在前台新建工作里看到该流程，但无权限用户不能点击。2:只有拥有权限的用户才能在前台新建工作中看到，并可点击,3:无论用户有无权限，都不会在前台新建工作中显示)',
  `guideprocess` varchar(20) NOT NULL DEFAULT '1' COMMENT '流程引导 - 当前完成步骤，用逗号分隔字符串相连',
  PRIMARY KEY (`flowid`),
  KEY `catid` (`catid`),
  KEY `formid` (`formid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='工作流类型表' AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_flow_version`
--

CREATE TABLE IF NOT EXISTS `ibos_flow_version` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `runid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程实例ID',
  `processid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程实例步骤ID',
  `flowprocess` mediumint(8) NOT NULL DEFAULT '0' COMMENT '流程步骤ID',
  `itemid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '表单字段ID',
  `itemdata` text NOT NULL COMMENT '表单字段的数据',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `mark` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='流程版本控制(历史数据)' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_ipbanned`
--

CREATE TABLE IF NOT EXISTS `ibos_ipbanned` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ip1` smallint(3) NOT NULL DEFAULT '0',
  `ip2` smallint(3) NOT NULL DEFAULT '0',
  `ip3` smallint(3) NOT NULL DEFAULT '0',
  `ip4` smallint(3) NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_login_template`
--

CREATE TABLE IF NOT EXISTS `ibos_login_template` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统图片',
  `image` varchar(100) NOT NULL COMMENT '背景图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_log_2014`
--

CREATE TABLE IF NOT EXISTS `ibos_log_2014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(128) DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5095 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_menu`
--

CREATE TABLE IF NOT EXISTS `ibos_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `name` char(20) NOT NULL COMMENT '菜单显示名字',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `m` char(20) NOT NULL DEFAULT '' COMMENT '模块',
  `c` char(20) NOT NULL DEFAULT '' COMMENT '控制器',
  `a` char(20) NOT NULL DEFAULT '' COMMENT '动作',
  `param` char(100) NOT NULL DEFAULT '' COMMENT '要传递的参数',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_menu_common`
--

CREATE TABLE IF NOT EXISTS `ibos_menu_common` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `module` varchar(30) NOT NULL DEFAULT '' COMMENT '模块',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模块名',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单显示描述',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `iscommon` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已设置为常用菜单',
  `iscustom` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是自定义的快捷导航',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `openway` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '打开连接方式:0为新窗口,1当前页打开',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon文件名,在./data/icon/目录下',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='首页通用菜单设置' AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_menu_personal`
--

CREATE TABLE IF NOT EXISTS `ibos_menu_personal` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '设置菜单的uid',
  `common` text NOT NULL COMMENT '常用菜单，按顺序逗号隔开的模块名称',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='首页个人菜单设置' AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_message_content`
--

CREATE TABLE IF NOT EXISTS `ibos_message_content` (
  `messageid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信内对话ID',
  `listid` int(11) NOT NULL DEFAULT '0' COMMENT '私信ID',
  `fromuid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '会话发布者UID',
  `content` text COMMENT '会话内容',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除，0：否；1：是',
  `mtime` int(11) NOT NULL DEFAULT '0' COMMENT '会话发布时间',
  PRIMARY KEY (`messageid`),
  KEY `listid` (`listid`,`isdel`,`mtime`),
  KEY `listid2` (`listid`,`mtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_message_list`
--

CREATE TABLE IF NOT EXISTS `ibos_message_list` (
  `listid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `fromuid` mediumint(8) unsigned NOT NULL COMMENT '私信发起者UID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '私信类别，1：一对一；2：多人',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `usernum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '参与者数量',
  `minmax` varchar(255) DEFAULT NULL COMMENT '参与者UID正序排列，以下划线“_”链接',
  `mtime` int(11) unsigned NOT NULL COMMENT '发起时间戳',
  `lastmessage` text NOT NULL COMMENT '最新的一条会话',
  PRIMARY KEY (`listid`),
  KEY `type` (`type`),
  KEY `min_max` (`minmax`),
  KEY `fromuid` (`fromuid`,`mtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_message_user`
--

CREATE TABLE IF NOT EXISTS `ibos_message_user` (
  `listid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0',
  `new` smallint(8) NOT NULL DEFAULT '0' COMMENT '未读消息数',
  `messagenum` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '消息总数',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '该参与者最后会话时间',
  `listctime` int(11) NOT NULL DEFAULT '0' COMMENT '私信最后会话时间',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除（假删）',
  PRIMARY KEY (`listid`,`uid`),
  KEY `new` (`new`),
  KEY `ctime` (`ctime`),
  KEY `listctime` (`listctime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_module`
--

CREATE TABLE IF NOT EXISTS `ibos_module` (
  `module` varchar(30) NOT NULL COMMENT '模块',
  `name` varchar(20) NOT NULL COMMENT '模块名',
  `url` varchar(100) NOT NULL COMMENT '链接地址',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否核心模块',
  `version` varchar(50) NOT NULL DEFAULT '' COMMENT '版本号',
  `icon` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图标文件存在与否',
  `category` varchar(30) NOT NULL COMMENT '模块所属分类',
  `description` varchar(255) NOT NULL COMMENT '模块描述',
  `config` text NOT NULL COMMENT '模块配置，数组形式',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序 ',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已禁用',
  `installdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装日期',
  `updatedate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新日期',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_module_guide`
--

CREATE TABLE IF NOT EXISTS `ibos_module_guide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `route` varchar(32) NOT NULL DEFAULT '' COMMENT '引导的页面id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '已经引导过的uid',
  PRIMARY KEY (`id`),
  KEY `route` (`route`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=230 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_nav`
--

CREATE TABLE IF NOT EXISTS `ibos_nav` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(30) NOT NULL COMMENT '导航名字',
  `url` varchar(255) NOT NULL COMMENT '链接URL',
  `targetnew` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为本窗口打开，1为新窗口打开',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统内置',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '模块名',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为超链接，1为单页图文',
  `pageid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '单页图文关联id',
  PRIMARY KEY (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_node`
--

CREATE TABLE IF NOT EXISTS `ibos_node` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `module` varchar(30) NOT NULL COMMENT '模块名',
  `key` varchar(20) NOT NULL COMMENT '授权节点key',
  `node` varchar(20) NOT NULL COMMENT '子节点(如果有)',
  `name` varchar(20) NOT NULL COMMENT '节点名称',
  `group` varchar(20) NOT NULL COMMENT '分组',
  `category` varchar(20) NOT NULL COMMENT '分类',
  `type` enum('data','node') NOT NULL DEFAULT 'node' COMMENT '节点类型',
  `routes` text NOT NULL COMMENT '路由',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1466 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_node_related`
--

CREATE TABLE IF NOT EXISTS `ibos_node_related` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `positionid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '岗位id',
  `module` varchar(30) NOT NULL COMMENT '模块名称',
  `key` varchar(20) NOT NULL COMMENT '授权节点key',
  `node` varchar(20) NOT NULL COMMENT '节点（如果有）',
  `val` tinyint(1) NOT NULL DEFAULT '0' COMMENT '数据权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`module`,`key`,`positionid`,`node`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4001 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_notify_email`
--

CREATE TABLE IF NOT EXISTS `ibos_notify_email` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `email` varchar(250) NOT NULL COMMENT '邮件接受地址',
  `issend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已经发送',
  `title` varchar(250) NOT NULL COMMENT '邮件标题',
  `body` text NOT NULL COMMENT '邮件内容',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `sendtime` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_notify_message`
--

CREATE TABLE IF NOT EXISTS `ibos_notify_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `body` text NOT NULL COMMENT '内容',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `isread` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接地址',
  PRIMARY KEY (`id`),
  KEY `uid_read` (`uid`,`isread`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2191 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_notify_node`
--

CREATE TABLE IF NOT EXISTS `ibos_notify_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `nodeinfo` varchar(50) NOT NULL COMMENT '节点描述',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `titlekey` varchar(50) NOT NULL COMMENT '标题key',
  `contentkey` varchar(50) NOT NULL COMMENT '内容key',
  `sendemail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送邮件',
  `sendmessage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送短消息',
  `sendsms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送短信',
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '信息类型：1 表示用户发送的 2表示是系统发送的',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=300 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_notify_sms`
--

CREATE TABLE IF NOT EXISTS `ibos_notify_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` mediumint(8) NOT NULL DEFAULT '0',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  `return` varchar(255) NOT NULL,
  `posturl` varchar(255) NOT NULL,
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_onlinetime`
--

CREATE TABLE IF NOT EXISTS `ibos_onlinetime` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `thismonth` smallint(6) unsigned NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_page`
--

CREATE TABLE IF NOT EXISTS `ibos_page` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `template` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_position`
--

CREATE TABLE IF NOT EXISTS `ibos_position` (
  `positionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `catid` smallint(6) NOT NULL DEFAULT '0' COMMENT '岗位分类',
  `posname` char(20) NOT NULL COMMENT '职位名称',
  `sort` mediumint(8) NOT NULL DEFAULT '0' COMMENT '排序序号',
  `goal` text NOT NULL COMMENT '职位权限',
  `minrequirement` text NOT NULL COMMENT '最低要求',
  `number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '在职人数',
  PRIMARY KEY (`positionid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_position_category`
--

CREATE TABLE IF NOT EXISTS `ibos_position_category` (
  `catid` mediumint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位分类id',
  `pid` mediumint(5) NOT NULL DEFAULT '0' COMMENT '职位权限',
  `name` char(20) NOT NULL COMMENT '职位名称',
  `sort` mediumint(5) NOT NULL DEFAULT '0' COMMENT '排序id 默认跟cid一致自动递增',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_position_related`
--

CREATE TABLE IF NOT EXISTS `ibos_position_related` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `positionid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '岗位id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_position_responsibility`
--

CREATE TABLE IF NOT EXISTS `ibos_position_responsibility` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '职责范围与衡量标准id',
  `positionid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所属岗位的id',
  `responsibility` text NOT NULL COMMENT '职责范围',
  `criteria` text NOT NULL COMMENT '衡量标准',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_process`
--

CREATE TABLE IF NOT EXISTS `ibos_process` (
  `processid` char(32) NOT NULL COMMENT '进程id',
  `expiry` int(10) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `extra` int(10) NOT NULL DEFAULT '0' COMMENT '扩展字段',
  PRIMARY KEY (`processid`),
  KEY `expiry` (`expiry`) USING HASH
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_rc_type`
--

CREATE TABLE IF NOT EXISTS `ibos_rc_type` (
  `rcid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `classname` varchar(255) NOT NULL COMMENT '标题和文号css样式',
  `content` text NOT NULL COMMENT '原生的内容',
  `escape_content` text NOT NULL COMMENT '转义后的内容',
  PRIMARY KEY (`rcid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_regular`
--

CREATE TABLE IF NOT EXISTS `ibos_regular` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '验证规则',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型索引',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '验证规则说明',
  `regex` text NOT NULL COMMENT '正则表达式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_report`
--

CREATE TABLE IF NOT EXISTS `ibos_report` (
  `repid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '总结id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '汇报人',
  `begindate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '汇报区间开始时间',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '汇报区间结束时间',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '汇报时间',
  `typeid` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '汇报类型id',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '汇报标题',
  `content` text NOT NULL COMMENT '汇报内容',
  `attachmentid` text NOT NULL COMMENT '附件id',
  `toid` text NOT NULL COMMENT '汇报对象',
  `readeruid` text NOT NULL COMMENT '阅读人uid',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '汇报状态',
  `remark` text NOT NULL COMMENT '备注',
  `stamp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '图章',
  `isreview` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已评阅',
  `lastcommenttime` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL COMMENT '评阅内容',
  `commentline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评阅时间戳',
  `replyer` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '评阅人',
  `reminddate` int(10) NOT NULL DEFAULT '0',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`repid`),
  UNIQUE KEY `REP_ID` (`repid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_report_record`
--

CREATE TABLE IF NOT EXISTS `ibos_report_record` (
  `recordid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `repid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '汇报id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '记录内容',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '完成标记(0为未完成1为已完成)',
  `planflag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '计划标记(0为原计划,1为计划外,2为下次计划)',
  `process` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '完成进度',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间戳',
  `exedetail` varchar(255) NOT NULL DEFAULT '' COMMENT '执行情况',
  `begindate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始区间',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束区间',
  `reminddate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提醒日期，时间戳',
  PRIMARY KEY (`recordid`),
  KEY `REP_ID` (`repid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=986 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_report_statistics`
--

CREATE TABLE IF NOT EXISTS `ibos_report_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `repid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总结ID',
  `typeid` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '汇报类型id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户UID',
  `stamp` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '图章id',
  `integration` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `scoretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评分时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_ID` (`repid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE,
  KEY `SCORE_TIME` (`scoretime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_report_type`
--

CREATE TABLE IF NOT EXISTS `ibos_report_type` (
  `typeid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '汇报类型id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型排序',
  `typename` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名字',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `intervaltype` tinyint(1) unsigned NOT NULL COMMENT '区间(0:周 1:月 2:季 3:半年 4:年 5:其他)',
  `intervals` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '自定义的间隔日期',
  `issystype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是系统自带类型',
  PRIMARY KEY (`typeid`),
  UNIQUE KEY `TYPE_ID` (`typeid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_resume`
--

CREATE TABLE IF NOT EXISTS `ibos_resume` (
  `resumeid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '简历id',
  `input` mediumint(8) NOT NULL DEFAULT '0' COMMENT '添加简历者uid',
  `positionid` smallint(6) NOT NULL DEFAULT '0' COMMENT '适合职位id',
  `entrytime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `remark` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `remarktime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '备注时间',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '标记',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '简历状态(1:面试中 2:录取3:入职4:待安排5：淘汰)',
  `statustime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '改变状态的日期时间戳，取0点',
  PRIMARY KEY (`resumeid`),
  UNIQUE KEY `ID` (`resumeid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `flag` (`flag`) USING BTREE,
  KEY `entrytime` (`entrytime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_resume_bgchecks`
--

CREATE TABLE IF NOT EXISTS `ibos_resume_bgchecks` (
  `checkid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resumeid` int(11) NOT NULL DEFAULT '0' COMMENT '简历id',
  `company` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '公司地址',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `fax` varchar(255) NOT NULL DEFAULT '' COMMENT '传真',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `position` varchar(255) NOT NULL DEFAULT '' COMMENT '职务',
  `entrytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入职时间',
  `quittime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '离职时间',
  `detail` text NOT NULL COMMENT '详细内容',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户UID',
  PRIMARY KEY (`checkid`),
  UNIQUE KEY `checkid` (`checkid`) USING BTREE,
  KEY `resumeid` (`resumeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_resume_contact`
--

CREATE TABLE IF NOT EXISTS `ibos_resume_contact` (
  `contactid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '联系id',
  `resumeid` mediumint(11) NOT NULL DEFAULT '0' COMMENT '简历id',
  `input` tinyint(4) NOT NULL DEFAULT '0' COMMENT '录入者',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `purpose` varchar(255) NOT NULL DEFAULT '' COMMENT '联系目的',
  `detail` text NOT NULL COMMENT '沟通内容',
  PRIMARY KEY (`contactid`),
  UNIQUE KEY `contactid` (`contactid`) USING BTREE,
  KEY `resumeid` (`resumeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_resume_detail`
--

CREATE TABLE IF NOT EXISTS `ibos_resume_detail` (
  `detailid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '详细信息id',
  `resumeid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '对应的简历id',
  `positionid` smallint(6) NOT NULL DEFAULT '0' COMMENT '目标职位id',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '名字',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别\n(0:不详 1:男 2:女)',
  `birthday` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出生日期',
  `maritalstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚姻状况\n(0:未婚 1:已婚 2:不详)',
  `residecity` varchar(255) NOT NULL DEFAULT '' COMMENT '居住城市',
  `idcard` varchar(255) NOT NULL DEFAULT '' COMMENT '证件号码',
  `birthplace` varchar(255) NOT NULL DEFAULT '' COMMENT '籍贯',
  `height` varchar(255) NOT NULL DEFAULT '' COMMENT '身高',
  `weight` varchar(255) NOT NULL DEFAULT '' COMMENT '体重',
  `workyears` varchar(10) NOT NULL DEFAULT '' COMMENT '工作年限',
  `education` varchar(255) NOT NULL DEFAULT '' COMMENT '学历',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ号码',
  `msn` varchar(64) NOT NULL DEFAULT '' COMMENT 'msn号码',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `telephone` varchar(255) NOT NULL DEFAULT '' COMMENT '固定电话',
  `zipcode` varchar(255) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `selfevaluation` text NOT NULL COMMENT '自我评价',
  `workexperience` text NOT NULL COMMENT '工作经历',
  `computerskill` text NOT NULL COMMENT '计算机技能',
  `eduexperience` text NOT NULL COMMENT '教育经历',
  `langskill` text NOT NULL COMMENT '语言水平',
  `professionskill` text NOT NULL COMMENT '职业技能',
  `trainexperience` text NOT NULL COMMENT '培训经历',
  `attachmentid` text NOT NULL COMMENT '附件ID',
  `recchannel` varchar(255) NOT NULL DEFAULT '' COMMENT '简历来源',
  `projectexperience` text NOT NULL COMMENT '项目经验',
  `relevantcertificates` text NOT NULL COMMENT '相关证书',
  `expectsalary` varchar(255) NOT NULL DEFAULT '' COMMENT '期望月薪',
  `workplace` varchar(255) NOT NULL DEFAULT '' COMMENT '工作地点',
  `beginworkday` varchar(255) NOT NULL DEFAULT '' COMMENT '到岗时间',
  `socialpractice` text NOT NULL COMMENT '社会实践',
  `avatarid` text NOT NULL COMMENT '头像',
  PRIMARY KEY (`detailid`),
  UNIQUE KEY `detailid` (`detailid`) USING BTREE,
  KEY `resumeid` (`resumeid`) USING BTREE,
  KEY `realname` (`realname`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_resume_interview`
--

CREATE TABLE IF NOT EXISTS `ibos_resume_interview` (
  `interviewid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '面试id',
  `resumeid` int(11) NOT NULL DEFAULT '0' COMMENT '简历id',
  `interviewtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '面试时间',
  `interviewer` mediumint(8) NOT NULL DEFAULT '0' COMMENT '面试人',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '面试方法',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '面试类型',
  `process` text NOT NULL COMMENT '面试过程',
  PRIMARY KEY (`interviewid`),
  UNIQUE KEY `interviewid` (`interviewid`) USING BTREE,
  KEY `resumeid` (`resumeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_resume_statistics`
--

CREATE TABLE IF NOT EXISTS `ibos_resume_statistics` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `new` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增数量',
  `pending` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '待安排数量',
  `interview` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '面试数量',
  `employ` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录用数量',
  `eliminate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '淘汰数量',
  `datetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日期时间戳',
  PRIMARY KEY (`id`),
  KEY `datetime` (`datetime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_session`
--

CREATE TABLE IF NOT EXISTS `ibos_session` (
  `sid` char(6) NOT NULL DEFAULT '',
  `ip1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `action` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastolupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid` (`sid`),
  KEY `uid` (`uid`) USING HASH
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_setting`
--

CREATE TABLE IF NOT EXISTS `ibos_setting` (
  `skey` varchar(255) NOT NULL DEFAULT '' COMMENT '键',
  `svalue` text NOT NULL COMMENT '值',
  PRIMARY KEY (`skey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_stamp`
--

CREATE TABLE IF NOT EXISTS `ibos_stamp` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '显示名称',
  `stamp` varchar(30) NOT NULL DEFAULT '' COMMENT '图章地址',
  `icon` varchar(30) NOT NULL DEFAULT '' COMMENT '图标地址',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统自带图章',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_syscache`
--

CREATE TABLE IF NOT EXISTS `ibos_syscache` (
  `name` varchar(32) NOT NULL COMMENT '缓存类型名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '缓存类型，1为数组，其余为0',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '时间戳',
  `value` mediumblob NOT NULL COMMENT '值',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_syscode`
--

CREATE TABLE IF NOT EXISTS `ibos_syscode` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `number` varchar(50) NOT NULL COMMENT '代码',
  `sort` mediumint(8) NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(50) NOT NULL COMMENT '系统代码描述',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统代码',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '系统代码图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`pid`,`number`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_tasks`
--

CREATE TABLE IF NOT EXISTS `ibos_tasks` (
  `id` varchar(50) NOT NULL DEFAULT '' COMMENT '任务ID，由前台传递',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '任务主题',
  `pid` varchar(50) NOT NULL DEFAULT '' COMMENT '父级任务的ID',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `date` varchar(10) NOT NULL DEFAULT '' COMMENT '完成日期',
  `complete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '完成状态(0为未完成，1为完成)',
  `allcomplete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '父、子级所有任务完成状态(0为未完成，1为完成)',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '任务所属的用户ID',
  `upuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上司的ID(添加人是上司时)',
  `isupper` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是上属添加的任务(0为自己添加的任务，1为上属添加的任务)',
  `mark` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否标记',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`complete`,`uid`,`upuid`,`isupper`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_user`
--

CREATE TABLE IF NOT EXISTS `ibos_user` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` char(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `isadministrator` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id标识: 0为非管理员，1为管理员',
  `deptid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `positionid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `upuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '直属领导id ',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `jobnumber` char(20) NOT NULL DEFAULT '' COMMENT '工号',
  `realname` char(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别\n(0女1男)',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `email` char(50) NOT NULL COMMENT '邮箱',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `credits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总积分',
  `newcomer` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否新成员标识',
  `salt` char(6) NOT NULL COMMENT '用户身份验证码',
  `validationemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证了邮件地址( (1为已验证0为未验证)',
  `validationmobile` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证了手机号码 (1为已验证0为未验证)',
  `lastchangepass` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改密码的时间',
  `guid` char(36) NOT NULL DEFAULT '' COMMENT '用户的唯一ID',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `mobile` (`mobile`),
  KEY `email` (`email`),
  KEY `jobnumber` (`jobnumber`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_user_binding`
--

CREATE TABLE IF NOT EXISTS `ibos_user_binding` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `bindvalue` text NOT NULL COMMENT '绑定的值',
  `app` char(30) NOT NULL COMMENT '绑定的类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidandapp` (`uid`,`app`),
  KEY `uid` (`uid`),
  KEY `app` (`app`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_user_count`
--

CREATE TABLE IF NOT EXISTS `ibos_user_count` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `extcredits1` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分1',
  `extcredits2` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分2',
  `extcredits3` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分3',
  `extcredits4` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分4',
  `extcredits5` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分5',
  `attachsize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总附件大小',
  `oltime` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '在线时间',
  `feeds` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '动态数',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_user_data`
--

CREATE TABLE IF NOT EXISTS `ibos_user_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户UID',
  `key` varchar(50) NOT NULL COMMENT 'Key',
  `value` text COMMENT '对应Key的 值',
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '当前时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user-key` (`uid`,`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3122 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_user_follow`
--

CREATE TABLE IF NOT EXISTS `ibos_user_follow` (
  `followid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '关注者ID',
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '被关注者ID',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '关注时间',
  PRIMARY KEY (`followid`),
  UNIQUE KEY `uid-fid` (`uid`,`fid`),
  UNIQUE KEY `fid-uid` (`fid`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=160 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_user_group`
--

CREATE TABLE IF NOT EXISTS `ibos_user_group` (
  `gid` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `grade` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '组头衔',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统自带：1为是；0为否',
  `creditshigher` int(10) NOT NULL DEFAULT '0' COMMENT '该组的积分上限',
  `creditslower` int(10) NOT NULL DEFAULT '0' COMMENT '该组的积分下限',
  PRIMARY KEY (`gid`),
  KEY `creditsrange` (`creditshigher`,`creditslower`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_user_profile`
--

CREATE TABLE IF NOT EXISTS `ibos_user_profile` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `birthday` int(11) unsigned NOT NULL DEFAULT '0',
  `telephone` varchar(255) NOT NULL DEFAULT '' COMMENT '住宅电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `qq` varchar(255) NOT NULL DEFAULT '' COMMENT 'QQ',
  `bio` varchar(255) NOT NULL COMMENT '自我介绍',
  `remindsetting` text NOT NULL COMMENT '提醒设置',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户资料表';

-- --------------------------------------------------------

--
-- 表的结构 `ibos_user_status`
--

CREATE TABLE IF NOT EXISTS `ibos_user_status` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户UID',
  `regip` char(15) NOT NULL DEFAULT '' COMMENT '注册IP',
  `lastip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后活动',
  `invisible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐身登录',
  PRIMARY KEY (`uid`),
  KEY `lastactivity` (`lastactivity`,`invisible`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户状态表';

-- --------------------------------------------------------

--
-- 表的结构 `ibos_vote`
--

CREATE TABLE IF NOT EXISTS `ibos_vote` (
  `voteid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `ismulti` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否多选: 0：单选；1：多选',
  `isvisible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '投票结果查看权限，0：所有人可见、1：投票后可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0：有效 、1：无效、2：结束',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发布者UID',
  `deadlinetype` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '截至日期类型：0自定义，1周，2月，3半年，4年',
  `maxselectnum` tinyint(2) NOT NULL DEFAULT '1' COMMENT '最大可选择数',
  `relatedmodule` varchar(64) NOT NULL DEFAULT '' COMMENT '模块名称',
  `relatedid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '该模块表下id列的值',
  PRIMARY KEY (`voteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_vote_item`
--

CREATE TABLE IF NOT EXISTS `ibos_vote_item` (
  `itemid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票项id',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '投票id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '投票项内容',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '投票项类型：1、内容；2、图片',
  `number` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '投票数',
  `picpath` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

-- --------------------------------------------------------

--
-- 表的结构 `ibos_vote_item_count`
--

CREATE TABLE IF NOT EXISTS `ibos_vote_item_count` (
  `itemid` mediumint(8) unsigned NOT NULL COMMENT '投票项ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  UNIQUE KEY `itemid` (`itemid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
