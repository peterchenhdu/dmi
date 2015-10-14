/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : dmi

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2015-10-14 11:15:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hotel`
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `gid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT '乌镇',
  `legalperson` varchar(100) DEFAULT '--' COMMENT '法人',
  `worktime` varchar(100) DEFAULT '8:00-18:00' COMMENT '营业时间',
  `phone` varchar(100) DEFAULT '--',
  `recommendation` varchar(1000) DEFAULT '无' COMMENT '推荐',
  `avgprice` varchar(100) DEFAULT '100元' COMMENT '人均价格',
  `businessscope` varchar(100) DEFAULT '乌镇范围' COMMENT '经营范围',
  `maxpeoplenum` int(10) DEFAULT '200' COMMENT '容纳人数',
  `haswifi` varchar(100) DEFAULT '有' COMMENT '无表示无wifi，有表示有wifi，可增加描述，如50M光宽带。',
  `score` float(100,0) DEFAULT '5' COMMENT '评分',
  `monitorid` bigint(20) DEFAULT '1' COMMENT '监控点id',
  `image` varchar(200) DEFAULT NULL,
  `clickcount` bigint(10) DEFAULT '0' COMMENT '点击次数',
  `monitortype` varchar(100) DEFAULT 'ezviz' COMMENT '监控点类型（ezviz：萤石视频, traffic：交通视频, police：公安视频）',
  `description` varchar(1000) DEFAULT '酒店',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1', 'mc1', 'dz1', 'fr1', 'yysj1', 'lxfs1', 'tj1', 'jj1', 'jyfw1', '1', 'wf1', '5', '1', 'tpdz1', '0', 'jkdlx1', 'ms1');
INSERT INTO `hotel` VALUES ('2', 'mc2', 'dz2', 'fr2', 'yysj2', 'lxfs2', 'tj2', 'jj2', 'jyfw2', '2', 'wf2', '5', '1', 'tpdz2', '0', 'jkdlx2', 'ms2');
INSERT INTO `hotel` VALUES ('3', 'mc3', 'dz3', 'fr3', 'yysj3', 'lxfs3', 'tj3', 'jj3', 'jyfw3', '2', 'wf3', '5', '1', 'tpdz3', '0', 'jkdlx3', 'ms3');
INSERT INTO `hotel` VALUES ('4', 'mc4', 'dz4', 'fr4', 'yysj4', 'lxfs4', 'tj4', 'jj4', 'jyfw4', '2', 'wf4', '5', '1', 'tpdz4', '0', 'jkdlx4', 'ms4');
INSERT INTO `hotel` VALUES ('5', 'mc5', 'dz5', 'fr5', 'yysj5', 'lxfs5', 'tj5', 'jj5', 'jyfw5', '2', 'wf5', '5', '1', 'tpdz5', '0', 'jkdlx5', 'ms5');
INSERT INTO `hotel` VALUES ('6', 'mc6', 'dz6', 'fr6', 'yysj6', 'lxfs6', 'tj6', 'jj6', 'jyfw6', '2', 'wf6', '5', '1', 'tpdz6', '0', 'jkdlx6', 'ms6');
INSERT INTO `hotel` VALUES ('7', 'mc7', 'dz7', 'fr7', 'yysj7', 'lxfs7', 'tj7', 'jj7', 'jyfw7', '2', 'wf7', '5', '1', 'tpdz7', '0', 'jkdlx7', 'ms7');
INSERT INTO `hotel` VALUES ('8', 'mc8', 'dz8', 'fr8', 'yysj8', 'lxfs8', 'tj8', 'jj8', 'jyfw8', '2', 'wf8', '5', '1', 'tpdz8', '0', 'jkdlx8', 'ms8');
INSERT INTO `hotel` VALUES ('9', 'mc9', 'dz9', 'fr9', 'yysj9', 'lxfs9', 'tj9', 'jj9', 'jyfw9', '2', 'wf9', '5', '1', 'tpdz9', '0', 'jkdlx9', 'ms9');
INSERT INTO `hotel` VALUES ('10', 'mc10', 'dz10', 'fr10', 'yysj10', 'lxfs10', 'tj10', 'jj10', 'jyfw10', '2', 'wf10', '5', '1', 'tpdz10', '0', 'jkdlx10', 'ms10');
INSERT INTO `hotel` VALUES ('11', 'mc11', 'dz11', 'fr11', 'yysj11', 'lxfs11', 'tj11', 'jj11', 'jyfw11', '2', 'wf11', '5', '1', 'tpdz11', '0', 'jkdlx11', 'ms11');
INSERT INTO `hotel` VALUES ('12', 'mc12', 'dz12', 'fr12', 'yysj12', 'lxfs12', 'tj12', 'jj12', 'jyfw12', '2', 'wf12', '5', '1', 'tpdz12', '0', 'jkdlx12', 'ms12');
INSERT INTO `hotel` VALUES ('13', 'mc13', 'dz13', 'fr13', 'yysj13', 'lxfs13', 'tj13', 'jj13', 'jyfw13', '2', 'wf13', '5', '1', 'tpdz13', '0', 'jkdlx13', 'ms13');
INSERT INTO `hotel` VALUES ('14', 'mc14', 'dz14', 'fr14', 'yysj14', 'lxfs14', 'tj14', 'jj14', 'jyfw14', '2', 'wf14', '5', '1', 'tpdz14', '0', 'jkdlx14', 'ms14');
INSERT INTO `hotel` VALUES ('15', 'mc15', 'dz15', 'fr15', 'yysj15', 'lxfs15', 'tj15', 'jj15', 'jyfw15', '2', 'wf15', '5', '1', 'tpdz15', '0', 'jkdlx15', 'ms15');
INSERT INTO `hotel` VALUES ('16', 'mc16', 'dz16', 'fr16', 'yysj16', 'lxfs16', 'tj16', 'jj16', 'jyfw16', '2', 'wf16', '5', '1', 'tpdz16', '0', 'jkdlx16', 'ms16');
INSERT INTO `hotel` VALUES ('17', 'mc17', 'dz17', 'fr17', 'yysj17', 'lxfs17', 'tj17', 'jj17', 'jyfw17', '2', 'wf17', '5', '1', 'tpdz17', '0', 'jkdlx17', 'ms17');
INSERT INTO `hotel` VALUES ('18', 'mc18', 'dz18', 'fr18', 'yysj18', 'lxfs18', 'tj18', 'jj18', 'jyfw18', '2', 'wf18', '5', '1', 'tpdz18', '0', 'jkdlx18', 'ms18');
INSERT INTO `hotel` VALUES ('19', 'mc19', 'dz19', 'fr19', 'yysj19', 'lxfs19', 'tj19', 'jj19', 'jyfw19', '2', 'wf19', '5', '1', 'tpdz19', '0', 'jkdlx19', 'ms19');
INSERT INTO `hotel` VALUES ('20', 'mc20', 'dz20', 'fr20', 'yysj20', 'lxfs20', 'tj20', 'jj20', 'jyfw20', '2', 'wf20', '5', '1', 'tpdz20', '0', 'jkdlx20', 'ms20');
INSERT INTO `hotel` VALUES ('21', 'mc21', 'dz21', 'fr21', 'yysj21', 'lxfs21', 'tj21', 'jj21', 'jyfw21', '2', 'wf21', '5', '1', 'tpdz21', '0', 'jkdlx21', 'ms21');
INSERT INTO `hotel` VALUES ('22', 'mc22', 'dz22', 'fr22', 'yysj22', 'lxfs22', 'tj22', 'jj22', 'jyfw22', '2', 'wf22', '5', '1', 'tpdz22', '0', 'jkdlx22', 'ms22');
INSERT INTO `hotel` VALUES ('23', 'mc23', 'dz23', 'fr23', 'yysj23', 'lxfs23', 'tj23', 'jj23', 'jyfw23', '2', 'wf23', '5', '1', 'tpdz23', '0', 'jkdlx23', 'ms23');
INSERT INTO `hotel` VALUES ('24', 'mc24', 'dz24', 'fr24', 'yysj24', 'lxfs24', 'tj24', 'jj24', 'jyfw24', '2', 'wf24', '5', '1', 'tpdz24', '0', 'jkdlx24', 'ms24');
INSERT INTO `hotel` VALUES ('25', 'mc25', 'dz25', 'fr25', 'yysj25', 'lxfs25', 'tj25', 'jj25', 'jyfw25', '2', 'wf25', '5', '1', 'tpdz25', '0', 'jkdlx25', 'ms25');
INSERT INTO `hotel` VALUES ('26', 'mc26', 'dz26', 'fr26', 'yysj26', 'lxfs26', 'tj26', 'jj26', 'jyfw26', '2', 'wf26', '5', '1', 'tpdz26', '0', 'jkdlx26', 'ms26');
INSERT INTO `hotel` VALUES ('27', 'mc27', 'dz27', 'fr27', 'yysj27', 'lxfs27', 'tj27', 'jj27', 'jyfw27', '2', 'wf27', '5', '1', 'tpdz27', '0', 'jkdlx27', 'ms27');
INSERT INTO `hotel` VALUES ('28', 'mc28', 'dz28', 'fr28', 'yysj28', 'lxfs28', 'tj28', 'jj28', 'jyfw28', '2', 'wf28', '5', '1', 'tpdz28', '0', 'jkdlx28', 'ms28');
INSERT INTO `hotel` VALUES ('29', 'mc29', 'dz29', 'fr29', 'yysj29', 'lxfs29', 'tj29', 'jj29', 'jyfw29', '2', 'wf29', '5', '1', 'tpdz29', '0', 'jkdlx29', 'ms29');
INSERT INTO `hotel` VALUES ('30', 'mc30', 'dz30', 'fr30', 'yysj30', 'lxfs30', 'tj30', 'jj30', 'jyfw30', '2', 'wf30', '5', '1', 'tpdz30', '0', 'jkdlx30', 'ms30');
INSERT INTO `hotel` VALUES ('31', 'mc31', 'dz31', 'fr31', 'yysj31', 'lxfs31', 'tj31', 'jj31', 'jyfw31', '2', 'wf31', '5', '1', 'tpdz31', '0', 'jkdlx31', 'ms31');
INSERT INTO `hotel` VALUES ('32', 'mc32', 'dz32', 'fr32', 'yysj32', 'lxfs32', 'tj32', 'jj32', 'jyfw32', '2', 'wf32', '5', '1', 'tpdz32', '0', 'jkdlx32', 'ms32');
INSERT INTO `hotel` VALUES ('33', 'mc33', 'dz33', 'fr33', 'yysj33', 'lxfs33', 'tj33', 'jj33', 'jyfw33', '2', 'wf33', '5', '1', 'tpdz33', '0', 'jkdlx33', 'ms33');
INSERT INTO `hotel` VALUES ('34', 'mc34', 'dz34', 'fr34', 'yysj34', 'lxfs34', 'tj34', 'jj34', 'jyfw34', '2', 'wf34', '5', '1', 'tpdz34', '0', 'jkdlx34', 'ms34');
INSERT INTO `hotel` VALUES ('35', 'mc35', 'dz35', 'fr35', 'yysj35', 'lxfs35', 'tj35', 'jj35', 'jyfw35', '2', 'wf35', '5', '1', 'tpdz35', '0', 'jkdlx35', 'ms35');
INSERT INTO `hotel` VALUES ('36', 'mc36', 'dz36', 'fr36', 'yysj36', 'lxfs36', 'tj36', 'jj36', 'jyfw36', '2', 'wf36', '5', '1', 'tpdz36', '0', 'jkdlx36', 'ms36');
INSERT INTO `hotel` VALUES ('37', 'mc37', 'dz37', 'fr37', 'yysj37', 'lxfs37', 'tj37', 'jj37', 'jyfw37', '2', 'wf37', '5', '1', 'tpdz37', '0', 'jkdlx37', 'ms37');
INSERT INTO `hotel` VALUES ('38', 'mc38', 'dz38', 'fr38', 'yysj38', 'lxfs38', 'tj38', 'jj38', 'jyfw38', '2', 'wf38', '5', '1', 'tpdz38', '0', 'jkdlx38', 'ms38');
INSERT INTO `hotel` VALUES ('39', 'mc39', 'dz39', 'fr39', 'yysj39', 'lxfs39', 'tj39', 'jj39', 'jyfw39', '2', 'wf39', '5', '1', 'tpdz39', '0', 'jkdlx39', 'ms39');
INSERT INTO `hotel` VALUES ('40', 'mc40', 'dz40', 'fr40', 'yysj40', 'lxfs40', 'tj40', 'jj40', 'jyfw40', '2', 'wf40', '5', '1', 'tpdz40', '0', 'jkdlx40', 'ms40');
INSERT INTO `hotel` VALUES ('41', 'mc41', 'dz41', 'fr41', 'yysj41', 'lxfs41', 'tj41', 'jj41', 'jyfw41', '2', 'wf41', '5', '1', 'tpdz41', '0', 'jkdlx41', 'ms41');
INSERT INTO `hotel` VALUES ('42', 'mc42', 'dz42', 'fr42', 'yysj42', 'lxfs42', 'tj42', 'jj42', 'jyfw42', '2', 'wf42', '5', '1', 'tpdz42', '0', 'jkdlx42', 'ms42');
INSERT INTO `hotel` VALUES ('43', 'mc43', 'dz43', 'fr43', 'yysj43', 'lxfs43', 'tj43', 'jj43', 'jyfw43', '2', 'wf43', '5', '1', 'tpdz43', '0', 'jkdlx43', 'ms43');
INSERT INTO `hotel` VALUES ('44', 'mc44', 'dz44', 'fr44', 'yysj44', 'lxfs44', 'tj44', 'jj44', 'jyfw44', '2', 'wf44', '5', '1', 'tpdz44', '0', 'jkdlx44', 'ms44');
INSERT INTO `hotel` VALUES ('45', 'mc45', 'dz45', 'fr45', 'yysj45', 'lxfs45', 'tj45', 'jj45', 'jyfw45', '2', 'wf45', '5', '1', 'tpdz45', '0', 'jkdlx45', 'ms45');
INSERT INTO `hotel` VALUES ('46', 'mc46', 'dz46', 'fr46', 'yysj46', 'lxfs46', 'tj46', 'jj46', 'jyfw46', '2', 'wf46', '5', '1', 'tpdz46', '0', 'jkdlx46', 'ms46');
INSERT INTO `hotel` VALUES ('47', 'mc47', 'dz47', 'fr47', 'yysj47', 'lxfs47', 'tj47', 'jj47', 'jyfw47', '2', 'wf47', '5', '1', 'tpdz47', '0', 'jkdlx47', 'ms47');
INSERT INTO `hotel` VALUES ('48', 'mc48', 'dz48', 'fr48', 'yysj48', 'lxfs48', 'tj48', 'jj48', 'jyfw48', '2', 'wf48', '5', '1', 'tpdz48', '0', 'jkdlx48', 'ms48');
INSERT INTO `hotel` VALUES ('49', 'mc49', 'dz49', 'fr49', 'yysj49', 'lxfs49', 'tj49', 'jj49', 'jyfw49', '2', 'wf49', '5', '1', 'tpdz49', '0', 'jkdlx49', 'ms49');
INSERT INTO `hotel` VALUES ('50', 'mc50', 'dz50', 'fr50', 'yysj50', 'lxfs50', 'tj50', 'jj50', 'jyfw50', '2', 'wf50', '5', '1', 'tpdz50', '0', 'jkdlx50', 'ms50');
INSERT INTO `hotel` VALUES ('51', 'mc51', 'dz51', 'fr51', 'yysj51', 'lxfs51', 'tj51', 'jj51', 'jyfw51', '2', 'wf51', '5', '1', 'tpdz51', '0', 'jkdlx51', 'ms51');
INSERT INTO `hotel` VALUES ('52', 'mc52', 'dz52', 'fr52', 'yysj52', 'lxfs52', 'tj52', 'jj52', 'jyfw52', '2', 'wf52', '5', '1', 'tpdz52', '0', 'jkdlx52', 'ms52');
INSERT INTO `hotel` VALUES ('53', 'mc53', 'dz53', 'fr53', 'yysj53', 'lxfs53', 'tj53', 'jj53', 'jyfw53', '2', 'wf53', '5', '1', 'tpdz53', '0', 'jkdlx53', 'ms53');
INSERT INTO `hotel` VALUES ('54', 'mc54', 'dz54', 'fr54', 'yysj54', 'lxfs54', 'tj54', 'jj54', 'jyfw54', '2', 'wf54', '5', '1', 'tpdz54', '0', 'jkdlx54', 'ms54');
INSERT INTO `hotel` VALUES ('55', 'mc55', 'dz55', 'fr55', 'yysj55', 'lxfs55', 'tj55', 'jj55', 'jyfw55', '2', 'wf55', '5', '1', 'tpdz55', '0', 'jkdlx55', 'ms55');
INSERT INTO `hotel` VALUES ('56', 'mc56', 'dz56', 'fr56', 'yysj56', 'lxfs56', 'tj56', 'jj56', 'jyfw56', '2', 'wf56', '5', '1', 'tpdz56', '0', 'jkdlx56', 'ms56');
INSERT INTO `hotel` VALUES ('57', 'mc57', 'dz57', 'fr57', 'yysj57', 'lxfs57', 'tj57', 'jj57', 'jyfw57', '2', 'wf57', '5', '1', 'tpdz57', '0', 'jkdlx57', 'ms57');
INSERT INTO `hotel` VALUES ('58', 'mc58', 'dz58', 'fr58', 'yysj58', 'lxfs58', 'tj58', 'jj58', 'jyfw58', '2', 'wf58', '5', '1', 'tpdz58', '0', 'jkdlx58', 'ms58');
INSERT INTO `hotel` VALUES ('59', 'mc59', 'dz59', 'fr59', 'yysj59', 'lxfs59', 'tj59', 'jj59', 'jyfw59', '2', 'wf59', '5', '1', 'tpdz59', '0', 'jkdlx59', 'ms59');
INSERT INTO `hotel` VALUES ('60', 'mc60', 'dz60', 'fr60', 'yysj60', 'lxfs60', 'tj60', 'jj60', 'jyfw60', '2', 'wf60', '5', '1', 'tpdz60', '0', 'jkdlx60', 'ms60');
INSERT INTO `hotel` VALUES ('61', 'mc61', 'dz61', 'fr61', 'yysj61', 'lxfs61', 'tj61', 'jj61', 'jyfw61', '2', 'wf61', '5', '1', 'tpdz61', '0', 'jkdlx61', 'ms61');
INSERT INTO `hotel` VALUES ('62', 'mc62', 'dz62', 'fr62', 'yysj62', 'lxfs62', 'tj62', 'jj62', 'jyfw62', '2', 'wf62', '5', '1', 'tpdz62', '0', 'jkdlx62', 'ms62');
INSERT INTO `hotel` VALUES ('63', 'mc63', 'dz63', 'fr63', 'yysj63', 'lxfs63', 'tj63', 'jj63', 'jyfw63', '2', 'wf63', '5', '1', 'tpdz63', '0', 'jkdlx63', 'ms63');
INSERT INTO `hotel` VALUES ('64', 'mc64', 'dz64', 'fr64', 'yysj64', 'lxfs64', 'tj64', 'jj64', 'jyfw64', '2', 'wf64', '5', '1', 'tpdz64', '0', 'jkdlx64', 'ms64');
INSERT INTO `hotel` VALUES ('65', 'mc65', 'dz65', 'fr65', 'yysj65', 'lxfs65', 'tj65', 'jj65', 'jyfw65', '2', 'wf65', '5', '1', 'tpdz65', '0', 'jkdlx65', 'ms65');
INSERT INTO `hotel` VALUES ('66', 'mc66', 'dz66', 'fr66', 'yysj66', 'lxfs66', 'tj66', 'jj66', 'jyfw66', '2', 'wf66', '5', '1', 'tpdz66', '0', 'jkdlx66', 'ms66');
INSERT INTO `hotel` VALUES ('67', 'mc67', 'dz67', 'fr67', 'yysj67', 'lxfs67', 'tj67', 'jj67', 'jyfw67', '2', 'wf67', '5', '1', 'tpdz67', '0', 'jkdlx67', 'ms67');
INSERT INTO `hotel` VALUES ('68', 'mc68', 'dz68', 'fr68', 'yysj68', 'lxfs68', 'tj68', 'jj68', 'jyfw68', '2', 'wf68', '5', '1', 'tpdz68', '0', 'jkdlx68', 'ms68');
INSERT INTO `hotel` VALUES ('69', 'mc69', 'dz69', 'fr69', 'yysj69', 'lxfs69', 'tj69', 'jj69', 'jyfw69', '2', 'wf69', '5', '1', 'tpdz69', '0', 'jkdlx69', 'ms69');
INSERT INTO `hotel` VALUES ('70', 'mc70', 'dz70', 'fr70', 'yysj70', 'lxfs70', 'tj70', 'jj70', 'jyfw70', '2', 'wf70', '5', '1', 'tpdz70', '0', 'jkdlx70', 'ms70');
INSERT INTO `hotel` VALUES ('71', 'mc71', 'dz71', 'fr71', 'yysj71', 'lxfs71', 'tj71', 'jj71', 'jyfw71', '2', 'wf71', '5', '1', 'tpdz71', '0', 'jkdlx71', 'ms71');
INSERT INTO `hotel` VALUES ('72', 'mc72', 'dz72', 'fr72', 'yysj72', 'lxfs72', 'tj72', 'jj72', 'jyfw72', '2', 'wf72', '5', '1', 'tpdz72', '0', 'jkdlx72', 'ms72');
INSERT INTO `hotel` VALUES ('73', 'mc73', 'dz73', 'fr73', 'yysj73', 'lxfs73', 'tj73', 'jj73', 'jyfw73', '2', 'wf73', '5', '1', 'tpdz73', '0', 'jkdlx73', 'ms73');
INSERT INTO `hotel` VALUES ('74', 'mc74', 'dz74', 'fr74', 'yysj74', 'lxfs74', 'tj74', 'jj74', 'jyfw74', '2', 'wf74', '5', '1', 'tpdz74', '0', 'jkdlx74', 'ms74');
INSERT INTO `hotel` VALUES ('75', 'mc75', 'dz75', 'fr75', 'yysj75', 'lxfs75', 'tj75', 'jj75', 'jyfw75', '2', 'wf75', '5', '1', 'tpdz75', '0', 'jkdlx75', 'ms75');
INSERT INTO `hotel` VALUES ('76', 'mc76', 'dz76', 'fr76', 'yysj76', 'lxfs76', 'tj76', 'jj76', 'jyfw76', '2', 'wf76', '5', '1', 'tpdz76', '0', 'jkdlx76', 'ms76');
INSERT INTO `hotel` VALUES ('77', 'mc77', 'dz77', 'fr77', 'yysj77', 'lxfs77', 'tj77', 'jj77', 'jyfw77', '2', 'wf77', '5', '1', 'tpdz77', '0', 'jkdlx77', 'ms77');
INSERT INTO `hotel` VALUES ('78', 'mc78', 'dz78', 'fr78', 'yysj78', 'lxfs78', 'tj78', 'jj78', 'jyfw78', '2', 'wf78', '5', '1', 'tpdz78', '0', 'jkdlx78', 'ms78');
INSERT INTO `hotel` VALUES ('79', 'mc79', 'dz79', 'fr79', 'yysj79', 'lxfs79', 'tj79', 'jj79', 'jyfw79', '2', 'wf79', '5', '1', 'tpdz79', '0', 'jkdlx79', 'ms79');
INSERT INTO `hotel` VALUES ('80', 'mc80', 'dz80', 'fr80', 'yysj80', 'lxfs80', 'tj80', 'jj80', 'jyfw80', '2', 'wf80', '5', '1', 'tpdz80', '0', 'jkdlx80', 'ms80');
INSERT INTO `hotel` VALUES ('81', 'mc81', 'dz81', 'fr81', 'yysj81', 'lxfs81', 'tj81', 'jj81', 'jyfw81', '2', 'wf81', '5', '1', 'tpdz81', '0', 'jkdlx81', 'ms81');
INSERT INTO `hotel` VALUES ('82', 'mc82', 'dz82', 'fr82', 'yysj82', 'lxfs82', 'tj82', 'jj82', 'jyfw82', '2', 'wf82', '5', '1', 'tpdz82', '0', 'jkdlx82', 'ms82');
INSERT INTO `hotel` VALUES ('83', 'mc83', 'dz83', 'fr83', 'yysj83', 'lxfs83', 'tj83', 'jj83', 'jyfw83', '2', 'wf83', '5', '1', 'tpdz83', '0', 'jkdlx83', 'ms83');
INSERT INTO `hotel` VALUES ('84', 'mc84', 'dz84', 'fr84', 'yysj84', 'lxfs84', 'tj84', 'jj84', 'jyfw84', '2', 'wf84', '5', '1', 'tpdz84', '0', 'jkdlx84', 'ms84');
INSERT INTO `hotel` VALUES ('85', 'mc85', 'dz85', 'fr85', 'yysj85', 'lxfs85', 'tj85', 'jj85', 'jyfw85', '2', 'wf85', '5', '1', 'tpdz85', '0', 'jkdlx85', 'ms85');
INSERT INTO `hotel` VALUES ('86', 'mc86', 'dz86', 'fr86', 'yysj86', 'lxfs86', 'tj86', 'jj86', 'jyfw86', '2', 'wf86', '5', '1', 'tpdz86', '0', 'jkdlx86', 'ms86');
INSERT INTO `hotel` VALUES ('87', 'mc87', 'dz87', 'fr87', 'yysj87', 'lxfs87', 'tj87', 'jj87', 'jyfw87', '2', 'wf87', '5', '1', 'tpdz87', '0', 'jkdlx87', 'ms87');
INSERT INTO `hotel` VALUES ('88', 'mc88', 'dz88', 'fr88', 'yysj88', 'lxfs88', 'tj88', 'jj88', 'jyfw88', '2', 'wf88', '5', '1', 'tpdz88', '0', 'jkdlx88', 'ms88');
INSERT INTO `hotel` VALUES ('89', 'mc89', 'dz89', 'fr89', 'yysj89', 'lxfs89', 'tj89', 'jj89', 'jyfw89', '2', 'wf89', '5', '1', 'tpdz89', '0', 'jkdlx89', 'ms89');
INSERT INTO `hotel` VALUES ('90', 'mc90', 'dz90', 'fr90', 'yysj90', 'lxfs90', 'tj90', 'jj90', 'jyfw90', '2', 'wf90', '5', '1', 'tpdz90', '0', 'jkdlx90', 'ms90');
INSERT INTO `hotel` VALUES ('91', 'mc91', 'dz91', 'fr91', 'yysj91', 'lxfs91', 'tj91', 'jj91', 'jyfw91', '2', 'wf91', '5', '1', 'tpdz91', '0', 'jkdlx91', 'ms91');
INSERT INTO `hotel` VALUES ('92', 'mc92', 'dz92', 'fr92', 'yysj92', 'lxfs92', 'tj92', 'jj92', 'jyfw92', '2', 'wf92', '5', '1', 'tpdz92', '0', 'jkdlx92', 'ms92');
INSERT INTO `hotel` VALUES ('93', 'mc93', 'dz93', 'fr93', 'yysj93', 'lxfs93', 'tj93', 'jj93', 'jyfw93', '2', 'wf93', '5', '1', 'tpdz93', '0', 'jkdlx93', 'ms93');
INSERT INTO `hotel` VALUES ('94', 'mc94', 'dz94', 'fr94', 'yysj94', 'lxfs94', 'tj94', 'jj94', 'jyfw94', '2', 'wf94', '5', '1', 'tpdz94', '0', 'jkdlx94', 'ms94');
INSERT INTO `hotel` VALUES ('95', 'mc95', 'dz95', 'fr95', 'yysj95', 'lxfs95', 'tj95', 'jj95', 'jyfw95', '2', 'wf95', '5', '1', 'tpdz95', '0', 'jkdlx95', 'ms95');
INSERT INTO `hotel` VALUES ('96', 'mc96', 'dz96', 'fr96', 'yysj96', 'lxfs96', 'tj96', 'jj96', 'jyfw96', '2', 'wf96', '5', '1', 'tpdz96', '0', 'jkdlx96', 'ms96');
INSERT INTO `hotel` VALUES ('97', 'mc97', 'dz97', 'fr97', 'yysj97', 'lxfs97', 'tj97', 'jj97', 'jyfw97', '2', 'wf97', '5', '1', 'tpdz97', '0', 'jkdlx97', 'ms97');
INSERT INTO `hotel` VALUES ('98', 'mc98', 'dz98', 'fr98', 'yysj98', 'lxfs98', 'tj98', 'jj98', 'jyfw98', '2', 'wf98', '5', '1', 'tpdz98', '0', 'jkdlx98', 'ms98');
INSERT INTO `hotel` VALUES ('99', 'mc99', 'dz99', 'fr99', 'yysj99', 'lxfs99', 'tj99', 'jj99', 'jyfw99', '2', 'wf99', '5', '1', 'tpdz99', '0', 'jkdlx99', 'ms99');
INSERT INTO `hotel` VALUES ('100', 'mc100', 'dz100', 'fr100', 'yysj100', 'lxfs100', 'tj100', 'jj100', 'jyfw100', '2', 'wf100', '5', '1', 'tpdz100', '0', 'jkdlx100', 'ms100');
INSERT INTO `hotel` VALUES ('101', 'mc101', 'dz101', 'fr101', 'yysj101', 'lxfs101', 'tj101', 'jj101', 'jyfw101', '2', 'wf101', '5', '1', 'tpdz101', '0', 'jkdlx101', 'ms101');
INSERT INTO `hotel` VALUES ('102', 'mc102', 'dz102', 'fr102', 'yysj102', 'lxfs102', 'tj102', 'jj102', 'jyfw102', '2', 'wf102', '5', '1', 'tpdz102', '0', 'jkdlx102', 'ms102');
INSERT INTO `hotel` VALUES ('103', 'mc103', 'dz103', 'fr103', 'yysj103', 'lxfs103', 'tj103', 'jj103', 'jyfw103', '2', 'wf103', '5', '1', 'tpdz103', '0', 'jkdlx103', 'ms103');
INSERT INTO `hotel` VALUES ('104', 'mc104', 'dz104', 'fr104', 'yysj104', 'lxfs104', 'tj104', 'jj104', 'jyfw104', '2', 'wf104', '5', '1', 'tpdz104', '0', 'jkdlx104', 'ms104');
INSERT INTO `hotel` VALUES ('105', 'mc105', 'dz105', 'fr105', 'yysj105', 'lxfs105', 'tj105', 'jj105', 'jyfw105', '2', 'wf105', '5', '1', 'tpdz105', '0', 'jkdlx105', 'ms105');
INSERT INTO `hotel` VALUES ('106', 'mc106', 'dz106', 'fr106', 'yysj106', 'lxfs106', 'tj106', 'jj106', 'jyfw106', '2', 'wf106', '5', '1', 'tpdz106', '0', 'jkdlx106', 'ms106');
INSERT INTO `hotel` VALUES ('107', 'mc107', 'dz107', 'fr107', 'yysj107', 'lxfs107', 'tj107', 'jj107', 'jyfw107', '2', 'wf107', '5', '1', 'tpdz107', '0', 'jkdlx107', 'ms107');
INSERT INTO `hotel` VALUES ('108', 'mc108', 'dz108', 'fr108', 'yysj108', 'lxfs108', 'tj108', 'jj108', 'jyfw108', '2', 'wf108', '5', '1', 'tpdz108', '0', 'jkdlx108', 'ms108');
INSERT INTO `hotel` VALUES ('109', 'mc109', 'dz109', 'fr109', 'yysj109', 'lxfs109', 'tj109', 'jj109', 'jyfw109', '2', 'wf109', '5', '1', 'tpdz109', '0', 'jkdlx109', 'ms109');
INSERT INTO `hotel` VALUES ('110', 'mc110', 'dz110', 'fr110', 'yysj110', 'lxfs110', 'tj110', 'jj110', 'jyfw110', '2', 'wf110', '5', '1', 'tpdz110', '0', 'jkdlx110', 'ms110');
INSERT INTO `hotel` VALUES ('111', 'mc111', 'dz111', 'fr111', 'yysj111', 'lxfs111', 'tj111', 'jj111', 'jyfw111', '2', 'wf111', '5', '1', 'tpdz111', '0', 'jkdlx111', 'ms111');
INSERT INTO `hotel` VALUES ('112', 'mc112', 'dz112', 'fr112', 'yysj112', 'lxfs112', 'tj112', 'jj112', 'jyfw112', '2', 'wf112', '5', '1', 'tpdz112', '0', 'jkdlx112', 'ms112');
INSERT INTO `hotel` VALUES ('113', 'mc113', 'dz113', 'fr113', 'yysj113', 'lxfs113', 'tj113', 'jj113', 'jyfw113', '2', 'wf113', '5', '1', 'tpdz113', '0', 'jkdlx113', 'ms113');
INSERT INTO `hotel` VALUES ('114', 'mc114', 'dz114', 'fr114', 'yysj114', 'lxfs114', 'tj114', 'jj114', 'jyfw114', '2', 'wf114', '5', '1', 'tpdz114', '0', 'jkdlx114', 'ms114');
INSERT INTO `hotel` VALUES ('115', 'mc115', 'dz115', 'fr115', 'yysj115', 'lxfs115', 'tj115', 'jj115', 'jyfw115', '2', 'wf115', '5', '1', 'tpdz115', '0', 'jkdlx115', 'ms115');
INSERT INTO `hotel` VALUES ('116', 'mc116', 'dz116', 'fr116', 'yysj116', 'lxfs116', 'tj116', 'jj116', 'jyfw116', '2', 'wf116', '5', '1', 'tpdz116', '0', 'jkdlx116', 'ms116');
INSERT INTO `hotel` VALUES ('117', 'mc117', 'dz117', 'fr117', 'yysj117', 'lxfs117', 'tj117', 'jj117', 'jyfw117', '2', 'wf117', '5', '1', 'tpdz117', '0', 'jkdlx117', 'ms117');
INSERT INTO `hotel` VALUES ('118', 'mc118', 'dz118', 'fr118', 'yysj118', 'lxfs118', 'tj118', 'jj118', 'jyfw118', '2', 'wf118', '5', '1', 'tpdz118', '0', 'jkdlx118', 'ms118');
INSERT INTO `hotel` VALUES ('119', 'mc119', 'dz119', 'fr119', 'yysj119', 'lxfs119', 'tj119', 'jj119', 'jyfw119', '2', 'wf119', '5', '1', 'tpdz119', '0', 'jkdlx119', 'ms119');
INSERT INTO `hotel` VALUES ('120', 'mc120', 'dz120', 'fr120', 'yysj120', 'lxfs120', 'tj120', 'jj120', 'jyfw120', '2', 'wf120', '5', '1', 'tpdz120', '0', 'jkdlx120', 'ms120');
INSERT INTO `hotel` VALUES ('121', 'mc121', 'dz121', 'fr121', 'yysj121', 'lxfs121', 'tj121', 'jj121', 'jyfw121', '2', 'wf121', '5', '1', 'tpdz121', '0', 'jkdlx121', 'ms121');
INSERT INTO `hotel` VALUES ('122', 'mc122', 'dz122', 'fr122', 'yysj122', 'lxfs122', 'tj122', 'jj122', 'jyfw122', '2', 'wf122', '5', '1', 'tpdz122', '0', 'jkdlx122', 'ms122');
INSERT INTO `hotel` VALUES ('123', 'mc123', 'dz123', 'fr123', 'yysj123', 'lxfs123', 'tj123', 'jj123', 'jyfw123', '2', 'wf123', '5', '1', 'tpdz123', '0', 'jkdlx123', 'ms123');
INSERT INTO `hotel` VALUES ('124', 'mc124', 'dz124', 'fr124', 'yysj124', 'lxfs124', 'tj124', 'jj124', 'jyfw124', '2', 'wf124', '5', '1', 'tpdz124', '0', 'jkdlx124', 'ms124');
INSERT INTO `hotel` VALUES ('125', 'mc125', 'dz125', 'fr125', 'yysj125', 'lxfs125', 'tj125', 'jj125', 'jyfw125', '2', 'wf125', '5', '1', 'tpdz125', '0', 'jkdlx125', 'ms125');
INSERT INTO `hotel` VALUES ('126', 'mc126', 'dz126', 'fr126', 'yysj126', 'lxfs126', 'tj126', 'jj126', 'jyfw126', '2', 'wf126', '5', '1', 'tpdz126', '0', 'jkdlx126', 'ms126');
INSERT INTO `hotel` VALUES ('127', 'mc127', 'dz127', 'fr127', 'yysj127', 'lxfs127', 'tj127', 'jj127', 'jyfw127', '2', 'wf127', '5', '1', 'tpdz127', '0', 'jkdlx127', 'ms127');
INSERT INTO `hotel` VALUES ('128', 'mc128', 'dz128', 'fr128', 'yysj128', 'lxfs128', 'tj128', 'jj128', 'jyfw128', '2', 'wf128', '5', '1', 'tpdz128', '0', 'jkdlx128', 'ms128');
INSERT INTO `hotel` VALUES ('129', 'mc129', 'dz129', 'fr129', 'yysj129', 'lxfs129', 'tj129', 'jj129', 'jyfw129', '2', 'wf129', '5', '1', 'tpdz129', '0', 'jkdlx129', 'ms129');
INSERT INTO `hotel` VALUES ('130', 'mc130', 'dz130', 'fr130', 'yysj130', 'lxfs130', 'tj130', 'jj130', 'jyfw130', '2', 'wf130', '5', '1', 'tpdz130', '0', 'jkdlx130', 'ms130');
INSERT INTO `hotel` VALUES ('131', 'mc131', 'dz131', 'fr131', 'yysj131', 'lxfs131', 'tj131', 'jj131', 'jyfw131', '2', 'wf131', '5', '1', 'tpdz131', '0', 'jkdlx131', 'ms131');
INSERT INTO `hotel` VALUES ('132', 'mc132', 'dz132', 'fr132', 'yysj132', 'lxfs132', 'tj132', 'jj132', 'jyfw132', '2', 'wf132', '5', '1', 'tpdz132', '0', 'jkdlx132', 'ms132');
INSERT INTO `hotel` VALUES ('133', 'mc133', 'dz133', 'fr133', 'yysj133', 'lxfs133', 'tj133', 'jj133', 'jyfw133', '2', 'wf133', '5', '1', 'tpdz133', '0', 'jkdlx133', 'ms133');
INSERT INTO `hotel` VALUES ('134', 'mc134', 'dz134', 'fr134', 'yysj134', 'lxfs134', 'tj134', 'jj134', 'jyfw134', '2', 'wf134', '5', '1', 'tpdz134', '0', 'jkdlx134', 'ms134');
INSERT INTO `hotel` VALUES ('135', 'mc135', 'dz135', 'fr135', 'yysj135', 'lxfs135', 'tj135', 'jj135', 'jyfw135', '2', 'wf135', '5', '1', 'tpdz135', '0', 'jkdlx135', 'ms135');
INSERT INTO `hotel` VALUES ('136', 'mc136', 'dz136', 'fr136', 'yysj136', 'lxfs136', 'tj136', 'jj136', 'jyfw136', '2', 'wf136', '5', '1', 'tpdz136', '0', 'jkdlx136', 'ms136');
INSERT INTO `hotel` VALUES ('137', 'mc137', 'dz137', 'fr137', 'yysj137', 'lxfs137', 'tj137', 'jj137', 'jyfw137', '2', 'wf137', '5', '1', 'tpdz137', '0', 'jkdlx137', 'ms137');
INSERT INTO `hotel` VALUES ('138', 'mc138', 'dz138', 'fr138', 'yysj138', 'lxfs138', 'tj138', 'jj138', 'jyfw138', '2', 'wf138', '5', '1', 'tpdz138', '0', 'jkdlx138', 'ms138');
INSERT INTO `hotel` VALUES ('139', 'mc139', 'dz139', 'fr139', 'yysj139', 'lxfs139', 'tj139', 'jj139', 'jyfw139', '2', 'wf139', '5', '1', 'tpdz139', '0', 'jkdlx139', 'ms139');
INSERT INTO `hotel` VALUES ('140', 'mc140', 'dz140', 'fr140', 'yysj140', 'lxfs140', 'tj140', 'jj140', 'jyfw140', '2', 'wf140', '5', '1', 'tpdz140', '0', 'jkdlx140', 'ms140');
INSERT INTO `hotel` VALUES ('141', 'mc141', 'dz141', 'fr141', 'yysj141', 'lxfs141', 'tj141', 'jj141', 'jyfw141', '2', 'wf141', '5', '1', 'tpdz141', '0', 'jkdlx141', 'ms141');
INSERT INTO `hotel` VALUES ('142', 'mc142', 'dz142', 'fr142', 'yysj142', 'lxfs142', 'tj142', 'jj142', 'jyfw142', '2', 'wf142', '5', '1', 'tpdz142', '0', 'jkdlx142', 'ms142');
INSERT INTO `hotel` VALUES ('143', 'mc143', 'dz143', 'fr143', 'yysj143', 'lxfs143', 'tj143', 'jj143', 'jyfw143', '2', 'wf143', '5', '1', 'tpdz143', '0', 'jkdlx143', 'ms143');
INSERT INTO `hotel` VALUES ('144', 'mc144', 'dz144', 'fr144', 'yysj144', 'lxfs144', 'tj144', 'jj144', 'jyfw144', '2', 'wf144', '5', '1', 'tpdz144', '0', 'jkdlx144', 'ms144');
INSERT INTO `hotel` VALUES ('145', 'mc145', 'dz145', 'fr145', 'yysj145', 'lxfs145', 'tj145', 'jj145', 'jyfw145', '2', 'wf145', '5', '1', 'tpdz145', '0', 'jkdlx145', 'ms145');
INSERT INTO `hotel` VALUES ('146', 'mc146', 'dz146', 'fr146', 'yysj146', 'lxfs146', 'tj146', 'jj146', 'jyfw146', '2', 'wf146', '5', '1', 'tpdz146', '0', 'jkdlx146', 'ms146');
INSERT INTO `hotel` VALUES ('147', 'mc147', 'dz147', 'fr147', 'yysj147', 'lxfs147', 'tj147', 'jj147', 'jyfw147', '2', 'wf147', '5', '1', 'tpdz147', '0', 'jkdlx147', 'ms147');
INSERT INTO `hotel` VALUES ('148', 'mc148', 'dz148', 'fr148', 'yysj148', 'lxfs148', 'tj148', 'jj148', 'jyfw148', '2', 'wf148', '5', '1', 'tpdz148', '0', 'jkdlx148', 'ms148');
INSERT INTO `hotel` VALUES ('149', 'mc149', 'dz149', 'fr149', 'yysj149', 'lxfs149', 'tj149', 'jj149', 'jyfw149', '2', 'wf149', '5', '1', 'tpdz149', '0', 'jkdlx149', 'ms149');
INSERT INTO `hotel` VALUES ('150', 'mc150', 'dz150', 'fr150', 'yysj150', 'lxfs150', 'tj150', 'jj150', 'jyfw150', '2', 'wf150', '5', '1', 'tpdz150', '0', 'jkdlx150', 'ms150');
INSERT INTO `hotel` VALUES ('151', 'mc151', 'dz151', 'fr151', 'yysj151', 'lxfs151', 'tj151', 'jj151', 'jyfw151', '2', 'wf151', '5', '1', 'tpdz151', '0', 'jkdlx151', 'ms151');
INSERT INTO `hotel` VALUES ('152', 'mc152', 'dz152', 'fr152', 'yysj152', 'lxfs152', 'tj152', 'jj152', 'jyfw152', '2', 'wf152', '5', '1', 'tpdz152', '0', 'jkdlx152', 'ms152');
INSERT INTO `hotel` VALUES ('153', 'mc153', 'dz153', 'fr153', 'yysj153', 'lxfs153', 'tj153', 'jj153', 'jyfw153', '2', 'wf153', '5', '1', 'tpdz153', '0', 'jkdlx153', 'ms153');
INSERT INTO `hotel` VALUES ('154', 'mc154', 'dz154', 'fr154', 'yysj154', 'lxfs154', 'tj154', 'jj154', 'jyfw154', '2', 'wf154', '5', '1', 'tpdz154', '0', 'jkdlx154', 'ms154');
INSERT INTO `hotel` VALUES ('155', 'mc155', 'dz155', 'fr155', 'yysj155', 'lxfs155', 'tj155', 'jj155', 'jyfw155', '2', 'wf155', '5', '1', 'tpdz155', '0', 'jkdlx155', 'ms155');
INSERT INTO `hotel` VALUES ('156', 'mc156', 'dz156', 'fr156', 'yysj156', 'lxfs156', 'tj156', 'jj156', 'jyfw156', '2', 'wf156', '5', '1', 'tpdz156', '0', 'jkdlx156', 'ms156');
INSERT INTO `hotel` VALUES ('157', 'mc157', 'dz157', 'fr157', 'yysj157', 'lxfs157', 'tj157', 'jj157', 'jyfw157', '2', 'wf157', '5', '1', 'tpdz157', '0', 'jkdlx157', 'ms157');
INSERT INTO `hotel` VALUES ('158', 'mc158', 'dz158', 'fr158', 'yysj158', 'lxfs158', 'tj158', 'jj158', 'jyfw158', '2', 'wf158', '5', '1', 'tpdz158', '0', 'jkdlx158', 'ms158');
INSERT INTO `hotel` VALUES ('159', 'mc159', 'dz159', 'fr159', 'yysj159', 'lxfs159', 'tj159', 'jj159', 'jyfw159', '2', 'wf159', '5', '1', 'tpdz159', '0', 'jkdlx159', 'ms159');
INSERT INTO `hotel` VALUES ('160', 'mc160', 'dz160', 'fr160', 'yysj160', 'lxfs160', 'tj160', 'jj160', 'jyfw160', '2', 'wf160', '5', '1', 'tpdz160', '0', 'jkdlx160', 'ms160');
INSERT INTO `hotel` VALUES ('161', 'mc161', 'dz161', 'fr161', 'yysj161', 'lxfs161', 'tj161', 'jj161', 'jyfw161', '2', 'wf161', '5', '1', 'tpdz161', '0', 'jkdlx161', 'ms161');
INSERT INTO `hotel` VALUES ('162', 'mc162', 'dz162', 'fr162', 'yysj162', 'lxfs162', 'tj162', 'jj162', 'jyfw162', '2', 'wf162', '5', '1', 'tpdz162', '0', 'jkdlx162', 'ms162');
INSERT INTO `hotel` VALUES ('163', 'mc163', 'dz163', 'fr163', 'yysj163', 'lxfs163', 'tj163', 'jj163', 'jyfw163', '2', 'wf163', '5', '1', 'tpdz163', '0', 'jkdlx163', 'ms163');
INSERT INTO `hotel` VALUES ('164', 'mc164', 'dz164', 'fr164', 'yysj164', 'lxfs164', 'tj164', 'jj164', 'jyfw164', '2', 'wf164', '5', '1', 'tpdz164', '0', 'jkdlx164', 'ms164');
INSERT INTO `hotel` VALUES ('165', 'mc165', 'dz165', 'fr165', 'yysj165', 'lxfs165', 'tj165', 'jj165', 'jyfw165', '2', 'wf165', '5', '1', 'tpdz165', '0', 'jkdlx165', 'ms165');
INSERT INTO `hotel` VALUES ('166', 'mc166', 'dz166', 'fr166', 'yysj166', 'lxfs166', 'tj166', 'jj166', 'jyfw166', '2', 'wf166', '5', '1', 'tpdz166', '0', 'jkdlx166', 'ms166');
INSERT INTO `hotel` VALUES ('167', 'mc167', 'dz167', 'fr167', 'yysj167', 'lxfs167', 'tj167', 'jj167', 'jyfw167', '2', 'wf167', '5', '1', 'tpdz167', '0', 'jkdlx167', 'ms167');
INSERT INTO `hotel` VALUES ('168', 'mc168', 'dz168', 'fr168', 'yysj168', 'lxfs168', 'tj168', 'jj168', 'jyfw168', '2', 'wf168', '5', '1', 'tpdz168', '0', 'jkdlx168', 'ms168');
INSERT INTO `hotel` VALUES ('169', 'mc169', 'dz169', 'fr169', 'yysj169', 'lxfs169', 'tj169', 'jj169', 'jyfw169', '2', 'wf169', '5', '1', 'tpdz169', '0', 'jkdlx169', 'ms169');
INSERT INTO `hotel` VALUES ('170', 'mc170', 'dz170', 'fr170', 'yysj170', 'lxfs170', 'tj170', 'jj170', 'jyfw170', '2', 'wf170', '5', '1', 'tpdz170', '0', 'jkdlx170', 'ms170');
INSERT INTO `hotel` VALUES ('171', 'mc171', 'dz171', 'fr171', 'yysj171', 'lxfs171', 'tj171', 'jj171', 'jyfw171', '2', 'wf171', '5', '1', 'tpdz171', '0', 'jkdlx171', 'ms171');
INSERT INTO `hotel` VALUES ('172', 'mc172', 'dz172', 'fr172', 'yysj172', 'lxfs172', 'tj172', 'jj172', 'jyfw172', '2', 'wf172', '5', '1', 'tpdz172', '0', 'jkdlx172', 'ms172');
INSERT INTO `hotel` VALUES ('173', 'mc173', 'dz173', 'fr173', 'yysj173', 'lxfs173', 'tj173', 'jj173', 'jyfw173', '2', 'wf173', '5', '1', 'tpdz173', '0', 'jkdlx173', 'ms173');
INSERT INTO `hotel` VALUES ('174', 'mc174', 'dz174', 'fr174', 'yysj174', 'lxfs174', 'tj174', 'jj174', 'jyfw174', '2', 'wf174', '5', '1', 'tpdz174', '0', 'jkdlx174', 'ms174');
INSERT INTO `hotel` VALUES ('175', 'mc175', 'dz175', 'fr175', 'yysj175', 'lxfs175', 'tj175', 'jj175', 'jyfw175', '2', 'wf175', '5', '1', 'tpdz175', '0', 'jkdlx175', 'ms175');
INSERT INTO `hotel` VALUES ('176', 'mc176', 'dz176', 'fr176', 'yysj176', 'lxfs176', 'tj176', 'jj176', 'jyfw176', '2', 'wf176', '5', '1', 'tpdz176', '0', 'jkdlx176', 'ms176');
INSERT INTO `hotel` VALUES ('177', 'mc177', 'dz177', 'fr177', 'yysj177', 'lxfs177', 'tj177', 'jj177', 'jyfw177', '2', 'wf177', '5', '1', 'tpdz177', '0', 'jkdlx177', 'ms177');
INSERT INTO `hotel` VALUES ('178', 'mc178', 'dz178', 'fr178', 'yysj178', 'lxfs178', 'tj178', 'jj178', 'jyfw178', '2', 'wf178', '5', '1', 'tpdz178', '0', 'jkdlx178', 'ms178');
INSERT INTO `hotel` VALUES ('179', 'mc179', 'dz179', 'fr179', 'yysj179', 'lxfs179', 'tj179', 'jj179', 'jyfw179', '2', 'wf179', '5', '1', 'tpdz179', '0', 'jkdlx179', 'ms179');
INSERT INTO `hotel` VALUES ('180', 'mc180', 'dz180', 'fr180', 'yysj180', 'lxfs180', 'tj180', 'jj180', 'jyfw180', '2', 'wf180', '5', '1', 'tpdz180', '0', 'jkdlx180', 'ms180');
INSERT INTO `hotel` VALUES ('181', 'mc181', 'dz181', 'fr181', 'yysj181', 'lxfs181', 'tj181', 'jj181', 'jyfw181', '2', 'wf181', '5', '1', 'tpdz181', '0', 'jkdlx181', 'ms181');
INSERT INTO `hotel` VALUES ('182', 'mc182', 'dz182', 'fr182', 'yysj182', 'lxfs182', 'tj182', 'jj182', 'jyfw182', '2', 'wf182', '5', '1', 'tpdz182', '0', 'jkdlx182', 'ms182');
INSERT INTO `hotel` VALUES ('183', 'mc183', 'dz183', 'fr183', 'yysj183', 'lxfs183', 'tj183', 'jj183', 'jyfw183', '2', 'wf183', '5', '1', 'tpdz183', '0', 'jkdlx183', 'ms183');
INSERT INTO `hotel` VALUES ('184', 'mc184', 'dz184', 'fr184', 'yysj184', 'lxfs184', 'tj184', 'jj184', 'jyfw184', '2', 'wf184', '5', '1', 'tpdz184', '0', 'jkdlx184', 'ms184');
INSERT INTO `hotel` VALUES ('185', 'mc185', 'dz185', 'fr185', 'yysj185', 'lxfs185', 'tj185', 'jj185', 'jyfw185', '2', 'wf185', '5', '1', 'tpdz185', '0', 'jkdlx185', 'ms185');
INSERT INTO `hotel` VALUES ('186', 'mc186', 'dz186', 'fr186', 'yysj186', 'lxfs186', 'tj186', 'jj186', 'jyfw186', '2', 'wf186', '5', '1', 'tpdz186', '0', 'jkdlx186', 'ms186');
INSERT INTO `hotel` VALUES ('187', 'mc187', 'dz187', 'fr187', 'yysj187', 'lxfs187', 'tj187', 'jj187', 'jyfw187', '2', 'wf187', '5', '1', 'tpdz187', '0', 'jkdlx187', 'ms187');
INSERT INTO `hotel` VALUES ('188', 'mc188', 'dz188', 'fr188', 'yysj188', 'lxfs188', 'tj188', 'jj188', 'jyfw188', '2', 'wf188', '5', '1', 'tpdz188', '0', 'jkdlx188', 'ms188');
INSERT INTO `hotel` VALUES ('189', 'mc189', 'dz189', 'fr189', 'yysj189', 'lxfs189', 'tj189', 'jj189', 'jyfw189', '2', 'wf189', '5', '1', 'tpdz189', '0', 'jkdlx189', 'ms189');
INSERT INTO `hotel` VALUES ('190', 'mc190', 'dz190', 'fr190', 'yysj190', 'lxfs190', 'tj190', 'jj190', 'jyfw190', '2', 'wf190', '5', '1', 'tpdz190', '0', 'jkdlx190', 'ms190');
INSERT INTO `hotel` VALUES ('191', 'mc191', 'dz191', 'fr191', 'yysj191', 'lxfs191', 'tj191', 'jj191', 'jyfw191', '2', 'wf191', '5', '1', 'tpdz191', '0', 'jkdlx191', 'ms191');
INSERT INTO `hotel` VALUES ('192', 'mc192', 'dz192', 'fr192', 'yysj192', 'lxfs192', 'tj192', 'jj192', 'jyfw192', '2', 'wf192', '5', '1', 'tpdz192', '0', 'jkdlx192', 'ms192');
INSERT INTO `hotel` VALUES ('193', 'mc193', 'dz193', 'fr193', 'yysj193', 'lxfs193', 'tj193', 'jj193', 'jyfw193', '2', 'wf193', '5', '1', 'tpdz193', '0', 'jkdlx193', 'ms193');
INSERT INTO `hotel` VALUES ('194', 'mc194', 'dz194', 'fr194', 'yysj194', 'lxfs194', 'tj194', 'jj194', 'jyfw194', '2', 'wf194', '5', '1', 'tpdz194', '0', 'jkdlx194', 'ms194');
INSERT INTO `hotel` VALUES ('195', 'mc195', 'dz195', 'fr195', 'yysj195', 'lxfs195', 'tj195', 'jj195', 'jyfw195', '2', 'wf195', '5', '1', 'tpdz195', '0', 'jkdlx195', 'ms195');
INSERT INTO `hotel` VALUES ('196', 'mc196', 'dz196', 'fr196', 'yysj196', 'lxfs196', 'tj196', 'jj196', 'jyfw196', '2', 'wf196', '5', '1', 'tpdz196', '0', 'jkdlx196', 'ms196');
INSERT INTO `hotel` VALUES ('197', 'mc197', 'dz197', 'fr197', 'yysj197', 'lxfs197', 'tj197', 'jj197', 'jyfw197', '2', 'wf197', '5', '1', 'tpdz197', '0', 'jkdlx197', 'ms197');
INSERT INTO `hotel` VALUES ('198', 'mc198', 'dz198', 'fr198', 'yysj198', 'lxfs198', 'tj198', 'jj198', 'jyfw198', '2', 'wf198', '5', '1', 'tpdz198', '0', 'jkdlx198', 'ms198');
INSERT INTO `hotel` VALUES ('199', 'mc199', 'dz199', 'fr199', 'yysj199', 'lxfs199', 'tj199', 'jj199', 'jyfw199', '2', 'wf199', '5', '1', 'tpdz199', '0', 'jkdlx199', 'ms199');
INSERT INTO `hotel` VALUES ('200', 'mc200', 'dz200', 'fr200', 'yysj200', 'lxfs200', 'tj200', 'jj200', 'jyfw200', '2', 'wf200', '5', '1', 'tpdz200', '0', 'jkdlx200', 'ms200');
INSERT INTO `hotel` VALUES ('201', 'mc201', 'dz201', 'fr201', 'yysj201', 'lxfs201', 'tj201', 'jj201', 'jyfw201', '2', 'wf201', '5', '1', 'tpdz201', '0', 'jkdlx201', 'ms201');
INSERT INTO `hotel` VALUES ('202', 'mc202', 'dz202', 'fr202', 'yysj202', 'lxfs202', 'tj202', 'jj202', 'jyfw202', '2', 'wf202', '5', '1', 'tpdz202', '0', 'jkdlx202', 'ms202');
INSERT INTO `hotel` VALUES ('203', 'mc203', 'dz203', 'fr203', 'yysj203', 'lxfs203', 'tj203', 'jj203', 'jyfw203', '2', 'wf203', '5', '1', 'tpdz203', '0', 'jkdlx203', 'ms203');
INSERT INTO `hotel` VALUES ('204', 'mc204', 'dz204', 'fr204', 'yysj204', 'lxfs204', 'tj204', 'jj204', 'jyfw204', '2', 'wf204', '5', '1', 'tpdz204', '0', 'jkdlx204', 'ms204');
INSERT INTO `hotel` VALUES ('205', 'mc205', 'dz205', 'fr205', 'yysj205', 'lxfs205', 'tj205', 'jj205', 'jyfw205', '2', 'wf205', '5', '1', 'tpdz205', '0', 'jkdlx205', 'ms205');
INSERT INTO `hotel` VALUES ('206', 'mc206', 'dz206', 'fr206', 'yysj206', 'lxfs206', 'tj206', 'jj206', 'jyfw206', '2', 'wf206', '5', '1', 'tpdz206', '0', 'jkdlx206', 'ms206');
INSERT INTO `hotel` VALUES ('207', 'mc207', 'dz207', 'fr207', 'yysj207', 'lxfs207', 'tj207', 'jj207', 'jyfw207', '2', 'wf207', '5', '1', 'tpdz207', '0', 'jkdlx207', 'ms207');
INSERT INTO `hotel` VALUES ('208', 'mc208', 'dz208', 'fr208', 'yysj208', 'lxfs208', 'tj208', 'jj208', 'jyfw208', '2', 'wf208', '5', '1', 'tpdz208', '0', 'jkdlx208', 'ms208');
INSERT INTO `hotel` VALUES ('209', 'mc209', 'dz209', 'fr209', 'yysj209', 'lxfs209', 'tj209', 'jj209', 'jyfw209', '2', 'wf209', '5', '1', 'tpdz209', '0', 'jkdlx209', 'ms209');
INSERT INTO `hotel` VALUES ('210', 'mc210', 'dz210', 'fr210', 'yysj210', 'lxfs210', 'tj210', 'jj210', 'jyfw210', '2', 'wf210', '5', '1', 'tpdz210', '0', 'jkdlx210', 'ms210');
INSERT INTO `hotel` VALUES ('211', 'mc211', 'dz211', 'fr211', 'yysj211', 'lxfs211', 'tj211', 'jj211', 'jyfw211', '2', 'wf211', '5', '1', 'tpdz211', '0', 'jkdlx211', 'ms211');
INSERT INTO `hotel` VALUES ('212', 'mc212', 'dz212', 'fr212', 'yysj212', 'lxfs212', 'tj212', 'jj212', 'jyfw212', '2', 'wf212', '5', '1', 'tpdz212', '0', 'jkdlx212', 'ms212');
INSERT INTO `hotel` VALUES ('213', 'mc213', 'dz213', 'fr213', 'yysj213', 'lxfs213', 'tj213', 'jj213', 'jyfw213', '2', 'wf213', '5', '1', 'tpdz213', '0', 'jkdlx213', 'ms213');
INSERT INTO `hotel` VALUES ('214', 'mc214', 'dz214', 'fr214', 'yysj214', 'lxfs214', 'tj214', 'jj214', 'jyfw214', '2', 'wf214', '5', '1', 'tpdz214', '0', 'jkdlx214', 'ms214');
INSERT INTO `hotel` VALUES ('215', 'mc215', 'dz215', 'fr215', 'yysj215', 'lxfs215', 'tj215', 'jj215', 'jyfw215', '2', 'wf215', '5', '1', 'tpdz215', '0', 'jkdlx215', 'ms215');
INSERT INTO `hotel` VALUES ('216', 'mc216', 'dz216', 'fr216', 'yysj216', 'lxfs216', 'tj216', 'jj216', 'jyfw216', '2', 'wf216', '5', '1', 'tpdz216', '0', 'jkdlx216', 'ms216');
INSERT INTO `hotel` VALUES ('217', 'mc217', 'dz217', 'fr217', 'yysj217', 'lxfs217', 'tj217', 'jj217', 'jyfw217', '2', 'wf217', '5', '1', 'tpdz217', '0', 'jkdlx217', 'ms217');
INSERT INTO `hotel` VALUES ('218', 'mc218', 'dz218', 'fr218', 'yysj218', 'lxfs218', 'tj218', 'jj218', 'jyfw218', '2', 'wf218', '5', '1', 'tpdz218', '0', 'jkdlx218', 'ms218');
INSERT INTO `hotel` VALUES ('219', 'mc219', 'dz219', 'fr219', 'yysj219', 'lxfs219', 'tj219', 'jj219', 'jyfw219', '2', 'wf219', '5', '1', 'tpdz219', '0', 'jkdlx219', 'ms219');
INSERT INTO `hotel` VALUES ('220', 'mc220', 'dz220', 'fr220', 'yysj220', 'lxfs220', 'tj220', 'jj220', 'jyfw220', '2', 'wf220', '5', '1', 'tpdz220', '0', 'jkdlx220', 'ms220');
INSERT INTO `hotel` VALUES ('221', 'mc221', 'dz221', 'fr221', 'yysj221', 'lxfs221', 'tj221', 'jj221', 'jyfw221', '2', 'wf221', '5', '1', 'tpdz221', '0', 'jkdlx221', 'ms221');
INSERT INTO `hotel` VALUES ('222', 'mc222', 'dz222', 'fr222', 'yysj222', 'lxfs222', 'tj222', 'jj222', 'jyfw222', '2', 'wf222', '5', '1', 'tpdz222', '0', 'jkdlx222', 'ms222');
INSERT INTO `hotel` VALUES ('223', 'mc223', 'dz223', 'fr223', 'yysj223', 'lxfs223', 'tj223', 'jj223', 'jyfw223', '2', 'wf223', '5', '1', 'tpdz223', '0', 'jkdlx223', 'ms223');
INSERT INTO `hotel` VALUES ('224', 'mc224', 'dz224', 'fr224', 'yysj224', 'lxfs224', 'tj224', 'jj224', 'jyfw224', '2', 'wf224', '5', '1', 'tpdz224', '0', 'jkdlx224', 'ms224');

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `gid` int(10) NOT NULL AUTO_INCREMENT COMMENT '全局gid',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `worktime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `phone` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', 'mc1', 'ms1', 'dz1', 'zgsj1', 'lxfs1', 'tpdz1');
INSERT INTO `school` VALUES ('2', 'mc2', 'ms2', 'dz2', 'zgsj2', 'lxfs2', 'tpdz2');
INSERT INTO `school` VALUES ('3', 'mc3', 'ms3', 'dz3', 'zgsj3', 'lxfs3', 'tpdz3');
INSERT INTO `school` VALUES ('4', 'mc4', 'ms4', 'dz4', 'zgsj4', 'lxfs4', 'tpdz4');
INSERT INTO `school` VALUES ('5', 'mc5', 'ms5', 'dz5', 'zgsj5', 'lxfs5', 'tpdz5');
INSERT INTO `school` VALUES ('6', 'mc6', 'ms6', 'dz6', 'zgsj6', 'lxfs6', 'tpdz6');
INSERT INTO `school` VALUES ('7', 'mc7', 'ms7', 'dz7', 'zgsj7', 'lxfs7', 'tpdz7');
INSERT INTO `school` VALUES ('8', 'mc8', 'ms8', 'dz8', 'zgsj8', 'lxfs8', 'tpdz8');
INSERT INTO `school` VALUES ('9', 'mc9', 'ms9', 'dz9', 'zgsj9', 'lxfs9', 'tpdz9');
INSERT INTO `school` VALUES ('10', 'mc10', 'ms10', 'dz10', 'zgsj10', 'lxfs10', 'tpdz10');
INSERT INTO `school` VALUES ('11', 'mc11', 'ms11', 'dz11', 'zgsj11', 'lxfs11', 'tpdz11');
INSERT INTO `school` VALUES ('12', 'mc12', 'ms12', 'dz12', 'zgsj12', 'lxfs12', 'tpdz12');
INSERT INTO `school` VALUES ('13', 'mc13', 'ms13', 'dz13', 'zgsj13', 'lxfs13', 'tpdz13');
INSERT INTO `school` VALUES ('14', 'mc14', 'ms14', 'dz14', 'zgsj14', 'lxfs14', 'tpdz14');
INSERT INTO `school` VALUES ('15', 'mc15', 'ms15', 'dz15', 'zgsj15', 'lxfs15', 'tpdz15');
INSERT INTO `school` VALUES ('16', 'mc16', 'ms16', 'dz16', 'zgsj16', 'lxfs16', 'tpdz16');
INSERT INTO `school` VALUES ('17', 'mc17', 'ms17', 'dz17', 'zgsj17', 'lxfs17', 'tpdz17');
INSERT INTO `school` VALUES ('18', 'mc18', 'ms18', 'dz18', 'zgsj18', 'lxfs18', 'tpdz18');
INSERT INTO `school` VALUES ('19', 'mc19', 'ms19', 'dz19', 'zgsj19', 'lxfs19', 'tpdz19');
INSERT INTO `school` VALUES ('20', 'mc20', 'ms20', 'dz20', 'zgsj20', 'lxfs20', 'tpdz20');
INSERT INTO `school` VALUES ('21', 'mc21', 'ms21', 'dz21', 'zgsj21', 'lxfs21', 'tpdz21');
INSERT INTO `school` VALUES ('22', 'mc22', 'ms22', 'dz22', 'zgsj22', 'lxfs22', 'tpdz22');
INSERT INTO `school` VALUES ('23', 'mc23', 'ms23', 'dz23', 'zgsj23', 'lxfs23', 'tpdz23');
INSERT INTO `school` VALUES ('24', 'mc24', 'ms24', 'dz24', 'zgsj24', 'lxfs24', 'tpdz24');
INSERT INTO `school` VALUES ('25', 'mc25', 'ms25', 'dz25', 'zgsj25', 'lxfs25', 'tpdz25');
INSERT INTO `school` VALUES ('26', 'mc26', 'ms26', 'dz26', 'zgsj26', 'lxfs26', 'tpdz26');
INSERT INTO `school` VALUES ('27', 'mc27', 'ms27', 'dz27', 'zgsj27', 'lxfs27', 'tpdz27');
INSERT INTO `school` VALUES ('28', 'mc28', 'ms28', 'dz28', 'zgsj28', 'lxfs28', 'tpdz28');
INSERT INTO `school` VALUES ('29', 'mc29', 'ms29', 'dz29', 'zgsj29', 'lxfs29', 'tpdz29');
INSERT INTO `school` VALUES ('30', 'mc30', 'ms30', 'dz30', 'zgsj30', 'lxfs30', 'tpdz30');
INSERT INTO `school` VALUES ('31', 'mc31', 'ms31', 'dz31', 'zgsj31', 'lxfs31', 'tpdz31');
INSERT INTO `school` VALUES ('32', 'mc32', 'ms32', 'dz32', 'zgsj32', 'lxfs32', 'tpdz32');
INSERT INTO `school` VALUES ('33', 'mc33', 'ms33', 'dz33', 'zgsj33', 'lxfs33', 'tpdz33');
INSERT INTO `school` VALUES ('34', 'mc34', 'ms34', 'dz34', 'zgsj34', 'lxfs34', 'tpdz34');
INSERT INTO `school` VALUES ('35', 'mc35', 'ms35', 'dz35', 'zgsj35', 'lxfs35', 'tpdz35');
INSERT INTO `school` VALUES ('36', 'mc36', 'ms36', 'dz36', 'zgsj36', 'lxfs36', 'tpdz36');
INSERT INTO `school` VALUES ('37', 'mc37', 'ms37', 'dz37', 'zgsj37', 'lxfs37', 'tpdz37');
INSERT INTO `school` VALUES ('38', 'mc38', 'ms38', 'dz38', 'zgsj38', 'lxfs38', 'tpdz38');
INSERT INTO `school` VALUES ('39', 'mc39', 'ms39', 'dz39', 'zgsj39', 'lxfs39', 'tpdz39');
INSERT INTO `school` VALUES ('40', 'mc40', 'ms40', 'dz40', 'zgsj40', 'lxfs40', 'tpdz40');
INSERT INTO `school` VALUES ('41', 'mc41', 'ms41', 'dz41', 'zgsj41', 'lxfs41', 'tpdz41');
INSERT INTO `school` VALUES ('42', 'mc42', 'ms42', 'dz42', 'zgsj42', 'lxfs42', 'tpdz42');
INSERT INTO `school` VALUES ('43', 'mc43', 'ms43', 'dz43', 'zgsj43', 'lxfs43', 'tpdz43');
INSERT INTO `school` VALUES ('44', 'mc44', 'ms44', 'dz44', 'zgsj44', 'lxfs44', 'tpdz44');
INSERT INTO `school` VALUES ('45', 'mc45', 'ms45', 'dz45', 'zgsj45', 'lxfs45', 'tpdz45');
INSERT INTO `school` VALUES ('46', 'mc46', 'ms46', 'dz46', 'zgsj46', 'lxfs46', 'tpdz46');
INSERT INTO `school` VALUES ('47', 'mc47', 'ms47', 'dz47', 'zgsj47', 'lxfs47', 'tpdz47');
INSERT INTO `school` VALUES ('48', 'mc48', 'ms48', 'dz48', 'zgsj48', 'lxfs48', 'tpdz48');
INSERT INTO `school` VALUES ('49', 'mc49', 'ms49', 'dz49', 'zgsj49', 'lxfs49', 'tpdz49');
INSERT INTO `school` VALUES ('50', 'mc50', 'ms50', 'dz50', 'zgsj50', 'lxfs50', 'tpdz50');
INSERT INTO `school` VALUES ('51', 'mc51', 'ms51', 'dz51', 'zgsj51', 'lxfs51', 'tpdz51');

-- ----------------------------
-- Function structure for `getPictureNextOrderid`
-- ----------------------------
DROP FUNCTION IF EXISTS `getPictureNextOrderid`;
DELIMITER ;;
CREATE DEFINER=`DDAP`@`%` FUNCTION `getPictureNextOrderid`(seq_name char(100)) RETURNS int(10)
begin
 DECLARE nextOrderid INT;
 SELECT MAX(orderid)+1 INTO nextOrderid FROM t_omot_picture t WHERE t.module = seq_name;
return IFNULL(nextOrderid,1);
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `nextval`
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`DDAP`@`%` FUNCTION `nextval`(seqName char (20)) RETURNS int(11)
begin
 update sequence set current_val=LAST_INSERT_ID(current_val+1) where seq_name=seqName;
 return  LAST_INSERT_ID();
end
;;
DELIMITER ;
