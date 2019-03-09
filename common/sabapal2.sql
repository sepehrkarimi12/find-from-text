/*
 Navicat Premium Data Transfer

 Source Server         : portal
 Source Server Type    : MySQL
 Source Server Version : 100131
 Source Host           : localhost:3306
 Source Schema         : sabapal2

 Target Server Type    : MySQL
 Target Server Version : 100131
 File Encoding         : 65001

 Date: 07/03/2019 11:37:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('bankAccount', 1, 1532174192);
INSERT INTO `auth_assignment` VALUES ('bankAccount', 50, 1537790324);
INSERT INTO `auth_assignment` VALUES ('document', 1, 1532165842);
INSERT INTO `auth_assignment` VALUES ('document', 49, 1531893147);
INSERT INTO `auth_assignment` VALUES ('document', 50, 1537797960);
INSERT INTO `auth_assignment` VALUES ('mobile', 1, 1531914061);
INSERT INTO `auth_assignment` VALUES ('mobile', 47, 1534768585);
INSERT INTO `auth_assignment` VALUES ('mobile', 50, 1537796784);
INSERT INTO `auth_assignment` VALUES ('user2', 1, 1507627062);
INSERT INTO `auth_assignment` VALUES ('user2', 47, 1531033684);
INSERT INTO `auth_assignment` VALUES ('user2', 49, 1531893423);
INSERT INTO `auth_assignment` VALUES ('user2', 50, 1537796921);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('bankAccount', 2, 'bankAccount', NULL, NULL, 1511936401, 1511936401);
INSERT INTO `auth_item` VALUES ('bankAccountVerify', 2, 'bankAccountVerify', NULL, NULL, 1530963717, 1530963717);
INSERT INTO `auth_item` VALUES ('document', 2, NULL, NULL, NULL, 1507626360, 1507626360);
INSERT INTO `auth_item` VALUES ('mobile', 2, 'mobile', NULL, NULL, 1531914061, 1531914061);
INSERT INTO `auth_item` VALUES ('updateProfile', 2, NULL, NULL, NULL, 1507626360, 1507626360);
INSERT INTO `auth_item` VALUES ('user2', 1, NULL, NULL, NULL, 1507626360, 1507626360);

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('user2', 'updateProfile');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bank_accounts
-- ----------------------------
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE `bank_accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankID` int(11) DEFAULT NULL,
  `shaba` char(26) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cartNumber` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `accountNumber` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `year` smallint(4) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `primary` smallint(1) DEFAULT NULL,
  `month` smallint(2) DEFAULT NULL,
  `active` smallint(255) DEFAULT NULL,
  `time` int(255) DEFAULT NULL,
  `deleted` smallint(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  INDEX `bankID`(`bankID`) USING BTREE,
  CONSTRAINT `bank_accounts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_accounts_ibfk_2` FOREIGN KEY (`bankID`) REFERENCES `bank_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bank_accounts
-- ----------------------------
INSERT INTO `bank_accounts` VALUES (22, 1, '221212121212211221212121', '', '', NULL, NULL, 1, 1, NULL, 1, 1532174192, 0);
INSERT INTO `bank_accounts` VALUES (23, 1, '123123123123', '123123123123', '123123123123', 1, 97, 47, 1, 1, 1, 1111111111, 0);
INSERT INTO `bank_accounts` VALUES (24, 3, '654654684684848984886466', '9999999999999999', '313121331231', NULL, 95, 50, 1, 4, NULL, 1537790324, 0);
INSERT INTO `bank_accounts` VALUES (25, 1, '789654123654789654123654', '1234567896541236', '1234567895', NULL, 96, 50, 0, 3, NULL, 1537791344, 0);
INSERT INTO `bank_accounts` VALUES (26, 2, '343137317212716721762171', '9999999999999999', '1165611533', NULL, 94, 50, 0, 3, NULL, 1537791442, 0);

-- ----------------------------
-- Table structure for bank_list
-- ----------------------------
DROP TABLE IF EXISTS `bank_list`;
CREATE TABLE `bank_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bank_list
-- ----------------------------
INSERT INTO `bank_list` VALUES (1, 'ملی', 1);
INSERT INTO `bank_list` VALUES (2, 'ملت', 1);
INSERT INTO `bank_list` VALUES (3, 'صادرات', 1);
INSERT INTO `bank_list` VALUES (4, 'تجارت', 1);
INSERT INTO `bank_list` VALUES (5, 'سپه', 1);

-- ----------------------------
-- Table structure for bank_log
-- ----------------------------
DROP TABLE IF EXISTS `bank_log`;
CREATE TABLE `bank_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `auth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `response` int(11) DEFAULT NULL,
  `externalPayID` int(11) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `orderID` int(11) DEFAULT NULL,
  `SystemTraceNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RetrivalRefNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  INDEX `externalPayID`(`externalPayID`) USING BTREE,
  INDEX `orderID`(`orderID`) USING BTREE,
  CONSTRAINT `bank_log_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_log_ibfk_2` FOREIGN KEY (`externalPayID`) REFERENCES `external_pay` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_log_ibfk_3` FOREIGN KEY (`orderID`) REFERENCES `transaction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bank_log
-- ----------------------------
INSERT INTO `bank_log` VALUES (155, 1, '0001772EA9D60B179F146DC584BFCBF9B820141988F69C5686EA', 1536399922, NULL, NULL, 1, 1000, 274, NULL, NULL);
INSERT INTO `bank_log` VALUES (156, 1, '0001772EA9D60B179F141846B56E9D68E9F8314181A1418E0DA2', 1536400144, NULL, 0, 1, 1000, 275, '000201', '321401437150');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `config` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `configBANKID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `configBANK`(`configBANKID`) USING BTREE,
  CONSTRAINT `config_ibfk_1` FOREIGN KEY (`configBANKID`) REFERENCES `config_bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, '', NULL, 1);

-- ----------------------------
-- Table structure for config_bank
-- ----------------------------
DROP TABLE IF EXISTS `config_bank`;
CREATE TABLE `config_bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shaba` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cardNumber` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `accountNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of config_bank
-- ----------------------------
INSERT INTO `config_bank` VALUES (1, 'ملی', '4564564564564564', '121212121212', '000252525458', 1);

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nationalCode` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tell` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postalCode` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (6, 'احمد', 'برزگر', '4060414425', 'ستارخان - خیابان حبیب اللهی - پلاک 123', '09334050410', '02188312999', '1450210000', 1, 0);
INSERT INTO `contact` VALUES (7, 'gdfgdf', 'gdfgdfgdf', '0014545454', 'gdfgdf', 'gdfgdfgdfgd', 'dfgdfgd', '', 47, 0);
INSERT INTO `contact` VALUES (8, 'حمیدرضا', 'خورش', '0011231231', '.نبدرصتقثدنتردصتقدرتصق نتدبلنتذصنتقادت منتدذتبارصتمثقاتلرتا', '09126359688', '44982891', '5645645456', 49, 0);
INSERT INTO `contact` VALUES (9, 'حسین', 'روشن', NULL, 'سمنیئبمنسئیمنرسبیب سیب سی5655س  س کیئمئ یس ', '09365322264', '09365322264', '3132564592', 50, 0);

-- ----------------------------
-- Table structure for external_pay
-- ----------------------------
DROP TABLE IF EXISTS `external_pay`;
CREATE TABLE `external_pay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of external_pay
-- ----------------------------
INSERT INTO `external_pay` VALUES (1, NULL, 'ملی');

-- ----------------------------
-- Table structure for factor
-- ----------------------------
DROP TABLE IF EXISTS `factor`;
CREATE TABLE `factor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `lastname` varchar(35) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `factorNumber` int(10) NOT NULL,
  `url` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `dateFactor` int(15) NOT NULL,
  `mobile` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(40) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `money` int(20) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `factor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for factor_detail
-- ----------------------------
DROP TABLE IF EXISTS `factor_detail`;
CREATE TABLE `factor_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `money` int(9) DEFAULT NULL,
  `factor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `factor_id`(`factor_id`) USING BTREE,
  CONSTRAINT `factor_detail_ibfk_1` FOREIGN KEY (`factor_id`) REFERENCES `factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for instagram_company
-- ----------------------------
DROP TABLE IF EXISTS `instagram_company`;
CREATE TABLE `instagram_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instagram_id` int(13) DEFAULT NULL,
  `internalID` int(11) DEFAULT NULL,
  `last_update` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`, `username`) USING BTREE,
  INDEX `internalID`(`internalID`) USING BTREE,
  CONSTRAINT `instagram_company_ibfk_1` FOREIGN KEY (`internalID`) REFERENCES `internal_pay` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of instagram_company
-- ----------------------------
INSERT INTO `instagram_company` VALUES (6, 'ho3einroshan', NULL, 2, 1547899635, 1547899635);
INSERT INTO `instagram_company` VALUES (7, 'ho3einroshan', NULL, 2, 1547899766, 1547899766);
INSERT INTO `instagram_company` VALUES (8, 'ry.cafe', NULL, 2, 1547900757, 1547900757);
INSERT INTO `instagram_company` VALUES (9, 'mortezaoboudi', NULL, 2, 1547903421, 1547903421);
INSERT INTO `instagram_company` VALUES (10, 'listenpersian', NULL, 2, 1551944463, 1551944463);

-- ----------------------------
-- Table structure for instagram_product
-- ----------------------------
DROP TABLE IF EXISTS `instagram_product`;
CREATE TABLE `instagram_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customId` int(11) DEFAULT NULL,
  `instagramId` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `caption` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shortLink` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `price_old` int(11) NOT NULL,
  `productCOLORID` int(11) DEFAULT NULL,
  `productCATEGORYID` int(11) DEFAULT NULL,
  `internal_payID` int(11) DEFAULT NULL,
  `imageUrlOnline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `instagramTYPEID` int(11) DEFAULT NULL,
  `companyID` int(11) DEFAULT NULL,
  `imageID` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productCOLORID`(`productCOLORID`) USING BTREE,
  INDEX `imageID`(`imageID`) USING BTREE,
  INDEX `product_ibfk_2`(`productCATEGORYID`) USING BTREE,
  INDEX `userID`(`internal_payID`) USING BTREE,
  INDEX `instagramTYPEID`(`instagramTYPEID`) USING BTREE,
  INDEX `companyID`(`companyID`) USING BTREE,
  CONSTRAINT `instagram_product_ibfk_1` FOREIGN KEY (`productCOLORID`) REFERENCES `product_color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instagram_product_ibfk_2` FOREIGN KEY (`productCATEGORYID`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instagram_product_ibfk_3` FOREIGN KEY (`imageID`) REFERENCES `product_image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instagram_product_ibfk_4` FOREIGN KEY (`internal_payID`) REFERENCES `internal_pay` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instagram_product_ibfk_5` FOREIGN KEY (`instagramTYPEID`) REFERENCES `instagram_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instagram_product_ibfk_6` FOREIGN KEY (`companyID`) REFERENCES `instagram_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of instagram_product
-- ----------------------------
INSERT INTO `instagram_product` VALUES (101, NULL, '1955375859351226860', 'گاهی هم دست خودمان نیست\nمزخرف می‌نویسیم\nمزخرف می‌گوییم\nمزخرف می‌شویم', 'Bsi4_vrAQns', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/fff6ac96bdf5f1fda3a182007204c624/5CFE5CAE/t51.2885-15/e35/49907395_1879386905504558_4636206721173218596_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (102, NULL, '1954036132769532461', 'شما تقریبا تا چهار سالگی آزادید. بعد از آن طریقه حرف زدن را می‌آموزید، به مدرسه میروید و جهت دهی می‌شوید و در قالب محیط گنجانده می‌شوید. فردگرایی خود را از دست می‌دهید. البته اگر به اندازه کافی داشته باشید مقداری از آن را حفظ می‌کنید. پیروزی، ازدواج، تولد.\nهشت ساعت کار می‌کنید با احساس رضایت نسبی. انگار دارید کار مهمی انجام می‌دهید. ازدواج می‌کنید، انگار ازدواج یک موفقیت است و بچه دار می‌شوید، انگ', 'BseIYKEAYot', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/7cb070c29381f4106ae94e0e00f0c02b/5C45780C/t51.2885-15/e35/47585296_1247773345361173_7148770402002520639_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 3, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (103, NULL, '1949628109544304034', 'وقتی خدا را کشته باشیم، چیزی یا کسی را به جایش می‌نشانیم. بدون توجه به ماهیت آن جایگزین، نفسِ جایگزینی بدین معنیست که خود را برتر و بالاتر و مختار به جایگزینی می‌دانیم. و اگر به بلندترین جایگاه برویم- مشرف بر همه آدمیان- هر چیزی پایین‌تر از خود، منجمله آن جایگزین را شامل می‌شویم.\nانسان ناگزیر به یافتن خدا درون خود است یا در غیر این صورت نه بر قله که در پَست‌ترین دَرَکات این جهان ایستاده است.', 'BsOeG-hgS2i', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/cc89ca7edf16dfd6a6f4731f1ee847e6/5D006ADA/t51.2885-15/e35/47694337_390035881731857_3083174138786214223_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (104, NULL, '1943833335012942509', 'داستانِ شب فرق میکند! شب صادق‌تر است، بی‌ریاتر است. شب‌ها را تا می‌توانید به بیداری سپری کنید که وقت برای خوابیدن بسیار است. \n#شب_لعنتیست\n#این_شبی_که_میگم_شب_نیست\n#شبانه_های_بیمار', 'Br54h6MAmKt', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/0093fae2c3416945383021d8bb8077a0/5CC6D55B/t51.2885-15/e35/46733255_1952500261723991_4501256481936931952_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (105, NULL, '1930008439375937064', 'دریغا که بار دگر شام شد\nسراپای گیتی سیه‌فام شد\n\nهمه خلق را گاهِ آرام شد	\nبجز من که درد و غمم شد فزون\n\nجهان را نباشد خوشی در مزاج\nبجز مرگ نَبْوَد غمم را علاج\n\nولیکن در آن گوشه در پای کاج	\nچکیده‌ست بر خاک سه قطره خون\n#صادق_هدایت\n#من_راست_قامت_جاودانه_تاریخ_خواهم_ماند\n#کی_به_کیه\n\nPhoto by: @farshad_msl1990', 'BrIxHMygj4o', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/b5bca9e88995adb221f97b462bf430f1/5CC7A110/t51.2885-15/e35/46127168_1353698144773021_2405847892099825607_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (106, NULL, '1919966611952027985', 'همینطور که ورق میزنید،  لذت ببرید از کار زیبای بچه های گروه آوازی تهران\n#موزیک_ویدئو ????❤\n???? سومین موزیک ویدئو رسمی #گروه_آوازی_تهران بر اساس موزیک فیلم #لالالند ???? \nدراین موسیقی از هیچ سازی استفاده نشده است!\nCity Of Stars\nComposer: Justin Horowitz \nArranger: @agharezaseyedi\nArtist Manager: @miladomranloo\nRecording: @kiarokni\nMix & Master: @hamidrezaadab\nDirector & Concept: @nedebadi63 \nCamer', 'BqlF3YOAslR', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/62f350861b1332c7f0649de155074d61/5C450D76/t51.2885-15/e35/44793746_2190141777914907_4802841682711927535_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (107, NULL, '1914163347956352901', 'مُشک را گفتند: ﺗﻮ ﺭﺍ ﯾﮏ ﻋﯿﺐ ﻫﺴﺖ، ﺑﺎ ﻫﺮ ﮐﻪ ﻧﺸﯿﻨﯽ ﺍﺯ ﺑﻮﯼ ﺧﻮﺷﺖ ﺑﻪ ﺍﻭ ﺩﻫﯽ\nﮔﻔﺖ: ﺯﯾﺮﺍ ﮐﻪ ﻧﻨﮕﺮﻡ ﺑﺎ که هستم، ﺑﻪ ﺁﻥ ﺑﻨﮕﺮﻡ ﮐﻪ ﻣﻦ که هستم.\n\n#مولانا \n#مشک_کی_بودم_من\n#خود_میبویم_نه_آنکه_عطار_میگوید\n#یه_هشتگ_بلند_که_از_آخرین_هشتگ_بلندتره', 'BqQeWxdAseF', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/21cdcd77e1054da59198d5d75dcc92b0/5CC53154/t51.2885-15/e35/45485409_1991946564196284_5253028483179073990_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (108, NULL, '1893178028679460261', 'انسان‌ها دو دسته‌اند\nانسان‌های معمولی و اون‌هایی که معتقدند\nانسان‌ها دو دسته‌اند', 'BpF62L4A3Wl', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/009c9e57112b38146651c28f897ca1a5/5CCC4B72/t51.2885-15/e35/41602416_2390868287843490_3869041181007786682_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (109, NULL, '1885184125372021515', '#محسن_چاوشی #ابراهیم', 'BophPlRATsL', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/5bb53cdfe3f1428e12e493cf56d4742c/5C456FB7/t51.2885-15/e35/41696714_312850152865556_4224984263738009133_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 3, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (110, NULL, '1869611700102400734', 'سال‌ها طول می‌کشه تا بفهمی همیشه رفتن به معنی رسیدن نیست\nبارها از نفس می‌افتی تا بفهمی نفس کشیدن به معنی زندگی کردن نیست\n\nاز #خودم\nدوست داشتی #خودت\n#کی_به_کیه\n#آلبرکامو اصلن????', 'BnyMe-EhIre', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/7b1aed4ae15d2335eff4c2211e419d09/5CC18EFE/t51.2885-15/e35/37539210_1112539772237155_1564102136583631860_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (111, NULL, '1867771461638800267', 'شرایط زیر رو در نظر بگیرید\nیک شرکت خودرو سازی تعداد محدودی خودرو تولید میکنه که از حجم تقاضای بازار خیلی کمتره. و با قیمت 3 هزار تومن اونها رو به فروش میگذاره. قیمت خودرو توی بازار آزاد 6 هزار تومنه که قیمت ناعادلانه‌ایه. به شما و دوستتون پیشنهاد میکنن که ماشین بخرید ولی تا بعد از خرید از تصمیم دوستتون نمیتونید مطلع بشید. و شرایط پایین هم برقراره:\n1- اگر شما ماشین بخرید و دوستتون نخره، شما می‌تونی', 'BnrqD-cl8OL', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/915e2bb1f43b6bc6faab2c5b2987e65d/5CCACF30/t51.2885-15/e35/41152742_130672111218498_3861313106096366563_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (112, NULL, '1858403246147968040', 'خبر کوتاه بود و اتفاق جانکاه\nبردند شایان را به قربانگاه\n\n@saadati_shayan ❤️\nengaged ????\n@sama_kashef ❤️\n#بله_برون\n#آرزوی_خوشبختی\n#شایان_سما', 'BnKX-f4FRwo', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/5fc60d2769eab1f95854423e3034ce86/5CCBF8CD/t51.2885-15/e35/39070628_322190385197667_5036064130558066688_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 6, NULL, 1547899641, 1547899641, NULL, NULL);
INSERT INTO `instagram_product` VALUES (113, NULL, '1955375859351226860', 'گاهی هم دست خودمان نیست\nمزخرف می‌نویسیم\nمزخرف می‌گوییم\nمزخرف می‌شویم', 'Bsi4_vrAQns', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/fff6ac96bdf5f1fda3a182007204c624/5CFE5CAE/t51.2885-15/e35/49907395_1879386905504558_4636206721173218596_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (114, NULL, '1954036132769532461', 'شما تقریبا تا چهار سالگی آزادید. بعد از آن طریقه حرف زدن را می‌آموزید، به مدرسه میروید و جهت دهی می‌شوید و در قالب محیط گنجانده می‌شوید. فردگرایی خود را از دست می‌دهید. البته اگر به اندازه کافی داشته باشید مقداری از آن را حفظ می‌کنید. پیروزی، ازدواج، تولد.\nهشت ساعت کار می‌کنید با احساس رضایت نسبی. انگار دارید کار مهمی انجام می‌دهید. ازدواج می‌کنید، انگار ازدواج یک موفقیت است و بچه دار می‌شوید، انگ', 'BseIYKEAYot', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/7cb070c29381f4106ae94e0e00f0c02b/5C45780C/t51.2885-15/e35/47585296_1247773345361173_7148770402002520639_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 3, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (115, NULL, '1949628109544304034', 'وقتی خدا را کشته باشیم، چیزی یا کسی را به جایش می‌نشانیم. بدون توجه به ماهیت آن جایگزین، نفسِ جایگزینی بدین معنیست که خود را برتر و بالاتر و مختار به جایگزینی می‌دانیم. و اگر به بلندترین جایگاه برویم- مشرف بر همه آدمیان- هر چیزی پایین‌تر از خود، منجمله آن جایگزین را شامل می‌شویم.\nانسان ناگزیر به یافتن خدا درون خود است یا در غیر این صورت نه بر قله که در پَست‌ترین دَرَکات این جهان ایستاده است.', 'BsOeG-hgS2i', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/cc89ca7edf16dfd6a6f4731f1ee847e6/5D006ADA/t51.2885-15/e35/47694337_390035881731857_3083174138786214223_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (116, NULL, '1943833335012942509', 'داستانِ شب فرق میکند! شب صادق‌تر است، بی‌ریاتر است. شب‌ها را تا می‌توانید به بیداری سپری کنید که وقت برای خوابیدن بسیار است. \n#شب_لعنتیست\n#این_شبی_که_میگم_شب_نیست\n#شبانه_های_بیمار', 'Br54h6MAmKt', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/0093fae2c3416945383021d8bb8077a0/5CC6D55B/t51.2885-15/e35/46733255_1952500261723991_4501256481936931952_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (117, NULL, '1930008439375937064', 'دریغا که بار دگر شام شد\nسراپای گیتی سیه‌فام شد\n\nهمه خلق را گاهِ آرام شد	\nبجز من که درد و غمم شد فزون\n\nجهان را نباشد خوشی در مزاج\nبجز مرگ نَبْوَد غمم را علاج\n\nولیکن در آن گوشه در پای کاج	\nچکیده‌ست بر خاک سه قطره خون\n#صادق_هدایت\n#من_راست_قامت_جاودانه_تاریخ_خواهم_ماند\n#کی_به_کیه\n\nPhoto by: @farshad_msl1990', 'BrIxHMygj4o', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/b5bca9e88995adb221f97b462bf430f1/5CC7A110/t51.2885-15/e35/46127168_1353698144773021_2405847892099825607_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (118, NULL, '1919966611952027985', 'همینطور که ورق میزنید،  لذت ببرید از کار زیبای بچه های گروه آوازی تهران\n#موزیک_ویدئو ????❤\n???? سومین موزیک ویدئو رسمی #گروه_آوازی_تهران بر اساس موزیک فیلم #لالالند ???? \nدراین موسیقی از هیچ سازی استفاده نشده است!\nCity Of Stars\nComposer: Justin Horowitz \nArranger: @agharezaseyedi\nArtist Manager: @miladomranloo\nRecording: @kiarokni\nMix & Master: @hamidrezaadab\nDirector & Concept: @nedebadi63 \nCamer', 'BqlF3YOAslR', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/699c5e33e4a02db69f5dfe0342e22008/5C45B636/t51.2885-15/e35/44793746_2190141777914907_4802841682711927535_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (119, NULL, '1914163347956352901', 'مُشک را گفتند: ﺗﻮ ﺭﺍ ﯾﮏ ﻋﯿﺐ ﻫﺴﺖ، ﺑﺎ ﻫﺮ ﮐﻪ ﻧﺸﯿﻨﯽ ﺍﺯ ﺑﻮﯼ ﺧﻮﺷﺖ ﺑﻪ ﺍﻭ ﺩﻫﯽ\nﮔﻔﺖ: ﺯﯾﺮﺍ ﮐﻪ ﻧﻨﮕﺮﻡ ﺑﺎ که هستم، ﺑﻪ ﺁﻥ ﺑﻨﮕﺮﻡ ﮐﻪ ﻣﻦ که هستم.\n\n#مولانا \n#مشک_کی_بودم_من\n#خود_میبویم_نه_آنکه_عطار_میگوید\n#یه_هشتگ_بلند_که_از_آخرین_هشتگ_بلندتره', 'BqQeWxdAseF', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/21cdcd77e1054da59198d5d75dcc92b0/5CC53154/t51.2885-15/e35/45485409_1991946564196284_5253028483179073990_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (120, NULL, '1893178028679460261', 'انسان‌ها دو دسته‌اند\nانسان‌های معمولی و اون‌هایی که معتقدند\nانسان‌ها دو دسته‌اند', 'BpF62L4A3Wl', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/009c9e57112b38146651c28f897ca1a5/5CCC4B72/t51.2885-15/e35/41602416_2390868287843490_3869041181007786682_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (121, NULL, '1885184125372021515', '#محسن_چاوشی #ابراهیم', 'BophPlRATsL', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/5bb53cdfe3f1428e12e493cf56d4742c/5C456FB7/t51.2885-15/e35/41696714_312850152865556_4224984263738009133_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 3, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (122, NULL, '1869611700102400734', 'سال‌ها طول می‌کشه تا بفهمی همیشه رفتن به معنی رسیدن نیست\nبارها از نفس می‌افتی تا بفهمی نفس کشیدن به معنی زندگی کردن نیست\n\nاز #خودم\nدوست داشتی #خودت\n#کی_به_کیه\n#آلبرکامو اصلن????', 'BnyMe-EhIre', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/7b1aed4ae15d2335eff4c2211e419d09/5CC18EFE/t51.2885-15/e35/37539210_1112539772237155_1564102136583631860_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (123, NULL, '1867771461638800267', 'شرایط زیر رو در نظر بگیرید\nیک شرکت خودرو سازی تعداد محدودی خودرو تولید میکنه که از حجم تقاضای بازار خیلی کمتره. و با قیمت 3 هزار تومن اونها رو به فروش میگذاره. قیمت خودرو توی بازار آزاد 6 هزار تومنه که قیمت ناعادلانه‌ایه. به شما و دوستتون پیشنهاد میکنن که ماشین بخرید ولی تا بعد از خرید از تصمیم دوستتون نمیتونید مطلع بشید. و شرایط پایین هم برقراره:\n1- اگر شما ماشین بخرید و دوستتون نخره، شما می‌تونی', 'BnrqD-cl8OL', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/915e2bb1f43b6bc6faab2c5b2987e65d/5CCACF30/t51.2885-15/e35/41152742_130672111218498_3861313106096366563_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (124, NULL, '1858403246147968040', 'خبر کوتاه بود و اتفاق جانکاه\nبردند شایان را به قربانگاه\n\n@saadati_shayan ❤️\nengaged ????\n@sama_kashef ❤️\n#بله_برون\n#آرزوی_خوشبختی\n#شایان_سما', 'BnKX-f4FRwo', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/5fc60d2769eab1f95854423e3034ce86/5CCBF8CD/t51.2885-15/e35/39070628_322190385197667_5036064130558066688_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 7, NULL, 1547899770, 1547899770, NULL, NULL);
INSERT INTO `instagram_product` VALUES (125, NULL, '1951453901208556846', '. کنسرت رستاک  امروز ساعت 6:30\n.\n. .شرایط شرکت در قرعه کشی:\n. 1_  3تا از دوستاتون و زیر این پست تگ کنید.\n. . 2_فقط دوستانی که از فالوورهای ما باشند در قرعه کشی شرکت داده میشن. .\n.  3_  3تااز پست های ما رو لایک کنید.\n.\n.\n.\n.\n.\n.\n.\n.\n#قرعه_کشی #کنسرت #گروه_رستاک #کافه_گردی', 'BsU9PvhFhUu', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/f5fc7e8b47b26ce6720d372d908342d6/5CCDF9C8/t51.2885-15/e35/49470042_770213316666591_5260701871134791668_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (126, NULL, '1950830454954694984', 'تماشای بازی جام ملت های اسیا در رای کافه ????????????\n.\n.\n.\n.\n.\n.\n.\n#جام_ملتهای_آسیا #ایران #تیم_ملی #کافه_گردی', 'BsSvfZ8lplI', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/e5f0ed79813845741ed0e8c3c9b0d7d1/5CCD0579/t51.2885-15/e35/49907285_952927921574322_1831885932779732184_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (127, NULL, '1948101527450470704', '. اوقات خوش ان بوود که با قهوه به سر شد????????????....\n.\n.\n.\n.\n.\n.\n.\n.\n#قهوه #لته #لته_آرت #باریستا #کافه_گردی #کافه #کجا_چی_بخوریم #معرفی_کافه', 'BsJDASKFMkw', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/d78a5f11a7fd840d334ef8f05df26d5a/5CC11163/t51.2885-15/e35/47693893_2218627211753678_4306075399272366525_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (128, NULL, '1941699262552734855', 'Merry Christmas ???? کریسمس رو به تمام هموطنان مسیحی عزیزمون تبریک عرض میکنیم #کریسمس #سال نومیلادی#کافه #کافه_گردی #دورهمی #شادی', 'BryTTEVF_yH', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/b2871bc0902e6013b5c638de15ef0b30/5CC7087A/t51.2885-15/e35/47586331_1941265012636436_4121352414527356689_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (129, NULL, '1937743605843620719', '. با ست منو مخصوص یلدا منتظر شما.. عزیزان هستیم????????????????????\n.لطفا جهت رزرو  با شماره 88937470 تماس بگیرین\n.\n.\n.\n.\n.\n.\n#یلدا#کافه_گردی #کافه', 'BrkP4r8F_Nv', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/a46a2e374eaf5a7cd69ef7f2bd4d53c4/5CC50CF7/t51.2885-15/e35/46662718_1960222187615610_314000767493174033_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (130, NULL, '1933591473758229293', '????????????????????????????????????\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n#تولد#کافه_گردی #کافه #تولدت_مبارک', 'BrVfzNmFVMt', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/3226f2b0ffaaf1a1941a7fed2e96af88/5CFFFEAA/t51.2885-15/e35/46234029_158269898481927_804126281786272881_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (131, NULL, '1921099577660108509', 'ممنونيم كه ما رو توي لحظات زيباتون انتخاب ميكنيد ???? تولد تمام اذر ماهي هاي عزيز  مبارك ???????? #ry.cafe \n#كافه#دورهمي #خوشمزه #كافه_گردي #غذا #قهوه #ارامش #تولد #اذر', 'BqpHeMwlW7d', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/b3bcf312ca6ddf02592f86f2ec187a13/5CD13385/t51.2885-15/e35/44734725_2263949340291444_3121897889815401097_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (132, NULL, '1919680285878097007', 'اين هواي باروني يه غذاي خوشمزه و بعدش قهوه ميطلبه مگه نه ???? #راي كافه #كافه #كافه گردي #غذا #خوشمزه #دورهمي #قهوه', 'BqkEwySFZRv', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/e6a78dd1c5b45abd75b9fe68eb9880dd/5CBCE920/t51.2885-15/e35/46427684_161963394762536_1909779853415060115_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (133, NULL, '1918225487576331996', 'مهمون امروز راي کافه جناب اقاي برانكوعزيز ????????⚽️❤️❤️‌‌. #برانکو #پرسپولیس #brancoivancovic #کافه#فوتبال #پرسپولیس_قهرمان #دورهمي #كافه_گردي #كافه #soccer #soccercoach #branco', 'Bqe5-ryFnbc', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/27f4d6c5b8a5cd0d4d40d4823152ccd2/5CC87E2A/t51.2885-15/e35/44316655_547988395663884_7513646060523450707_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (134, NULL, '1916663936276902572', 'پیتزا یا لازانیا؟؟؟؟؟؟\nمساله این است????????\n.\n.\n.#پیتزا #لازاانیا_خونگی #كافه_گردي #کجا_چی_بخوریم #خوشمزه', 'BqZW7HzljKs', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/64cc1d0a4d661a73466f7f3afedbb169/5CCD2787/t51.2885-15/e35/43984898_324065944988373_2797611782439585000_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (135, NULL, '1915251105484751414', 'Have a good day with coffee☕☕☕\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n#قهوه#کافه_گردی #کافه #کجا_چی_بخوریم', 'BqUVrumF8I2', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/594d9cfad7980a7e935d2f3fa6aa1cce/5CC17D7C/t51.2885-15/e35/45609853_511227116060451_2107057026074662117_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (136, NULL, '1914560618364875594', '. پنینی رست بیف مارو حتما امتحان کنید???????????? . در ضمن تخفیف 20% همه روزه مارو يادتون نره????????????????????\n.\n.\n.\n.\n.\n.\n.\n#کافه_گردی #کافه #کجا_چی_بخوریم #پنینی', 'BqR4r0WlzNK', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/f17fecc07089d936e664b4fcbf42f7c9/5CC4CFB8/t51.2885-15/e35/44451551_1181250568690678_2715974415980344306_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 8, NULL, 1547900763, 1547900763, NULL, NULL);
INSERT INTO `instagram_product` VALUES (137, NULL, '1958960618019387136', 'ما آدمای بدی نیستیم، ما فقط از جای بدی میایم... ???? Shame  #wintertide #me', 'BsvoE2WBncAHM3Tmp2OtgYpFRuXdUkBifYaNxU0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/6d0ced72ffebec662fb07d5609fc5bc9/5CC0FBB3/t51.2885-15/e35/47583692_320372551906950_7101378281305482335_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (138, NULL, '1949469707996610156', '???? هوا دلگير، درها بسته،\nسرها در گريبان، دست‌ها پنهان، \nنفس‌ها ابر، دل‌ها خسته و غمگين، \nزمين دلمرده، سقف آسمان کوتاه، \nغبارآلوده مهر و ماه، \nزمستان است... ???? مهدی اخوان‌ثالث', 'BsN6F7lhb5siz3e9qLmVxkF7Il7cAPwlL9ZD3A0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/d4466ec31236a383bdfebde171ac75a7/5CC53EAB/t51.2885-15/e35/49778708_525731054593755_6010550772930926749_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (139, NULL, '1943794744029014315', 'بچه که بودیم،زمان را ملال آور و پایان ناپذیر می دانستیم،سال ها گذشت تا فهمیدیم هر ساعت فقط شصت دقیقه است و بعدها یاد گرفتیم همه ی دقیقه ها بدون استثنا سر ثانیه شصتم تمام میشود...!', 'Br5vwViHukrP4Jja4nojGfhULzx6KMe3CqrLCw0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/57a9234437d65185b0c70255ebd51410/5CC649A1/t51.2885-15/e35/47200707_584288972013138_4676293160097698786_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (140, NULL, '1935532477984904220', 'وضعیت شخصیت شما، میانگین پنج نفر از افرادی است که بیشترین زمان را با آنها سپری می کنید...! ????جیم ران', 'BrcZIiphZQcXj71P2LNQpauGbM31E3s6UeLlQg0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/90a0d0ff76ad9cb7bb4ff2ba9a8b2a47/5CFB444D/t51.2885-15/e35/46043116_304094083556819_4600297151123449923_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (141, NULL, '1931995411623821990', 'پشت هر آدم موفق،\nکوهستانی سرد و تاریک\nاز اهمیت ندادن به دیگران و\nنظرات‌شان است. ????وین دایر', 'BrP05c5hcKmrISnOJnS0t8i4Vd9KTCQwe2-j6U0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/939f8dfa557fec070cfd6f54376e6de5/5CC915B8/t51.2885-15/e35/46307308_205585310368933_7546904862867780084_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (142, NULL, '1929852299514436834', '????', 'BrINnENh1ziSMzWJEhlrTUKqQpO5t0PJkKDB700', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/4fb3f2b59360d13e9062b4175c13f1cb/5CBFF514/t51.2885-15/e35/46552221_2247165252163878_4159811311860603566_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (143, NULL, '1919113531069170966', 'ما راه میرفتیم و زندگی نشستن بود\nما میدویدیم و زندگی راه رفتن بود\nما میخوابیدیم و زندگی دویدن بود\nنه! انسان، هیچگاه برای خود مأمن خوبی نبوده است... ????حسین پناهی\n???? به وقت گرینویچ', 'BqiD5avBgUWzIc4-iZhPk4P0gJAfpslDvGAix00', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/e8c158a8c038cae8e5e965f75ff3fe2f/5CBF5105/t51.2885-15/e35/44726697_325317074965003_3853570329987483478_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (144, NULL, '1907271029983867855', 'شما روی زمین هستید، \nهیچ درمانی برایش نداریم! ????ساموئل بکت', 'Bp3_OWIlPPPibGtWfcu7OypfYWmX9uhEHUPRBY0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/bc6d286ebf16ac40e4e0f776e7ce77ef/5CFC5AAE/t51.2885-15/e35/43400733_288190658483345_7016044860188687965_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (145, NULL, '1896305600939496520', 'آنکه به زمان‌های متفاوتی تعلق دارد، معاصر هيچ‌کس نيست... ????مانس اشپربر\n???? قطره اشکی در اقیانوس', 'BpRB-WhlRRISCuu80M_RZdCB3DzHiK51CcjEbA0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/055768a8de87fc1e02127b7492d02110/5CC6EE16/t51.2885-15/e35/43065153_345864912650898_5474700705444407520_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (146, NULL, '1886353724500469914', 'Personneli????', 'BotrLfVleiavAnQKzWPVwvqa7DKaNkNKeXYTeA0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/71a2b1fdd0822f7b79575c07cab76653/5CFDF8C2/t51.2885-15/e35/42004183_155048478777292_7496288149619931564_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 1, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (147, NULL, '1880002589460061926', 'گرگ ها هرگز گریه نمی کنند؛\nاما گاهی چنان عرصه ی زندگی بر آنان تنگ می شود،\nکه برفراز بلندترین کوهها می روند\nو دردناکترین زوزه ها را می کشند! ???? ارنستو چگوارا', 'BoXHGT5lN7mHYHxsPY0P4Z9_vcZbnXsPgDtFdg0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/0e317719b7ed33509a3ea97c8d856e99/5CCC6BB4/t51.2885-15/e35/41405323_261939931120108_566567550850660989_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (148, NULL, '1877822700090836938', 'می خواهم اقلا یک ‌نفر باشد \nکه من با او \nاز همه چیز،\nهمان طور حرف بزنم\nکه با خودم حرف می زنم. ????فئودور داستایوفسکی', 'BoPXcvuFEfK2nUzG8vAM8yhdmr9EeQ3NF6as8g0', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://instagram.fgyd4-1.fna.fbcdn.net/vp/2dc8b9dd24f8643ab50dd2711458a1a7/5CFD14B5/t51.2885-15/e35/41739257_304841300345847_8612994601569653716_n.jpg?_nc_ht=instagram.fgyd4-1.fna.fbcdn.net', 4, 9, NULL, 1547903458, 1547903458, NULL, NULL);
INSERT INTO `instagram_product` VALUES (149, NULL, '1993808770295346542', 'آهنگ پیشنهادی امشب ، سورپرایز برای طرفداران داریوش\n.\n#داریوش - بمان مادر\n.\n#موزیک_ایرانی #موزیک #موسیقی #داریوش_اقبالی #بهترینها #مادر #آهنگ #dariush', 'BurboNPgzVu', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/4d7caf29d8ad097b4b90b10817053a76/5C831674/t51.2885-15/e35/52706566_250011325947571_8724673125074215532_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 4, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (150, NULL, '1993768516653682764', '#پیمان_معادی #کریستن_استوارت .\n.\n.\n#بازیگران #هنرمندان #سینما #عکس', 'BurSecHgBBM', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/e639615b5081d6d6477884b336d5d006/5D028810/t51.2885-15/e35/54511497_2646283462068472_7876562507289547106_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 1, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (151, NULL, '1993043584315797961', '#النازشاکردوست', 'BuotpSRA7HJ', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/053033451cbf8fc460fe086a13d62617/5D068341/t51.2885-15/e35/52700620_124423088640346_3881559224948894254_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 1, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (152, NULL, '1992334532761716902', 'موزیک پیشنهادی امشب ????\n.\nزنده یاد #مهستی - میخونه بی شراب\n.\n#موزیک #موزیک_ایرانی #آهنگ #موسیقی #بانو #شب #mahasti', 'BumMbOjAYim', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/813a5f5a3a0f8bff6a7324b4c9fac42a/5C835459/t51.2885-15/e35/52831250_409476563137175_7810539864773635770_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 3, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (153, NULL, '1992279173762206301', '#استاد_شجریان درکنار همسر و پسر\n.\nآرزوی سلامتی برای #خسرو_آواز_ايران_محمدرضا_شجريان', 'Bul_1pdgUpd', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/6f599b81cb49b705062f3a51eea8fce1/5D0C4F6D/t51.2885-15/e35/51914375_333261827317214_7206331845822094199_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 1, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (154, NULL, '1992081396390238141', '.\nعکس جدید #مهران_غفوریان به همراه همسر و دختر تازه متولد شدش\n.\n#بازیگران #هنرمندان #سینما #عکس #جدید #دختر #بیبی', 'BulS3m7gRe9', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/33f49fc48465965f736ca687b16b4671/5D19E2FB/t51.2885-15/e35/52826020_2197100187014819_1246085562155842074_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 1, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (155, NULL, '1991616844875910996', 'موزیک پیشنهادی امشب\n.\n#شادمهرعقیلی - انتخاب\n.\n#موزیک #موزیک_ایرانی #آهنگ #موسیقی #شادمهر #shadmehraghili', 'BujpPfng09U', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/3d63bb01f77b6de033b858d8f43b92fc/5C8395A6/t51.2885-15/e35/52800609_391592614762631_2328082966547050576_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 4, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (156, NULL, '1991538084780482496', '#شهاب_حسینی', 'BujXVYkAJ_A', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/39422be7eb16abf7aae7329fa9b2f7c0/5D0D7C0D/t51.2885-15/e35/52332935_780112759036997_1581073482294824336_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 1, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (157, NULL, '1990925411797798515', 'موزیک پیشنهادی امشب ????\n.\n#ابی - این آخرین باره\n.\n#موزیک #موسیقی #آهنگ #موزیک_ایرانی', 'BuhMB0YgY5z', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/09d4cb37bf4454476d305043fe626d29/5C83556D/t51.2885-15/e35/53014203_303491860314227_8564847460236525238_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 4, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (158, NULL, '1990158791265644519', '.\nهنوز صداش تو گوشتونه ؟\n#خسروشکیبایی #روحش_شاد', 'BueduBYAm_n', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/6ad6cbd543197f4f51fe0981cec68bfd/5D07D21C/t51.2885-15/e35/52355818_120561705701558_1133298255169656778_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 1, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (159, NULL, '1990129354373407713', '.\n#هانیه_توسلی و مرضیه ابراهیمی، دختری که چند ساله پیش در اصفهان به رویش اسید پاشیدند !', 'BueXBqIgSPh', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/3d706a02263ffaecd6b41a4e16034759/5D137353/t51.2885-15/e35/52719319_1846801762098807_2299519237699053998_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 1, 10, NULL, 1551944766, 1551944766, NULL, NULL);
INSERT INTO `instagram_product` VALUES (160, NULL, '1989428162072802153', '#صدف_طاهریان زمانی که در ایران بود', 'Bub3l96gfNp', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'https://scontent-frx5-1.cdninstagram.com/vp/1b9c39e07e4bc694386a160736cd9574/5D0242F4/t51.2885-15/e35/52044884_764415700606991_5824796405463496129_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com', 1, 10, NULL, 1551944766, 1551944766, NULL, NULL);

-- ----------------------------
-- Table structure for instagram_type
-- ----------------------------
DROP TABLE IF EXISTS `instagram_type`;
CREATE TABLE `instagram_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of instagram_type
-- ----------------------------
INSERT INTO `instagram_type` VALUES (1, 'image');
INSERT INTO `instagram_type` VALUES (2, 'sidebar');
INSERT INTO `instagram_type` VALUES (3, 'video');
INSERT INTO `instagram_type` VALUES (4, 'sidecar');

-- ----------------------------
-- Table structure for internal_pay
-- ----------------------------
DROP TABLE IF EXISTS `internal_pay`;
CREATE TABLE `internal_pay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(255) DEFAULT NULL,
  `website_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `website_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_tell` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `website_desc` varchar(455) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `website_categoryID` int(255) DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `deleted` smallint(6) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `private_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  INDEX `website_categoryID`(`website_categoryID`) USING BTREE,
  CONSTRAINT `internal_pay_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `internal_pay_ibfk_2` FOREIGN KEY (`website_categoryID`) REFERENCES `website_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of internal_pay
-- ----------------------------
INSERT INTO `internal_pay` VALUES (2, 1, 'صفر و وب', 'http://localhost/sabaTest1/web/index.php/site/response', '09336086658', '1234', 1, '185.94.97.110', 1, 0, 213207, 'milad');
INSERT INTO `internal_pay` VALUES (3, 1, 'صفر و وب', 'http://sefroweb.com/', '09336086658', 'sadasd', 2, '192.168.11.1', NULL, 0, 1530341893, NULL);
INSERT INTO `internal_pay` VALUES (4, 49, 'rg43wg4', 'http://www.localhost/forooshgah', '02188888888', '', 2, '109.162.201.21', 1, 0, 1531895569, '5555555555555555555550');
INSERT INTO `internal_pay` VALUES (5, 50, 'خنده های شیطانی', 'https://www.khande.ir', '09365322264', 'hkkn.kllm,;\'\'', 1, '', NULL, 0, 1537798037, NULL);
INSERT INTO `internal_pay` VALUES (6, 50, 'aslfmsdf', 'https://www.sabapal.ir', '09365322264', 'alnksckancjk', 1, '', NULL, 0, 1537798079, NULL);
INSERT INTO `internal_pay` VALUES (7, 50, 'ref', '', '', '', 1, '', NULL, 0, 1539430615, NULL);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `logTYPE` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `admin_active` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `active_time` int(11) DEFAULT NULL,
  `sourceID` int(11) NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  INDEX `log_ibfk_2`(`logTYPE`) USING BTREE,
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `log_ibfk_2` FOREIGN KEY (`logTYPE`) REFERENCES `log_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 1, 1540380246, 4, 1, 0, 0, 0, 22, 'bank_accounts');
INSERT INTO `log` VALUES (2, 1, 1540380324, 4, 1, 0, 0, 0, 22, 'bank_accounts');

-- ----------------------------
-- Table structure for log_type
-- ----------------------------
DROP TABLE IF EXISTS `log_type`;
CREATE TABLE `log_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `verify` int(11) DEFAULT NULL,
  `req_source` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log_type
-- ----------------------------
INSERT INTO `log_type` VALUES (1, 'ثبت ترمینال جدید برای متقاضی', 1, 5);
INSERT INTO `log_type` VALUES (4, 'ثبت درخواست تغییر شباهای متصل', 0, 6);
INSERT INTO `log_type` VALUES (5, '  ثبت درخواست تعریف مشتری و فروشگاه ', 1, 13);
INSERT INTO `log_type` VALUES (6, 'درخواست تغییر آدرس فروشگاه یذ پدیرنده ', 1, 17);
INSERT INTO `log_type` VALUES (7, ' درخواست فعال سازی ترمینال ', 1, 18);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1507384218);
INSERT INTO `migration` VALUES ('m130524_201442_init', 1507384223);
INSERT INTO `migration` VALUES ('m140209_132017_init', 1507539664);
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', 1507539666);
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', 1507539672);
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', 1507539674);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1507447529);
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', 1507447202);
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', 1507539675);
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', 1507539676);
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', 1507539677);
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', 1507539679);
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', 1507539683);
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', 1507539683);
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', 1507539684);
INSERT INTO `migration` VALUES ('m160312_050000_create_user', 1507447202);
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', 1507539685);

-- ----------------------------
-- Table structure for mobile_phone
-- ----------------------------
DROP TABLE IF EXISTS `mobile_phone`;
CREATE TABLE `mobile_phone`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` int(5) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `count` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `active` smallint(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `mobile_phone_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mobile_phone
-- ----------------------------
INSERT INTO `mobile_phone` VALUES (22, 33573, 1, '09336086658', 1531914050, 0, 1, 1);
INSERT INTO `mobile_phone` VALUES (23, 68661, 47, '09216475712', 1534768354, 0, 1, 1);
INSERT INTO `mobile_phone` VALUES (24, 39150, 50, '09123456789', 1537796344, 6, -1, 1);
INSERT INTO `mobile_phone` VALUES (25, 72607, 50, '09365322264', 1537796740, 0, 1, 1);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, 'کیف', 'bag');
INSERT INTO `product_category` VALUES (2, 'کفش', 'show');
INSERT INTO `product_category` VALUES (3, 'بدلیجات', NULL);

-- ----------------------------
-- Table structure for product_color
-- ----------------------------
DROP TABLE IF EXISTS `product_color`;
CREATE TABLE `product_color`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_color
-- ----------------------------
INSERT INTO `product_color` VALUES (1, 'زرد', 'yello');
INSERT INTO `product_color` VALUES (2, 'قرمز', 'red');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  `deleted` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `timezone` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', 'Asia/Tehran');
INSERT INTO `profile` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for shaparak_details
-- ----------------------------
DROP TABLE IF EXISTS `shaparak_details`;
CREATE TABLE `shaparak_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PmtTpInf` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `InstrId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EndToEndId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TxId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IntrBkSttlmAmt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ChrgBr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Nm` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DbtrId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DbtrIdTp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DbtrAcct` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DbtrAgt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CdtrAgt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Cdtr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PrvtId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CdtrAcct` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RmtInf` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shaparakListID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shaparakListID`(`shaparakListID`) USING BTREE,
  CONSTRAINT `shaparak_details_ibfk_1` FOREIGN KEY (`shaparakListID`) REFERENCES `shaparak_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shaparak_details
-- ----------------------------
INSERT INTO `shaparak_details` VALUES (8, NULL, NULL, '97101193300000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `shaparak_details` VALUES (9, NULL, NULL, '97101193300000002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `shaparak_details` VALUES (10, NULL, NULL, '97101193300000003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `shaparak_details` VALUES (11, NULL, NULL, '97101193300000004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `shaparak_details` VALUES (12, NULL, NULL, '97101193300000005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `shaparak_details` VALUES (13, NULL, NULL, '97101193300000006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `shaparak_details` VALUES (14, NULL, NULL, '97101193300000007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `shaparak_details` VALUES (15, NULL, NULL, '97101193300000001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `shaparak_details` VALUES (16, NULL, NULL, '97101193300000002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `shaparak_details` VALUES (17, NULL, NULL, '97101193300000003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `shaparak_details` VALUES (18, NULL, NULL, '97101193300000004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `shaparak_details` VALUES (19, NULL, NULL, '97101193300000005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `shaparak_details` VALUES (20, NULL, NULL, '97101193300000006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `shaparak_details` VALUES (21, NULL, NULL, '97101193300000007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);

-- ----------------------------
-- Table structure for shaparak_list
-- ----------------------------
DROP TABLE IF EXISTS `shaparak_list`;
CREATE TABLE `shaparak_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MsgId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CrDtTm` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NbOfTxs` int(11) DEFAULT NULL,
  `TtlIntrBkSttlmAmt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IntrBkSttlmDt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SttlmInf` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PmtTpInf` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `internalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `internalID`(`internalID`) USING BTREE,
  CONSTRAINT `shaparak_list_ibfk_1` FOREIGN KEY (`internalID`) REFERENCES `internal_pay` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shaparak_list
-- ----------------------------
INSERT INTO `shaparak_list` VALUES (6, 'BMJSSHAP97101115012.CT', NULL, 7, '46169139', '1397-10-11', 'CLRG', 'SEPA', NULL);
INSERT INTO `shaparak_list` VALUES (7, 'BMJSSHAP97101115012.CT', NULL, 7, '46169139', '1397-10-11', 'CLRG', 'SEPA', NULL);

-- ----------------------------
-- Table structure for short_link
-- ----------------------------
DROP TABLE IF EXISTS `short_link`;
CREATE TABLE `short_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortLink` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`, `link`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_unique`(`provider`, `client_id`) USING BTREE,
  UNIQUE INDEX `account_unique_code`(`code`) USING BTREE,
  INDEX `fk_user_account`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sourcetypes
-- ----------------------------
DROP TABLE IF EXISTS `sourcetypes`;
CREATE TABLE `sourcetypes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `opration` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sourcetypes
-- ----------------------------
INSERT INTO `sourcetypes` VALUES (1, 'شارژ کیف پول', 1);
INSERT INTO `sourcetypes` VALUES (2, 'انتقال به حساب داخلی دیگران', -1);
INSERT INTO `sourcetypes` VALUES (3, 'دریافت از حساب داخلی دیگران', 1);
INSERT INTO `sourcetypes` VALUES (4, 'تسویه حساب', -1);
INSERT INTO `sourcetypes` VALUES (5, 'درگاه مجازی', 1);
INSERT INTO `sourcetypes` VALUES (6, 'درخواست وجه', 1);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ticketDepartmentID` int(11) DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order` smallint(6) DEFAULT NULL COMMENT '1:high , 2:medium , 3:low',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1:send , 2 receive ',
  `status` smallint(6) DEFAULT NULL COMMENT '1:open  , 2: wait , 3:close',
  `parent` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `deleted` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  INDEX `ticketDepartmentID`(`ticketDepartmentID`) USING BTREE,
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ticketDepartmentID`) REFERENCES `ticket_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (9, 1, '17', '21', 1, '', 1, '2', 4, 0, 1507720713, 1);
INSERT INTO `ticket` VALUES (10, 1, '12', '21', 1, 'uploads/users/1/ticket/YaxNO0b1FQ0uYv6DsC1Amp4u--xGfxS3SampleCode-Yii2-master.zip', 1, '1', 4, 9, 1517729713, 0);
INSERT INTO `ticket` VALUES (11, 1, 'ثبت تیکت', 'توضیحات', 1, 'uploads/users/1/ticket/r8R0ofRP6ldCIyZEAsPj9zoX2Pmn5q6klightbox2-master(1).zip', 1, '1', 4, 0, 1507965696, 0);
INSERT INTO `ticket` VALUES (12, 1, 'موضوع', 'توضیحات', 1, 'uploads/users/1/ticket/yXOtc5-oLMDFSzQtr3uFPETNGVggCm9fSampleCode-Yii2-master.zip', 1, '2', 3, 0, 1507966418, 1);
INSERT INTO `ticket` VALUES (13, NULL, '1231', '12313132', NULL, '', NULL, NULL, NULL, 12, NULL, NULL);
INSERT INTO `ticket` VALUES (14, NULL, 'qweqwe', '', NULL, '', NULL, '1', 3, 12, 1516449640, 0);
INSERT INTO `ticket` VALUES (23, NULL, 'dfsf', '', NULL, '', NULL, '1', 3, 12, 1516451339, 0);
INSERT INTO `ticket` VALUES (24, NULL, 'asd', '', NULL, '', NULL, '1', 3, 9, 1516773311, 0);
INSERT INTO `ticket` VALUES (25, NULL, '23423', '', NULL, '', NULL, '1', 3, 9, 1516773336, 0);
INSERT INTO `ticket` VALUES (26, NULL, 'erw', '', NULL, '', NULL, '1', 3, 9, 1516773351, 0);
INSERT INTO `ticket` VALUES (27, NULL, '234', '', NULL, '', NULL, '1', 3, 9, 1516773369, 0);
INSERT INTO `ticket` VALUES (28, NULL, '234', '', NULL, '', NULL, '1', 3, 9, 1516773388, 0);
INSERT INTO `ticket` VALUES (29, NULL, '', 'برزذ', NULL, NULL, NULL, '1', 3, 9, 1516795847, 0);
INSERT INTO `ticket` VALUES (30, 1, 'راهنمایی درباره ی گرفتن درگاه', 'با سلام\r\nبدون داشتن کپی کارت ملی امکان گرفتن درگاه هست؟', 1, '', 1, '1', 2, 0, 1519588726, 0);
INSERT INTO `ticket` VALUES (31, 1, 'تست با آقای میر حسینی', 'توضیحات', 2, 'uploads/users/1/ticket/6NH9Y41eO89ORHe0YRRHquMzlGn8rOkbsabapal.zip', 1, '1', 2, 0, 1530342629, 1);
INSERT INTO `ticket` VALUES (32, 47, '54765675675', '5675675', 1, '', 1, '1', 2, 0, 1531034378, 0);

-- ----------------------------
-- Table structure for ticket_department
-- ----------------------------
DROP TABLE IF EXISTS `ticket_department`;
CREATE TABLE `ticket_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket_department
-- ----------------------------
INSERT INTO `ticket_department` VALUES (1, 'درخواست درگاه پرداخت');
INSERT INTO `ticket_department` VALUES (2, 'درخواست تایید اطلاعات');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE INDEX `token_unique`(`user_id`, `code`, `type`) USING BTREE,
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 'BCFH9t8--cxTP74UHqBfAdaymM3PmnKd', 1507544897, 0);
INSERT INTO `token` VALUES (1, 'KZNw-DOn_qF5aELbYdMI5y2MqYacAvXV', 1543903758, 1);
INSERT INTO `token` VALUES (2, '4P9IG42IrzmahplUD6xHk3o45-1HVARG', 1508921603, 0);
INSERT INTO `token` VALUES (3, 'mnjg-4jmMBK-6zS9Jzx2qctkELIJGACA', 1509778036, 0);
INSERT INTO `token` VALUES (4, '-PYZdZCRtdeRunqwaFPl4_C-Fyw0GP0F', 1510724065, 0);
INSERT INTO `token` VALUES (5, 'OBb6tWJV8PHyOlwrYm8piz-DPhr2XYkQ', 1513422525, 0);
INSERT INTO `token` VALUES (46, '6xKx4tYZxvaxgnQs9vZjC8uWxXDez-Hs', 1530967950, 0);
INSERT INTO `token` VALUES (48, 'Qi6CkJJJOtSX16Heaexfc7jBSADYHehs', 1531892428, 0);
INSERT INTO `token` VALUES (52, 'Ds4Mh8SBJ3cjChErYunlYYPnnpC-3XG6', 1533634185, 0);
INSERT INTO `token` VALUES (53, 'B3iQJJ7yRKDfM0wOK6Jrj8JUZaKwf90i', 1538287457, 0);
INSERT INTO `token` VALUES (54, 'kEAplf68ialJ2GH3oVMeVbVFw1GRwkhS', 1539313689, 0);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `sourceTypeID` int(11) DEFAULT NULL,
  `sourceID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `bankLogID` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cck` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `deleted` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  INDEX `sourceID`(`sourceID`) USING BTREE,
  INDEX `transaction_ibfk_2`(`sourceTypeID`) USING BTREE,
  INDEX `bankLogID`(`bankLogID`) USING BTREE,
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`sourceTypeID`) REFERENCES `sourcetypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`bankLogID`) REFERENCES `bank_log` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 284 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES (274, 1, NULL, NULL, 1536399922, 1000, NULL, -1, '', NULL, NULL, NULL);
INSERT INTO `transaction` VALUES (275, 1, 1, NULL, 1536400113, 1000, 156, 1, '', NULL, 'e5bbefe8a498e0b64e888154383068737af5f4d1664e9c53e0f3bd49d3e6681d1000', 0);
INSERT INTO `transaction` VALUES (282, 1, 4, NULL, 1546868607, 1000, NULL, 2, '', '', '51f01492e2434f6c8351689ccd03fae9d5481c90944521dd5c0645c98604513d1000', 0);
INSERT INTO `transaction` VALUES (283, 1, 6, '09336086658', 1551943335, 1000, NULL, -1, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for transaction_callback
-- ----------------------------
DROP TABLE IF EXISTS `transaction_callback`;
CREATE TABLE `transaction_callback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `url` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaction_id`(`transaction_id`) USING BTREE,
  CONSTRAINT `transaction_callback_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_unique_username`(`username`) USING BTREE,
  UNIQUE INDEX `user_unique_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'mysaltern@gmail.com', '$2y$12$BxTHgfeFppYnXJiYXKvOIeUIVesnVZwHXM36nWLPWumTFLPyWmN62', 'MXS-R14AsC2UXOosgomLP0PrhytTSSXa', 123123, NULL, NULL, '::1', 1507539731, 1511333258, 0, 1551943489, 10);
INSERT INTO `user` VALUES (2, 'mysaltern', 'miladjan63@gmail.com', '$2y$12$Aznen66ET2GjcDCAKqwlJ.UtAUaIN1pmBDBXiSqG1hIDDZcSZgVHG', 'laPg7icIcWPKDMVwEFEJdgwBh5F23yR0', 123123, NULL, NULL, '109.162.208.39', 1508921603, 1508921603, 0, 1508921806, 0);
INSERT INTO `user` VALUES (3, 'test2', 'test2@gmail.com', '$2y$10$3OyI5mFi5Jd2UK/ZbcYu9OYCFWkj4Q3Wn9isJF3S8XXsY/vjjEeGW', 'x1CCPfYE5MCUVEbE10lAGOUVP07xImRV', 1, NULL, NULL, '213.207.208.172', 1509778036, 1509778036, 0, 1509778090, 0);
INSERT INTO `user` VALUES (4, 'testing1', 'testing1@gmail.com', '$2y$10$522FgsfooFZdFHC7jJf/2ef0L1D.P88IAsJIWca0B3u9VTIQ44XLW', 'BltQvf4yc0BK1SH-NBb5WXe4Eo7FtAIU', 1, NULL, NULL, '213.207.208.172', 1510724065, 1510724065, 0, 1510724869, 0);
INSERT INTO `user` VALUES (5, 'ttest2', 'ttest2@gmail.com', '$2y$10$NLXq2o/UY76SyhOIaQ351uds2NUpZ0BUyy5GZSBVXVPOgJYZtVGYa', 'bicaXFp8UvcpfVmENVHtSwINXPCcDiBT', 1, NULL, NULL, '213.207.208.172', 1513422525, 1513422525, 0, 1523269050, 0);
INSERT INTO `user` VALUES (46, 'werwerwerew', 'asda@asd.com', '$2y$12$awfkdEb33n8VtqBkXtI5pOR/WKCzomB2u6LMfpJ1aNFUg8FJK86fO', 'OKDbPHyeoo3ffzHqAmqI5BGWvGQMW6j9', NULL, NULL, NULL, '109.162.132.223', 1530967950, 1530967950, 0, NULL, 0);
INSERT INTO `user` VALUES (47, 'miladjan63', 'miladjan63@yahoo.com', '$2y$12$ZojaPq/t6VDMi7ONnTR8u.I9qO7/ElOiQlRqMAnnPMzMYUGbX.FWS', '_1i7oAbR4dwoaTNk2luE2jM_33yvmco6', 1531032435, NULL, NULL, '5.116.22.99', 1531032191, 1531032191, 0, 1534767625, 0);
INSERT INTO `user` VALUES (48, 'hr_khoresh', 'hamidrezakhoresh@gmail.com', '$2y$12$VdY31gQIfBiU5mBTEB/LDOb2Q3ULX0n68cDt0T5v016QJFCWgKbAC', 'KJGNI7DyYQE-MBgiDGtojO5rZMSAVqwX', NULL, NULL, NULL, '109.162.201.21', 1531892259, 1531892259, 0, NULL, 0);
INSERT INTO `user` VALUES (49, 'hr_khoreshi', 'hr_khoresh@yahoo.com', '$2y$12$23Y7Qf0h1WgTSmz6qIUNEOLzqNJ9pSutFFxiJpVY2BJco3WUtznBa', 'd8Z87vieMy1eWPdtn4j88oP-1OF9FQ2Q', 1531892616, NULL, NULL, '109.162.201.21', 1531892563, 1532327496, 0, 1532335403, 0);
INSERT INTO `user` VALUES (50, 'smith', 'mrsmith_geladiator@yahoo.com', '$2y$12$dCSsW3uBK4MzvaGBzf3Y9ep5Jfu6iFRSWbwACOBTXk2zHAnHI.lgu', 'jMvSaIYrfiogboLJ--DFZnviCVdDnTCW', 1532187030, NULL, NULL, '67.220.189.158', 1532186879, 1532186879, 0, 1541399024, 0);
INSERT INTO `user` VALUES (51, 'farshadfaezyrazi', 'farshadfaezy@gmail.com', '$2y$12$9ZLInYpePJ68SPyCzpER6.yULI/IMpzGdEr5X9s0OOtkiykVa4LDS', 'BOgfzeCLTtzA9vTuaZXzapQcVIwJouj7', 1532326352, NULL, NULL, '89.41.196.4', 1532326278, 1532326278, 0, NULL, 0);
INSERT INTO `user` VALUES (52, 'Farshad', 'f.faezi@sabasamaneh.ac.ir', '$2y$12$tO4kIuT81cTuOdT8hGbJ5OQAyjVzR2e0i3buQ0FSNZBxLL7bYfVZG', '-ntOw89Ss28vSJlfet1JoZsksRUXD3qY', NULL, NULL, NULL, '109.162.146.97', 1533634185, 1533634185, 0, 1533634357, 0);
INSERT INTO `user` VALUES (53, 'hamed.katoly', 'hamed.katoly@gmail.com', '$2y$12$mz60N8mY798MYYaV0yjmcuJSb/7CYq.yn2Us7dT4.OdBvjsn/.PjC', 'joHy4Jeqa-Sb4JPYWGPZsnDhC3tgmkmD', NULL, NULL, NULL, '185.239.173.72', 1538287457, 1538287457, 0, 1538287502, 0);
INSERT INTO `user` VALUES (54, 'Mom774', 'M.a.fakhrian@live.com', '$2y$12$8ucU7hVoN6FH0hFKbY05SeWKY8FtWXpa4OkWGY4vYzrpVkDMh5JLm', 'XENdO2uBnrX0o6xSg1zH62So5w4ylR2j', NULL, NULL, NULL, '5.113.208.127', 1539313689, 1539313689, 0, 1539313733, 0);

-- ----------------------------
-- Table structure for user_confirmatory
-- ----------------------------
DROP TABLE IF EXISTS `user_confirmatory`;
CREATE TABLE `user_confirmatory`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nationalCard_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthCertificate_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  CONSTRAINT `user_confirmatory_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_confirmatory
-- ----------------------------
INSERT INTO `user_confirmatory` VALUES (1, 'uploads/1/documents/_w-QvqPkkChyRpVFkE5MgpawIfeg_GrsIMG_2731.JPG', '', 1, 1);
INSERT INTO `user_confirmatory` VALUES (2, 'uploads/1/documents/yS92TU4uBIzyhvlK0EGcvPsyxjfeQ4Wf449.jpg', '', 1, 1);
INSERT INTO `user_confirmatory` VALUES (3, 'uploads/1/documents/52pszvXkSE1CWoQbHpSKR48GBxxS0DKeuser2-160x160.jpg', '', 1, NULL);
INSERT INTO `user_confirmatory` VALUES (4, 'uploads/1/documents/nTj_R8ujhzYr3Mm6C29F2sTl_3TDxMWsuser2-160x160.jpg', '', 1, NULL);
INSERT INTO `user_confirmatory` VALUES (5, 'uploads/users/1/documents/k9LBnGtM95UEs-umypjPdMF7XqMiSCZSuser2-160x160.jpg', '', 1, 1);
INSERT INTO `user_confirmatory` VALUES (6, '', '', 1, NULL);
INSERT INTO `user_confirmatory` VALUES (7, 'uploads/1/documents/pL9CqT8jdVI5lUN3Fg210IExIj0e9T3nuser2-160x160.jpg', '', 1, NULL);
INSERT INTO `user_confirmatory` VALUES (8, 'uploads/1/documents/yY-Z5b6MALR_mj4ufgb-KYTbnYid0QVt19013.png', '', 1, NULL);
INSERT INTO `user_confirmatory` VALUES (9, '', '', 1, NULL);
INSERT INTO `user_confirmatory` VALUES (10, 'uploads/1/documents/w8gMzUe0Rzps_Cxcq580EOiy1kzoLwUz19013.png', '', 1, NULL);
INSERT INTO `user_confirmatory` VALUES (11, '', '', 1, NULL);
INSERT INTO `user_confirmatory` VALUES (12, 'uploads/47/documents/S8HarqICTN9WysKPQ6sdrsGekfyAYyln19013.png', '', 47, NULL);
INSERT INTO `user_confirmatory` VALUES (13, 'uploads/49/documents/ouL1cuGnlFHeJSI6WDJFRp2dWo0L7Y_l2073592.jpg', '', 49, 1);
INSERT INTO `user_confirmatory` VALUES (14, 'uploads/1/documents/QANX-Qp76Kbc0P-xoAQt-UlSHxSG9mTduser2-160x160.jpg', '', 1, 1);
INSERT INTO `user_confirmatory` VALUES (15, 'uploads/users/1/documents/z1AzaNkAqArkoUYp1HL5nHAoj-sosnLepage-1-psd-97-1.png', NULL, 1, NULL);
INSERT INTO `user_confirmatory` VALUES (16, 'uploads/1/documents/-6ZvRLub3yKbaCytzNuhkDnunpwsrCbOuser2-160x160.jpg', '', 1, 1);
INSERT INTO `user_confirmatory` VALUES (17, 'uploads/1/documents/D2S7OHOS4y9L4OQa0K3d3qignkwm7m-suser2-160x160.jpg', '', 1, 1);
INSERT INTO `user_confirmatory` VALUES (18, 'uploads/users/50/documents/Mf5IXjwJ44d0KiqnYhN7S0F499HkrhkElogo.png', '', 50, NULL);
INSERT INTO `user_confirmatory` VALUES (19, 'uploads/users/50/documents/5q5Nc5gXh0-z6QHD-6S3lYnVzpvspvX4logo.png', '', 50, NULL);
INSERT INTO `user_confirmatory` VALUES (20, 'uploads/users/50/documents/teTM4mHCJbI0pM_sZs79lWQoeBytsSvWe1916c8904d572a8e738b106c5edb46f.jpg', '', 50, NULL);
INSERT INTO `user_confirmatory` VALUES (21, 'uploads/50/documents/eGMhKETiJBL7Ko_HTJ0aq6eU6jSnjR8Ce1916c8904d572a8e738b106c5edb46f.jpg', '', 50, 1);

-- ----------------------------
-- Table structure for wage_amount
-- ----------------------------
DROP TABLE IF EXISTS `wage_amount`;
CREATE TABLE `wage_amount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromAmount` int(11) DEFAULT NULL,
  `toAmount` int(11) DEFAULT NULL,
  `staticAmount` int(11) DEFAULT NULL,
  `percent` smallint(6) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wage_amount
-- ----------------------------
INSERT INTO `wage_amount` VALUES (1, 0, 1000000, 20000, 5, 1);

-- ----------------------------
-- Table structure for website_category
-- ----------------------------
DROP TABLE IF EXISTS `website_category`;
CREATE TABLE `website_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of website_category
-- ----------------------------
INSERT INTO `website_category` VALUES (1, NULL, 'آموزش زبان');
INSERT INTO `website_category` VALUES (2, NULL, 'فروشگاه تحت وب');

SET FOREIGN_KEY_CHECKS = 1;
