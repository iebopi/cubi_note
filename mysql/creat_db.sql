Create Database If Not Exists aids Character Set UTF8;
use aids;

-- ----------------------------
-- Table structure for tb_action
-- ----------------------------
DROP TABLE IF EXISTS `tb_action`;
CREATE TABLE `tb_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(6) NOT NULL DEFAULT '' COMMENT '操作代号',
  `section_code` char(6) DEFAULT NULL COMMENT '分类代号（二级导航）',
  `module_code` char(6) DEFAULT NULL COMMENT '模块代号（一级导航）',
  `menu_code` char(6) DEFAULT NULL COMMENT '菜单代号',
  `access_uri` varchar(128) DEFAULT NULL COMMENT 'api访问地址和方法，格式为uri#verb',
  `module` varchar(32) DEFAULT '' COMMENT '所属业务模块',
  `access_url` varchar(255) DEFAULT '' COMMENT 'api访问地址',
  `level` tinyint(3) NOT NULL DEFAULT '0' COMMENT '操作的层级，0表示菜单，1表示模块，2表示分类，3表示页面按钮',
  `sort_order` char(3) DEFAULT NULL COMMENT '菜单排序',
  `title_zh` varchar(16) DEFAULT NULL COMMENT '中文名称',
  `title_en` varchar(64) DEFAULT NULL COMMENT '英文名称',
  `icon_tag` varchar(32) DEFAULT NULL COMMENT '图标标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='操作权限表';

-- ----------------------------
-- Records of tb_action
-- ----------------------------
INSERT INTO `tb_action` VALUES ('1', '10000', null, null, null, null, '', '', '0', '100', '素材管理', null, null);
INSERT INTO `tb_action` VALUES ('2', '20000', null, null, null, null, '', '', '0', '120', '设备管理', null, null);
INSERT INTO `tb_action` VALUES ('3', '30000', null, null, null, null, '', '', '0', '110', '信息发布', null, null);
INSERT INTO `tb_action` VALUES ('4', '50000', null, null, null, null, '', '', '0', '130', '人工智能', null, null);
INSERT INTO `tb_action` VALUES ('5', '40000', null, null, null, null, '', '', '0', '190', '系统管理', null, null);
INSERT INTO `tb_action` VALUES ('6', '60000', null, null, null, null, '', '', '0', '140', '权限管理', null, null);
INSERT INTO `tb_action` VALUES ('7', '70000', null, null, null, null, '', '', '0', '200', '授权管理', null, null);
INSERT INTO `tb_action` VALUES ('10', '11000', null, null, '10000', '/materials#GET', '', '', '1', '300', '素材列表', null, 'icon-element');
INSERT INTO `tb_action` VALUES ('11', '12000', null, null, '10000', '/templates#GET', '', '', '1', '301', '模板列表', null, 'icon-template');
INSERT INTO `tb_action` VALUES ('12', '21000', null, null, '20000', '/devices-mips#GET', '', '', '1', '320', '设备列表', null, 'icon-device');
INSERT INTO `tb_action` VALUES ('13', '31000', null, null, '30000', '/programs#GET', '', '', '1', '310', '节目列表', null, 'icon-program');
INSERT INTO `tb_action` VALUES ('14', '32000', null, null, '30000', '/releases#GET', '', '', '1', '312', '发布列表', null, 'icon-release');
INSERT INTO `tb_action` VALUES ('15', '33000', null, null, '30000', '/staticReport#GET', '', '', '1', '313', '播放统计', null, 'icon-play');
INSERT INTO `tb_action` VALUES ('16', '41000', null, null, '40000', '/system-set#GET', '', '', '1', '470', '系统设置', null, 'icon-settings');
INSERT INTO `tb_action` VALUES ('17', '42000', null, null, '40000', '/OperationLogList#GET', '', '', '1', '471', '系统日志', null, 'icon-logs');
INSERT INTO `tb_action` VALUES ('18', '51000', null, null, '50000', '/face-pfs#GET', '', '', '1', '480', '客流统计', null, 'icon-submenu-flow');
INSERT INTO `tb_action` VALUES ('19', '52000', null, null, '50000', '/face-vips#GET', '', '', '1', '490', 'VIP 管理', null, 'icon-submenu-member');
INSERT INTO `tb_action` VALUES ('20', '61000', null, null, '60000', '/users#GET', '', '', '1', '500', '组织架构', null, 'icon-org');
INSERT INTO `tb_action` VALUES ('21', '62000', null, null, '60000', '/roles#GET', '', '', '1', '501', '角色管理', null, 'icon-role');
INSERT INTO `tb_action` VALUES ('22', '63000', null, null, '60000', '/companies#GET', '', '', '1', '502', '企业管理', null, 'icon-enterprise');
INSERT INTO `tb_action` VALUES ('23', '71000', null, null, '70000', '/licences#GET', '', '', '1', '510', '授权管理', null, 'icon-auth');
INSERT INTO `tb_action` VALUES ('24', '22000', null, null, '20000', '/devices-apk#GET', '', '', '1', '321', 'APK列表', null, 'icon-android');
INSERT INTO `tb_action` VALUES ('31', '21101', null, '21000', '20000', '/devices-mips#GET', '', '', '3', null, '广告机列表', null, null);
INSERT INTO `tb_action` VALUES ('32', '21102', null, '21000', '20000', '/devices/add-ons#PUT', '', '', '3', null, '修改广告机基础信息', null, null);
INSERT INTO `tb_action` VALUES ('33', '21103', null, '21000', '20000', '/devices#DELETE', '', '', '3', null, '删除广告机', null, null);
INSERT INTO `tb_action` VALUES ('34', '21109', null, '21000', '20000', '/devices/rpc-update-name#PUT', '', '', '3', null, '设置广告机名称', null, null);
INSERT INTO `tb_action` VALUES ('35', '21110', null, '21000', '20000', '/devices/rpc-reboot#PUT', '', '', '3', null, '远程-重启', null, null);
INSERT INTO `tb_action` VALUES ('36', '21111', null, '21000', '20000', '/devices/rpc-shutdown#PUT', '', '', '3', null, '远程-关机', null, null);
INSERT INTO `tb_action` VALUES ('37', '21112', null, '21000', '20000', '/devices/rpc-screenshot#PUT', '', '', '3', null, '远程-截屏', null, null);
INSERT INTO `tb_action` VALUES ('38', '21113', null, '21000', '20000', '/devices/rpc-log#PUT', '', '', '3', null, '远程-上传日志', null, null);
INSERT INTO `tb_action` VALUES ('39', '21114', null, '21000', '20000', '/devices/rpc-ai-pm#PUT', '', '', '3', null, '远程-精准开关设置', null, null);
INSERT INTO `tb_action` VALUES ('40', '21115', null, '21000', '20000', '/devices/rpc-ai-vip#PUT', '', '', '3', null, '远程-VIP设置', null, null);
INSERT INTO `tb_action` VALUES ('41', '21116', null, '21000', '20000', '/devices/rpc-camera#PUT', '', '', '3', null, '远程-摄像头设置', null, null);
INSERT INTO `tb_action` VALUES ('42', '21117', null, '21000', '20000', '/devices/rpc-volume#PUT', '', '', '3', null, '远程-音量设置', null, null);
INSERT INTO `tb_action` VALUES ('43', '21118', null, '21000', '20000', '/devices/rpc-power-schedule#PUT$/devices/rpc-power-clean#PUT', '', '', '3', null, '远程-电源计划', null, null);
INSERT INTO `tb_action` VALUES ('44', '21119', null, '21000', '20000', '/devices/rpc-rotate#PUT', '', '', '3', null, '远程-旋转屏幕', null, null);
INSERT INTO `tb_action` VALUES ('45', '21120', null, '21000', '20000', '/devices/rpc-program-add#PUT', '', '', '3', null, '远程-节目加播/插播', null, null);
INSERT INTO `tb_action` VALUES ('46', '21122', null, '21000', '20000', '/devices/rpc-program-del#PUT', '', '', '3', null, '远程-节目减播', null, null);
INSERT INTO `tb_action` VALUES ('47', '21123', null, '21000', '20000', '/devices/rpc-program-clean#PUT', '', '', '3', null, '远程-清空节目', null, null);
INSERT INTO `tb_action` VALUES ('48', '21124', null, '21000', '20000', '/devices/rpc-upgrade#PUT', '', '', '3', null, '远程-设备升级', null, null);
INSERT INTO `tb_action` VALUES ('49', '21125', null, '21000', '20000', '/devices-mips/device-group-move#PUT', '', '', '3', null, '移动分组', null, null);
INSERT INTO `tb_action` VALUES ('50', '21126', null, '21000', '20000', '/devices/rpc-backlight#PUT', '', '', '3', null, '背光设置', null, null);
INSERT INTO `tb_action` VALUES ('51', '21127', null, '21000', '20000', '/devices/rpc-startup-on-boot#PUT', '', '', '3', null, '开机自启', null, null);
INSERT INTO `tb_action` VALUES ('52', '21128', null, '21000', '20000', '/devices/rpc-watchdog#PUT', '', '', '3', null, '应用守护', null, null);
INSERT INTO `tb_action` VALUES ('53', '21129', null, '21000', '20000', '/devices-mips/device-group-add#POST', '', '', '3', null, '新增终端分组', null, null);
INSERT INTO `tb_action` VALUES ('54', '21130', null, '21000', '20000', '/devices-mips/device-group-update#PUT', '', '', '3', null, '修改终端分组', null, null);
INSERT INTO `tb_action` VALUES ('55', '21131', null, '21000', '20000', '/devices-mips/device-group-delete#DELETE', '', '', '3', null, '删除终端分组', null, null);
INSERT INTO `tb_action` VALUES ('56', '21132', null, '21000', '20000', '/devices/rpc-RecoveryInvalid#PUT', '', '', '3', null, '恢复失效设备', null, null);
INSERT INTO `tb_action` VALUES ('57', '21133', null, '21000', '20000', '/devices/rpc-language-set#PUT', '', '', '3', null, '语言设置', null, null);
INSERT INTO `tb_action` VALUES ('58', '21134', null, '21000', '20000', '/devices/rpc-screen-set#PUT', '', '', '3', null, '屏幕设置', null, null);
INSERT INTO `tb_action` VALUES ('59', '21135', null, '21000', '20000', '/devices/rpc-status-bar#PUT', '', '', '3', null, '状态栏设置', null, null);
INSERT INTO `tb_action` VALUES ('60', '21200', null, '21000', '20000', '/devices/flow#PUT', '', '', '3', null, '配置设备流量', null, null);
INSERT INTO `tb_action` VALUES ('61', '21136', null, '21000', '20000', '/licences/device#POST ', '', '', '3', null, '设备激活', null, null);
INSERT INTO `tb_action` VALUES ('62', '21137', null, '21000', '20000', '/devices/rpc-brightness#PUT', '', '', '3', null, '亮度设置', null, null);
INSERT INTO `tb_action` VALUES ('63', '21138', null, '21000', '20000', '/devices/rpc-strategy#PUT', '', '', '3', null, '终端删除策略', null, null);
INSERT INTO `tb_action` VALUES ('64', '21139', null, '21000', '20000', '/devices/rpc-log-clean#PUT', '', '', '3', null, '手动清除存储日志', null, null);
INSERT INTO `tb_action` VALUES ('81', '31101', null, '31000', '30000', '/programs#GET', '', '', '3', null, '查看节目', null, null);
INSERT INTO `tb_action` VALUES ('82', '31102', null, '31000', '30000', '/programs#POST', '', '', '3', null, '新增节目', null, null);
INSERT INTO `tb_action` VALUES ('83', '31103', null, '31000', '30000', '/programs#PUT', '', '', '3', null, '修改节目', null, null);
INSERT INTO `tb_action` VALUES ('84', '31104', null, '31000', '30000', '/programs#DELETE', '', '', '3', null, '删除节目', null, null);
INSERT INTO `tb_action` VALUES ('85', '31105', null, '31000', '30000', '/programs/{id}/zipfile#GET', '', '', '3', null, '导出节目', null, null);
INSERT INTO `tb_action` VALUES ('86', '31106', null, '31000', '30000', '/programs/{id}/preview#GET', '', '', '3', null, '预览节目', null, null);
INSERT INTO `tb_action` VALUES ('87', '31107', null, '31000', '30000', '/programs/resolution#POST', '', '', '3', null, '自定义分辨率', null, null);
INSERT INTO `tb_action` VALUES ('88', '31108', null, '31000', '30000', '/programs/labels#PUT', '', '', '3', null, '设置精准标签', null, null);
INSERT INTO `tb_action` VALUES ('89', '31109', null, '31000', '30000', '/programs/labels#DELETE', '', '', '3', null, '删除精准标签', null, null);
INSERT INTO `tb_action` VALUES ('90', '31110', null, '31000', '30000', '/programs/review#PUT', '', '', '3', null, '审核节目', null, null);
INSERT INTO `tb_action` VALUES ('91', '31111', null, '31000', '30000', '/programs/program-group-move#PUT', '', '', '3', null, '移动节目分组', null, null);
INSERT INTO `tb_action` VALUES ('92', '31112', null, '31000', '30000', '/programs/program-group-add#POST', '', '', '3', null, '新增节目分组', null, null);
INSERT INTO `tb_action` VALUES ('93', '31113', null, '31000', '30000', '/programs/program-group-update#PUT', '', '', '3', null, '修改节目分组', null, null);
INSERT INTO `tb_action` VALUES ('94', '31114', null, '31000', '30000', '/programs/program-group-delete#DELETE', '', '', '3', null, '删除节目分组', null, null);
INSERT INTO `tb_action` VALUES ('95', '31115', null, '31000', '30000', '/programs/copy#POST', '', '', '3', null, '节目复制', null, null);
INSERT INTO `tb_action` VALUES ('96', '31116', null, '31000', '30000', '/programs/releases#POST', '', '', '3', null, '节目-一键发布', null, null);
INSERT INTO `tb_action` VALUES ('97', '34000', null, null, '30000', '/play-list#GET', '', '', '1', '311', '播放列表', null, 'icon-playlist');
INSERT INTO `tb_action` VALUES ('101', '31201', null, '32000', '30000', '/releases#GET', '', '', '3', null, '查看发布', null, null);
INSERT INTO `tb_action` VALUES ('102', '31202', null, '32000', '30000', '/releases#POST', '', '', '3', null, '新增发布', null, null);
INSERT INTO `tb_action` VALUES ('103', '31203', null, '32000', '30000', '/releases#PUT', '', '', '3', null, '修改发布', null, null);
INSERT INTO `tb_action` VALUES ('104', '31204', null, '32000', '30000', '/releases/pullout#PUT', '', '', '3', null, '下线发布', null, null);
INSERT INTO `tb_action` VALUES ('105', '31205', null, '32000', '30000', '/releases/review#PUT', '', '', '3', null, '审核发布', null, null);
INSERT INTO `tb_action` VALUES ('106', '31206', null, '32000', '30000', '/releases#DELETE', '', '', '3', null, '删除发布', null, null);
INSERT INTO `tb_action` VALUES ('107', '31302', null, '32000', '30000', '/notices#POST', '', '', '3', null, '新增插播消息', null, null);
INSERT INTO `tb_action` VALUES ('108', '31303', null, '32000', '30000', '/notices/pullout#PUT', '', '', '3', null, '下线插播消息', null, null);
INSERT INTO `tb_action` VALUES ('109', '31304', null, '32000', '30000', '/notices#DELETE', '', '', '3', null, '删除插播消息', null, null);
INSERT INTO `tb_action` VALUES ('110', '33101', null, '33000', '30000', '/staticReport#GET', '', '', '3', null, '查看播放统计', null, null);
INSERT INTO `tb_action` VALUES ('121', '11101', null, '11000', '10000', '/materials#GET', '', '', '3', null, '查看素材', null, null);
INSERT INTO `tb_action` VALUES ('122', '11102', null, '11000', '10000', '/materials#POST', '', '', '3', null, '上传素材', null, null);
INSERT INTO `tb_action` VALUES ('123', '11103', null, '11000', '10000', '/materials#PUT', '', '', '3', null, '修改素材', null, null);
INSERT INTO `tb_action` VALUES ('124', '11104', null, '11000', '10000', '/materials#DELETE', '', '', '3', null, '删除素材', null, null);
INSERT INTO `tb_action` VALUES ('125', '11105', null, '11000', '10000', '/materials/material-group-move#PUT', '', '', '3', null, '移动分组', null, null);
INSERT INTO `tb_action` VALUES ('126', '11106', null, '11000', '10000', '/materials/material-group-add#POST', '', '', '3', null, '新增素材分组', null, null);
INSERT INTO `tb_action` VALUES ('127', '11107', null, '11000', '10000', '/materials/material-group-update#PUT', '', '', '3', null, '修改素材分组', null, null);
INSERT INTO `tb_action` VALUES ('128', '11108', null, '11000', '10000', '/materials/material-group-delete#DELETE', '', '', '3', null, '删除素材分组', null, null);
INSERT INTO `tb_action` VALUES ('131', '12101', null, '12000', '10000', '/templates#GET', '', '', '3', null, '查看模板', null, null);
INSERT INTO `tb_action` VALUES ('132', '12102', null, '12000', '10000', '/templates#POST', '', '', '3', null, '新增模板', null, null);
INSERT INTO `tb_action` VALUES ('133', '12103', null, '12000', '10000', '/templates#PUT', '', '', '3', null, '修改模板', null, null);
INSERT INTO `tb_action` VALUES ('134', '12104', null, '12000', '10000', '/templates#DELETE', '', '', '3', null, '删除模板', null, null);
INSERT INTO `tb_action` VALUES ('135', '12105', null, '12000', '10000', '/templates/departments#PUT', '', '', '3', null, '移动分组', null, null);
INSERT INTO `tb_action` VALUES ('136', '12106', null, '12000', '10000', '/templates/{id}/preview#GET', '', '', '3', null, '预览模板', null, null);
INSERT INTO `tb_action` VALUES ('151', '51101', null, '51000', '50000', '/face-pfs#GET', '', '', '3', null, '查看客流统计', null, null);
INSERT INTO `tb_action` VALUES ('161', '52101', null, '52000', '50000', '/face-vips#GET', '', '', '3', null, '查看VIP列表', null, null);
INSERT INTO `tb_action` VALUES ('162', '52102', null, '52000', '50000', '/face-vips#POST', '', '', '3', null, '新增VIP', null, null);
INSERT INTO `tb_action` VALUES ('163', '52103', null, '52000', '50000', '/face-vips#PUT', '', '', '3', null, '编辑VIP', null, null);
INSERT INTO `tb_action` VALUES ('164', '52104', null, '52000', '50000', '/face-vips/departments#PUT', '', '', '3', null, '更改VIP分组', null, null);
INSERT INTO `tb_action` VALUES ('165', '52105', null, '52000', '50000', '/face-vips#DELETE', '', '', '3', null, '删除VIP', null, null);
INSERT INTO `tb_action` VALUES ('171', '61101', null, '61000', '60000', '/departments#GET', '', '', '3', null, '查看分组', null, null);
INSERT INTO `tb_action` VALUES ('172', '61102', null, '61000', '60000', '/departments#POST', '', '', '3', null, '新增分组', null, null);
INSERT INTO `tb_action` VALUES ('173', '61103', null, '61000', '60000', '/departments/{id}/rules#PUT', '', '', '3', null, '设置分组及资源权限', null, null);
INSERT INTO `tb_action` VALUES ('174', '61104', null, '61000', '60000', '/departments/{id}/rules#GET', '', '', '3', null, '查看分组广告机权限', null, null);
INSERT INTO `tb_action` VALUES ('175', '61107', null, '61000', '60000', '/departments#PUT', '', '', '3', null, '修改、移动分组', null, null);
INSERT INTO `tb_action` VALUES ('176', '61108', null, '61000', '60000', '/departments#DELETE', '', '', '3', null, '删除分组', null, null);
INSERT INTO `tb_action` VALUES ('181', '61109', null, '61000', '60000', '/users#GET', '', '', '3', null, '用户列表', null, null);
INSERT INTO `tb_action` VALUES ('182', '61110', null, '61000', '60000', '/users#POST', '', '', '3', null, '新增用户', null, null);
INSERT INTO `tb_action` VALUES ('183', '61111', null, '61000', '60000', '/users#PUT', '', '', '3', null, '修改用户基础信息', null, null);
INSERT INTO `tb_action` VALUES ('184', '61112', null, '61000', '60000', '/users#DELETE', '', '', '3', null, '删除用户', null, null);
INSERT INTO `tb_action` VALUES ('185', '61113', null, '61000', '60000', '/users-password#PUT', '', '', '3', null, '重置密码', null, null);
INSERT INTO `tb_action` VALUES ('186', '61114', null, '61000', '60000', '/users-lock#POST', '', '', '3', null, '禁用用户', null, null);
INSERT INTO `tb_action` VALUES ('187', '61115', null, '61000', '60000', '/users-lock#DELETE', '', '', '3', null, '解禁用户', null, null);
INSERT INTO `tb_action` VALUES ('188', '61116', null, '61000', '60000', '/users-department#PUT', '', '', '3', null, '修改用户分组', null, null);
INSERT INTO `tb_action` VALUES ('189', '61117', null, '61000', '60000', '/users-role#PUT', '', '', '3', null, '修改用户角色', null, null);
INSERT INTO `tb_action` VALUES ('201', '61201', null, '62000', '60000', '/roles#GET', '', '', '3', null, '角色列表', null, null);
INSERT INTO `tb_action` VALUES ('202', '61202', null, '62000', '60000', '/roles#POST', '', '', '3', null, '新增角色', null, null);
INSERT INTO `tb_action` VALUES ('203', '61203', null, '62000', '60000', '/roles#PUT', '', '', '3', null, '修改角色', null, null);
INSERT INTO `tb_action` VALUES ('204', '61204', null, '62000', '60000', '/roles#DELETE', '', '', '3', null, '删除角色', null, null);
INSERT INTO `tb_action` VALUES ('211', '41101', null, '41000', '40000', '/system-set#GET', '', '', '3', null, '获取系统设置', null, null);
INSERT INTO `tb_action` VALUES ('221', '42101', null, '42000', '40000', '/OperationLogList#GET', '', '', '3', null, '获取日志', null, null);
INSERT INTO `tb_action` VALUES ('231', '71101', null, '71000', '70000', '/licences#GET', '', '', '3', null, '获取权限', null, null);
INSERT INTO `tb_action` VALUES ('232', '31117', null, '31000', '30000', '/programs/zipfile#POST', '', '', '3', null, '导入节目', null, null);
INSERT INTO `tb_action` VALUES ('233', '34101', null, '34000', '30000', '/play-list#GET', '', '', '3', null, '查看播放列表', null, null);
INSERT INTO `tb_action` VALUES ('234', '34102', null, '34000', '30000', '/play-list#POST', '', '', '3', null, '新增播放列表', null, null);
INSERT INTO `tb_action` VALUES ('235', '34103', null, '34000', '30000', '/play-list/{id}#PUT', '', '', '3', null, '修改播放列表', null, null);
INSERT INTO `tb_action` VALUES ('236', '34104', null, '34000', '30000', '/play-list#DELETE', '', '', '3', null, '删除播放列表', null, null);
INSERT INTO `tb_action` VALUES ('237', '34105', null, '34000', '30000', '/play-list/{playListId}/devices#GET', '', '', '3', null, '查看关联设备', null, null);
INSERT INTO `tb_action` VALUES ('238', '34107', null, '34000', '30000', '/play-list/play-group-move#PUT', '', '', '3', null, '移动分组', null, null);
INSERT INTO `tb_action` VALUES ('239', '34108', null, '34000', '30000', '/play-list/play-group-add#POST', '', '', '3', null, '新增分组', null, null);
INSERT INTO `tb_action` VALUES ('240', '34109', null, '34000', '30000', '/play-list/play-group-delete#DELETE', '', '', '3', null, '删除分组', null, null);
INSERT INTO `tb_action` VALUES ('241', '34110', null, '34000', '30000', '/play-list/play-group-update#PUT', '', '', '3', null, '修改分组', null, null);
INSERT INTO `tb_action` VALUES ('242', '34111', null, '34000', '30000', '/play-list/release/{id}/#GET', '', '', '3', null, '发布播放列表', null, null);
INSERT INTO `tb_action` VALUES ('243', '34112', null, '34000', '30000', '/releases/pullout-plays#PUT', '', '', '3', null, '下线播放列表', null, null);
INSERT INTO `tb_action` VALUES ('244', '12107', null, '12000', '10000', '/templates/null#PUT', '', '', '3', null, '导入模板', null, null);
INSERT INTO `tb_action` VALUES ('245', '12108', null, '12000', '10000', '/templates/null#PUT', '', '', '3', null, '导出模板', null, null);
INSERT INTO `tb_action` VALUES ('246', '31118', null, '31000', '30000', '/programs/related-devices/{id}#GET', '', '', '3', null, '下线节目', null, null);
INSERT INTO `tb_action` VALUES ('247', '33102', null, '33000', '30000', '/staticReport/excel#GET', '', '', '3', null, '导出素材统计报表', null, null);
INSERT INTO `tb_action` VALUES ('248', '33103', null, '33000', '30000', '/staticReport/excel#GET', '', '', '3', null, '导出节目统计报表', null, null);
INSERT INTO `tb_action` VALUES ('249', '21201', null, '21000', '20000', '/releases/pullout-pros#PUT', '', '', '3', null, '下线设备节目', null, null);
INSERT INTO `tb_action` VALUES ('250', '21202', null, '21000', '20000', '/releases#POST', '', '', '3', null, '发布设备节目', null, null);

-- ----------------------------
-- Table structure for tb_announcement_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_announcement_info`;
CREATE TABLE `tb_announcement_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annc_title` varchar(128) NOT NULL DEFAULT 'null' COMMENT '公告标题',
  `annc_content` varchar(255) DEFAULT '' COMMENT '公告内容',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '公告创建时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '公告状态：1、待发布；2、已发布；3、已撤销',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '被删除时间',
  `create_user_Id` int(11) DEFAULT NULL COMMENT '创建人Id',
  `gmt_published` datetime DEFAULT NULL COMMENT '公告发布时间',
  `gmt_undo` datetime DEFAULT NULL COMMENT '撤销时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告信息表';

-- ----------------------------
-- Records of tb_announcement_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_background
-- ----------------------------
DROP TABLE IF EXISTS `tb_background`;
CREATE TABLE `tb_background` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '背景名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '背景的可用状态。1：使用中 2:未使用',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `oss_picture_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '图片的网上地址',
  `picture_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '图片的本地地址',
  `number` int(1) NOT NULL DEFAULT '0' COMMENT '图片的本地地址',
  `picture_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图片的id组合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_background
-- ----------------------------

-- ----------------------------
-- Table structure for tb_company
-- ----------------------------
DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE `tb_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(16) NOT NULL DEFAULT '' COMMENT '公司编号',
  `name` varchar(64) DEFAULT NULL COMMENT '公司名称',
  `manager_login_id` varchar(64) NOT NULL DEFAULT '' COMMENT '管理员登录ID',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，0表示正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='平台公司表--new';

-- ----------------------------
-- Records of tb_company
-- ----------------------------
INSERT INTO `tb_company` VALUES ('1', 'mips', 'admin', 'admin', '2018-08-02 10:31:15', '2018-11-28 19:44:24', '0');

-- ----------------------------
-- Table structure for tb_company_balance
-- ----------------------------
DROP TABLE IF EXISTS `tb_company_balance`;
CREATE TABLE `tb_company_balance` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` char(16) NOT NULL DEFAULT '' COMMENT '公司编号',
  `resource_package_id` int(11) DEFAULT NULL COMMENT '套餐Id',
  `storage_max` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '存储空间总量',
  `storage_used` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '存储空间使用量',
  `storage_free` bigint(20) NOT NULL DEFAULT '0' COMMENT '默认存储空间',
  `bandwidth` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '网络带宽，单位Kb',
  `adv_max` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告机设备数量上限',
  `adv_used` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告机设备当前用量',
  `adv_free` int(11) NOT NULL DEFAULT '0' COMMENT '默认广告机上限',
  `vm_max` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '售货机数量上限',
  `vm_used` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '售货机当前数量',
  `vm_free` int(11) NOT NULL DEFAULT '0' COMMENT '默认售货机上限',
  `fw_max` bigint(20) NOT NULL DEFAULT '0' COMMENT '流量总量（Kb）',
  `fw_used` bigint(20) NOT NULL DEFAULT '0' COMMENT '剩余流量',
  `fw_free` bigint(20) NOT NULL DEFAULT '0' COMMENT '默认流量',
  `img_limit` int(11) NOT NULL DEFAULT '0' COMMENT '默认图片上传限制',
  `video_limit` int(11) NOT NULL DEFAULT '0' COMMENT '默认视频上传限制',
  `expire_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '当前配置过期时间',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '记录创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '资源配置状态，0正常',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='公司资源配置表--new';

-- ----------------------------
-- Records of tb_company_balance
-- ----------------------------
INSERT INTO `tb_company_balance` VALUES ('1', 'mips', '0', '102400', '0', '102400', '0', '10', '0', '10', '10', '0', '10', '1048576', '1048576', '1048576', '10240', '51200', '2029-07-28 23:59:59', '2018-07-28 14:07:14', null, '0');

-- ----------------------------
-- Table structure for tb_company_balance_default
-- ----------------------------
DROP TABLE IF EXISTS `tb_company_balance_default`;
CREATE TABLE `tb_company_balance_default` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `category` char(3) NOT NULL DEFAULT '' COMMENT '标识，“001”:注册即送',
  `storage` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '默认空间(KB)',
  `bandwidth` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认带宽',
  `adv_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认广告机数量',
  `vm_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认售货机数量',
  `flow_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '默认流量数量(KB)',
  `img_count` int(11) NOT NULL DEFAULT '0' COMMENT '默认单个图片上传大小限制（KB）',
  `video_count` int(11) NOT NULL DEFAULT '0' COMMENT '默认单个视频上传大小限制（KB）',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='注册即送';

-- ----------------------------
-- Records of tb_company_balance_default
-- ----------------------------
INSERT INTO `tb_company_balance_default` VALUES ('1', '001', '102400', '0', '10', '10', '1048576', '10240', '51200', '2017-12-09 17:06:30');

-- ----------------------------
-- Table structure for tb_company_label
-- ----------------------------
DROP TABLE IF EXISTS `tb_company_label`;
CREATE TABLE `tb_company_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL COMMENT '标签id',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司和标签关联列表';

-- ----------------------------
-- Records of tb_company_label
-- ----------------------------

-- ----------------------------
-- Table structure for tb_customerflow_static
-- ----------------------------
DROP TABLE IF EXISTS `tb_customerflow_static`;
CREATE TABLE `tb_customerflow_static` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count_time` varchar(20) NOT NULL DEFAULT '' COMMENT '日期 例如2016-12-12',
  `count_month` varchar(20) DEFAULT NULL COMMENT '月份',
  `count_hour` int(2) DEFAULT NULL COMMENT '小时',
  `all_count` int(11) DEFAULT '0' COMMENT '统计总数',
  `man_count` int(11) DEFAULT '0' COMMENT '男性总数',
  `women_count` int(11) DEFAULT '0' COMMENT '女性总数',
  `age_one_count` int(11) DEFAULT '0' COMMENT '0-11岁总数',
  `age_two_count` int(11) DEFAULT '0' COMMENT '11-20 岁总数',
  `age_three_count` int(11) DEFAULT '0' COMMENT '20-30岁总数',
  `age_four_count` int(11) DEFAULT '0' COMMENT '30-40岁总数',
  `age_five_count` int(11) DEFAULT '0' COMMENT '40-50岁总数',
  `age_six_count` int(11) DEFAULT '0' COMMENT '50岁以上总数',
  `device_id` int(11) DEFAULT '0' COMMENT '属于哪个终端',
  `duration_one` varchar(128) DEFAULT '0' COMMENT '1分钟以下',
  `duration_two` varchar(128) DEFAULT '0' COMMENT '1-3分钟',
  `duration_three` varchar(128) DEFAULT '0' COMMENT '3-5分钟',
  `duration_four` varchar(128) DEFAULT '0' COMMENT '5分钟以上',
  `company_code` char(16) DEFAULT NULL COMMENT '所在公司ID',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customerflow_static
-- ----------------------------

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '节点名称',
  `company_code` char(16) NOT NULL DEFAULT '' COMMENT '所在公司的编号',
  `parent_path` varchar(512) NOT NULL DEFAULT '/' COMMENT '父级节点的路径',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '记录创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `creator_login_id` varchar(32) DEFAULT '' COMMENT '创建者登录ID',
  `modifier_login_id` varchar(32) DEFAULT NULL COMMENT '记录修改者登录ID',
  `unix_perms` char(3) DEFAULT '700' COMMENT '权限标识',
  `default_flag` int(1) DEFAULT '0' COMMENT '默认分组的标志，0表示普通分组，1表示默认分组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='公司分组架构表--new';

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES ('1', '默认用户组', 'mips', '/', '2018-08-02 10:31:15', null, null, 'admin', null, '700', '1');

-- ----------------------------
-- Table structure for tb_department_rule
-- ----------------------------
DROP TABLE IF EXISTS `tb_department_rule`;
CREATE TABLE `tb_department_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '节点ID',
  `base_unix_perms` char(12) DEFAULT '111100000000' COMMENT '节点自身的权限',
  `adv_unix_perms` char(12) NOT NULL DEFAULT '111100000000' COMMENT '广告机的权限',
  `vm_unix_perms` char(12) NOT NULL DEFAULT '111100000000' COMMENT '售货机的权限',
  `material_unix_perms` char(12) NOT NULL DEFAULT '111100000000' COMMENT '素材的权限',
  `program_unix_perms` char(12) NOT NULL DEFAULT '111100000000' COMMENT '节目的权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点资源规则表--new';

-- ----------------------------
-- Records of tb_department_rule
-- ----------------------------
INSERT INTO `tb_department_rule` VALUES ('1', '1', '111100000000', '111100000000', '111100000000', '111100000000', '111100000000');

-- ----------------------------
-- Table structure for tb_device_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_basic_info`;
CREATE TABLE `tb_device_basic_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '终端唯一识别编号',
  `device_name` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '终端名称',
  `device_resolution` varchar(256) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '终端屏幕分辨率，以逗号隔开。例如：1024*768,1920*1080',
  `device_mac` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '终端MAC地址',
  `device_hard_version` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备主板型号',
  `device_firmware` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备固件版本',
  `device_system_type` varchar(64) CHARACTER SET utf8 DEFAULT 'Android' COMMENT '设备操作系统类型（Android、Windows）',
  `device_soft_version` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '终端软件版本',
  `device_unline_softversion` varchar(32) CHARACTER SET utf8 DEFAULT '0' COMMENT '默认为0，服务器离线升级后将此版本号改为升级后的版本号。客户端升级成功后在改为0',
  `is_used` tinyint(1) NOT NULL DEFAULT '1' COMMENT '终端使用标识(1-使用中，0-已删除)',
  `is_invalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '失效标识（1-有效，0-无效）',
  `device_module` int(3) NOT NULL DEFAULT '0' COMMENT '终端所属业务模块（0：默认1：数字标牌 2：售货机）',
  `device_type` int(3) DEFAULT NULL COMMENT '终端类型（0:默认 1：单屏-普通； 2：双屏-普通；3：单屏-AI；4：双屏-AI）',
  `device_screen` int(3) NOT NULL DEFAULT '0' COMMENT '横竖屏设置  0:横屏 1:竖屏 2:反向横屏 3:反向竖屏',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建注册时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `add_user_id` int(11) DEFAULT NULL COMMENT '添加人员',
  `company_code` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '所属公司编号',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  `group_id` int(11) DEFAULT '1' COMMENT '终端分组id',
  `system_version` varchar(64) COLLATE utf8_bin DEFAULT '001_001_000' COMMENT '终端当前的版本信息,默认基础版本',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_device_basic_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_commandmessage
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_commandmessage`;
CREATE TABLE `tb_device_commandmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '终端唯一标识',
  `command` int(1) DEFAULT NULL COMMENT '1:开关机，2:发布，3：清空节目',
  `command_attribute` int(11) DEFAULT NULL COMMENT '命令的补充信息，比如发布命令需带上发布ID',
  `status` int(1) DEFAULT NULL COMMENT '0:有效 1:失效',
  `creation_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端命令消息表';

-- ----------------------------
-- Records of tb_device_commandmessage
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_extend_info`;
CREATE TABLE `tb_device_extend_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_id` int(11) NOT NULL DEFAULT '0' COMMENT '属于哪个终端基础信息',
  `device_addr` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '终端位置',
  `device_remark` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `charge_user` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '负责人员',
  `charge_user_phone` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '负责人电话',
  `business_attribute` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商业属性',
  `screen_rotation` varchar(128) CHARACTER SET utf8 DEFAULT '0' COMMENT '屏幕的旋转角度,以逗号隔开',
  `screen_brightness` varchar(32) COLLATE utf8_bin DEFAULT '20' COMMENT '屏幕亮度，以逗号隔开',
  `device_variant` tinyint(1) DEFAULT '0' COMMENT '0表示基础版本，1表示AI版本',
  `device_ai_module` int(11) DEFAULT NULL COMMENT '1基础部分，2客流统计模块，4精准推广模块，8VIP模块。按激活模块相加。',
  `device_ai_pm_onoff` tinyint(1) DEFAULT NULL COMMENT '精准推广模块开关,0位关闭，1位开启',
  `device_ai_trial_status` int(3) DEFAULT NULL COMMENT 'AI试用状态：0表示缺省，1表示试用中，2表示已过期',
  `camera_position` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '终端摄像头位置设置信息，t位0关闭，1左上，2左下，3右上，4右下，5自定义，信息：t:0,x:0,y:0,w:0,h:0,s:0',
  `camera_work_status` tinyint(1) DEFAULT '1' COMMENT '摄像头运行状态 0：异常 1：正常',
  `device_ai_work_status` tinyint(1) DEFAULT NULL COMMENT 'AI模块运行状态0异常 1正常（加密芯片授权成功正常 未授权或不能使用异常）',
  `device_vip_info` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'VIP设置，包含开关、音量和静音，定义：s:1,v:50,m:0',
  `device_vipfile_md5` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '终端记录vip信息的文件',
  `device_appease_video` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '安抚视频id列表',
  `device_phone` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '报警电话',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '记录创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `delete_strategy` int(11) DEFAULT '1' COMMENT '设备存储删除策略，0关，1开',
  `diskspace` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '终端存储空间，all_space总存储空间，resource_space播放资源使用空间，log_space日志使用空间，residual_space剩余空间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_device_extend_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_group`;
CREATE TABLE `tb_device_group` (
  `Id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '终端分类名称',
  `parent_path` varchar(512) CHARACTER SET utf8 NOT NULL DEFAULT '/' COMMENT '父级节点的路径',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '记录创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `creator_login_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者登录ID',
  `modifier_login_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '记录修改者登录ID',
  `default_flag` int(1) DEFAULT '0' COMMENT '默认分组的标志，0表示普通分组，1表示默认分组',
  `company_code` char(16) COLLATE utf8_bin DEFAULT 'mips' COMMENT '所属公司代号',
  `department_id` int(11) DEFAULT '1' COMMENT '所属分组',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_device_group
-- ----------------------------
INSERT INTO `tb_device_group` VALUES ('1', '默认分组', '/', '2018-07-28 14:07:14', null, null, '', null, '1', 'mips', '1');

-- ----------------------------
-- Table structure for tb_device_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_log`;
CREATE TABLE `tb_device_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `device_mac` varchar(64) NOT NULL DEFAULT '' COMMENT '设备mac',
  `operation_type` int(11) NOT NULL DEFAULT '0' COMMENT '设备操作类型',
  `content` varchar(2550) DEFAULT NULL COMMENT '设备操作内容',
  `gmt_created` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '操作时间',
  `message_id` int(11) DEFAULT NULL COMMENT '消息编号',
  `server_status` int(3) DEFAULT NULL COMMENT '服务器下发状态（0：失败 1：成功）',
  `client_status` int(3) DEFAULT NULL COMMENT '设备接收状态（0：失败 1：成功）',
  `device_created` datetime DEFAULT NULL COMMENT '设备接收时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_device_log
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_material
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_material`;
CREATE TABLE `tb_device_material` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '节目ID',
  `material_id` int(11) NOT NULL DEFAULT '0' COMMENT '资源ID',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '时间',
  `down_progress` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='终端资源对应表';

-- ----------------------------
-- Records of tb_device_material
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_operation_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_operation_type`;
CREATE TABLE `tb_device_operation_type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_name` varchar(255) DEFAULT NULL COMMENT '操作项名称',
  `operation_name_en` varchar(255) DEFAULT NULL COMMENT '操作项名称英文命名',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_device_operation_type
-- ----------------------------
INSERT INTO `tb_device_operation_type` VALUES ('1', '截屏', 'SCREEN_CAPTURE');
INSERT INTO `tb_device_operation_type` VALUES ('2', '清空节目', 'WIPE_OUT_PROGRAMS');
INSERT INTO `tb_device_operation_type` VALUES ('3', '设置开关机', 'POWER_SCHEDULE');
INSERT INTO `tb_device_operation_type` VALUES ('4', '终端重启', 'REBOOT');
INSERT INTO `tb_device_operation_type` VALUES ('5', '软件升级', 'SOFTWARE_UPGRADE');
INSERT INTO `tb_device_operation_type` VALUES ('6', '固件升级', 'FIRMWARE_UPGRADE');
INSERT INTO `tb_device_operation_type` VALUES ('7', '设备名称修改', 'NAME_UPDATE');
INSERT INTO `tb_device_operation_type` VALUES ('8', '上传Log', 'GET_LOG_MESSAGE');
INSERT INTO `tb_device_operation_type` VALUES ('9', 'HDMI开关操作', 'HDMI_SWITCH');
INSERT INTO `tb_device_operation_type` VALUES ('10', '声音控制', 'VOLUME_CONTROL');
INSERT INTO `tb_device_operation_type` VALUES ('11', '远程关机', 'DEVICE_SHUTDOWN');
INSERT INTO `tb_device_operation_type` VALUES ('14', '屏幕旋转', 'SCREEN_ROTATION');
INSERT INTO `tb_device_operation_type` VALUES ('15', '插播消息', 'INTERSTITIAL_MESSAGES');
INSERT INTO `tb_device_operation_type` VALUES ('16', '精准推广状态', 'ACCURATE_PROMOTION_STATE');
INSERT INTO `tb_device_operation_type` VALUES ('17', '摄像头控制', 'CAMERA_CONTROL');
INSERT INTO `tb_device_operation_type` VALUES ('18', 'vip欢迎语声音控制', 'WELCOME_VOLUME_CONTROL');
INSERT INTO `tb_device_operation_type` VALUES ('20', '背光设置', 'LCD_CONTROL');
INSERT INTO `tb_device_operation_type` VALUES ('21', '开机自启', 'POWOER_BOOT_CONTROL');
INSERT INTO `tb_device_operation_type` VALUES ('22', '应用守护', 'DAEMON_CONTROL');
INSERT INTO `tb_device_operation_type` VALUES ('23', '亮度设置', 'BRIGHTNESS_CONTROL');
INSERT INTO `tb_device_operation_type` VALUES ('24', '横竖屏设置', 'SCREEN_SET');
INSERT INTO `tb_device_operation_type` VALUES ('25', '状态栏设置', 'BAR_STATUS');
INSERT INTO `tb_device_operation_type` VALUES ('26', '语言设置', 'LANGUAGE_SET');
INSERT INTO `tb_device_operation_type` VALUES ('27', '时间设置', 'TIME_SET');
INSERT INTO `tb_device_operation_type` VALUES ('30', 'AI节目下线(东莞芝捷项目)', 'SET_AI_PROGRAM_OFF_LINE');
INSERT INTO `tb_device_operation_type` VALUES ('110', '删除策略', 'SET_STRATEGY');
INSERT INTO `tb_device_operation_type` VALUES ('111', '清除日志', 'SET_LOG_CLEAN');
INSERT INTO `tb_device_operation_type` VALUES ('600', '设备激活', 'DEVICE_ACTIVATE');
INSERT INTO `tb_device_operation_type` VALUES ('601', '设备注册', 'DEVICE_REGISTER');
INSERT INTO `tb_device_operation_type` VALUES ('602', '设备登录', 'DEVICE_LOGIN');
INSERT INTO `tb_device_operation_type` VALUES ('603', '设备离线', 'DEVICE_OFFLINE');

-- ----------------------------
-- Table structure for tb_device_pms_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_pms_info`;
CREATE TABLE `tb_device_pms_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_id` int(11) NOT NULL DEFAULT '0' COMMENT '属于哪个终端基础信息',
  `device_telephone` varchar(32) DEFAULT NULL COMMENT '终端服务电话',
  `api_key` varchar(32) DEFAULT NULL COMMENT '终端api_key',
  `admin_password` varchar(32) DEFAULT NULL COMMENT '终端管理员登陆密码',
  `cash_count` decimal(10,2) DEFAULT NULL COMMENT '当前货机现金数',
  `device_probability` int(3) DEFAULT NULL COMMENT '终端概率',
  `probability_flag` int(3) DEFAULT NULL COMMENT '概率标准 1：低为标准 2：高 3：终端 4：商品',
  `door_password` varchar(32) DEFAULT NULL COMMENT '开门密码',
  `pms_status` tinyint(1) DEFAULT NULL COMMENT '终端状态。0: 异常； 1: 正常',
  `price_flag` int(3) DEFAULT NULL COMMENT '商品定价模式：0表示商品为准，1表示动态定价',
  `lottery_flag` int(3) DEFAULT NULL COMMENT '奖品形式；0表示买奖相同，1表示统一奖品，2表示差异奖品',
  `game_flag` int(3) DEFAULT NULL COMMENT '游戏模式，0表示无游戏，1表示拍牌，2表示转盘',
  `prize_content` varchar(255) DEFAULT NULL COMMENT '奖品内容，单个奖品格式为（类型标识 + ID + @ + 概率',
  `wx_mp_id` int(11) DEFAULT NULL COMMENT '收款微信公众号',
  `device_alert` int(11) DEFAULT NULL COMMENT '存货预警数',
  `member_name` varchar(32) DEFAULT NULL COMMENT '负责人微信号',
  `zfb_mp_id` int(11) DEFAULT NULL COMMENT '支付宝收款号',
  `device_coin` int(11) DEFAULT NULL COMMENT '硬币报警数',
  `device_banknote` int(11) DEFAULT NULL COMMENT '纸币报警法值',
  `cardType` int(11) DEFAULT NULL COMMENT '货道类别',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '记录创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_device_pms_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_powerschedule
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_powerschedule`;
CREATE TABLE `tb_device_powerschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT '0' COMMENT '终端唯一标识编号',
  `monday` varchar(2550) DEFAULT NULL COMMENT '{"on":"00:00", "off":"00:00","status":"on"}',
  `tuesday` varchar(2550) DEFAULT NULL COMMENT 'json字符串，最多支持10条',
  `wednesday` varchar(2550) DEFAULT NULL,
  `thursday` varchar(2550) DEFAULT NULL,
  `friday` varchar(2550) DEFAULT NULL,
  `saturday` varchar(2550) DEFAULT NULL,
  `sunday` varchar(255) DEFAULT NULL,
  `otherday` varchar(2550) DEFAULT NULL COMMENT '特殊日期的',
  `crossday` varchar(2550) DEFAULT NULL COMMENT '跨日期的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端开机关机时间表';

-- ----------------------------
-- Records of tb_device_powerschedule
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_schedule
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_schedule`;
CREATE TABLE `tb_device_schedule` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `device_id` int(3) DEFAULT NULL COMMENT '设备ID',
  `schedule_details` text COLLATE utf8_bin COMMENT '日程详情',
  `screen_type` int(1) DEFAULT '1' COMMENT '屏幕显示 1：屏幕1 2：屏幕2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='设备日程安排表';

-- ----------------------------
-- Records of tb_device_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_state_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_state_info`;
CREATE TABLE `tb_device_state_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_id` int(11) NOT NULL DEFAULT '0' COMMENT '属于哪个终端基础信息',
  `device_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最近登录时间',
  `device_ip` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '终端IP',
  `device_volume` int(3) DEFAULT '0' COMMENT '终端音量',
  `device_flow` bigint(20) NOT NULL DEFAULT '0' COMMENT '终端剩余流量（单位Kb）',
  `is_mute` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否静音0-否 1-是',
  `network_type` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '3G/4G/WIFI',
  `is_online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '终端在线状态（0.离线; 1.在线）',
  `is_active` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '端激活状态（0.未激活 1.激活）1;001_001_002 表示基础版和001_001_002定制版本激活',
  `is_blacklight` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否背光（0：否 1：是）',
  `is_root_start` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开机自启（0：否 1：是）',
  `is_guard` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启进程守护（0 否 1：是）',
  `is_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示状态栏（0：否 1：是）',
  `device_language` varchar(11) COLLATE utf8_bin NOT NULL DEFAULT 'cn' COMMENT '系统语音（cn：中文 en：英文）',
  `device_disk_space` varchar(16) CHARACTER SET utf8 DEFAULT NULL COMMENT '磁盘空间',
  `device_sys_time` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '时间设置，格式（yyyy-MM-dd HH:mm）',
  `playtime_count` int(11) DEFAULT '0' COMMENT '总计播放时长',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '记录创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `gmt_offline` datetime DEFAULT NULL COMMENT '离线时间',
  `is_available` int(64) DEFAULT '0' COMMENT '是否可操作 0-可 1-不可',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_device_state_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_upgrade`;
CREATE TABLE `tb_device_upgrade` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `path` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '下载的绝对地址',
  `uploader` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传者',
  `ver_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '程序版本号',
  `device_module` int(1) NOT NULL DEFAULT '1' COMMENT '终端所属业务模块（1-数字标牌;2-售货机）',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '软件版本状态：0-未发布；1-已发布；2-已失效（撤销）',
  `gmt_modified` datetime DEFAULT NULL COMMENT '更新时间',
  `type_platform` int(1) DEFAULT '1' COMMENT '使用平台：1-Android，2-IOS',
  `oss_path` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '阿里云OSS下载地址',
  `ver_md5` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '软件版本的MD5值',
  `ver_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '软件版本名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='软件升级';

-- ----------------------------
-- Records of tb_device_upgrade
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_upload
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_upload`;
CREATE TABLE `tb_device_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `device_mac` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '终端mac地址',
  `file_type` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件类型0-图片 1-log 5-报警 6-视频上传',
  `file_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名称',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `file_path` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '文件存储路径',
  `gmt_created` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '上传时间',
  `company_code` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `oss_path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'oss路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_device_upload
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_verinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_verinfo`;
CREATE TABLE `tb_device_verinfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ver_package` varchar(255) DEFAULT NULL COMMENT '软件包',
  `ver_code` varchar(64) DEFAULT NULL COMMENT '软件版本号',
  `ver_name` varchar(64) DEFAULT NULL COMMENT '软件版本名称',
  `ver_md5` varchar(255) DEFAULT NULL COMMENT '软件版本的MD5值',
  `path` varchar(255) DEFAULT NULL COMMENT '下载的绝对地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APK信息';

-- ----------------------------
-- Records of tb_device_verinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_device_volumeschedule
-- ----------------------------
DROP TABLE IF EXISTS `tb_device_volumeschedule`;
CREATE TABLE `tb_device_volumeschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int(11) DEFAULT NULL COMMENT '终端id',
  `start_time` varchar(8) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(8) DEFAULT NULL COMMENT '结束时间',
  `volume` int(3) DEFAULT NULL COMMENT '音量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_device_volumeschedule
-- ----------------------------

-- ----------------------------
-- Table structure for tb_label
-- ----------------------------
DROP TABLE IF EXISTS `tb_label`;
CREATE TABLE `tb_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL DEFAULT '0' COMMENT '标签名称',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司标签列表';

-- ----------------------------
-- Records of tb_label
-- ----------------------------

-- ----------------------------
-- Table structure for tb_licence_list
-- ----------------------------
DROP TABLE IF EXISTS `tb_licence_list`;
CREATE TABLE `tb_licence_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licence_type` int(3) NOT NULL COMMENT '授权类型（0：本地导入 1：在线授权）',
  `licence_num` int(11) NOT NULL COMMENT '授权数量',
  `gmt_creat` datetime NOT NULL COMMENT '时间',
  `status` int(3) NOT NULL COMMENT '授权状态（见授权提取状态值）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_licence_list
-- ----------------------------

-- ----------------------------
-- Table structure for tb_licence_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_licence_user`;
CREATE TABLE `tb_licence_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licence_user` varchar(64) NOT NULL COMMENT '授权平台用户名',
  `access_token` varchar(256) NOT NULL COMMENT '授权平台调用token',
  `api_key` varchar(128) NOT NULL COMMENT 'api_key',
  `account_type` int(3) NOT NULL COMMENT '账户类型（1：B类客户  2：C类客户）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_licence_user
-- ----------------------------

-- ----------------------------
-- Table structure for tb_material_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_material_group`;
CREATE TABLE `tb_material_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '素材分类名称',
  `parent_path` varchar(512) NOT NULL DEFAULT '/' COMMENT '父级节点的路径',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '记录创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `creator_login_id` varchar(32) DEFAULT '' COMMENT '创建者登录ID',
  `modifier_login_id` varchar(32) DEFAULT NULL COMMENT '记录修改者登录ID',
  `default_flag` int(1) DEFAULT '0' COMMENT '默认分组的标志，0表示普通分组，1表示默认分组',
  `company_code` char(16) DEFAULT 'mips' COMMENT '所属公司代号',
  `department_id` int(11) DEFAULT '1' COMMENT '所属分组',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_material_group
-- ----------------------------
INSERT INTO `tb_material_group` VALUES ('1', '默认分组', '/', '2018-07-16 16:30:52', null, null, 'admin', null, '1', 'mips', '1');

-- ----------------------------
-- Table structure for tb_material_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_material_info`;
CREATE TABLE `tb_material_info` (
  `Id` int(3) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(40) DEFAULT NULL COMMENT '素材名称',
  `material_type_id` int(3) DEFAULT NULL COMMENT '素材类型',
  `material_url` varchar(255) DEFAULT NULL COMMENT '素材地址',
  `material_size` int(11) DEFAULT '0' COMMENT '素材文件大小(字节)',
  `material_md5` varchar(32) DEFAULT NULL COMMENT '文件md5码',
  `upload_user` int(11) DEFAULT NULL COMMENT '上传人员',
  `gmt_upload` datetime DEFAULT NULL COMMENT '上传时间',
  `duration` int(3) DEFAULT '0' COMMENT '播放时长(以秒为单位)',
  `resolution` varchar(32) DEFAULT NULL,
  `isdelete` int(3) DEFAULT '0' COMMENT '0：正常 1：删除 2:导入',
  `user_group_id` int(11) DEFAULT '0' COMMENT '上传者所在分组',
  `company_code` char(16) DEFAULT NULL COMMENT '所在公司ID',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录变更时间',
  `oss_url` varchar(255) DEFAULT NULL COMMENT 'OSS存储路径',
  `convert_url` varchar(255) DEFAULT NULL COMMENT '素材视频非mp4转化成mp4路径，非视频默认为空',
  `group_id` int(11) DEFAULT '1' COMMENT '素材分组',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='素材信息表';

-- ----------------------------
-- Records of tb_material_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_material_limit
-- ----------------------------
DROP TABLE IF EXISTS `tb_material_limit`;
CREATE TABLE `tb_material_limit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `image_max` int(11) NOT NULL DEFAULT '0' COMMENT '图片最大限制（KB）',
  `video_max` int(11) NOT NULL DEFAULT '0' COMMENT '视频最大限制（KB）',
  `audio_max` int(11) NOT NULL DEFAULT '0' COMMENT '音频最大限制（KB）',
  `office_max` int(11) NOT NULL DEFAULT '0' COMMENT '文档最大限制（KB）',
  `upload_count` int(11) NOT NULL DEFAULT '0' COMMENT '最大上传数量',
  `upload_total_size` int(11) NOT NULL DEFAULT '0' COMMENT '总大小最大限制（KB）',
  `company_code` char(16) DEFAULT NULL COMMENT '公司标识',
  `gmt_modified` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='素材上传限制';

-- ----------------------------
-- Records of tb_material_limit
-- ----------------------------
INSERT INTO `tb_material_limit` VALUES ('1', '10240', '51200', '10240', '10240', '10', '1024000', 'mips', '2018-08-02 14:35:11');

-- ----------------------------
-- Table structure for tb_material_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_material_template`;
CREATE TABLE `tb_material_template` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(32) DEFAULT NULL COMMENT '模板名称',
  `template_resolution_id` int(3) DEFAULT NULL COMMENT '模板分辨率Id',
  `template_url` varchar(255) DEFAULT NULL COMMENT '模板配置地址（XML配置文件）',
  `owner` int(3) DEFAULT NULL COMMENT '制作/修改人员',
  `update_time` datetime DEFAULT NULL COMMENT '制作/修改时间',
  `company_code` char(16) DEFAULT NULL COMMENT '所属公司代号',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  `group_id` int(11) DEFAULT '1' COMMENT '节目分组',
  `title_pic_url` varchar(255) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of tb_material_template
-- ----------------------------

-- ----------------------------
-- Table structure for tb_notice_device
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice_device`;
CREATE TABLE `tb_notice_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) DEFAULT NULL COMMENT '消息id',
  `device_id` int(11) DEFAULT NULL COMMENT '终端id',
  `company_code` char(16) DEFAULT NULL COMMENT '所属公司代号',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插播消息与终端对应表';

-- ----------------------------
-- Records of tb_notice_device
-- ----------------------------

-- ----------------------------
-- Table structure for tb_notice_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice_info`;
CREATE TABLE `tb_notice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_speed` int(1) DEFAULT NULL COMMENT '速度（1.慢;2.一般;3.快;4.很快.）',
  `notice_content` varchar(4096) DEFAULT NULL COMMENT '消息内容',
  `notice_duration` int(11) DEFAULT NULL COMMENT '播放时长',
  `notice_position` int(2) DEFAULT NULL COMMENT '消息位置（1：底部，2：顶部）',
  `notice_font_color` varchar(32) DEFAULT NULL COMMENT '颜色',
  `notice_font_size` varchar(32) DEFAULT NULL COMMENT '字体大小',
  `create_user` int(3) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `notice_title` varchar(32) DEFAULT NULL COMMENT '消息标题',
  `notice_time` datetime DEFAULT NULL COMMENT '插播时间',
  `notice_status` int(2) DEFAULT NULL COMMENT '状态（1：未播放； 2：正在播放； 3：已下线；）',
  `notice_type` int(2) DEFAULT NULL COMMENT '类型(1:按时段； 2：按次数； )',
  `notice_direction` int(2) DEFAULT NULL COMMENT '文字滚动方向（1.向左；2.向右）',
  `notice_typeface` int(2) DEFAULT NULL COMMENT '字体（1.宋体；2.楷书；3.隶书；4.华文新魏；）',
  `notice_number` int(11) DEFAULT NULL COMMENT '播放次数',
  `notice_start_time` datetime DEFAULT NULL COMMENT '开始播放时间点',
  `notice_end_time` datetime DEFAULT NULL COMMENT '播放结束时间点',
  `device_screen` int(2) DEFAULT '1' COMMENT '消息所属屏幕（1：屏幕一（上屏） ；  2：屏幕二（下屏）；）',
  `company_code` char(16) DEFAULT NULL COMMENT '所属公司代号',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  `notice_bg_color` varchar(32) DEFAULT '#FFFFFF' COMMENT '背景颜色',
  `notice_bg_opacity` int(3) DEFAULT '0' COMMENT '背景透明度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插播消息表';

-- ----------------------------
-- Records of tb_notice_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_log`;
CREATE TABLE `tb_operation_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(64) DEFAULT NULL COMMENT '操作人',
  `company_code` char(16) DEFAULT NULL COMMENT '公司识别号',
  `module_type` char(6) DEFAULT '0' COMMENT '模块类型',
  `operation_type` int(11) NOT NULL DEFAULT '0' COMMENT '操作类型  (0:新增，1:更新，2:删除）',
  `content` varchar(10000) NOT NULL DEFAULT '' COMMENT '操作内容',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '操作时间',
  `end_result` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作结果  (0：失败，1：成功)',
  `device_ip` varchar(32) DEFAULT NULL COMMENT '操作机器Ip',
  `detail_attached` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有详情(0:有，1:没有)',
  `detail_before_log` longtext COMMENT '操作前数据',
  `detail_after_log` longtext COMMENT '操作后数据',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台操作日志表';

-- ----------------------------
-- Records of tb_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for tb_picture_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_picture_group`;
CREATE TABLE `tb_picture_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '' COMMENT '分组名称',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '删除时间',
  `default_flag` int(1) DEFAULT '0' COMMENT '默认分组的标志，0表示普通分组，1表示默认分组',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片素材分组表';

-- ----------------------------
-- Records of tb_picture_group
-- ----------------------------

-- ----------------------------
-- Table structure for tb_picture_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_picture_info`;
CREATE TABLE `tb_picture_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '图片名称',
  `picture_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  `picture_oss_url` varchar(255) DEFAULT NULL COMMENT 'oss路径',
  `picture_size` bigint(20) DEFAULT '0' COMMENT '图片大小(字节)',
  `picture_md5` varchar(32) NOT NULL DEFAULT '' COMMENT '图片MD5',
  `picture_resolution` varchar(255) DEFAULT NULL COMMENT '图片分辨率',
  `picture_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0:正常 1:删除',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '上传时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '删除时间',
  `group_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '图片分组Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='背景素材表';

-- ----------------------------
-- Records of tb_picture_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_play_list
-- ----------------------------
DROP TABLE IF EXISTS `tb_play_list`;
CREATE TABLE `tb_play_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '播放列表的名称',
  `company_code` char(16) DEFAULT '' COMMENT '所属公司代号',
  `login_id` char(16) DEFAULT '' COMMENT '创建者',
  `content` varchar(1024) DEFAULT NULL COMMENT '播放列表的详情，包含播放列表的节目或素材Id,所处位置 ，如：节目Id@类型',
  `status` tinyint(1) DEFAULT '1' COMMENT '播放列表的审核状态（   1：未审核；  2：已审核）',
  `check_remark` varchar(32) DEFAULT NULL COMMENT '审核备注',
  `group_id` int(11) DEFAULT '0' COMMENT '播放列表所属分组',
  `department_id` int(11) DEFAULT NULL COMMENT '所属节点ID',
  `gmt_created` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `material_Ids` varchar(255) DEFAULT NULL COMMENT '所有素材的ID',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标志：0正常，1删除',
  `size` bigint(11) DEFAULT '0' COMMENT '播放列表素材和节目的总大小',
  `check_user` varchar(25) DEFAULT NULL COMMENT '审核人',
  `gmt_checked` datetime DEFAULT NULL COMMENT '审核时间',
  `sum_play_time` int(11) DEFAULT '0' COMMENT '总播放时间',
  `title_pic_url` varchar(255) DEFAULT NULL COMMENT '播放列表的缩略图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='播放列表信息表';

-- ----------------------------
-- Records of tb_play_list
-- ----------------------------

-- ----------------------------
-- Table structure for tb_program_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_program_group`;
CREATE TABLE `tb_program_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '节目分类名称',
  `parent_path` varchar(512) CHARACTER SET utf8 NOT NULL DEFAULT '/' COMMENT '父级节点的路径',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '记录创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `creator_login_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者登录ID',
  `modifier_login_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '记录修改者登录ID',
  `default_flag` int(1) DEFAULT '0' COMMENT '默认分组的标志，0表示普通分组，1表示默认分组',
  `company_code` char(16) COLLATE utf8_bin DEFAULT 'mips' COMMENT '所属公司代号',
  `department_id` int(11) DEFAULT '1' COMMENT '所属分组',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_program_group
-- ----------------------------
INSERT INTO `tb_program_group` VALUES ('1', '默认分组', '/', '2018-07-31 17:10:27', null, null, 'admin', null, '1', 'mips', '1');

-- ----------------------------
-- Table structure for tb_program_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_program_info`;
CREATE TABLE `tb_program_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `program_name` varchar(128) DEFAULT NULL COMMENT '节目名称',
  `program_status` tinyint(1) DEFAULT NULL COMMENT '节目状态，-1保存中，0未审核，1审核通过，2审核失败',
  `check_user` int(11) DEFAULT NULL COMMENT '审核人',
  `check_time` datetime DEFAULT NULL COMMENT '审核时间',
  `check_remark` varchar(32) DEFAULT NULL COMMENT '审核备注',
  `program_category_id` int(11) DEFAULT NULL COMMENT '节目类型编号，1普通，2互动',
  `program_epg` varchar(255) DEFAULT NULL COMMENT '节目的EPG（含场景及内容的配置XML地址）',
  `program_number_id` varchar(32) DEFAULT NULL COMMENT '节目编号',
  `program_description` varchar(128) DEFAULT NULL COMMENT '节目描述',
  `resolution_id` int(11) DEFAULT NULL COMMENT '节目分辨率id',
  `program_duration` int(4) DEFAULT NULL COMMENT '节目时长(秒)',
  `create_user` int(11) DEFAULT NULL COMMENT '节目创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int(3) DEFAULT NULL COMMENT '最后修改者',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `package_url` varchar(255) DEFAULT NULL COMMENT 'zip包地址',
  `package_md5` varchar(32) DEFAULT NULL COMMENT '节目配置文件的md5码，json文件',
  `package_size` bigint(20) DEFAULT '0' COMMENT '包大小，以B为单位 (1kb=1024B)',
  `reserve1` varchar(32) DEFAULT NULL COMMENT '保留字段',
  `del_flag` int(3) DEFAULT '0' COMMENT '删除标志：0正常， 1删除',
  `user_group_id` int(11) DEFAULT '0',
  `program_ai_label` varchar(128) DEFAULT NULL COMMENT '精准推广标签 1：男2：女3：儿童4：少年5：青年6：壮年7：中年8：老年（。。扩展）_优先级（1,2,3,4,5）_扩展 取值：（选取男，女，少年优先级为2）1,2,4_2',
  `company_code` char(16) DEFAULT NULL COMMENT '所属公司代号',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '记录删除时间',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  `oss_url_xml` varchar(255) DEFAULT NULL COMMENT '节目xml文件OSS存储路径',
  `oss_url_zip` varchar(255) DEFAULT NULL COMMENT '节目zip文件OSS存储路径',
  `group_id` int(11) DEFAULT '1' COMMENT '节目分组',
  `material_ids` varchar(1024) DEFAULT NULL COMMENT '素材ID集合 ,隔开',
  `time_flag` varchar(25) DEFAULT NULL COMMENT '素材制作的节目标识：素材id@设置的播放时长',
  `title_pic_url` varchar(255) DEFAULT NULL COMMENT '节目的缩略图',
  PRIMARY KEY (`id`),
  KEY `resolution_id` (`resolution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节目信息表';

-- ----------------------------
-- Records of tb_program_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_program_resolution
-- ----------------------------
DROP TABLE IF EXISTS `tb_program_resolution`;
CREATE TABLE `tb_program_resolution` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `resolution_id` int(3) DEFAULT NULL COMMENT '节目分辨率id',
  `resolution_value` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '节目分辨率值',
  `company_code` char(16) CHARACTER SET utf8 DEFAULT NULL COMMENT '所属公司代号',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='节目分辨率表';

-- ----------------------------
-- Records of tb_program_resolution
-- ----------------------------
INSERT INTO `tb_program_resolution` VALUES ('1', '1', '1920*1080', 'mips', '1');
INSERT INTO `tb_program_resolution` VALUES ('2', '1', '1280*800', 'mips', '1');
INSERT INTO `tb_program_resolution` VALUES ('3', '1', '1280*752', 'mips', '1');
INSERT INTO `tb_program_resolution` VALUES ('4', '1', '1440*900', 'mips', '1');
INSERT INTO `tb_program_resolution` VALUES ('5', '1', '1024*768', 'mips', '1');
INSERT INTO `tb_program_resolution` VALUES ('6', '1', '1366*768', 'mips', '1');
INSERT INTO `tb_program_resolution` VALUES ('7', '1', '800*1280', 'mips', '1');
INSERT INTO `tb_program_resolution` VALUES ('8', '1', '1080*1920', 'mips', '1');

-- ----------------------------
-- Table structure for tb_program_scene
-- ----------------------------
DROP TABLE IF EXISTS `tb_program_scene`;
CREATE TABLE `tb_program_scene` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `scene_name` varchar(32) DEFAULT NULL COMMENT '场景名',
  `scene_duration` int(10) DEFAULT NULL COMMENT '场景时长',
  `program_id` int(11) DEFAULT NULL COMMENT '所属节目id',
  `scene_order` int(3) DEFAULT NULL COMMENT '场景顺序（从1开始）',
  `only_key` varchar(32) DEFAULT NULL COMMENT '节目下唯一key',
  PRIMARY KEY (`id`),
  KEY `fk_psc_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节目场景表';

-- ----------------------------
-- Records of tb_program_scene
-- ----------------------------

-- ----------------------------
-- Table structure for tb_program_scene_element
-- ----------------------------
DROP TABLE IF EXISTS `tb_program_scene_element`;
CREATE TABLE `tb_program_scene_element` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `scene_id` int(3) DEFAULT NULL COMMENT '所属场景Id',
  `element_name` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '元素名',
  `element_category_id` int(3) DEFAULT NULL COMMENT '元素类型',
  `element_width` int(3) DEFAULT NULL COMMENT '宽度',
  `element_height` int(3) DEFAULT NULL COMMENT '高度',
  `element_posX` int(3) DEFAULT NULL COMMENT '水平X位置',
  `element_posY` int(3) DEFAULT NULL COMMENT '垂直Y位置',
  `element_div` int(3) DEFAULT NULL COMMENT '元素所在分层顺序',
  `element_config` varchar(1024) CHARACTER SET utf8 DEFAULT '' COMMENT '元素配置',
  `element_preconfig` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT '元素链接配置',
  `link_sence_id` int(3) DEFAULT NULL COMMENT '互动节目的跳转场景ID',
  `element_key` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '场景下唯一key',
  `element_otype` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '其它属性。这里暂时用于视频保存 1平铺显示 2等比显示',
  PRIMARY KEY (`id`),
  KEY `fk_scene_id` (`scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='节目场景元素表';

-- ----------------------------
-- Records of tb_program_scene_element
-- ----------------------------

-- ----------------------------
-- Table structure for tb_publish_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_publish_detail`;
CREATE TABLE `tb_publish_detail` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '发布明细表',
  `program_id` int(3) DEFAULT NULL COMMENT '节目ID',
  `device_id` int(3) DEFAULT NULL COMMENT '终端ID',
  `publish_id` int(3) DEFAULT NULL COMMENT '发布ID',
  `download_progress` int(3) DEFAULT '0' COMMENT '下载进度 -1:下载失败 -2:磁盘空间不足 -3:未审核或审核不通过',
  `del_flag` int(3) DEFAULT '0' COMMENT '状态：0，正常；1：已删除',
  `program_order` int(3) DEFAULT NULL COMMENT '节目播放顺序',
  `screen_type` tinyint(1) DEFAULT '1' COMMENT '屏幕显示 1：屏幕1 2：屏幕2',
  `group_id` int(3) DEFAULT '1' COMMENT '终端对应的分组ID',
  PRIMARY KEY (`id`),
  KEY `fk_pd_program_id` (`program_id`),
  KEY `fk_pd_publish_id` (`publish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='发布明细表';

-- ----------------------------
-- Records of tb_publish_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tb_publish_detail_new
-- ----------------------------
DROP TABLE IF EXISTS `tb_publish_detail_new`;
CREATE TABLE `tb_publish_detail_new` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `publish_id` int(3) DEFAULT NULL COMMENT '发布ID',
  `program_id` int(3) DEFAULT NULL COMMENT '节目ID',
  `play_list_id` int(3) DEFAULT NULL COMMENT '播放列表ID',
  `device_id` int(3) DEFAULT NULL COMMENT '终端ID',
  `device_list_id` int(3) DEFAULT NULL COMMENT '终端分组ID',
  `download_progress` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '下载进度 素材id',
  `progress` int(3) DEFAULT '0' COMMENT '下载进度值',
  `del_flag` int(3) DEFAULT '0' COMMENT '状态：0，正常；1：已删除',
  `program_order` int(3) DEFAULT NULL COMMENT '节目播放顺序',
  `screen_type` tinyint(1) DEFAULT '1' COMMENT '屏幕显示 1：屏幕1 2：屏幕2',
  PRIMARY KEY (`id`),
  KEY `fk_pd_program_id` (`program_id`),
  KEY `fk_pd_publish_id` (`publish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='新发布明细表';

-- ----------------------------
-- Records of tb_publish_detail_new
-- ----------------------------

-- ----------------------------
-- Table structure for tb_publish_detail_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_publish_detail_record`;
CREATE TABLE `tb_publish_detail_record` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `publish_id` int(3) DEFAULT NULL COMMENT '设备ID',
  `content` text COLLATE utf8_bin COMMENT '发布详情',
  `screen_type` int(1) DEFAULT '1' COMMENT '屏幕显示 1：屏幕1 2：屏幕2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='发布详情记录表';

-- ----------------------------
-- Records of tb_publish_detail_record
-- ----------------------------

-- ----------------------------
-- Table structure for tb_publish_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_publish_info`;
CREATE TABLE `tb_publish_info` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `publish_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发布名称',
  `publish_time` int(11) DEFAULT NULL COMMENT '发布时间',
  `publish_time_two` int(11) DEFAULT NULL COMMENT '屏幕2发布时间',
  `publish_expire_time` int(11) DEFAULT NULL COMMENT '过期时间',
  `publish_expire_time_two` int(11) DEFAULT NULL COMMENT '屏幕2过期时间',
  `publish_user` int(11) DEFAULT NULL COMMENT '发布人',
  `check_user` int(11) DEFAULT NULL COMMENT '审核人',
  `check_time` int(11) DEFAULT NULL,
  `publish_status` tinyint(1) DEFAULT NULL COMMENT '状态(0：未审核，1：审核通过，2：审核失败，3：已下线，4：已删除)',
  `check_remark` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核备注',
  `publist_is_singleton` tinyint(1) DEFAULT '0' COMMENT '是否独占（0：否，1：是）',
  `publist_is_singleton_two` tinyint(1) DEFAULT '0' COMMENT '屏幕2是否独占',
  `play_mode` tinyint(1) DEFAULT NULL COMMENT '播放模式（0：默认轮播，1：自定义,2:按周播放）',
  `play_mode_two` tinyint(1) DEFAULT NULL COMMENT '屏幕2播放模式',
  `publist_is_synchronize` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否同步播放，0-否 1-同步',
  `cycle_time` varchar(16) COLLATE utf8_bin DEFAULT '0' COMMENT '播放周期 0：每天，1：周一，2：周二，3：周三，4：周四, 5:周五,6:周六 ,7:周日（多个,隔开）',
  `cycle_time_two` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '屏幕2播放周期',
  `wite_time` int(4) DEFAULT '0' COMMENT '发布互动节目无操作进入屏保广告等待时间',
  `user_group_id` int(11) DEFAULT '0',
  `publish_type` tinyint(1) DEFAULT '1' COMMENT '节目发布类型，1：普通，2：互动，3：双屏',
  `play_status` tinyint(1) DEFAULT '0' COMMENT '播放状态（0：无；   1：正在播放；  2：已下线；）',
  `company_code` char(16) COLLATE utf8_bin DEFAULT '' COMMENT '所属公司代号',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '所属节点ID',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='发布信息表';

-- ----------------------------
-- Records of tb_publish_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_publish_schedule
-- ----------------------------
DROP TABLE IF EXISTS `tb_publish_schedule`;
CREATE TABLE `tb_publish_schedule` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `publish_id` int(3) DEFAULT NULL COMMENT '发布ID',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `start_time` time DEFAULT NULL COMMENT '开始时间（时分秒）',
  `end_time` time DEFAULT NULL COMMENT '结束时间（时分秒）',
  `turn_cycle` int(3) DEFAULT NULL COMMENT '轮换周期（0：自定义，1：周一，2：周二，3：周三，4：周四, 5:周五,6:周六 ,7:周日,8:轮播）',
  `screen_type` int(1) DEFAULT '1' COMMENT '屏幕显示 1：屏幕1 2：屏幕2',
  PRIMARY KEY (`id`),
  KEY `fk_psd_publish_id` (`publish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='发布时间计划表';

-- ----------------------------
-- Records of tb_publish_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for tb_publish_schedule_new
-- ----------------------------
DROP TABLE IF EXISTS `tb_publish_schedule_new`;
CREATE TABLE `tb_publish_schedule_new` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `publish_id` int(3) DEFAULT NULL COMMENT '发布ID',
  `schedule_time` text COLLATE utf8_bin COMMENT '时间段，（开始时间-结束时间），分开',
  `screen_type` int(1) DEFAULT '1' COMMENT '屏幕显示 1：屏幕1 2：屏幕2',
  PRIMARY KEY (`id`),
  KEY `fk_psd_publish_id` (`publish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='新发布时间计划表';

-- ----------------------------
-- Records of tb_publish_schedule_new
-- ----------------------------

-- ----------------------------
-- Table structure for tb_release_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_release_message`;
CREATE TABLE `tb_release_message` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `system_message_id` int(11) DEFAULT NULL COMMENT '系统消息Id',
  `rule_message_id` int(11) DEFAULT NULL COMMENT '规则消息Id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 （0:待发布，1:已发布，2:已撤销）',
  `content_url` varchar(64) NOT NULL DEFAULT '' COMMENT '内容路径',
  `company_code` char(16) DEFAULT NULL COMMENT '公司识别号',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '消息类型',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息发布表';

-- ----------------------------
-- Records of tb_release_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_release_message_read
-- ----------------------------
DROP TABLE IF EXISTS `tb_release_message_read`;
CREATE TABLE `tb_release_message_read` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL DEFAULT '0' COMMENT '系统消息Id',
  `company_code` char(16) NOT NULL DEFAULT '' COMMENT '公司识别号',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '第一次阅读时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司-系统消息关系表';

-- ----------------------------
-- Records of tb_release_message_read
-- ----------------------------

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `company_code` char(16) NOT NULL DEFAULT '' COMMENT '所属公司编号，0表示平台',
  `department_id` int(11) unsigned DEFAULT '0' COMMENT '所属的节点ID，0表示平台',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '角色创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '角色修改时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '角色删除时间',
  `creator_login_id` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者登录ID',
  `modifier_login_id` varchar(32) DEFAULT NULL COMMENT '修改者登录ID',
  `action_code_list` varchar(20000) DEFAULT NULL COMMENT '角色权限列表，逗号相隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表--new';

-- ----------------------------
-- Records of tb_role
-- ----------------------------

-- ----------------------------
-- Table structure for tb_rule_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_rule_message`;
CREATE TABLE `tb_rule_message` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) NOT NULL DEFAULT '' COMMENT '规则标识（001：续费提醒，002：到期提醒）',
  `name` varchar(64) DEFAULT NULL COMMENT '规则名称',
  `explain` varchar(255) DEFAULT NULL COMMENT '规则说明',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `content_url` varchar(64) DEFAULT NULL COMMENT '内容路径',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类别',
  `login_id` varchar(64) DEFAULT NULL COMMENT '创建人',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_delete` datetime DEFAULT NULL COMMENT '无效时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 （0:有效，1:无效）',
  `day` int(11) NOT NULL DEFAULT '0' COMMENT '过期前多少天发布（以天为单位）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='规则消息表';

-- ----------------------------
-- Records of tb_rule_message
-- ----------------------------
INSERT INTO `tb_rule_message` VALUES ('1', '001', '资源续费提醒', '企业用户所购买的资源即将到期时，自动向用户发送通知，提醒用户续费。', '资源续费提醒', null, '0', 'admin', '2017-12-06 10:10:11', '2017-12-11 18:01:34', '2017-12-06 17:21:11', '1', '7');
INSERT INTO `tb_rule_message` VALUES ('2', '002', '资源到期提醒', '企业用户所购买的资源已到期，自动向用户发送通知，告知用户相关资源将不可用。', '到期提醒', null, '0', 'admin', '2017-12-06 10:10:11', '2017-12-11 17:53:47', '2017-12-06 10:23:20', '1', '0');

-- ----------------------------
-- Table structure for tb_sms
-- ----------------------------
DROP TABLE IF EXISTS `tb_sms`;
CREATE TABLE `tb_sms` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号码',
  `service_tag` int(3) NOT NULL DEFAULT '0' COMMENT '相关的服务，10表示注册',
  `code` char(6) NOT NULL DEFAULT '' COMMENT '验证码，6位数字',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '生成时间',
  `valid_for` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '有效期，单位为毫秒',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0表示初始，1表示已使用',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `mobile` (`mobile`,`service_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信服务表';

-- ----------------------------
-- Records of tb_sms
-- ----------------------------

-- ----------------------------
-- Table structure for tb_solutions_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_solutions_info`;
CREATE TABLE `tb_solutions_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) DEFAULT NULL COMMENT '方案名称',
  `create_user` int(11) DEFAULT NULL COMMENT '创建者',
  `status` int(11) DEFAULT NULL COMMENT '方案状态：1待发布，2已发布，3已撤销',
  `scene_url` varchar(255) DEFAULT NULL COMMENT '方案场景图路径',
  `introduction_url` varchar(255) DEFAULT NULL COMMENT '方案介绍图路径',
  `gmt_released` datetime DEFAULT NULL COMMENT '发布时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_undo` datetime DEFAULT NULL COMMENT '撤销时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='方案广告表';

-- ----------------------------
-- Records of tb_solutions_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_staticreport_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_staticreport_info`;
CREATE TABLE `tb_staticreport_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL COMMENT '类型，2：资源，1：节目',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '播放次数',
  `res_program_id` int(11) DEFAULT NULL COMMENT '资源id或者节目id',
  `deviceId` int(11) DEFAULT NULL COMMENT '所属终端',
  `upload_time` varchar(32) DEFAULT NULL COMMENT '保存时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='统计报表';

-- ----------------------------
-- Records of tb_staticreport_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_system_set
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_set`;
CREATE TABLE `tb_system_set` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `set_type` int(11) NOT NULL DEFAULT '0' COMMENT '设置类型',
  `name_china` varchar(64) NOT NULL DEFAULT '' COMMENT '中文标签',
  `name_english` varchar(128) NOT NULL DEFAULT '' COMMENT '英文标签',
  `set_value` int(3) NOT NULL DEFAULT '0' COMMENT '设置状态值（0：关闭（默认）       1：开启）',
  `set_remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统审核设置表';

-- ----------------------------
-- Records of tb_system_set
-- ----------------------------
INSERT INTO `tb_system_set` VALUES ('1', '0', '', '', '0', '');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_id` varchar(64) NOT NULL DEFAULT '' COMMENT '登录ID',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `gmt_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '注册时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `belong_to` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户所属，0表示平台，1表示公司',
  `role_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色类型，0：管理员，1：自定义',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机号码',
  `company_code` char(16) DEFAULT NULL COMMENT '用户所属的公司编号',
  `department_id` int(11) unsigned DEFAULT NULL COMMENT '公司架构中，所属节点的ID',
  `gmt_blocked` datetime DEFAULT NULL COMMENT '被禁用的时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '被删除的时间',
  `creator_login_id` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者登录ID',
  `modifier_login_id` varchar(64) DEFAULT NULL COMMENT '修改者登录ID',
  `gmt_last_login` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `open_id` varchar(64) DEFAULT NULL COMMENT '微信用户唯一标识',
  `gmt_logout` datetime DEFAULT NULL COMMENT '被注销的时间',
  `page_numbers` varchar(255) DEFAULT '10_0,10_0,10,10,10,10,10_0,10,10,10,10,10,10,10' COMMENT '素材列表_显示方式(0:缩略图,1:列表),节目列表_显示方式,设备列表,发布列表,消息列表,版本信息列表,模板列表_显示方式(0:缩略图,1:列表),用户列表,角色列表,企业列表,日志列表,VIP列表，统计素材列表，统计节目列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='平台用户表--new';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057', '2017-09-22 15:27:46', '2019-03-15 15:05:48', '0', '0', null, 'mips', '1', null, null, 'admin', 'admin', '2019-03-15 15:48:40', null, null, '10_0,10_0,10,10,10,10,10_0,10,10,10,10,10,10,10');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(32) NOT NULL DEFAULT '' COMMENT '登录ID',
  `role_id` int(11) unsigned DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色表--new';

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for tb_vip_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_vip_info`;
CREATE TABLE `tb_vip_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vip_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'vip名称',
  `vip_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'vip照片可用状态。1：待验证 2:验证成功 3：验证失败',
  `vip_sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：男 2：女',
  `vip_age` int(3) DEFAULT '1' COMMENT '年龄，1-99',
  `telephone` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `visiting_times` int(11) DEFAULT '0' COMMENT '到访次数，默认0',
  `welcome_words` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '目前最大输入30个字，默认提供“欢迎尊敬的vip客户光临本店”',
  `remark` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '目前最大30个字，备注',
  `upload_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '上传者',
  `gmt_upload` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '上传时间',
  `gmt_deleted` datetime DEFAULT NULL COMMENT '被删除的时间',
  `company_code` char(16) CHARACTER SET utf8 DEFAULT NULL COMMENT '所在公司ID',
  `department_id` int(11) DEFAULT NULL COMMENT '所属节点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_vip_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_vip_picture
-- ----------------------------
DROP TABLE IF EXISTS `tb_vip_picture`;
CREATE TABLE `tb_vip_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图片名称',
  `picture_vip_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属VIP',
  `picture_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图片存储地址',
  `picture_size` bigint(20) DEFAULT NULL COMMENT '图片大小',
  `picture_md5` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图片MD5',
  `picture_resolution` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '图片分辨率',
  `picture_status` int(3) DEFAULT '0' COMMENT '用于记录VIP哪张图片是通过验证的 0:未验证  1：验证通过',
  `token` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '随机8位字符',
  `company_code` char(16) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_vip_picture
-- ----------------------------


-- ----------------------------
-- Table structure for tb_licence_list
-- ----------------------------
DROP TABLE IF EXISTS `tb_licence_list`;
CREATE TABLE `tb_licence_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licence_type` int(3) NOT NULL COMMENT '授权类型（0：本地导入 1：在线授权）',
  `licence_num` int(11) NOT NULL COMMENT '授权数量',
  `gmt_creat` datetime NOT NULL COMMENT '时间',
  `licence_id` varchar(128) DEFAULT NULL COMMENT '对应授权平台的licence_id',
  `licence_code` varchar(64) DEFAULT NULL COMMENT 'licence_code',
  `status` int(3) NOT NULL COMMENT '授权状态（见授权提取状态值）',
  `user_id` int(11) DEFAULT NULL COMMENT '在线授权类型对应的user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for tb_licence_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_licence_user`;
CREATE TABLE `tb_licence_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licence_user` varchar(64) NOT NULL COMMENT '授权平台用户名',
  `access_token` varchar(256) NOT NULL COMMENT '授权平台调用token',
  `api_key` varchar(128) NOT NULL COMMENT 'api_key',
  `account_type` int(3) NOT NULL COMMENT '账户类型（1：B类客户  2：C类客户）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- v4.0修改表语句、补丁
-- ----------------------------

ALTER TABLE `tb_program_info` ADD COLUMN `version_flag`  int(3) NULL DEFAULT 4 COMMENT '3迁移数据（v3.0），4新版数据（v4.0）';
ALTER TABLE `tb_publish_info` ADD COLUMN `version_flag`  int(3) NULL DEFAULT 4 COMMENT '3迁移数据（v3.0），4新版数据（v4.0）';
ALTER TABLE `tb_material_template` ADD COLUMN `version_flag`  int(3) NULL DEFAULT 4 COMMENT '3迁移数据（v3.0），4新版数据（v4.0）';
ALTER TABLE `tb_play_list` MODIFY COLUMN `material_Ids` text  NULL COMMENT '所有素材的ID' ;