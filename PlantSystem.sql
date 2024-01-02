/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : PlantSystem

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 02/01/2024 19:49:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `collectionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shareid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`collectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of collection
-- ----------------------------
BEGIN;
INSERT INTO `collection` (`collectionid`, `shareid`, `userId`) VALUES ('154c4dbb-cbee-4924-bbfa-c331bbfb2eea', '05943ac2-d224-4f85-8e0c-96b481a1c986', '3162c4e2-4e6c-4e4f-a46d-284fe4f0f932');
INSERT INTO `collection` (`collectionid`, `shareid`, `userId`) VALUES ('1bfca2c8-6130-4fca-aff5-f72befb05d57', 'b60c398b-3a0c-4959-b50a-9261303b13e5', '8f6f66a1-3f21-4f0f-aa70-06c9d2209157');
INSERT INTO `collection` (`collectionid`, `shareid`, `userId`) VALUES ('2f11b9f1-58cb-40aa-8b59-631aca830559', 'a1f628c1-1744-431b-924b-043d215a7963', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d');
INSERT INTO `collection` (`collectionid`, `shareid`, `userId`) VALUES ('61b770f5-bb39-404c-b0b0-b4beb31e8bd1', '27a5b09d-f8c7-45b1-a77b-a729158e5e67', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d');
INSERT INTO `collection` (`collectionid`, `shareid`, `userId`) VALUES ('86c4934c-6d20-4aa3-b86e-7906ef70e31e', 'b60c398b-3a0c-4959-b50a-9261303b13e5', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d');
INSERT INTO `collection` (`collectionid`, `shareid`, `userId`) VALUES ('94bd0855-d94f-4d3f-a781-450a040c38fa', 'b60c398b-3a0c-4959-b50a-9261303b13e5', '2c263376-fabf-4b75-a350-359423790612');
INSERT INTO `collection` (`collectionid`, `shareid`, `userId`) VALUES ('b255b21b-bf00-4b2d-a146-55b380cd0a0a', '27a5b09d-f8c7-45b1-a77b-a729158e5e67', '3162c4e2-4e6c-4e4f-a46d-284fe4f0f932');
INSERT INTO `collection` (`collectionid`, `shareid`, `userId`) VALUES ('b3587e9a-48e1-4f98-ab39-62708463e19e', '27a5b09d-f8c7-45b1-a77b-a729158e5e67', '2c263376-fabf-4b75-a350-359423790612');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pageId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('0fb0fd6a-e158-4c96-b599-c88047e73136', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '1f4fd477-9c33-4d43-98da-75873ef40e86', 'Its a good share!', '2023-12-20 17:12:11');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('162abfaf-4e37-4fb8-ac2d-820c83de5783', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '27a5b09d-f8c7-45b1-a77b-a729158e5e67', 'test', '2023-12-26 21:06:58');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('16fa805f-03dc-4bcf-8e82-5a3f86fbf2ed', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d', 'b60c398b-3a0c-4959-b50a-9261303b13e5', 'cool', '2023-11-27 16:47:13');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('218980d2-56ad-42be-9950-9bd5c24ee038', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '1f4fd477-9c33-4d43-98da-75873ef40e86', 'test1', '2023-12-20 16:34:25');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('45f08d73-e75b-4855-a226-39ab6664e672', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '1f4fd477-9c33-4d43-98da-75873ef40e86', 'thank you!', '2023-12-20 17:08:10');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('6139b0f0-66c2-468c-9c8c-711bf3d9ecce', '8f6f66a1-3f21-4f0f-aa70-06c9d2209157', 'b60c398b-3a0c-4959-b50a-9261303b13e5', 'dafj', '2024-01-01 22:18:10');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('89f607a3-2b1d-4f92-bc7d-35b92b94873a', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d', '27a5b09d-f8c7-45b1-a77b-a729158e5e67', 'c00l！', '2023-11-24 23:22:01');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('aa50fc4a-c0d6-4681-bf14-67abcb15b0a6', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '1f4fd477-9c33-4d43-98da-75873ef40e86', 'Its a nice share! thank you !', '2023-12-20 17:06:32');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('bdf14937-8ac3-411b-bb37-b07e7d36693e', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '1f4fd477-9c33-4d43-98da-75873ef40e86', 'test', '2023-12-20 16:35:33');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('bf5ec101-ebd0-4153-9c57-56cc41a2519f', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '27a5b09d-f8c7-45b1-a77b-a729158e5e67', '1', '2023-12-26 21:07:20');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('c0ec56d0-13b8-42b0-a709-393103cc7c17', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '1f4fd477-9c33-4d43-98da-75873ef40e86', 'Its a useful share!!!', '2023-12-04 20:29:36');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('c2a95671-bddf-4c20-8a16-289745d01531', '2c263376-fabf-4b75-a350-359423790612', '27a5b09d-f8c7-45b1-a77b-a729158e5e67', 'dfa', '2024-01-01 21:00:14');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('c6250594-a9cb-431d-a881-c05d95eee9d4', '8fe4bbbe-ac18-49e3-acc2-3ea4b8032904', 'b60c398b-3a0c-4959-b50a-9261303b13e5', 'fdasjklg', '2024-01-01 22:30:28');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('cb2b17e7-5249-43df-be80-b79c3cb27992', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '1f4fd477-9c33-4d43-98da-75873ef40e86', 'cool!', '2023-12-20 16:13:51');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('da9f4878-a620-48c8-9e1e-283a0c86f22b', '72e9daf4-12d0-44d1-ad1a-ec2680032dbb', '90b8ab31-4421-4964-91e0-6c576146e249', 'dsa', '2023-12-17 00:12:06');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('f2f4b34d-103b-46c2-97a2-d3404c0e6a68', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '1f4fd477-9c33-4d43-98da-75873ef40e86', 'It looks so cute!!!!', '2023-12-20 17:04:34');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('f5df141b-c115-4545-a8b9-c6c2f066d130', '2c263376-fabf-4b75-a350-359423790612', '27a5b09d-f8c7-45b1-a77b-a729158e5e67', 'dsawosd', '2024-01-01 20:09:42');
INSERT INTO `comment` (`id`, `userId`, `pageId`, `content`, `createtime`) VALUES ('f8637e4f-d9bf-409d-844a-9428c22f394c', 'cb18b07a-2220-4a9b-be2d-0e6fbc528df6', 'f4ea58dc-dd66-4c5f-95af-1704b71319e6', 'nice', '2023-12-16 22:03:42');
COMMIT;

-- ----------------------------
-- Table structure for concern
-- ----------------------------
DROP TABLE IF EXISTS `concern`;
CREATE TABLE `concern` (
  `concernid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `concernuserId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `concernusername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `concernuseravatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`concernid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of concern
-- ----------------------------
BEGIN;
INSERT INTO `concern` (`concernid`, `userId`, `concernuserId`, `concernusername`, `concernuseravatar`) VALUES ('1b84c31f-03bb-4151-9237-d0f883b15144', '2c263376-fabf-4b75-a350-359423790612', '96972ee5-9142-4126-865b-ca33c4802ccd', '1', 'http://localhost:3000/uploads/cb141052fb3b5cb7d78a25733b49afd6');
INSERT INTO `concern` (`concernid`, `userId`, `concernuserId`, `concernusername`, `concernuseravatar`) VALUES ('38aed0f2-4955-46cc-81be-e949a4894ae7', '2c263376-fabf-4b75-a350-359423790612', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d', 'fly', 'http://localhost:3000/uploads/81f9a0e9aa487e7ed87c70f6ff817d35');
INSERT INTO `concern` (`concernid`, `userId`, `concernuserId`, `concernusername`, `concernuseravatar`) VALUES ('e01dbeb0-05ea-4828-8869-667f091053f2', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '96972ee5-9142-4126-865b-ca33c4802ccd', '1', 'http://localhost:3000/uploads/cb141052fb3b5cb7d78a25733b49afd6');
COMMIT;

-- ----------------------------
-- Table structure for garden
-- ----------------------------
DROP TABLE IF EXISTS `garden`;
CREATE TABLE `garden` (
  `gardenid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gardenname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gardenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of garden
-- ----------------------------
BEGIN;
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('3ce8a167-1906-45d4-9c43-fb87abccd754', 'cool!', '3162c4e2-4e6c-4e4f-a46d-284fe4f0f932', '2023-12-26 22:21:01');
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('402f57a8-4471-4249-92c4-8cdb70d9cb62', 'test1', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d', '2023-12-26 22:21:01');
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('7c42474d-2416-4252-899b-4dad749c968c', 'f', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '2023-12-26 22:23:52');
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('883a6c35-83b7-49f5-8deb-f65b7414b5b7', 'test', '2c263376-fabf-4b75-a350-359423790612', '2024-01-01 20:10:38');
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('92d51a7f-55ab-4e60-9d1c-e2d98a779c59', 'a', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '2023-12-26 22:23:47');
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('bbbc8d1a-fd24-4ed0-9ae5-6ab65b652e35', 'test1', '2c263376-fabf-4b75-a350-359423790612', '2024-01-01 20:39:19');
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('d2c6764e-3122-42b6-b9ef-5a7bf1603b89', 'dsadas', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '2023-12-26 22:24:21');
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('f0172ed3-123c-4121-a33a-b7ffbe69ba05', 'post', '2c263376-fabf-4b75-a350-359423790612', '2024-01-01 21:01:06');
INSERT INTO `garden` (`gardenid`, `gardenname`, `userId`, `createtime`) VALUES ('fa16dea1-b1c6-4ceb-8b6e-8eb574c69850', 'test', '8f6f66a1-3f21-4f0f-aa70-06c9d2209157', '2024-01-01 22:18:32');
COMMIT;

-- ----------------------------
-- Table structure for gardencard
-- ----------------------------
DROP TABLE IF EXISTS `gardencard`;
CREATE TABLE `gardencard` (
  `gardencardid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plantid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `gardenid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`gardencardid`),
  UNIQUE KEY `unique_position_garden` (`position`,`gardenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of gardencard
-- ----------------------------
BEGIN;
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('0ee893df-8876-4d6b-a773-ea45cb600d96', '2', '8', '3ce8a167-1906-45d4-9c43-fb87abccd754');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('23765cf2-e30d-4807-8c75-78af1279e96c', '1', '0', 'f0172ed3-123c-4121-a33a-b7ffbe69ba05');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('2b617d31-e7c2-4216-9749-a38a333f7818', '4', '4', 'dc67fbc3-5c7c-49c5-8ecc-41c2d54c53a8');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('2b9550de-bca5-47f2-a4d9-f13bb9f54ea6', '1', '0', 'f9fc8f8c-92ad-4dfb-86f9-c83379bdb00f');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('2f014503-7241-4bf0-9a9c-76e9102dd5d1', '3', '4', '33d4a92e-7c17-40a9-b9b4-4faa91580f5f');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('325f4f8c-5fed-4aa5-b41a-e0caf0a3c2a8', '2', '4', 'fa16dea1-b1c6-4ceb-8b6e-8eb574c69850');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('3573884a-d409-4cd6-8fbc-8af7618d870c', '3', '0', '3ce8a167-1906-45d4-9c43-fb87abccd754');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('37641a44-729e-4796-acb7-2a0f8578ebaa', '1', '0', 'fa16dea1-b1c6-4ceb-8b6e-8eb574c69850');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('3c4cdd56-fbd6-4712-87d2-c6954d0cf49b', '2', '0', 'bbbc8d1a-fd24-4ed0-9ae5-6ab65b652e35');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('41ac0a8c-5cf4-4811-be33-4aa60af88c9f', '1', '0', 'd629a97b-582f-4522-80d2-029436d8a5e8');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('440fa274-e89d-4863-8c8d-bacb0bad9cde', '1', '1', 'a8b52449-8402-40dd-ac32-5beadf9c5317');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('4f9c5bd2-dae0-48a2-97fa-1db4437abbb4', '1', '4', 'bbbc8d1a-fd24-4ed0-9ae5-6ab65b652e35');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('63c6c816-b74b-4be8-860f-e185f048ba1d', '4', '4', '402f57a8-4471-4249-92c4-8cdb70d9cb62');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('64c4bad0-63f3-4480-acff-b08b171a69e6', '4', '1', '3ce8a167-1906-45d4-9c43-fb87abccd754');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('733cf36a-e56a-4745-8669-1cbd88a8abf0', '2', '0', '883a6c35-83b7-49f5-8deb-f65b7414b5b7');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('79d822f7-8187-4757-9463-6b90fd9200d6', '1', '0', 'a8b52449-8402-40dd-ac32-5beadf9c5317');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('7a267be2-1d7b-4fb0-acfa-8cc26203e2cc', '2', '1', '83adfe91-2a16-4d89-bb95-4c446c500690');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('7b707ec5-e0a7-4e6a-a692-fbf0b9e2e097', '2', '0', 'dc67fbc3-5c7c-49c5-8ecc-41c2d54c53a8');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('7f41f316-f707-4f40-b6fb-c417076c1537', '2', '1', 'd629a97b-582f-4522-80d2-029436d8a5e8');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('8fb1d73a-2bed-4605-a542-54225a7749db', '2', '4', '883a6c35-83b7-49f5-8deb-f65b7414b5b7');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('9f9786ce-54bd-4a67-98f4-a10f77b1bce2', '4', '4', 'f0172ed3-123c-4121-a33a-b7ffbe69ba05');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('a9d48209-0813-409a-ae52-e620200c7de9', NULL, '3', 'd629a97b-582f-4522-80d2-029436d8a5e8');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('b1c12a29-75cf-4dec-8b83-05b5cd3537d2', '2', '2', 'd629a97b-582f-4522-80d2-029436d8a5e8');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('cd063c78-e0af-4e3e-b981-f0008ea2e1e6', '1', '1', 'f9fc8f8c-92ad-4dfb-86f9-c83379bdb00f');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('d4431e23-ec27-4a39-9aee-431e8390969d', NULL, '8', 'a8b52449-8402-40dd-ac32-5beadf9c5317');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('f023e711-469a-4c2a-a29e-cecdedb9b176', '3', '0', '402f57a8-4471-4249-92c4-8cdb70d9cb62');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('f8f9808e-7b4a-4983-b23c-1562d943adbd', '2', '3', '33d4a92e-7c17-40a9-b9b4-4faa91580f5f');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('f9d055f5-4864-49a0-a808-41f1985b0026', '1', '7', 'd629a97b-582f-4522-80d2-029436d8a5e8');
INSERT INTO `gardencard` (`gardencardid`, `plantid`, `position`, `gardenid`) VALUES ('ff7ac918-f0b1-4eb2-b205-7f7a1842661c', '1', '0', '33d4a92e-7c17-40a9-b9b4-4faa91580f5f');
COMMIT;

-- ----------------------------
-- Table structure for pest
-- ----------------------------
DROP TABLE IF EXISTS `pest`;
CREATE TABLE `pest` (
  `pestid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pestname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pestcontrol` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `prevention` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pestpicture` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`pestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pest
-- ----------------------------
BEGIN;
INSERT INTO `pest` (`pestid`, `pestname`, `description`, `pestcontrol`, `prevention`, `pestpicture`) VALUES ('1', 'Mealybugs', 'Mealybugs are small, pale insects related to scales. They are about ⅛ to ¼ inch long and move very sluggishly. The adult females cover themselves and their eggs with a white, waxy material, making them look cottony. Some have waxy filaments that extend beyond their bodies.', 'Light infestations can be controlled by removing individual mealybugs by hand or by wiping each insect with a cotton swab dipped in rubbing alcohol. An insecticidal soap spray may also be used. With a heavy infestation, it may be necessary to discard the plant. For houseplants that are outdoors, spray with neem oil extract, pyrethrins, acetamiprid, imidacloprid, cyfluthrin, deltamethrin, or lambda cyhalothrin to control mealybugs. Imidacloprid granules put onto the soil will also control mealybugs. ', 'Light infestations can be controlled by removing individual mealybugs by hand or by wiping each insect with a cotton swab dipped in rubbing alcohol. An insecticidal soap spray may also be used. With a heavy infestation, it may be necessary to discard the plant. For houseplants that are outdoors, spray with neem oil extract, pyrethrins, acetamiprid, imidacloprid, cyfluthrin, deltamethrin, or lambda cyhalothrin to control mealybugs. Imidacloprid granules put onto the soil will also control mealybugs. ', 'https://extension.umd.edu/sites/extension.umd.edu/files/styles/optimized/public/2021-03/HGIC_IndoorPlants_Mealybugs_5573436_1600.jpg?itok=mOMrGa-o');
INSERT INTO `pest` (`pestid`, `pestname`, `description`, `pestcontrol`, `prevention`, `pestpicture`) VALUES ('2', 'Aphids', 'Aphids are small, soft-bodied, pear-shaped insects about 1/16– to ⅛-inch long. They are usually green but may be pink, brown, black, or yellow. Some aphids have a woolly or powdery appearance because of a waxy coat. Adults may or may not have wings.\n\nAphids are usually found feeding on new growth or the undersides of leaves. Some feed on roots. They suck plant sap, resulting in yellowing and misshapen leaves. In addition, growth may be stunted, and new buds deformed. As aphids feed, they excrete a sugary material, called honeydew, which makes leaves shiny and sticky. Sooty mold fungi may grow on the honeydew, producing unsightly dark splotches on the plant’s surfaces.', 'With minor infestations, handpicking, spraying with water, or wiping the insects with a cotton swab dipped in rubbing alcohol may be practical. Insecticidal soap spray may also be used. In most cases, the treatment will have to be repeated multiple times. For houseplants that are taken outdoors, spray with insecticidal soap, neem oil extract, pyrethrins, imidacloprid, cyfluthrin, deltamethrin, or lambda cyhalothrin to control aphids.', 'For fruit or shade trees, spray dormant horticultural oil to kill overwintering aphid eggs. Beneficial insects, such as ladybugs, lacewings, and parasitic wasps, will feed on aphids. Attract these insect to your garden by providing an environment that features a range of flowers and foliage plants, as well as access to water. Supplemental populations of these insects can be ordered online and should help keep the aphid populations controlled from the start. Companion planting can help to keep aphids away from your plants in the first place, or to draw them away from the plants your really want to grow. For example: Aphids are repelled by catnip. Aphids are especially attracted to mustard and nasturtium. Plant these near more valuable plants as traps for the aphids. The aphids will likely go for these plants before your prized tomatoes. (Check your trap plants regularly to keep aphid populations from jumping to your valued plants.) Nasturtiums spoil the taste of fruit tree sap for aphids and will help keep aphids off of broccoli. Garlic and chives repel aphids when planted near lettuce, peas, and rose bushes.', 'https://www.saferbrand.com/media/wysiwyg/sb/cms/learning-center/sb-lc-insect-header-aphids.jpg');
INSERT INTO `pest` (`pestid`, `pestname`, `description`, `pestcontrol`, `prevention`, `pestpicture`) VALUES ('3', 'Root Ball Pests', 'Houseplants taken outdoors during the summer may have their root balls infested with pillbugs, millipedes, and slugs. These houseplant pests may cause minor feeding damage to root systems. They are generally found along the exterior of the root ball in small cavities carved from the potting mix. Ants may also make nests within the potting soil of houseplants while outside.', 'The plant container can be gently removed to inspect for pillbugs, millipedes, and slugs, which simply can be scraped away. Ant colonies in the container may be killed by soil drenches of products containing cyfluthrin or lambda cyhalothrin. Mix insecticide concentrates at the same rate as for spraying, and pour the solution through the soil in the container. Allow pots to thoroughly drain and dry before bringing indoors. ', 'Keep growing areas clean. Promptly remove crop debris and weeds and dispose of them in covered containers. Do not allow water (e.g., irrigation runoff) from areas infested with ground mealybugs to drain to areas believed free of these pests because mealybug crawlers are easily spread with moving water.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6_qvyMMZ3FqWWV-Neuuz_eoO_wCPmFUriKdU46nnMtw&s');
INSERT INTO `pest` (`pestid`, `pestname`, `description`, `pestcontrol`, `prevention`, `pestpicture`) VALUES ('4', 'Thrips', 'Thrips are tiny, slender, yellowish to blackish insects with fringed wings. They are typically found on leaves and between flower petals. At less than 1/16 inch in length, the adults are very difficult to see without a magnifying lens. Blowing lightly into blooms and leaves causes thrips to move around quickly, making them easier to see.\n\nBoth adults and nymphs (immature stage) feed by scraping surface cells to suck plant sap. Leaves fed on by thrips will often take on a silvery or speckled appearance similar to damage caused by mites. Leaves may drop early. When thrips feed on flower buds, the flower may die without opening. Flowers may be streaked or distorted because of feeding.', 'Rinse leaves with water. Spray plants with insecticidal soap. For houseplants that are outdoors, spray foliage with spinosad, acetamiprid, imidacloprid, cyfluthrin, deltamethin, or lambda cyhalothrin to control thrips. For plants with flower buds infested with thrips, the insecticide must have systemic activity, such as spinosad, acetamiprid, or imidacloprid, in order to control the hidden thrips.', 'Thrips can be challenging to spot, so the problem can quickly get out of hand. Wipe the plant’s foliage with a damp cloth impregnated with insecticidal soap to combat thrips. Or spray neem oil over the foliage, which kills the bugs. Check the plant regularly for signs of recurrence. ', 'https://s3g2u3k4.rocketcdn.me/wp-content/uploads/sites/4/2022/01/thrips.jpg');
COMMIT;

-- ----------------------------
-- Table structure for pest_supplier
-- ----------------------------
DROP TABLE IF EXISTS `pest_supplier`;
CREATE TABLE `pest_supplier` (
  `pestid` varchar(255) NOT NULL,
  `supplierid` varchar(255) NOT NULL,
  PRIMARY KEY (`pestid`,`supplierid`),
  KEY `supplierid` (`supplierid`),
  CONSTRAINT `pest_supplier_ibfk_1` FOREIGN KEY (`pestid`) REFERENCES `pest` (`pestid`) ON DELETE CASCADE,
  CONSTRAINT `pest_supplier_ibfk_2` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`supplierid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pest_supplier
-- ----------------------------
BEGIN;
INSERT INTO `pest_supplier` (`pestid`, `supplierid`) VALUES ('2', '2');
INSERT INTO `pest_supplier` (`pestid`, `supplierid`) VALUES ('3', '2');
INSERT INTO `pest_supplier` (`pestid`, `supplierid`) VALUES ('4', '2');
INSERT INTO `pest_supplier` (`pestid`, `supplierid`) VALUES ('1', '3');
COMMIT;

-- ----------------------------
-- Table structure for plant
-- ----------------------------
DROP TABLE IF EXISTS `plant`;
CREATE TABLE `plant` (
  `plantid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plantname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `planthelp` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `plantpicture` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userplantpicture` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `entertime` int DEFAULT '0',
  `plantneed` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `wheretoplant` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `howtoplant` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `timetoplant` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of plant
-- ----------------------------
BEGIN;
INSERT INTO `plant` (`plantid`, `plantname`, `description`, `planthelp`, `plantpicture`, `userplantpicture`, `entertime`, `plantneed`, `wheretoplant`, `howtoplant`, `timetoplant`) VALUES ('1', 'sunflower', 'The sunflower (scientific name: Helianthus annuus) is a striking plant whose features include a tall stature, usually up to 1.5 to 3 meters, with an erect main stem and ovate leaves with serrated edges. Its flowers are extremely striking, bright yellow, often with a brown disk in the center, and can be up to 10 centimeters or more in diameter. The seeds of the sunflower grow in the disk and are usually brown or black in color; these seeds are rich in oil and are commonly used in the manufacture of cooking oil. Sunflowers are also known for being adaptable and sun-loving, growing in different types of soil, and are a common ornamental plant found in gardens and yards. Sunflowers are a popular plant for both food and aesthetic uses.', 'https://www.rhs.org.uk/education-learning/gardening-children-schools/family-activities/grow-it/grow/sunflower', 'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3VuZmxvd2Vyc3xlbnwwfHwwfHx8MA%3D%3D', 'https://t3.ftcdn.net/jpg/00/58/32/80/360_F_58328045_3e7YZJT02aV3Ofn0gAjuOnzV27jn5y5z.jpg', 15, 'Sunflower seeds, Rake, Trowel, Pots, Compost and Clear plastic bags or propagator.', 'Sunflowers have two essential needs – fertile soil and lots of sun. Once you’ve ticked those boxes, you can let your imagination run wild when planting sunflowers.', 'You can sow sunflower seeds in pots indoors in April and then transplant them outside in May after the frosty season has passed, which will help you produce beautiful summer sunflowers. First, fill small pots with multi-purpose compost and sow one seed per pot to a depth of about 1.5cm. Then, water the pots well, cover them with a clear plastic bag and place them in a bright, but not direct sunlight, such as a windowsill. When the seeds have germinated, remove the plastic bag and make sure the compost stays moist. Before transplanting the plants outdoors, perform a two-week plant hardening-off, placing them outdoors during the day and back indoors at night. Before planting outdoors, remove weeds from the ground and add enough compost or well-rotted farmyard manure. Keep spacing between plants at 45 centimeters. Alternatively, if you prefer to sow your seeds outdoors, you can perform the following steps at the end of May: remove any weeds from the ground and dig in plenty of compost or well-rotted farmyard manure. Then, harrow the ground to create a fine, friable horizontal surface, sow to a depth of about 1.5 cm, keeping the spacing at 10 cm, and water well. When the seedlings have germinated, interplant them to a spacing of about 45 cm. These steps will help you succeed in producing healthy sunflower plants.', 'Planted in April and May of each year');
INSERT INTO `plant` (`plantid`, `plantname`, `description`, `planthelp`, `plantpicture`, `userplantpicture`, `entertime`, `plantneed`, `wheretoplant`, `howtoplant`, `timetoplant`) VALUES ('2', 'banana', 'The banana is a perennial herb that often ranges in height from 2 to 8 meters. It has long, large leaves and spectacular inflorescences, and the flowers can be white, pink or pale yellow. The banana fruit is usually elongated, with yellow, green or red skin varieties, and is widely consumed because of its soft, sweet flesh, which is rich in carbohydrates, vitamin C, potassium and dietary fiber. Bananas can be eaten raw or used in cooking and are a popular global fruit.', 'https://www.brisbane.qld.gov.au/clean-and-green/green-home-and-community/clean-and-green-blog/four-ways-banana-peels-can-help-your-plants', 'https://media.istockphoto.com/id/173242750/photo/banana-bunch.jpg?s=612x612&w=0&k=20&c=MAc8AXVz5KxwWeEmh75WwH6j_HouRczBFAhulLAtRUU=', 'https://media.istockphoto.com/id/120492078/photo/banana.jpg?s=612x612&w=0&k=20&c=Xlkb122txfxnF8s7rZGxCZnSX4Qe4ZabXrPCFOG-lIc=', 4, 'A plant, cutting, or seeds, A sheltered, sunny space, Mulch, Spade', 'Banana plants are a bold addition to the garden and can make a striking centerpiece for borders. In UK gardens, some types of banana plant can grow to 4 meters or more in height, so make sure you have plenty of room for them to grow. Banana plants are native to India, South East Asia and Northern Australia. Anything we can do to replicate the tropical environment will help the plants grow well. With this in mind, place them where they want to be: protected from wind, protected from severe frosts, have access to moist, well-drained soil, receive lots of sunlight, Many varieties are frost-tolerant but prolonged periods of sub-zero temperatures can present a challenge to even the hardiest banana plants. If growing indoors, water consistently and well, as this is often a problem for houseplants as central heating systems can make conditions a little tricky. You can get the best of both worlds by growing your plants in pots outside from mid-spring to fall, then moving the pots indoors to spend the entire winter in a greenhouse or conservatory.', 'Banana plants are perennials and can be cared for with care. New shoots will appear in mid-spring (around April). If the plant has spent the winter indoors, now is the time to move the plant and re-acclimatize it to the outdoors. If moving into garden soil, add compost mulch around the plant stems to supply moisture and help retain it. If moving plants in pots, move them to slightly larger containers as needed. Feed plants a general-purpose liquid feed every two weeks during the spring and summer. For the best chance of fruiting, use a potassium-rich fertilizer when the plants are flowering. If plants are going to bloom, they should do so in July and August. Water well in spring and summer, but do not water in winter unless the soil is very dry. For plants grown outdoors, move all dead or dying foliage in early winter, wrap or add a loop of wire mesh and fill with straw. This will provide some protection against very cold weather. Although home-grown bananas are unlikely to produce edible fruit, in order to have a chance you will need to provide a minimum temperature of 15°C (59 °F) at all times, preferably 25-30°C (77-86 °F) for about 18 months. This is the time it takes to grow edible bananas in the UK.', 'Planted from April to November each year');
INSERT INTO `plant` (`plantid`, `plantname`, `description`, `planthelp`, `plantpicture`, `userplantpicture`, `entertime`, `plantneed`, `wheretoplant`, `howtoplant`, `timetoplant`) VALUES ('3', 'Aloe Vera', 'Aloe Vera (Aloe Vera) is a succulent plant with long, thick green leaves with serrated edges. The plant is native to North Africa and the Arabian Peninsula and is known for its medicinal and health properties. Aloe Vera leaves contain a clear gel that is rich in many vitamins, minerals and antioxidants and are widely used for skin care and treatment of minor burns, cuts and other skin problems. In addition, Aloe Vera is also an indoor potted plant, popular for its easy care and aesthetic appearance.', 'https://www.lovethegarden.com/uk-en/article/aloe-vera-bitter-aloe-aloe-vera', 'https://media.istockphoto.com/id/1338025183/photo/fresh-dissected-aloe-vera-stacks-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=Jk1_xOTKfs64B_U9BjzVOIrIKVqQ1jrey1zzFflnrfs=', 'https://www.shutterstock.com/image-vector/aloe-vera-isolated-on-white-600nw-2162205227.jpg', 0, 'Aloe vera needs well-drained compost, and the plants prefer to be planted in wide rather than deep pots and given plenty of room to grow. Add gravel or pebbles to the top of the compost to produce a natural, finished look and help reduce evaporation.', 'Indoor aloe vera needs a brightly lit location, preferably facing south or west. It can be moved outside to a warm, sunny patio in the summer, but make sure you bring it back inside before the weather turns cold in early autumn.', 'Water moderately while the plant is growing (April to September), but water sparingly when dormant - once or twice a month is enough. Let the soil dry out before watering. Aloe vera is a succulent that can grow for a long time without water, but it grows best with water.', 'Planted from April to September each year');
INSERT INTO `plant` (`plantid`, `plantname`, `description`, `planthelp`, `plantpicture`, `userplantpicture`, `entertime`, `plantneed`, `wheretoplant`, `howtoplant`, `timetoplant`) VALUES ('4', 'Rose', 'Roses (Roses) are one of the most famous flowers in the world, they belong to the Rosaceae family and come in a wide range of colours and varieties, usually shrubby, and are known for their gorgeous flowers and sweet fragrance. Roses often have multi-layered flowers with petals in a variety of colours ranging from red, pink, white, yellow to orange. They are widely cultivated in horticulture for garden decoration, cut flowers and perfume making. Roses also symbolise love, beauty and affection and therefore have a special significance in culture.', 'https://www.gardenersworld.com/how-to/grow-plants/how-to-grow-roses/', 'https://images.unsplash.com/photo-1562690868-60bbe7293e94?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cm9zZSUyMGZsb3dlcnxlbnwwfHwwfHx8MA%3D%3D', 'https://t4.ftcdn.net/jpg/01/23/88/91/360_F_123889155_MrDC4wi6dj2M9NajHxCUAWIjzF3j0agD.jpg', 0, 'Bone meal or superphosphate, New rose plantm, Compost, Mulch, Granular rose fertilizer', 'Make sure the rose has some sun, ideally at least 4 hours of sunlight a day. Generally, the more sun the better. However, in the hottest areas, shade from the afternoon sun can be beneficial. Ensure the rose has enough space, so that the roots do not suffer from intense competition from neighbouring plants, including trees and hedges.', 'You are now ready to place your bare-root rose in the planting hole. Hold the rose with one hand, to ensure that it will be planted at the correct planting depth and that its roots are spread. Start to add the compost mix to the hole until it is approximately half full. The rose can now stand on its own and the soil can be firmed with a heel. Continue to fill the hole and firm as required. It is important to firm the soil around your newly planted rose to make sure that there are no air pockets present around the roots. Don’t forget at this point to make sure that your rose is labeled! It can be incredibly frustrating when you can’t remember what your beautiful new roses are called. Especially if you want to recommend them to friends.', 'Potted roses can be planted all year round. The only time we recommend that you don\'t plant is when the ground is frozen, waterlogged or in drought conditions.');
COMMIT;

-- ----------------------------
-- Table structure for plant_pest
-- ----------------------------
DROP TABLE IF EXISTS `plant_pest`;
CREATE TABLE `plant_pest` (
  `plantid` varchar(255) NOT NULL,
  `pestid` varchar(255) NOT NULL,
  PRIMARY KEY (`plantid`,`pestid`),
  KEY `pestid` (`pestid`),
  CONSTRAINT `plant_pest_ibfk_1` FOREIGN KEY (`plantid`) REFERENCES `plant` (`plantid`) ON DELETE CASCADE,
  CONSTRAINT `plant_pest_ibfk_2` FOREIGN KEY (`pestid`) REFERENCES `pest` (`pestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of plant_pest
-- ----------------------------
BEGIN;
INSERT INTO `plant_pest` (`plantid`, `pestid`) VALUES ('1', '1');
INSERT INTO `plant_pest` (`plantid`, `pestid`) VALUES ('2', '1');
INSERT INTO `plant_pest` (`plantid`, `pestid`) VALUES ('1', '2');
INSERT INTO `plant_pest` (`plantid`, `pestid`) VALUES ('1', '3');
INSERT INTO `plant_pest` (`plantid`, `pestid`) VALUES ('3', '3');
INSERT INTO `plant_pest` (`plantid`, `pestid`) VALUES ('1', '4');
INSERT INTO `plant_pest` (`plantid`, `pestid`) VALUES ('4', '4');
COMMIT;

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `shareid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sharepicture` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entertime` int DEFAULT '0',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shareid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of share
-- ----------------------------
BEGIN;
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('05943ac2-d224-4f85-8e0c-96b481a1c986', 'how to kill ant!!!', 'Effective against damage from cabbage white butterflies, caterpillars, aphids & other sap suckers. A unique product that combines and addresses two very crucial and key elements of current horticultural and environmental issues. Using a very safe but effective formula, sprayed directly on to the foliage, not only is the plant being treated against potential damage from cabbage white butterflies, caterpillars and aphids, and its growth stimulated and strengthened, but there is no detrimental impact on the environment.', 'uploads/bf53f7c2a0ee80952aa5ccc9379cbe77', '41d4e59a-fbaa-4e31-b571-3c18f2c3640a', 6, '2023-11-22 22:43:20');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('1f4fd477-9c33-4d43-98da-75873ef40e86', 'How to plant a apple ', 'Planting an apple tree is a great move. The ultimate in garden trees, apple trees are easy to grow, full of character, and not too big, ideal for the average small yard. As well as providing tasty fresh fruit in late summer and autumn, apple trees are a mass of beautiful pink-white blossom in springtime. \r\n\r\nBelow, gardening expert Hazel Sillver explains how to plant apple trees – amongst the best fruit trees your yard can have.', 'uploads/8bfb5d017f0de6ce00d5a9e5ad66a420', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d', 52, '2023-11-22 22:43:23');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('27a5b09d-f8c7-45b1-a77b-a729158e5e67', '213', 'dsadasfdsaf', 'uploads/0b752346802a5e705aa7931bd2a874fb;uploads/9fd7c938ddf08ddaf7b47a08d7de2493', '96972ee5-9142-4126-865b-ca33c4802ccd', 65, '2023-11-22 22:39:14');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('4474a3a3-f1bc-43d1-b276-a9f5b53e9674', 'Its a apple idea', 'djsklafj;lkadsfj;lkds', 'uploads/0eb5ddd30803d330fead253b8cc08bc4;uploads/c3890706a2024a63eeea48832ab760db', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d', 2, '2023-11-23 16:05:42');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('481fb27d-7398-47f8-8830-97c7c235397a', 'test2', 'dsd', 'uploads/5de0598f339fa48b03c472df4fff93f0', '96972ee5-9142-4126-865b-ca33c4802ccd', 2, '2023-11-22 19:13:49');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('5563dc18-71d2-436b-ad33-f7641d73bf62', 'ghj', 'ftyrj', 'uploads/c58ee6fbb1a2845c738f84a6c09bed8d', '74fdbd49-a0d0-477b-88e1-2d4512e1e96b', 2, '2023-12-22 13:39:26');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('90b8ab31-4421-4964-91e0-6c576146e249', '213', 'dsad', 'uploads/fc373d050569f92b01c8f7658eb34269;uploads/34ce2d74218b02cae0dd3d71e29e5bb4;uploads/b88e373185f918f5be1b09bd54e04516;uploads/47db66eec8e6cd0159ee952031562153', '72e9daf4-12d0-44d1-ad1a-ec2680032dbb', 1, '2023-12-17 00:11:51');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('a1f628c1-1744-431b-924b-043d215a7963', 'test1', 'dsafdsafiodsapfjosij213124890@!#*()(!$&*(@&$()', 'uploads/ded61960c4962b741f8e222e1a58b1f3;uploads/c9f6bc833cd2e44de197a061f4d5abae', '96972ee5-9142-4126-865b-ca33c4802ccd', 5, '2023-11-22 19:13:45');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('b60c398b-3a0c-4959-b50a-9261303b13e5', 'I love peach!!!!', 'Consumption of fruits like peaches that are rich in vitamin A, are known to offer protection from lung and oral cancers. They contain many vital minerals such as potassium, fluoride and iron. Potassium is an important component of cell and body fluids that help regulate heart rate and blood pressure.', 'uploads/278d680413119fc5c741c679cf87b094;uploads/821379e304f4a5de92a8fdf390f0b248', '3162c4e2-4e6c-4e4f-a46d-284fe4f0f932', 14, '2023-11-22 22:45:06');
INSERT INTO `share` (`shareid`, `title`, `description`, `sharepicture`, `userId`, `entertime`, `createtime`) VALUES ('f9f228ac-d84b-4fa7-b07b-c97ef976fe38', 'jkljlk', 'hgjkhl', 'uploads/1c241f44badd8f298b7565436e1af9e5', '8f9f42c4-72c6-49a5-873b-89958ec9fc5d', 3, '2023-11-27 16:47:55');
COMMIT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplierid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `suppliername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `supplierlink` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `suppliertype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` (`supplierid`, `suppliername`, `description`, `supplierlink`, `suppliertype`) VALUES ('2', 'Green Gardener', 'Eco-friendly gardening supplies from biodegradable pots to biological pest controls including nematodes for use outside and under cover. Also supplies irrigation equipment, wormeries and raised bed kits.', 'https://www.greengardener.co.uk/', 'pest');
INSERT INTO `supplier` (`supplierid`, `suppliername`, `description`, `supplierlink`, `suppliertype`) VALUES ('3', 'PestControlSupplies', 'Pest management!', 'https://www.pestcontrolsupplies.co.uk/', 'pest');
INSERT INTO `supplier` (`supplierid`, `suppliername`, `description`, `supplierlink`, `suppliertype`) VALUES ('4', 'The Alpine and Grass Nursery\n', 'A family-run nursery based in Lincolnshire, growing alpines for over 30 years and ornamental grasses for over 20 years. Plants are propagated on site and put together in collections such as alpines for troughs, alpines for pollinators and cascading alpines. Deliveries available across the UK.', 'https://www.specialistgrower.co.uk/', 'planttype');
INSERT INTO `supplier` (`supplierid`, `suppliername`, `description`, `supplierlink`, `suppliertype`) VALUES ('5', 'Marshalls Garden', 'Seed merchants Marshalls have now expanded their range massively and sell a wide range of gardening sundries as well, ranging from bird food to tools, greenhouse accessories and hanging baskets, and – occasionally – compost. Fresh stock is arriving daily. Stock levels are good, but there’s currently a three-week delay on despatch times with plants sent out in strict order of availability – see website for exact delivery dates.', 'https://marshallsgarden.com/', 'plantkit');
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `adviselink` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tagpicture` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `looks` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `likes` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` (`tagid`, `title`, `description`, `adviselink`, `tagpicture`, `looks`, `likes`) VALUES ('1', 'Alpines', 'Alpines are small and highly collectable plants, producing exquisite little flowers in a range of vibrant hues. As they come from mountainous regions, many are very hardy. They\'re easy to grow too, as long as you give them sharply draining compost. They thrive in containers, where a small collection can create a cheery display all year round.', 'https://www.homesandgardens.com/advice/how-to-plant-trees', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs6sFLTlwyuUxRqyD5MQSMJwnG3Et6Fdy7fxLzEkQ9dA&s', 'Alpines are compact plants that usually produce lots of tiny jewel-like flowers in vibrant colours. Alpines encompass a range of plants from bulbs, shrubs and herbaceous perennials. Most form cushion-like mounds, or slowly spreading carpets. A popular way to grow them is to combine several different plants together as a collection, among gravel or rocks to mimic their natural habitats on mountain slopes.', 'Most alpines like dry, sunny conditions, so are happy in containers, rock gardens, gravel gardens and raised beds. They prefer a mulch of grit or gravel on the soil surface, so their foliage doesn’t rest on damp ground. Established plants fare well in cold, exposed sites, or during short spells of drought.');
INSERT INTO `tag` (`tagid`, `title`, `description`, `adviselink`, `tagpicture`, `looks`, `likes`) VALUES ('2', 'Bulb', 'Bulbs bring spectacular colour to gardens across the seasons, but especially in spring. From cheery daffodils to elegant tulips, blowsy gladioli to demure snowdrops, there are bulbs for all styles and growing conditions. A container of miniature bulbs will brighten up even the smallest space, while some dramatic dahlias or cannas will make a big splash in even the grandest of borders.Planted when dormant, bulbs may look unassuming, but after just a few months they’ll reward you with exquisite flowers. It includes a wide range of flower shapes, colours and sizes as this is a large and diverse group.Most bulbs like a sunny spot with soil that drains well. They prefer moist soil during the growing season, but often need drier conditions when the foliage dies back and they become dormant.', 'https://www.farmergracy.co.uk/blogs/farmer-gracys-blog/flower-bulbs-a-general-guide?gclid=Cj0KCQiAyeWrBhDDARIsAGP1mWQIIReC-P4CEN48z40sdZdpZ8hgWRCWZg5J2lSvrQcFGFgCjbB3d1EaAlpqEALw_wcB', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHlziVUnYxBou52T2pjmTAZxBEpZ4WTQ-3Y9dcmHeU6A&s', 'Planted when dormant, bulbs may look unassuming, but after just a few months they’ll reward you with exquisite flowers. It includes a wide range of flower shapes, colours and sizes as this is a large and diverse group.', 'Most bulbs like a sunny spot with soil that drains well. They prefer moist soil during the growing season, but often need drier conditions when the foliage dies back and they become dormant.');
INSERT INTO `tag` (`tagid`, `title`, `description`, `adviselink`, `tagpicture`, `looks`, `likes`) VALUES ('3', 'Cacti and succulents', 'Low maintenance and drought tolerant, cacti and succulents make attractive and easy-to-grow houseplants. A few can also be grown outdoors in sunny, well-drained conditions. Readily available in great diversity, these often inexpensive plants are fascinating and highly collectable.', 'https://hicksnurseries.com/houseplants/cactus-succulents/', 'https://media.istockphoto.com/id/927885184/vector/watercolor-vector-set-of-cacti-and-succulent-plants-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=0zAURVnrwIT-SIYg4sOshqBbkNlAJptuzi99W8b3fFQ=', 'Cacti and succulents are easily recognisable by their fleshy leaves or stems, in which they store water. They come in a huge range of shapes, colours and forms, some covered in spines, others smooth or furry, some gently rounded, others angular and sculptural.', 'Cacti and succulents generally like low moisture, dry air, good drainage and high temperatures. However, some do grow well in semi-shade and humid conditions.');
INSERT INTO `tag` (`tagid`, `title`, `description`, `adviselink`, `tagpicture`, `looks`, `likes`) VALUES ('4', 'Shrubs', 'Shrubs are the backbone of any garden, offering long-term structure and beauty across the seasons. There’s a shrub to suit every situation and style, whether you want year-round interest or a big seasonal splash, a tall, dense screen or low ground cover. As well as flowers, many shrubs offer attractive foliage, colourful stems and vibrant fruits. They’re a wildlife magnet too, providing shelter and food for a range of creatures.', 'https://www.gardendesign.com/shrubs/', 'https://t3.ftcdn.net/jpg/02/58/27/92/360_F_258279297_vxAgvSlzt1VROvzZ6zLOtUtJ8IozQziC.jpg', 'Shrubs have a permanent structure of woody stems. They come in all shapes and sizes, some holding onto their leaves all year, others losing them in autumn. As well as flowers in every possible hue, many shrubs have attractive foliage, fruits and bark.', 'Choose a suitable shrub for your conditions if you want it to live a long and happy life. Annual pruning keeps shrubs healthy and vigorous.');
COMMIT;

-- ----------------------------
-- Table structure for tag_plant
-- ----------------------------
DROP TABLE IF EXISTS `tag_plant`;
CREATE TABLE `tag_plant` (
  `tagid` varchar(255) NOT NULL,
  `plantid` varchar(255) NOT NULL,
  PRIMARY KEY (`tagid`,`plantid`),
  KEY `plantid` (`plantid`),
  CONSTRAINT `tag_plant_ibfk_1` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`) ON DELETE CASCADE,
  CONSTRAINT `tag_plant_ibfk_2` FOREIGN KEY (`plantid`) REFERENCES `plant` (`plantid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tag_plant
-- ----------------------------
BEGIN;
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('1', '1');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('1', '2');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('2', '2');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('1', '3');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('2', '3');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('3', '3');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('1', '4');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('2', '4');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('3', '4');
INSERT INTO `tag_plant` (`tagid`, `plantid`) VALUES ('4', '4');
COMMIT;

-- ----------------------------
-- Table structure for tag_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tag_supplier`;
CREATE TABLE `tag_supplier` (
  `tagid` varchar(255) NOT NULL,
  `supplierid` varchar(255) NOT NULL,
  PRIMARY KEY (`tagid`,`supplierid`),
  KEY `supplierid` (`supplierid`),
  CONSTRAINT `tag_supplier_ibfk_1` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`) ON DELETE CASCADE,
  CONSTRAINT `tag_supplier_ibfk_2` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`supplierid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tag_supplier
-- ----------------------------
BEGIN;
INSERT INTO `tag_supplier` (`tagid`, `supplierid`) VALUES ('1', '3');
INSERT INTO `tag_supplier` (`tagid`, `supplierid`) VALUES ('3', '3');
INSERT INTO `tag_supplier` (`tagid`, `supplierid`) VALUES ('2', '4');
INSERT INTO `tag_supplier` (`tagid`, `supplierid`) VALUES ('4', '4');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `useravatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('2c263376-fabf-4b75-a350-359423790612', 'a', 'a', 'a', 'uploads/6bddbb9ecbc0c68aae44381a188a0831', 'a', 'a');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('3162c4e2-4e6c-4e4f-a46d-284fe4f0f932', 'Sarah', '1', '11', 'uploads/46a89ba7bc7725978f3758e22f880c9d', '2', '3');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('316e4334-466c-4563-a4c7-2b0d08b0affe', 'hu', '1', 'hu', 'uploads/6567af0a42eccbf51ca54395d8e88cc3', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('31986b30-937f-45fa-80af-8a3584c33ea5', 'qq', '1', 'qq', 'uploads/cb09dad9780d4695a296e7880dd6ce39', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('3e8a3e68-9145-43e3-8326-7a6a81af62ce', 'an', 'zxc123', '1@qq.com', 'uploads/a52b8cfb2ccba4548dc6f604613b5f0f', '2', '5');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('41d4e59a-fbaa-4e31-b571-3c18f2c3640a', 'Adam', '1', '123', 'uploads/e036f984f181e5555ab7e71466e1781a', '1', '2');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('4b03fe0c-270c-4600-b6b2-09104d1ce77c', '', '1', '1321', 'uploads/e19e9396e8329ee9a67c676e4b567c7f', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('64e9f4f7-8f2e-43e0-9acb-ba06c44ff5da', 'dsa', '111', 'hu@lala.ocm', 'uploads/da149cfdddeca0cf6786e8bc841e5b3c', '2', '3');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('6534a590-1ff9-4085-a33a-348c9d0b4c54', '6', '6', '6', 'uploads/0bb2b6b7990fc7274a67281c18a73b9e', '6', '6');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('6801e036-1195-4ccb-928c-da7afbbc822e', 'ee', '2', 'ee', 'uploads/fcdb9ae691e92cec4f2688785f41249c', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('72e9daf4-12d0-44d1-ad1a-ec2680032dbb', '1', '1', '99', 'uploads/0ef00bbceab6c87463b4f4cef8a98716', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('74fdbd49-a0d0-477b-88e1-2d4512e1e96b', '测试1', '1', '9', 'uploads/78b624e7b2649efa5a327652815da434', '2', '6');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('768304ca-bf5f-48cc-b957-bb44b4bb7aeb', 'la', '1', 'qwe', 'uploads/b143785c970ce8d819f2f2c613c7f0ab', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('77714849-3bcc-4420-9240-13e55b673d40', '1', '1', '3', 'uploads/6dc970ce7f7819c84d84ad3f479b7b05', '4', '5');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('8f6f66a1-3f21-4f0f-aa70-06c9d2209157', 'b', 'b', 'b', 'uploads/f0ec2b2591d0bffe4dcacc08a816b28b', 'b', 'b');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('8f9f42c4-72c6-49a5-873b-89958ec9fc5d', 'fly', '1', '10', 'uploads/81f9a0e9aa487e7ed87c70f6ff817d35', '2', '5');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('8fe4bbbe-ac18-49e3-acc2-3ea4b8032904', 'c', 'c', 'c', 'uploads/bd9374fe83c17fbaf92d312e1139937e', 'c', 'c');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('96972ee5-9142-4126-865b-ca33c4802ccd', '1', '2', 'test1', 'uploads/cb141052fb3b5cb7d78a25733b49afd6', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('a43857e7-1596-4268-8aec-fb657f005466', 'ww', 'w', 'ww', 'uploads/05f32a37387b03828a594ce602160230', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('a782889b-8ade-43b4-9b87-844677b05201', '111', 'z1', '1', 'uploads/bdc6f64e7d63889262f176780da0dd41', '2', '4');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('a9afe3ac-b5cf-415a-b1f8-f48341daecfd', '11', '2', '121', 'uploads/0704d4cd79e8044ffd9a2f054b925776', '1', '1');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `useravatar`, `lat`, `lon`) VALUES ('cb18b07a-2220-4a9b-be2d-0e6fbc528df6', '7', '7', '7', 'uploads/94346262d3fc79aad1e4c204b7178a75', '7', '7');
COMMIT;

-- ----------------------------
-- Table structure for user_concern
-- ----------------------------
DROP TABLE IF EXISTS `user_concern`;
CREATE TABLE `user_concern` (
  `id` varchar(255) NOT NULL,
  `concernid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`concernid`),
  KEY `concernid` (`concernid`),
  CONSTRAINT `user_concern_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_concern_ibfk_2` FOREIGN KEY (`concernid`) REFERENCES `concern` (`concernid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_concern
-- ----------------------------
BEGIN;
INSERT INTO `user_concern` (`id`, `concernid`) VALUES ('2c263376-fabf-4b75-a350-359423790612', '1b84c31f-03bb-4151-9237-d0f883b15144');
INSERT INTO `user_concern` (`id`, `concernid`) VALUES ('2c263376-fabf-4b75-a350-359423790612', '38aed0f2-4955-46cc-81be-e949a4894ae7');
INSERT INTO `user_concern` (`id`, `concernid`) VALUES ('74fdbd49-a0d0-477b-88e1-2d4512e1e96b', 'e01dbeb0-05ea-4828-8869-667f091053f2');
COMMIT;

-- ----------------------------
-- Triggers structure for table concern
-- ----------------------------
DROP TRIGGER IF EXISTS `after_concern_insert`;
delimiter ;;
CREATE TRIGGER `after_concern_insert` AFTER INSERT ON `concern` FOR EACH ROW BEGIN
  INSERT INTO user_concern (id, concernid)
  VALUES (NEW.userId, NEW.concernid);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table concern
-- ----------------------------
DROP TRIGGER IF EXISTS `after_concern_delete`;
delimiter ;;
CREATE TRIGGER `after_concern_delete` AFTER DELETE ON `concern` FOR EACH ROW BEGIN
  DELETE FROM user_concern
  WHERE id = OLD.userId AND concernid = OLD.concernid;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
