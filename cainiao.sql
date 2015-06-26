-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.17 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 cainiao 的数据库结构
CREATE DATABASE IF NOT EXISTS `a0420200711` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `a0420200711`;


-- 导出  表 cainiao.cn_article 结构
CREATE TABLE IF NOT EXISTS `cn_article` (
  `id`         INT(10) NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  `title`      VARCHAR(100)     DEFAULT NULL
  COMMENT '标题',
  `content`    TEXT COMMENT '内容',
  `categoryid` INT(10) NOT NULL
  COMMENT '类别id',
  `addtime`    VARCHAR(11)      DEFAULT NULL
  COMMENT '添加时间',
  `addip`      VARCHAR(15)      DEFAULT NULL
  COMMENT '添加ip',
  `updatetime` VARCHAR(11)      DEFAULT NULL
  COMMENT '最后修改时间',
  `updateip`   VARCHAR(15)      DEFAULT NULL
  COMMENT '最后修改ip',
  `writer`     VARCHAR(50)      DEFAULT NULL
  COMMENT '作者',
  `status`     SMALLINT(6)      DEFAULT '1'
  COMMENT '状态1是正常2是禁用-1是删除',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '文章表';

-- 正在导出表  cainiao.cn_article 的数据：~0 rows (大约)
DELETE FROM `cn_article`;
/*!40000 ALTER TABLE `cn_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `cn_article` ENABLE KEYS */;


-- 导出  表 cainiao.cn_category 结构
CREATE TABLE IF NOT EXISTS `cn_category` (
  `id`     INT(10)     NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  `name`   VARCHAR(50) NOT NULL
  COMMENT '名称',
  `pid`    SMALLINT(6) NOT NULL DEFAULT '1'
  COMMENT '父级导航id,0代表是父级导航',
  `type`   SMALLINT(6) NOT NULL DEFAULT '0'
  COMMENT '导航类型，1代表是列表页面,2代表是单页面',
  `rank`   SMALLINT(6) NOT NULL
  COMMENT '显示顺序',
  `status` SMALLINT(6) NOT NULL DEFAULT '1'
  COMMENT '状态,1是正常显示，2是禁用',
  `image`  VARCHAR(50)          DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '类别';

-- 正在导出表  cainiao.cn_category 的数据：~0 rows (大约)
DELETE FROM `cn_category`;
/*!40000 ALTER TABLE `cn_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cn_category` ENABLE KEYS */;


-- 导出  表 cainiao.cn_check_log 结构
CREATE TABLE IF NOT EXISTS `cn_check_log` (
  `id`            INT(10)     NOT NULL AUTO_INCREMENT,
  `ip_address`    VARCHAR(15) NOT NULL
  COMMENT 'ip地址',
  `error_content` VARCHAR(50) NOT NULL
  COMMENT '错误内容',
  `add_time`      INT(11) UNSIGNED     DEFAULT NULL
  COMMENT '添加时间',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COMMENT = '检查登录表';

-- 正在导出表  cainiao.cn_check_log 的数据：~4 rows (大约)
DELETE FROM `cn_check_log`;
/*!40000 ALTER TABLE `cn_check_log` DISABLE KEYS */;
INSERT INTO `cn_check_log` (`id`, `ip_address`, `error_content`, `add_time`) VALUES
  (1, '127.0.0.1', '用户名或密码错误', 1402030958),
  (2, '127.0.0.1', '用户名或密码错误', 1426039496),
  (3, '127.0.0.1', '用户名或密码错误', 1426039615),
  (4, '127.0.0.1', '用户名或密码错误', 1426040233);
/*!40000 ALTER TABLE `cn_check_log` ENABLE KEYS */;


-- 导出  表 cainiao.cn_config_admin 结构
CREATE TABLE IF NOT EXISTS `cn_config_admin` (
  `name`                 VARCHAR(50) NOT NULL
  COMMENT '后台名称',
  `logo`                 VARCHAR(50)         DEFAULT NULL
  COMMENT '后台logo，位于assets/web/logo目录下',
  `resources`            VARCHAR(50) NOT NULL
  COMMENT '资源存放文件夹，位于根目录下',
  `css`                  VARCHAR(50) NOT NULL
  COMMENT 'CSS存放文件夹，位于assets/admin目录下',
  `js`                   VARCHAR(50) NOT NULL
  COMMENT 'JS存放文件夹，位于assets/admin目录下',
  `img`                  VARCHAR(50) NOT NULL
  COMMENT 'img存放文件夹，位于assets/admin目录下',
  `editor`               VARCHAR(50) NOT NULL
  COMMENT '在线编辑器存放文件夹，位于assets/admin目录下',
  `art`                  VARCHAR(50) NOT NULL
  COMMENT '弹窗存放文件夹，位于assets/admin目录下',
  `uploads`              VARCHAR(50) NOT NULL
  COMMENT '上传存放文件夹，位于assets/admin目录下',
  `valicode`             VARCHAR(50) NOT NULL
  COMMENT '验证码文件夹，位于assets/admin目录下',
  `upload_image_size`    INT(10) UNSIGNED    DEFAULT '1048576'
  COMMENT '上传图片大小，默认 1048576 byte',
  `upload_flash_size`    INT(10) UNSIGNED    DEFAULT '1048576'
  COMMENT '上传动画大小，默认 1048576 byte',
  `upload_media_size`    INT(10) UNSIGNED    DEFAULT '1048576'
  COMMENT '上传视频大小，默认 1048576 byte',
  `upload_file_size`     INT(10) UNSIGNED    DEFAULT '1048576'
  COMMENT '上传文件大小，默认 1048576 byte',
  `encryption_key_begin` VARCHAR(20) NOT NULL
  COMMENT '开始密钥',
  `encryption_key_end`   VARCHAR(20) NOT NULL
  COMMENT '结束密钥',
  `theme`                VARCHAR(50)         DEFAULT 'default'
  COMMENT '后台主题，位于 application/views 下',
  `email_status`         TINYINT(1) UNSIGNED DEFAULT '2'
  COMMENT '开启邮件，2是关闭，1是开启，默认是2',
  `email_smtp`           VARCHAR(20)         DEFAULT NULL
  COMMENT 'SMTP服务器地址',
  `email_port`           TINYINT(2) UNSIGNED DEFAULT '25'
  COMMENT 'SMTP服务器端口，默认25',
  `email_title`          VARCHAR(50)         DEFAULT '测试邮箱'
  COMMENT '邮件标题',
  `email_username`       VARCHAR(50)         DEFAULT NULL
  COMMENT '邮件署名',
  `email_user`           VARCHAR(50)         DEFAULT NULL
  COMMENT '发件人电子邮箱',
  `email_password`       VARCHAR(50)         DEFAULT NULL
  COMMENT '发件人电子邮箱密码',
  `email_content`        VARCHAR(50)         DEFAULT '这是一个测试邮件'
  COMMENT '邮件测试内容'
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COMMENT = '后台配置表';

-- 正在导出表  cainiao.cn_config_admin 的数据：1 rows
DELETE FROM `cn_config_admin`;
/*!40000 ALTER TABLE `cn_config_admin` DISABLE KEYS */;
INSERT INTO `cn_config_admin` (`name`, `logo`, `resources`, `css`, `js`, `img`, `editor`, `art`, `uploads`, `valicode`, `upload_image_size`, `upload_flash_size`, `upload_media_size`, `upload_file_size`, `encryption_key_begin`, `encryption_key_end`, `theme`, `email_status`, `email_smtp`, `email_port`, `email_title`, `email_username`, `email_user`, `email_password`, `email_content`)
VALUES
  ('后台管理', 'logo20.png', 'assets', 'css', 'js', 'img', 'kindeditor', 'artDialog', 'uploads', 'valicode', 1048576,
   1048576, 1048576, 1048576, 'ushiba', '7788', 'default', 1, '', 25, '测试', '有事吧', '', 'anhui99', '这是一个测试邮件');
/*!40000 ALTER TABLE `cn_config_admin` ENABLE KEYS */;


-- 导出  表 cainiao.cn_config_web 结构
CREATE TABLE IF NOT EXISTS `cn_config_web` (
  `name`                 VARCHAR(50)  NOT NULL
  COMMENT '站点名称',
  `logo`                 VARCHAR(50)         DEFAULT NULL
  COMMENT '站点logo，位于assets/web/logo目录下',
  `icp`                  VARCHAR(50)         DEFAULT NULL
  COMMENT '站点备案号',
  `statistical_code`     TEXT COMMENT '站点统计代码',
  `share_code`           TEXT COMMENT '站点分享代码',
  `keywords`             VARCHAR(200) NOT NULL
  COMMENT '站点关键字',
  `description`          VARCHAR(200) NOT NULL
  COMMENT '站点描述',
  `resources`            VARCHAR(50)  NOT NULL
  COMMENT '资源存放文件夹，位于根目录下',
  `css`                  VARCHAR(50)  NOT NULL
  COMMENT 'CSS存放文件夹，位于assets/web目录下',
  `js`                   VARCHAR(50)  NOT NULL
  COMMENT 'JS存放文件夹，位于assets/web目录下',
  `img`                  VARCHAR(50)  NOT NULL
  COMMENT 'img存放文件夹，位于assets/web目录下',
  `editor`               VARCHAR(50)  NOT NULL
  COMMENT '在线编辑器存放文件夹，位于assets/web目录下',
  `art`                  VARCHAR(50)  NOT NULL
  COMMENT '弹窗存放文件夹，位于assets/admin目录下',
  `uploads`              VARCHAR(50)  NOT NULL
  COMMENT '上传存放文件夹，位于assets/web目录下',
  `valicode`             VARCHAR(50)  NOT NULL
  COMMENT '验证码文件夹，位于assets/web目录下',
  `upload_image_size`    INT(10) UNSIGNED    DEFAULT '1048576'
  COMMENT '上传图片大小',
  `upload_flash_size`    INT(10) UNSIGNED    DEFAULT '1048576'
  COMMENT '上传动画大小',
  `upload_media_size`    INT(10) UNSIGNED    DEFAULT '1048576'
  COMMENT '上传视频大小',
  `upload_file_size`     INT(10) UNSIGNED    DEFAULT '1048576'
  COMMENT '上传文件大小',
  `encryption_key_begin` VARCHAR(20)         DEFAULT NULL
  COMMENT '开始密钥',
  `encryption_key_end`   VARCHAR(20)         DEFAULT NULL
  COMMENT '结束密钥',
  `status`               TINYINT(1) UNSIGNED DEFAULT '1'
  COMMENT '站点状态，1 = 正常，2 = 关闭',
  `close_reason`         VARCHAR(200)        DEFAULT NULL
  COMMENT '站点关闭原因',
  `reg_agreement`        TEXT COMMENT '站点注册协议',
  `theme`                VARCHAR(50)         DEFAULT 'default'
  COMMENT '站点主题，位于 application/views 下',
  `email_status`         TINYINT(1) UNSIGNED DEFAULT '2'
  COMMENT '开启邮件，2是关闭，1是开启，默认是2',
  `email_smtp`           VARCHAR(20)         DEFAULT NULL
  COMMENT 'SMTP服务器地址',
  `email_port`           TINYINT(2) UNSIGNED DEFAULT '25'
  COMMENT 'SMTP服务器端口，默认25',
  `email_title`          VARCHAR(50)         DEFAULT '测试邮箱'
  COMMENT '测试邮箱',
  `email_username`       VARCHAR(50)         DEFAULT NULL
  COMMENT '邮件署名',
  `email_user`           VARCHAR(50)         DEFAULT NULL
  COMMENT '发件人电子邮箱',
  `email_password`       VARCHAR(50)         DEFAULT NULL
  COMMENT '发件人电子邮箱密码',
  `email_content`        VARCHAR(50)         DEFAULT '这是一个测试邮件'
  COMMENT '邮件测试内容'
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COMMENT = '站点配置表';

-- 正在导出表  cainiao.cn_config_web 的数据：1 rows
DELETE FROM `cn_config_web`;
/*!40000 ALTER TABLE `cn_config_web` DISABLE KEYS */;
INSERT INTO `cn_config_web` (`name`, `logo`, `icp`, `statistical_code`, `share_code`, `keywords`, `description`, `resources`, `css`, `js`, `img`, `editor`, `art`, `uploads`, `valicode`, `upload_image_size`, `upload_flash_size`, `upload_media_size`, `upload_file_size`, `encryption_key_begin`, `encryption_key_end`, `status`, `close_reason`, `reg_agreement`, `theme`, `email_status`, `email_smtp`, `email_port`, `email_title`, `email_username`, `email_user`, `email_password`, `email_content`)
VALUES
  ('前台', 'logo.png', '', '', '', '有事吧，有事没事都来吧。', '有事吧，有事没事都来吧。', 'assets', 'css', 'js', 'img', 'kindeditor',
   'artDialog', 'uploads', 'valicode', 1048576, 1048576, 1048576, 1048576, 'ushiba', '7788', 2, '网站维护升级中...', '测试',
   'default', 2, '', 25, '测试邮箱', NULL, '', 'anhui99', '这是一个测试邮件');
/*!40000 ALTER TABLE `cn_config_web` ENABLE KEYS */;


-- 导出  表 cainiao.cn_email_log 结构
CREATE TABLE IF NOT EXISTS `cn_email_log` (
  `id`          INT(11)                      NOT NULL AUTO_INCREMENT
  COMMENT 'id',
  `type`        TINYINT(1) UNSIGNED          NOT NULL
  COMMENT '类型1是忘记密码邮件2是注册邮件',
  `title`       VARCHAR(50)                  NOT NULL
  COMMENT '邮件标题',
  `content`     TEXT                         NOT NULL
  COMMENT '邮件内容',
  `email`       VARCHAR(50)                  NOT NULL
  COMMENT '接收电子邮箱地址',
  `status`      TINYINT(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0'
  COMMENT '0未发送，1发送成功，2发送失败',
  `addtime`     INT(10) UNSIGNED                      DEFAULT NULL
  COMMENT '添加时间',
  `sendtime`    INT(10) UNSIGNED                      DEFAULT NULL
  COMMENT '发送时间',
  `addip`       VARCHAR(50)                  NOT NULL
  COMMENT '添加ip',
  `active_time` INT(10) UNSIGNED                      DEFAULT '0'
  COMMENT '激活时间',
  `code`        VARCHAR(10)                  NOT NULL
  COMMENT '激活码',
  `url`         VARCHAR(100)                 NOT NULL
  COMMENT '激活地址',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '邮件记录表';

-- 正在导出表  cainiao.cn_email_log 的数据：~0 rows (大约)
DELETE FROM `cn_email_log`;
/*!40000 ALTER TABLE `cn_email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cn_email_log` ENABLE KEYS */;


-- 导出  表 cainiao.cn_link 结构
CREATE TABLE IF NOT EXISTS `cn_link` (
  `id`               INT(11)      NOT NULL AUTO_INCREMENT,
  `name`             VARCHAR(50)  NOT NULL
  COMMENT '名称',
  `url`              VARCHAR(200) NOT NULL
  COMMENT '网址',
  `rank`             SMALLINT(6)           DEFAULT NULL
  COMMENT '排序',
  `thumb`            VARCHAR(100)          DEFAULT NULL
  COMMENT '图片',
  `addtime`          VARCHAR(10)  NOT NULL
  COMMENT '添加时间',
  `updatetime`       VARCHAR(10)  NOT NULL
  COMMENT '更新时间',
  `addip`            VARCHAR(15)  NOT NULL
  COMMENT '添加ip',
  `updateip`         VARCHAR(15)  NOT NULL
  COMMENT '更新ip',
  `addip_address`    VARCHAR(50)           DEFAULT NULL
  COMMENT '添加ip地址',
  `updateip_address` VARCHAR(50)           DEFAULT NULL
  COMMENT '更新ip地址',
  `status`           SMALLINT(6)  NOT NULL
  COMMENT '状态1是正常',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8
  COMMENT = '友情链接';

-- 正在导出表  cainiao.cn_link 的数据：~0 rows (大约)
DELETE FROM `cn_link`;
/*!40000 ALTER TABLE `cn_link` DISABLE KEYS */;
INSERT INTO `cn_link` (`id`, `name`, `url`, `rank`, `thumb`, `addtime`, `updatetime`, `addip`, `updateip`, `addip_address`, `updateip_address`, `status`)
VALUES
  (1, '百度', 'http://www.baidu.com', 0,
   '/admin/../assets/admin/default/uploads/image/20140611/886649a7bbd8aee9b10d34c724088391.jpg', '1402461952', '',
   '127.0.0.1', '', NULL, NULL, 1);
/*!40000 ALTER TABLE `cn_link` ENABLE KEYS */;


-- 导出  表 cainiao.cn_manager 结构
CREATE TABLE IF NOT EXISTS `cn_manager` (
  `id`            INT(10)     NOT NULL AUTO_INCREMENT,
  `username`      VARCHAR(50) NOT NULL
  COMMENT '用户名',
  `password`      VARCHAR(50)          DEFAULT '3a0f0fee92a4fd13fb3f1c2bfcb3eac5'
  COMMENT '密码',
  `nickname`      VARCHAR(50)          DEFAULT NULL
  COMMENT '昵称',
  `phone`         VARCHAR(11)          DEFAULT NULL
  COMMENT '手机',
  `phone_status`  TINYINT(1)           DEFAULT '2'
  COMMENT '手机认证状态：1是认证2是未认证',
  `email`         VARCHAR(50) NOT NULL
  COMMENT '邮箱',
  `email_status`  TINYINT(1)  NOT NULL DEFAULT '2'
  COMMENT '邮箱激活状态：1是激活2是未激活',
  `role_id`       INT(11)     NOT NULL
  COMMENT '角色id',
  `status`        TINYINT(1) UNSIGNED  DEFAULT '1'
  COMMENT '1是正常，2是禁用',
  `skin`          VARCHAR(20)          DEFAULT 'cerulean'
  COMMENT '主题',
  `last_log_time` INT(10) UNSIGNED     DEFAULT NULL
  COMMENT '上次登录时间',
  `now_log_time`  INT(10) UNSIGNED     DEFAULT NULL
  COMMENT '现在登录时间',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COMMENT = '后台管理员表';

-- 正在导出表  cainiao.cn_manager 的数据：~1 rows (大约)
DELETE FROM `cn_manager`;
/*!40000 ALTER TABLE `cn_manager` DISABLE KEYS */;
INSERT INTO `cn_manager` (`id`, `username`, `password`, `nickname`, `phone`, `phone_status`, `email`, `email_status`, `role_id`, `status`, `skin`, `last_log_time`, `now_log_time`)
VALUES
  (1, 'admin', '3a0f0fee92a4fd13fb3f1c2bfcb3eac5', '超级管理员', '13989373135', 1, 'shangshanxiaoyao@163.com', 1, 1, 1,
   'classic', 1426042325, 1426042352),
  (2, '123456', '3a0f0fee92a4fd13fb3f1c2bfcb3eac5', '', '', 2, '707069100@qq.com', 2, 2, 1, 'cerulean', NULL,
   1426042310);
/*!40000 ALTER TABLE `cn_manager` ENABLE KEYS */;


-- 导出  表 cainiao.cn_manager_logging 结构
CREATE TABLE IF NOT EXISTS `cn_manager_logging` (
  `id`         INT(10)          NOT NULL AUTO_INCREMENT,
  `username`   VARCHAR(50)      NOT NULL DEFAULT '0'
  COMMENT '管理员id',
  `activity`   VARCHAR(500)              DEFAULT NULL
  COMMENT '活动',
  `url`        VARCHAR(50)               DEFAULT NULL
  COMMENT 'url',
  `role_id`    INT(10) UNSIGNED NOT NULL
  COMMENT '角色id',
  `time`       INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '添加时间',
  `ip`         VARCHAR(50)      NOT NULL
  COMMENT 'ip',
  `ip_address` VARCHAR(50)               DEFAULT NULL
  COMMENT 'ip地址',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 151
  DEFAULT CHARSET = utf8mb4
  COMMENT = '登录、活动、日志表';

-- 正在导出表  cainiao.cn_manager_logging 的数据：~150 rows (大约)
DELETE FROM `cn_manager_logging`;
/*!40000 ALTER TABLE `cn_manager_logging` DISABLE KEYS */;
INSERT INTO `cn_manager_logging` (`id`, `username`, `activity`, `url`, `role_id`, `time`, `ip`, `ip_address`) VALUES
  (1, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1397629922, '127.0.0.1', NULL),
  (2, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][首页][1][1]', 'category/form', 1, 1397630003, '127.0.0.1', NULL),
  (3, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][会员概况][1][1]', 'category/form', 1, 1397630353, '127.0.0.1', NULL),
  (4, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[2][会员数据统计][1][1]', 'category/form', 1, 1397630399, '127.0.0.1', NULL),
  (5, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[2][执常委名录][2][1]', 'category/form', 1, 1397630478, '127.0.0.1', NULL),
  (6, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[2][团体会员][3][1]', 'category/form', 1, 1397630489, '127.0.0.1', NULL),
  (7, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][全国工商联章程][2][1]', 'category/form', 1, 1397630497, '127.0.0.1', NULL),
  (8, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[1][入会申请][1]', 'category/form/6', 1, 1397630513, '127.0.0.1', NULL),
  (9, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][全国工商联章程][1][1]', 'category/form', 1, 1397630528, '127.0.0.1', NULL),
  (10, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][宁波市商会章程][2][1]', 'category/form', 1, 1397630536, '127.0.0.1', NULL),
  (11, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][入会须知][3][1]', 'category/form', 1, 1397630546, '127.0.0.1', NULL),
  (12, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][入会申请][4][1]', 'category/form', 1, 1397630558, '127.0.0.1', NULL),
  (13, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][基层组织][3][1]', 'category/form', 1, 1397630573, '127.0.0.1', NULL),
  (14, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][基层组织动态][1][1]', 'category/form', 1, 1397630620, '127.0.0.1', NULL),
  (15, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][基层组织概况][2][1]', 'category/form', 1, 1397630629, '127.0.0.1', NULL),
  (16, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][直属商会][3][1]', 'category/form', 1, 1397630637, '127.0.0.1', NULL),
  (17, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][经验交流][4][1]', 'category/form', 1, 1397630646, '127.0.0.1', NULL),
  (18, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][参政议政][4][1]', 'category/form', 1, 1397630658, '127.0.0.1', NULL),
  (19, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[16][委员名录][1][1]', 'category/form', 1, 1397630668, '127.0.0.1', NULL),
  (20, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[16][团体提案][2][1]', 'category/form', 1, 1397630677, '127.0.0.1', NULL),
  (21, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[16][委员之声][3][1]', 'category/form', 1, 1397630685, '127.0.0.1', NULL),
  (22, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[16][调研报告][4][1]', 'category/form', 1, 1397630694, '127.0.0.1', NULL),
  (23, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][经济服务][5][1]', 'category/form', 1, 1397630703, '127.0.0.1', NULL),
  (24, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][融资服务][1][1]', 'category/form', 1, 1397630711, '127.0.0.1', NULL),
  (25, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][财经广角][2][1]', 'category/form', 1, 1397630723, '127.0.0.1', NULL),
  (26, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][会展资讯][3][1]', 'category/form', 1, 1397630732, '127.0.0.1', NULL),
  (27, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][教育培训][4][1]', 'category/form', 1, 1397630740, '127.0.0.1', NULL),
  (28, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][土地厂房供求信息][5][1]', 'category/form', 1, 1397630749, '127.0.0.1', NULL),
  (29, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][企业文化][6][1]', 'category/form', 1, 1397630757, '127.0.0.1', NULL),
  (30, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[27][企业文化论坛][1][1]', 'category/form', 1, 1397630764, '127.0.0.1', NULL),
  (31, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[27][企业文化动态][2][1]', 'category/form', 1, 1397630809, '127.0.0.1', NULL),
  (32, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[27][经验交流][3][1]', 'category/form', 1, 1397630817, '127.0.0.1', NULL),
  (33, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][光彩事件][7][1]', 'category/form', 1, 1397630831, '127.0.0.1', NULL),
  (34, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[31][光彩事业简介][1][1]', 'category/form', 1, 1397630840, '127.0.0.1', NULL),
  (35, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[31][光彩事业倡议书][2][1]', 'category/form', 1, 1397630855, '127.0.0.1', NULL),
  (36, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[31][光彩事业章程][3][1]', 'category/form', 1, 1397630866, '127.0.0.1', NULL),
  (37, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[31][光彩事业动态][4][1]', 'category/form', 1, 1397630874, '127.0.0.1', NULL),
  (38, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][培机构][8][1]', 'category/form', 1, 1397630893, '127.0.0.1', NULL),
  (39, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][公告通知][9][1]', 'category/form', 1, 1397630900, '127.0.0.1', NULL),
  (40, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[1][培训机构][1]', 'category/form/36', 1, 1397630917, '127.0.0.1', NULL),
  (41, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1397694795, '127.0.0.1', NULL),
  (42, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1399430555, '127.0.0.1', NULL),
  (43, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1399431885, '127.0.0.1', NULL),
  (44, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1400222529, '127.0.0.1', NULL),
  (45, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1400809676, '127.0.0.1', NULL),
  (46, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1400810874, '127.0.0.1', NULL),
  (47, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1400827824, '127.0.0.1', NULL),
  (48, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401848108, '127.0.0.1', NULL),
  (49, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401865492, '127.0.0.1', NULL),
  (50, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[0][fdgdsg][10][1]', 'category/form', 1, 1401865704, '127.0.0.1', NULL),
  (51, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[0][fdgdsg][1]', 'category/form/38', 1, 1401865728, '127.0.0.1', NULL),
  (52, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[2][fdgdsg][1]', 'category/form/38', 1, 1401865795, '127.0.0.1', NULL),
  (53, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401931703, '127.0.0.1', NULL),
  (54, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401931703, '127.0.0.1', NULL),
  (55, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401947746, '127.0.0.1', NULL),
  (56, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(slide),添加的数据为：[1][测试][][][/admin/../assets/admin/default/uploads/image/20140605/b836f1e4948456739da1cdc38035cf58.jpg][1][1401947774][127.0.0.1]', 'slide/form', 1, 1401947774, '127.0.0.1', NULL),
  (57, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(slide),添加的数据为：[1][测试2][][][/admin/../assets/admin/default/uploads/image/20140605/a5e4064e2b6004614d42252bc5f4c05e.gif][1][1401947807][127.0.0.1]', 'slide/form', 1, 1401947807, '127.0.0.1', NULL),
  (58, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(slide),更改后的数据为：[1][测试][1][http://www.baidu.com][][/admin/../assets/admin/default/uploads/image/20140605/b836f1e4948456739da1cdc38035cf58.jpg][1][1401952619][127.0.0.1]', 'slide/form/1', 1, 1401952619, '127.0.0.1', NULL),
  (59, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(slide),更改后的数据为：[1][测试2][2][http://www.so.com][][/admin/../assets/admin/default/uploads/image/20140605/a5e4064e2b6004614d42252bc5f4c05e.gif][1][1401952628][127.0.0.1]', 'slide/form/2', 1, 1401952628, '127.0.0.1', NULL),
  (60, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401958140, '127.0.0.1', NULL),
  (61, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fdsf][fdsfadsfsdfasdf][admin][1][1401959251][127.0.0.1]', 'article/form', 1, 1401959251, '127.0.0.1', NULL),
  (62, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402016201, '127.0.0.1', NULL),
  (63, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402016219, '127.0.0.1', NULL),
  (64, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdf][][][anhui99]', 'setting/web', 1, 1402019201, '127.0.0.1', NULL),
  (65, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fasdfadsfasdfasdf][dfgdsgsdfg][admin][1][1402019531][127.0.0.1]', 'article/form', 1, 1402019531, '127.0.0.1', NULL),
  (66, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fasdfadsfasdfasdf][dfgdsgsdfg][admin][1][1402019561][127.0.0.1]', 'article/form/2', 1, 1402019561, '127.0.0.1', NULL),
  (67, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdffsdfsadffsdfsdfsfsdfsdfsdffsdfsdfsadfsdfasdfasdfsadfsdfsdfsadffsdfasdfasdfasdfasdfsdf][][][anhui99]', 'setting/web', 1, 1402020623, '127.0.0.1', NULL),
  (68, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[5][fsdfdsf][sdfsadfasdf][admin][1][1402020920][127.0.0.1]', 'article/form', 1, 1402020920, '127.0.0.1', NULL),
  (69, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fdsdsa][fsdafasdfasdfasdf][admin][1][1402020964][127.0.0.1]', 'article/form', 1, 1402020964, '127.0.0.1', NULL),
  (70, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdffsdfsadffsdfsdfsfsdfsdfsdffsdfsdfsadfsdfasdfasdfsadfsdfsdfsadffsdfasdfasdfasdfasdfsdffsdafasdf][][][anhui99]', 'setting/web', 1, 1402020994, '127.0.0.1', NULL),
  (71, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdffsdfsadffsdfsdfsfsdfsdfsdffsdfsdfsadfsdfasdfasdfsadfsdfsdfsadffsdfasdfasdfasdfasdfsdffsdafasdffsdfsadfasdf][][][anhui99]', 'setting/web', 1, 1402021002, '127.0.0.1', NULL),
  (72, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[18][fddf][sadfasdfadsfasdf][admin][1][1402021152][127.0.0.1]', 'article/form', 1, 1402021152, '127.0.0.1', NULL),
  (73, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[29][ddfss][fsdafasdfasdfasdf][admin][1][1402021180][127.0.0.1]', 'article/form', 1, 1402021180, '127.0.0.1', NULL),
  (74, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdffsdfsadffsdfsdfsfsdfsdfsdffsdfsdfsadfsdfasdfasdfsadfsdfsdfsadffsdfasdfasdfasdfasdfsdffsdafas发撒旦法士大夫dffsdfsadfasdf][][][anhui99]', 'setting/web', 1, 1402021435, '127.0.0.1', NULL),
  (75, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[测试测试二会儿][][][anhui99]', 'setting/web', 1, 1402021469, '127.0.0.1', NULL),
  (76, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402021698, '127.0.0.1', NULL),
  (77, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fsdaf][测试测试fsdaffdsfads][admin][1][1402022200][127.0.0.1]', 'article/form', 1, 1402022200, '127.0.0.1', NULL),
  (78, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[17][fdsafa][dsfadsfadsfadsfadsfdasfdsafasd][admin][1][1402022213][127.0.0.1]', 'article/form', 1, 1402022213, '127.0.0.1', NULL),
  (79, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[7][fasdfasdfasdfasdf][asdfadsffffffffffff][admin][1][1402022222][127.0.0.1]', 'article/form', 1, 1402022222, '127.0.0.1', NULL),
  (80, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[28][fadsfadsfadsfads][fadsfadsfaaaaaaaaaaa][admin][1][1402022233][127.0.0.1]', 'article/form', 1, 1402022233, '127.0.0.1', NULL),
  (81, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402030510, '127.0.0.1', NULL),
  (82, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402030966, '127.0.0.1', NULL),
  (83, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[12][fsdafa][fasdfasdfasdf][admin][1][1402031105][127.0.0.1]', 'article/form', 1, 1402031105, '127.0.0.1', NULL),
  (84, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[32][fasafasdf][adsfadsffsdafasdf][admin][1][1402031118][127.0.0.1]', 'article/form', 1, 1402031118, '127.0.0.1', NULL),
  (85, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[28][fsdaf23rf][sdfadsfasdf][admin][1][1402031164][127.0.0.1]', 'article/form', 1, 1402031164, '127.0.0.1', NULL),
  (86, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdaf23rf][sdfadsfasdf][admin][1][1402031537][127.0.0.1]', 'article/form/13', 1, 1402031537, '127.0.0.1', NULL),
  (87, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fasafasdf][adsfadsffsdafasdf][admin][1][1402031574][127.0.0.1]', 'article/form/12', 1, 1402031574, '127.0.0.1', NULL),
  (88, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdafa][fasdfasdfasdf][admin][1][1402031586][127.0.0.1]', 'article/form/11', 1, 1402031586, '127.0.0.1', NULL),
  (89, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fadsfadsfadsfads][fadsfadsfaaaaaaaaaaa][admin][1][1402031594][127.0.0.1]', 'article/form/10', 1, 1402031594, '127.0.0.1', NULL),
  (90, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fasdfasdfasdfasdf][asdfadsffffffffffff][admin][1][1402031612][127.0.0.1]', 'article/form/9', 1, 1402031612, '127.0.0.1', NULL),
  (91, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fdsafa][dsfadsfadsfadsfadsfdasfdsafasd][admin][1][1402031624][127.0.0.1]', 'article/form/8', 1, 1402031624, '127.0.0.1', NULL),
  (92, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdaf][测试测试fsdaffdsfads][admin][1][1402031648][127.0.0.1]', 'article/form/7', 1, 1402031648, '127.0.0.1', NULL),
  (93, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][ddfss][fsdafasdfasdfasdf][admin][1][1402031659][127.0.0.1]', 'article/form/6', 1, 1402031659, '127.0.0.1', NULL),
  (94, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fddf][sadfasdfadsfasdf][admin][1][1402031670][127.0.0.1]', 'article/form/5', 1, 1402031670, '127.0.0.1', NULL),
  (95, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdfdsf][sdfsadfasdf][admin][1][1402031714][127.0.0.1]', 'article/form/3', 1, 1402031714, '127.0.0.1', NULL),
  (96, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdaf23rf最新][sdfadsfasdf][admin][1][1402032952][127.0.0.1]', 'article/form/13', 1, 1402032952, '127.0.0.1', NULL),
  (97, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[37][公告][1][1]', 'category/form', 1, 1402034550, '127.0.0.1', NULL),
  (98, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[39][fdsfsdaf][fsadfsadfasdf][admin][1][1402034563][127.0.0.1]', 'article/form', 1, 1402034563, '127.0.0.1', NULL),
  (99, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[39][fsdaasdffsadfasdf][dsafasdfasdffsadf][admin][1][1402034578][127.0.0.1]', 'article/form', 1, 1402034578, '127.0.0.1', NULL),
  (100, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[39][fsdfsadfasd][fdsafdsafasdf][admin][1][1402034590][127.0.0.1]', 'article/form', 1, 1402034590, '127.0.0.1', NULL),
  (101, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[39][fsdfsadfasdfsdfasdfasdf][fdsafdsafasdf][admin][1][1402034698][127.0.0.1]', 'article/form/16', 1, 1402034698, '127.0.0.1', NULL),
  (102, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402035341, '127.0.0.1', NULL),
  (103, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402038008, '127.0.0.1', NULL),
  (104, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402039374, '127.0.0.1', NULL),
  (105, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402039376, '127.0.0.1', NULL),
  (106, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402276515, '127.0.0.1', NULL),
  (107, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fsdfsdafasd][fsadfasdffsdfadsfasdf][admin][1][1402280105][127.0.0.1]', 'article/form', 1, 1402280105, '127.0.0.1', NULL),
  (108, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsdadsfsdafsdadsfsdafsdadsfsdafsda][dsfsdafsdadsfsdafsdadsfsdafsda][admin][1][1402280129][127.0.0.1]', 'article/form', 1, 1402280129, '127.0.0.1', NULL),
  (109, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsdasdf][dsfsdafsdadsfsdafsdafsdf][admin][1][1402280160][127.0.0.1]', 'article/form', 1, 1402280160, '127.0.0.1', NULL),
  (110, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsda5116][dsfsdafsdadsfsdafsdadsfsdafsda][admin][1][1402280177][127.0.0.1]', 'article/form', 1, 1402280177, '127.0.0.1', NULL),
  (111, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsda6489849][dsfsdafsdadsfsdafsdaf5ds6f6asd5f][admin][1][1402280189][127.0.0.1]', 'article/form', 1, 1402280189, '127.0.0.1', NULL),
  (112, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsdadsfsdafsda165106][dsfsdafsdadsfsdafsdadsfsdafsdadsfsdafsda][admin][1][1402280209][127.0.0.1]', 'article/form', 1, 1402280209, '127.0.0.1', NULL),
  (113, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfdsafsdagfasd2165dsfdsafsdagfasd][dsfdsafsdagfasddsfdsafsdagfasddsfds][admin][1][1402282086][127.0.0.1]', 'article/form', 1, 1402282086, '127.0.0.1', NULL),
  (114, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfdsafsdagfasd56165][dsfdsafsdagfasddsfdsafsdagfasddsfdsafsdagfasddsfdsafsdagfasd][admin][1][1402282096][127.0.0.1]', 'article/form', 1, 1402282096, '127.0.0.1', NULL),
  (115, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfdsafsdagfasddsfdsafsdagfasd51651][dsfdsafsdagfasddsfdsafsdagfasddsfdsafsdagfasd56116156][admin][1][1402282124][127.0.0.1]', 'article/form', 1, 1402282124, '127.0.0.1', NULL),
  (116, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fadsfadsfasd415612132][fffsdfasdf516132165][admin][1][1402282153][127.0.0.1]', 'article/form', 1, 1402282153, '127.0.0.1', NULL),
  (117, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402386363, '127.0.0.1', NULL),
  (118, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[0][0][fdsfsd][10][1]', 'category/form', 1, 1402388461, '127.0.0.1', NULL),
  (119, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[11][2][直属商会][1]', 'category/form/14', 1, 1402388481, '127.0.0.1', NULL),
  (120, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][][fdsfsad][5][1]', 'category/form', 1, 1402388527, '127.0.0.1', NULL),
  (121, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][1][fsdafasdf][5][1]', 'category/form', 1, 1402389294, '127.0.0.1', NULL),
  (122, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402407898, '127.0.0.1', NULL),
  (123, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402447515, '127.0.0.1', NULL),
  (124, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402448617, '127.0.0.1', NULL),
  (125, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402461373, '127.0.0.1', NULL),
  (126, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(link),添加的数据为：[百度][][http://www.baidu.com][/admin/../assets/admin/default/uploads/image/20140611/886649a7bbd8aee9b10d34c724088391.jpg][1][1402461952][127.0.0.1]', 'link/form', 1, 1402461952, '127.0.0.1', NULL),
  (127, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1418022438, '127.0.0.1', NULL),
  (128, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1418784830, '127.0.0.1', NULL),
  (129, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[14][fdsaadsfas][fasdfasdfasdfasdfasdfasdfasdf][admin][1][1418784886][127.0.0.1]', 'article/form', 1, 1418784886, '127.0.0.1', NULL),
  (130, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1418786576, '127.0.0.1', NULL),
  (131, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426035825, '127.0.0.1', NULL),
  (132, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426037115, '127.0.0.1', NULL),
  (133, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1426037244, '127.0.0.1', NULL),
  (134, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426040276, '127.0.0.1', NULL),
  (135, 'admin', '角色：[超级管理员]，用户名：[admin]更换皮肤,更改后的数据为：[classic]', 'login/show_skin', 1, 1426040282, '127.0.0.1', NULL),
  (136, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1426040328, '127.0.0.1', NULL),
  (137, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426040730, '127.0.0.1', NULL),
  (138, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[2][网站维护升级中...][][][anhui99]', 'setting/web', 1, 1426040781, '127.0.0.1', NULL),
  (139, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[测试][][][anhui99]', 'setting/web', 1, 1426040787, '127.0.0.1', NULL),
  (140, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426042244, '127.0.0.1', NULL),
  (141, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(role),添加的数据为：[测试][测试组][1,2,3,6,7,9,12,13,16,17,19,20,22,23,24,26,30,28,29][1]', 'role/form', 1, 1426042286, '127.0.0.1', NULL),
  (142, 'admin',
   '角色：[超级管理员]，用户名：[admin]添加表(manager),添加的数据为：[2][123456][][][707069100@qq.com][2][2][3a0f0fee92a4fd13fb3f1c2bfcb3eac5][1]',
   'manager/form', 1, 1426042300, '127.0.0.1', NULL),
  (143, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1426042305, '127.0.0.1', NULL),
  (144, '123456', '角色：[测试]，用户名：[123456]登录系统', 'login', 2, 1426042310, '127.0.0.1', NULL),
  (145, '123456', '角色：[测试]，用户名：[123456]退出系统', 'login/logout', 2, 1426042320, '127.0.0.1', NULL),
  (146, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426042325, '127.0.0.1', NULL),
  (147, 'admin',
   '角色：[超级管理员]，用户名：[admin]更新表(role),更改后的数据为：[测试][测试组][1,2,3,6,7,9,10,12,13,16,17,19,20,22,23,24,26,30,28,29][1]',
   'role/form/2', 1, 1426042335, '127.0.0.1', NULL),
  (148, 'admin', '角色：[超级管理员]，用户名：[admin]更改密码,更改后的数据为：[eece2c655c2aa34fb935686464b993ca]', 'manager/change_pwd', 1,
   1426042345, '127.0.0.1', NULL),
  (149, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'manager/change_pwd_logout', 1, 1426042346, '127.0.0.1', NULL),
  (150, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426042352, '127.0.0.1', NULL);
/*!40000 ALTER TABLE `cn_manager_logging` ENABLE KEYS */;


-- 导出  表 cainiao.cn_mode 结构
CREATE TABLE IF NOT EXISTS `cn_mode` (
  `id`     INT(11)     NOT NULL AUTO_INCREMENT,
  `name`   VARCHAR(20) NOT NULL
  COMMENT '名称',
  `remark` VARCHAR(200)         DEFAULT NULL
  COMMENT '备注',
  `rank`   SMALLINT(6) NOT NULL DEFAULT '0'
  COMMENT '排序，数字越小越靠前',
  `status` TINYINT(4)  NOT NULL DEFAULT '0'
  COMMENT '状态0是未激活，1是正常，2是禁用',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8
  COMMENT = '模块';

-- 正在导出表  cainiao.cn_mode 的数据：~0 rows (大约)
DELETE FROM `cn_mode`;
/*!40000 ALTER TABLE `cn_mode` DISABLE KEYS */;
INSERT INTO `cn_mode` (`id`, `name`, `remark`, `rank`, `status`) VALUES
  (1, '首页幻灯片', '首页幻灯片', 1, 1);
/*!40000 ALTER TABLE `cn_mode` ENABLE KEYS */;


-- 导出  表 cainiao.cn_power 结构
CREATE TABLE IF NOT EXISTS `cn_power` (
  `id`     INT(10)     NOT NULL AUTO_INCREMENT,
  `pid`    INT(10) UNSIGNED     DEFAULT '1'
  COMMENT '1是顶级权限',
  `name`   VARCHAR(50) NOT NULL DEFAULT ''
  COMMENT '权限名称',
  `icon`   VARCHAR(50)          DEFAULT 'icon-home'
  COMMENT '图标',
  `url`    VARCHAR(150)         DEFAULT 'default_view'
  COMMENT '权限访问路径 default_view',
  `rank`   INT(11) UNSIGNED     DEFAULT '0'
  COMMENT '排序',
  `status` TINYINT(1) UNSIGNED  DEFAULT '1'
  COMMENT '1是正常，2是禁用',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 32
  DEFAULT CHARSET = utf8mb4
  COMMENT = '权限表';

-- 正在导出表  cainiao.cn_power 的数据：~31 rows (大约)
DELETE FROM `cn_power`;
/*!40000 ALTER TABLE `cn_power` DISABLE KEYS */;
INSERT INTO `cn_power` (`id`, `pid`, `name`, `icon`, `url`, `rank`, `status`) VALUES
  (1, 0, '系统管理', 'icon-home', 'default_view', 0, 1),
  (2, 1, '系统设置', 'icon-home', 'default_view', 0, 1),
  (3, 2, '系统信息', 'icon-home', 'main', 0, 1),
  (4, 2, '后台设置', 'icon-home', 'setting/admin', 0, 1),
  (5, 2, '站点设置', 'icon-home', 'setting/web', 0, 1),
  (6, 1, '权限管理', 'icon-home', 'default_view', 0, 1),
  (7, 6, '权限列表', 'icon-home', 'power', 0, 1),
  (8, 6, '添加权限', 'icon-home', 'power/form', 0, 1),
  (9, 1, '角色管理', 'icon-home', 'default_view', 0, 1),
  (10, 9, '角色列表', 'icon-home', 'role', 0, 1),
  (11, 9, '添加角色', 'icon-home', 'role/form', 0, 1),
  (12, 1, '管理员管理', 'icon-home', 'default_view', 0, 1),
  (13, 12, '管理员列表', 'icon-home', 'manager', 0, 1),
  (14, 12, '添加管理员', 'icon-home', 'manager/form', 0, 1),
  (15, 12, '更改密码', 'icon-home', 'manager/pwd', 0, 1),
  (16, 1, '类别管理', 'icon-home', 'default_view', 0, 1),
  (17, 16, '类别列表', 'icon-home', 'category', 0, 1),
  (18, 16, '添加类别', 'icon-home', 'category/form', 0, 1),
  (19, 1, '内容管理', 'icon-home', 'default_view', 0, 1),
  (20, 19, '文章列表', 'icon-home', 'article', 0, 1),
  (21, 19, '添加文章', 'icon-home', 'article/form', 0, 1),
  (22, 19, '回收站', 'icon-home', 'article/recycle_bin', 0, 1),
  (23, 1, '模块管理', 'icon-home', 'default_view', 0, 1),
  (24, 23, '模块列表', 'icon-home', 'mode', 0, 1),
  (25, 23, '添加模块', 'icon-home', 'mode/form', 0, 1),
  (26, 23, '首页幻灯片列表', 'icon-home', 'slide', 0, 1),
  (27, 23, '添加首页幻灯片', 'icon-home', 'slide/form', 0, 1),
  (28, 1, '系统日志', 'icon-home', 'default_view', 0, 1),
  (29, 28, '系统日志列表', 'icon-home', 'manager_log', 0, 1),
  (30, 23, '友情链接列表', 'icon-home', 'link', 0, 1),
  (31, 23, '添加友情链接', 'icon-home', 'link/form', 0, 1);
/*!40000 ALTER TABLE `cn_power` ENABLE KEYS */;


-- 导出  表 cainiao.cn_role 结构
CREATE TABLE IF NOT EXISTS `cn_role` (
  `id`        INT(10)      NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(50)  NOT NULL DEFAULT ''
  COMMENT '名称',
  `powers`    VARCHAR(100) NOT NULL
  COMMENT '所有权限',
  `introduce` VARCHAR(50)  NOT NULL DEFAULT ''
  COMMENT '简介',
  `status`    TINYINT(1) UNSIGNED   DEFAULT '1'
  COMMENT '1是正常，2是禁用',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COMMENT = '角色表';

-- 正在导出表  cainiao.cn_role 的数据：~1 rows (大约)
DELETE FROM `cn_role`;
/*!40000 ALTER TABLE `cn_role` DISABLE KEYS */;
INSERT INTO `cn_role` (`id`, `name`, `powers`, `introduce`, `status`) VALUES
  (1, '超级管理员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31',
   '系统最高级管理人，拥有站点所有权限', 1),
  (2, '测试', '1,2,3,6,7,9,10,12,13,16,17,19,20,22,23,24,26,30,28,29', '测试组', 1);
/*!40000 ALTER TABLE `cn_role` ENABLE KEYS */;


-- 导出  表 cainiao.cn_sessions 结构
CREATE TABLE IF NOT EXISTS `cn_sessions` (
  `session_id`    VARCHAR(40)      NOT NULL DEFAULT '0'
  COMMENT 'session_id',
  `ip_address`    VARCHAR(45)      NOT NULL DEFAULT '0'
  COMMENT 'ip地址',
  `user_agent`    VARCHAR(120)     NOT NULL,
  `last_activity` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data`     TEXT             NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COMMENT = 'session表';

-- 正在导出表  cainiao.cn_sessions 的数据：~8 rows (大约)
DELETE FROM `cn_sessions`;
/*!40000 ALTER TABLE `cn_sessions` DISABLE KEYS */;
INSERT INTO `cn_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
  ('20dcaba59dfb7c4ca1f9008ebaf867fb', '127.0.0.1',
   'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',
   1426040227, ''),
  ('4151b9d60a9dde448e41ccd7334af556', '127.0.0.1',
   'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',
   1426042164, 'a:1:{s:9:"user_data";s:0:"";}'),
  ('4d1931f799ab2e5fa7db3b962aa4edba', '127.0.0.1',
   'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',
   1426040227,
   'a:4:{s:9:"user_data";s:0:"";s:10:"check_flag";s:1:"0";s:15:"flash:old:error";s:24:"用户名或密码错误";s:8:"valicode";s:4:"7fqR";}'),
  ('60a32a4fa5f5b01b7f4b3c93dbe5582d', '127.0.0.1',
   'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',
   1426040729, 'a:1:{s:9:"user_data";s:0:"";}'),
  ('72571299314b80f525bdce8d168e56f0', '127.0.0.1',
   'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36',
   1426040223, 'a:3:{s:9:"user_data";s:0:"";s:10:"check_flag";s:1:"0";s:8:"valicode";s:4:"nc4f";}'),
  ('7c0a2aa96c84b16ad345bc1e3884c742', '127.0.0.1',
   'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',
   1426040729,
   'a:2:{s:9:"user_data";s:0:"";s:7:"manager";a:5:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:7:"role_id";s:1:"1";s:6:"status";s:1:"1";s:6:"expire";i:1426044437;}}'),
  ('e9b9973a1b4d8e19afd9ca9f33446099', '127.0.0.1',
   'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',
   1426042347,
   'a:2:{s:9:"user_data";s:0:"";s:7:"manager";a:5:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:7:"role_id";s:1:"1";s:6:"status";s:1:"1";s:6:"expire";i:1426045952;}}'),
  ('fe289146223cdd2010d2e7dbae6bb0c9', '127.0.0.1',
   'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36',
   1426040223, '');
/*!40000 ALTER TABLE `cn_sessions` ENABLE KEYS */;


-- 导出  表 cainiao.cn_slide 结构
CREATE TABLE IF NOT EXISTS `cn_slide` (
  `id`               INT(11)      NOT NULL AUTO_INCREMENT,
  `mode_id`          INT(11)      NOT NULL
  COMMENT '模块id',
  `title`            VARCHAR(50)  NOT NULL
  COMMENT '标题',
  `url`              VARCHAR(50)           DEFAULT NULL
  COMMENT '链接',
  `thumb`            VARCHAR(100)          DEFAULT NULL
  COMMENT '图片',
  `rank`             SMALLINT(6)  NOT NULL DEFAULT '0'
  COMMENT '排序，数字越小越靠前',
  `remark`           VARCHAR(200) NOT NULL
  COMMENT '备注',
  `addtime`          VARCHAR(10)  NOT NULL
  COMMENT '添加时间',
  `updatetime`       VARCHAR(10)  NOT NULL
  COMMENT '最后更新时间',
  `addip`            VARCHAR(15)  NOT NULL
  COMMENT '添加ip',
  `addip_address`    VARCHAR(50)           DEFAULT NULL
  COMMENT '添加ip地址',
  `updateip`         VARCHAR(15)  NOT NULL
  COMMENT '更新ip',
  `updateip_address` VARCHAR(50)           DEFAULT NULL
  COMMENT '更新pi地址',
  `status`           TINYINT(2)   NOT NULL
  COMMENT '状态0是未激活，1是正常，2是禁用',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '首页幻灯片';

-- 正在导出表  cainiao.cn_slide 的数据：~0 rows (大约)
DELETE FROM `cn_slide`;
/*!40000 ALTER TABLE `cn_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `cn_slide` ENABLE KEYS */;
/*!40101 SET SQL_MODE = IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS = IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;

-- 导出  表 cainiao.cn_project 结构
CREATE TABLE IF NOT EXISTS `cn_project` (
  `id`               INT(11)      NOT NULL AUTO_INCREMENT,
  `mode_id`          INT(11)      NOT NULL
  COMMENT '模块id',
  `title`            VARCHAR(50)  NOT NULL
  COMMENT '标题',
  `url`              VARCHAR(50)           DEFAULT NULL
  COMMENT '链接',
  `thumb`            VARCHAR(100)          DEFAULT NULL
  COMMENT '图片',
  `rank`             SMALLINT(6)  NOT NULL DEFAULT '0'
  COMMENT '排序，数字越小越靠前',
  `remark`           VARCHAR(200) NOT NULL
  COMMENT '备注',
  `addtime`          VARCHAR(10)  NOT NULL
  COMMENT '添加时间',
  `updatetime`       VARCHAR(10)  NOT NULL
  COMMENT '最后更新时间',
  `addip`            VARCHAR(15)  NOT NULL
  COMMENT '添加ip',
  `addip_address`    VARCHAR(50)           DEFAULT NULL
  COMMENT '添加ip地址',
  `updateip`         VARCHAR(15)  NOT NULL
  COMMENT '更新ip',
  `updateip_address` VARCHAR(50)           DEFAULT NULL
  COMMENT '更新pi地址',
  `status`           TINYINT(2)   NOT NULL
  COMMENT '状态0是未激活，1是正常，2是禁用',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '案例';

-- 正在导出表  cainiao.cn_project 的数据：~0 rows (大约)
DELETE FROM `cn_project`;
/*!40000 ALTER TABLE `cn_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `cn_project` ENABLE KEYS */;
/*!40101 SET SQL_MODE = IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS = IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
