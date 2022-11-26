-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: job_search
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company_job_details`
--

DROP TABLE IF EXISTS `company_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_job_details` (
  `job_details_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `salary_per_hour` int DEFAULT NULL,
  `skills_required` text NOT NULL,
  `active` char(1) NOT NULL,
  `job_location` varchar(100) NOT NULL,
  `creation_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `ctc_offered` int DEFAULT NULL,
  PRIMARY KEY (`job_details_id`),
  KEY `job_id_fk_idx` (`job_id`),
  CONSTRAINT `job_id_fk` FOREIGN KEY (`job_id`) REFERENCES `company_jobs` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_job_details`
--

LOCK TABLES `company_job_details` WRITE;
/*!40000 ALTER TABLE `company_job_details` DISABLE KEYS */;
INSERT INTO `company_job_details` VALUES (1,1,NULL,'JAVA,RDBMS,SPRING BOOT,DAT STRUCTIRES AND ALGORITHMS','Y','remote','2022-11-12 21:38:14',NULL,2500000);
/*!40000 ALTER TABLE `company_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_jobs`
--

DROP TABLE IF EXISTS `company_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_jobs` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `job_title` varchar(200) NOT NULL,
  `job_description` text NOT NULL,
  `job_type_id` int NOT NULL,
  `active` char(1) NOT NULL,
  `posted_by` int NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `company_id_fk_idx` (`company_id`),
  KEY `job_type_id_fk_idx` (`job_type_id`),
  CONSTRAINT `company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `m_company` (`company_id`),
  CONSTRAINT `job_type_id_fk` FOREIGN KEY (`job_type_id`) REFERENCES `m_job_type` (`job_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_jobs`
--

LOCK TABLES `company_jobs` WRITE;
/*!40000 ALTER TABLE `company_jobs` DISABLE KEYS */;
INSERT INTO `company_jobs` VALUES (1,1001,'abc','java developer',1,'N',2),(2,1001,'bcd','angular developer',1,'Y',2);
/*!40000 ALTER TABLE `company_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_application_history`
--

DROP TABLE IF EXISTS `job_application_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_application_history` (
  `job_application_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `job_seeker_id` int NOT NULL,
  `creation_date` datetime NOT NULL,
  `active` varchar(1) NOT NULL,
  `application_accepted` varchar(25) DEFAULT NULL,
  `application_viewed` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`job_application_id`,`job_id`),
  UNIQUE KEY `job_applicaton_id_UNIQUE` (`job_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_application_history`
--

LOCK TABLES `job_application_history` WRITE;
/*!40000 ALTER TABLE `job_application_history` DISABLE KEYS */;
INSERT INTO `job_application_history` VALUES (1,1,1,'2022-11-15 16:00:16','Y','Y',NULL);
/*!40000 ALTER TABLE `job_application_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_company`
--

DROP TABLE IF EXISTS `m_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) NOT NULL,
  `company_description` varchar(500) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_name_UNIQUE` (`company_name`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_company`
--

LOCK TABLES `m_company` WRITE;
/*!40000 ALTER TABLE `m_company` DISABLE KEYS */;
INSERT INTO `m_company` VALUES (1001,'XYZ PVT LTD','TELECOM SECTOR',2);
/*!40000 ALTER TABLE `m_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_degree`
--

DROP TABLE IF EXISTS `m_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_degree` (
  `degree_id` int NOT NULL AUTO_INCREMENT,
  `degree` varchar(150) NOT NULL,
  `degree_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`degree_id`),
  UNIQUE KEY `degree_UNIQUE` (`degree`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_degree`
--

LOCK TABLES `m_degree` WRITE;
/*!40000 ALTER TABLE `m_degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_institution`
--

DROP TABLE IF EXISTS `m_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_institution` (
  `institution_id` int NOT NULL AUTO_INCREMENT,
  `institution_name` varchar(200) NOT NULL,
  `address` varchar(150) NOT NULL,
  `pin_code` varchar(20) NOT NULL,
  `location` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  UNIQUE KEY `institution_name_UNIQUE` (`institution_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_institution`
--

LOCK TABLES `m_institution` WRITE;
/*!40000 ALTER TABLE `m_institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_job_type`
--

DROP TABLE IF EXISTS `m_job_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_job_type` (
  `job_type_id` int NOT NULL AUTO_INCREMENT,
  `job_type` varchar(50) NOT NULL,
  `job_type_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`job_type_id`),
  UNIQUE KEY `job_type_UNIQUE` (`job_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_job_type`
--

LOCK TABLES `m_job_type` WRITE;
/*!40000 ALTER TABLE `m_job_type` DISABLE KEYS */;
INSERT INTO `m_job_type` VALUES (1,'FULL-TIME','Permanent Full Time Oppourtunity'),(2,'CONTRACTUAL','Contractual Oppourtunity'),(3,'INTERSHIP','Intern Oppourtunity');
/*!40000 ALTER TABLE `m_job_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user_role`
--

DROP TABLE IF EXISTS `m_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `role_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_UNIQUE` (`role`),
  UNIQUE KEY `role_id_UNIQUE` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user_role`
--

LOCK TABLES `m_user_role` WRITE;
/*!40000 ALTER TABLE `m_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user_type`
--

DROP TABLE IF EXISTS `m_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user_type` (
  `user_type_id` int NOT NULL AUTO_INCREMENT,
  `user_type` varchar(45) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user_type`
--

LOCK TABLES `m_user_type` WRITE;
/*!40000 ALTER TABLE `m_user_type` DISABLE KEYS */;
INSERT INTO `m_user_type` VALUES (1,'JOB_SEEKER'),(2,'JOB_POSTER');
/*!40000 ALTER TABLE `m_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resume_name` varchar(45) NOT NULL,
  `resume_content` mediumblob NOT NULL,
  `resume_file_type` varchar(15) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES (1,'Rudresh Karn2.pdf',_binary '%PDF-1.4\n%\Ó\ë\é\á\n1 0 obj\n<</Title (Rudresh Karn2)\n/Producer (Skia/PDF m109 Google Docs Renderer)>>\nendobj\n3 0 obj\n<</ca 1\n/BM /Normal>>\nendobj\n5 0 obj\n<</CA 1\n/ca 1\n/LC 0\n/LJ 0\n/LW 1.33333337\n/ML 10\n/SA true\n/BM /Normal>>\nendobj\n7 0 obj\n<</CA 1\n/ca 1\n/LC 0\n/LJ 0\n/LW 2.6666667\n/ML 10\n/SA true\n/BM /Normal>>\nendobj\n8 0 obj\n<</Type /Annot\n/Subtype /Link\n/F 4\n/Border [0 0 0]\n/Rect [72 715.93103 209.56641 729.72986]\n/A <</Type /Action\n/S /URI\n/URI (mailto:rudreshkarna@gmail.com)>>>>\nendobj\n9 0 obj\n<</Type /Annot\n/Subtype /Link\n/F 4\n/Border [0 0 0]\n/Rect [449.57227 715.93103 540 729.72986]\n/A <</Type /Action\n/S /URI\n/URI (tel:9123438201)>>>>\nendobj\n10 0 obj\n<</Filter /FlateDecode\n/Length 2537>> stream\nxœ\Í[Y‹$7~¯_‘\Ï–%E„0†\ê.?\ÛÛ°?`wm0…õş\ØĞ™‘ª¼ª]=\ÃLU+3•q~q©Í¤ù\ïw†ÿó\ÑNÿüzù\ïEyÊ«\í“Í”şşò\ÓT¾üù\Û\åûŸ`ú\í—t=7Mnúóß—_/?;x;Q”v©Ï¼¼_¾¿\ád\Ãôş\ë\Å4¬%\å¬\ÑqR\Ñ8m\ÈÁôş•_ğ_\0ô_ğş¯\é­´¦ 5zş\ä\ï\È\ß\Éñ\ç‹\æ‹Z\Û7ş\å\Z™§÷\ß/oï™®ü\"Ğy\ÅD\í?ş6ı\ç\\g•õ\Ú`‡\Ò\ÎùIÿ™TH\"VfYT¾X\Z’/Ş–, ğŞ…ƒ\nCù9³C;\ì\à‚•ò\İ2‹x\åŸuù_ù\ßMk“®ósdÓµ™\í\Äx\âùu°ødŞó\nmt!	A3£†1XtØ¾æ’­A_?_\êZº—LjA!9\ç²\é)\Ê$‹ÿ7w‹™!J!Ûr:„À½8«\å\Â—¿¯½2ò4\Åkw\Ê\å?K£7š_LYš\ŞBt\è›Ñ£bşm².3k¢²¤m\ä\Ç\Ë:!°<ƒ\Å4_!\ÊW\ï\ì<Dš	[l_\Ù\ÜLC¾Àzf¶\Ùmû¨{\å}¤y¶\ßQŒÖ²	2%/|€yz•€0\è\Ïğ+\Ø``T M›}Å°*|0¶\Û4¨j\Ï\è\æ×¬{Y…H`\à\È1,\Ï_d\0\ÊoØ¡f·o\è§o;ğ?(C¾\Â•{À\Õg_\ëz…ô=]\Ï\Ğc\n4UE[\í\ß#¨”­S”NT$€ÊŸ×®oX\\>Éº\ÛR%cE\Ä[E6]1“uó·zoc)\Ö\×%–%«t-l\æ=ª¨2Àğæ¦²KUq÷\ì‚J»•°6(\Z¡/\ã¼t\â4Sc\Ë\Ú—9Tå‘¯\Ïúzı:\Ç¹w^ƒ*¥[5\0W\×}•\Ô\Úû›±\\Åµ…‘TMÙªE?\Ğ>ÀO³Š\×1œZ!`wgú\'h\Åb\á²E\×Ny£,VŠh–\ÔH¹Ù¥\ÖE\å!ø;bŸ\r5\'xUCn¶ \Æó\"ûşÔ´BX}µY\Ğ[\Õ\æ\ël\è…\Å\rš¿·½¯óµ#\é\å\ä8¯Ô¾d4Ÿ\Ò„\Ù\Ä\Ùd4\ÌN\Ò9Uj\r\"»\ã=‘k\à‘H\é\0T½8_ıš\Ó?P‚ò\È \Õø÷;jµ\Ú(.\nô3|\ÇPi…MV¢3r\ÊøDó3yÍ‰\çjİ²÷&¬†¼\İ¨G\ëPq˜÷s\â²k\ä–\Ó,@ôŸ\'o†\r?x‰\æ=­pA-¸}8©xp\ç,MW\"ö“2òo¹F\Ş\Ï\Ü\rŞ‰\È9\Z÷ø|sĞ«p\ê·{§jôu\Û\n•·—ù\ç}§\0P\Ö\0„\'8E#\æ.ğµô@„ó¤l.µ½•¼3ˆ—²ş\ÔT\0\Ê;²p\ã¼G\Îu_…R\Òú\ë‘\Ï`T:Xı‰|f\0”\àûeğŸ8\ÛRAµ¥\æ\ÔbzS——\Ìş:ğ¶ ñ²\íG›ŠÚ¾\"WøP ¨k=ÿz\Ñ‘~Qø\ÙS)£f$\íaÿ]À-ª\n\ÂzD^K~D’4–&¨µ{!\è\Ñ÷šp†ô{(¹=\á­‚‰€Ÿ\Ç\Şw¡†Rô²¦#oQ÷$h\r§»\nªı6ŸÚ«xh%~-ª\'ù,1¦\ß[\ëÌ–/b¿È«\åó‹¼7\í¯÷TrÁÇ•>Ó‡p~·T\ÜMV>n»?òó}=k}\Êh\n\Êö¾#0V9·f\ãX\Zp~4u¶VTH]@©Í‡&\İø¤új\××ª\í•ü²«	–v$q¶\ãi³\ÏVÃ†u\ìcÈ˜Ÿô°ÿ¢{N+s¹±]¤\×ú\ZW\Æ8Tj\Ä=UÚ Ğ’}†-–nË²¢qzn\Å7[À²`ªc7\ân£p\İ\ØLT	Kğ\ê¡t\Ñ:¼Zï™…p˜\í&\Ç\Z\áÃ­m\Ã&N>\"˜\é\ë…X\Úre£¹\rÁ«\Ö\ßù\Öfs›7\Ñ\Ç\ã\ævX\ï£\ß\ì\ïn÷°k\ßTj\ä\ÚS\Íb¿\Ñ\Ã\Æb ¤¢µÆ¡x\Ânîµ—r\"?\0ı\îô|\í+£~2Û‡2\ä\ì_(ıû\ÉË«‚r>º‘\Ç\Û,­R\Ş\"mfˆ\ìaŒúy³•\rQ»{r¬L³€\êT±\ì…}­\Ø\Ü\Ì3º\Îyf\Ê`-d¯)+\æN\Ê[G‚r‹{h„\Ñ-#Ç‡m`Aû\rŒ\æ…\r,bŸc\Z7g±ˆ£	…dGXTm!ã‡‹@\Ã\ã˜ór€k›m\Î\ro{=<¶Ã·­—o’»õ\î\'µ=K\Ü+8ƒ™O\0\Ã7Š×š}È´-µ·m·\Ê\Èaº\Ì\'\ï‹\í“jmT\å\Åp|9\ØO<¤\Ù\nW£9eÔ·ƒ\í\"gô\É;öüRYûGû¢:±kM\0Qf\ÆbŠHµ[xô6Ş²¶s^\Ø*!\ß\İzÇº@±›D<Ó‹%¿Lo©6\Ú½–.ˆ\Ş\çÀp†‹»q\áGBš*k~\ß_l\0³\İsKT<\á˜M¶9h- eÿ4\'zv™Œz–ªL¯L¸q¸#«Ëñ¨¸ñ\È\æ@¨\Ê!­3\Æ\Âu*\Òõ¦|m\ÌºqBu\æ(QÒŠ\ìòÌ¡`Ãªãœ„3µC\ä\'\\„¬*\0}YúÄ¿••uf oı¼Ï†»QQs:óŒ\Úø %b\àZRrR¦\è|®ƒD\Ã–h\Ò&f\'}\í@\Ü\ÄÍµûö8u)\æ{üSò4\îM«Z\à˜/µNhri]õ\Û,L];8\é#5\Ğf¯«)\ÍqN‹D\í \ä\Ğ?\ÑJ\á\Ê=`\É\ëzn9µ\à–\'8{\Ç^ˆCg¾ù(ı¤2^u\ï\Î7tAZV¦\É0sşT,˜e\ëË¶‹ü©\ÍP8\Û\ÑÚ£E\ã57\æTeY\Ë\Ú:i§+¹\ÑWp‰\rœ¢¤¨\ÙswzO%\\f’Á\ÏpŠ†SW‹Îºh´A\Ö-+z”hR™xV4©\å$ŞŠF^VûË¬\\*\r!\Úğñ®™¨\Ñ\Æ~\"T¬lTª\\h*6Àû\ÉüŞ‘P\ïÀ™\ãJµ\Ø4/;ŸN9\éNm	\İ*\ï6k²­]UÁıNO<vº]un\ïµ]qo\Ö{³&ˆ+“€\Ç\ÃFNJ6x\èBz0yq$¼Ïº\ÛğÕ—Nš³\×şŒ\ÑAI\Í\ÕL.v¬®g\è§\rúta\\\Ö!|öºö.p	şş\0\í\ã\ç\â{qr’|wQ\Ïmµ\Å$Ñˆ{E\ì>w$icr\"äµº\ß8“y\ÒÚ¤Ròsö¤›×¤ 5ñŸ û«•Àó6I¿81\Õ¾•i\èxBguŠ\Úbd»·õXW¢\ïÜˆø¦¿\ÚA\å\×\\¸H\à\İ\Ñb\ì7\åBşoı{™\ãÂ’\Â:)û¿š\à\Óf)Ô”)Ušµ™\ÈX\Ê;b\ÂAşƒbõ\ÜH¨lJ\åqH\ëÀ[\Ú|y•«\çz»eS\Úü ¸\0\Ö%\Z\Å\Ï\çB\ïÈ²W\Ól—,÷Õ²\éÿª’¸\Ä\nendstream\nendobj\n13 0 obj\n<</Type /Annot\n/Subtype /Link\n/F 4\n/Border [0 0 0]\n/Rect [372.7793 135.443115 390.78516 149.241943]\n/A <</Type /Action\n/S /URI\n/URI (https://www.techgig.com/codegladiators/coding/print_certificate?param=RXUyZzkvQzd3ZkxrdVpjbFphR3VnRERzMUJ0VzgycGV0RGJMNDVUcDAvV04zYzJtTjg0Tm5meWJ4QXFPYjJ1SVk1TTRQaE9ZZG4yelpHZkRhbHFCL3c9PQ==)>>>>\nendobj\n14 0 obj\n<</Type /Annot\n/Subtype /Link\n/F 4\n/Border [0 0 0]\n/Rect [272.51953 103.705811 290.52539 117.504639]\n/A <</Type /Action\n/S /URI\n/URI (https://www.techgig.com/rudreshkarn)>>>>\nendobj\n15 0 obj\n<</Filter /FlateDecode\n/Length 1989>> stream\nxœ\íZÛ\ã6}\ÏWøª•(R (d&û\Üvş \í.Ptºı \ÔÍ¢\í\Ø\Îdg±³—2±e\ëF’‡’Ì ù\ï\'\Ãÿ|„\á‡\ÊS.m¿\\h†ô÷\ÛÛ¡\\||xó\Ö\ïÿ;¤\çÁ¸Áhr\ÃÇ¿\ï¿\ÎZğ0\Ä\ÜF­qz:¼¹p7<½;˜\Ö=\à`hxúpH…6Uúsøş><>•\ê8¯aP­k£\ÂP\î¹­´¦ 5ù{\á¯/\×dø÷¨µ¶ü‹õŞ—{®’\Ë\Ú{\ä§÷\Óúy„\Æ{µƒ4ÿ\Ú1W€\Ûk/Ù ä™¶—¬\Ï\ÂX€¡tO¶k÷©\Ü].p9A¯—¯M­S‡\ß\êÒ±?µyª\í=\Ô6cù\ÍeT§\Ìõğ±·…¾)äŠ¾*¸\à\æz¿CqóYZ*£h£¢Z<j¢>\ëQZµ®1[#£¼õV\Ó+@\êy¦ú\n©\Æ9r“Zósª\ê;W•mÀÅº\Úş¬­\Ô$D¬L\ï¬Ã¦\0\Z€­­¹Šúm\É[¯™ü+|“°+¾\"Is.`#±\rVg¿f|±k\"CôX\î³ôª6V%ŞŒ¬¶›Ê¶…GV¡\çjñ\Ë¯\Ùeğ>m\ÂÙ“\\º0²½B\Ôóm‡\àØ›\Â6¿ƒ\Õé£€z\ìye\Õdp\0Y\ç¹A\ë\Ü\Ï\×Ç\Ç·”\ì¢bÁƒ{gº\'´<¹*„m\äR`L4_?ğğü\íP\Èu04À\äk*×£_ı,\îZ ¬ º\rhó¶6t\Ú(ô\Ò3\ßÅ­rP(\\·	<°jŒ‹A˜J\ï\"§².E¢õ5\Õ&e@\rƒPúy\ZZmğÛ€6U$›¬agxæ¡‡œ	/»l„¢K\î\rPH\Ğ\0\Ó÷Á]\àö˜\')\ãMØ·\ÌjÔ¸w»½M„:l\"\Z5U4÷}\ì–+YH¶\×&Stj‹RÃ°d$[\èò\Ì\\Ñ˜Ğ¥\ÈZ;\Èÿœ\0-s2D	‡\È\"Pg….´,ø\çğû\Õ.£SMhae\à”ËŸ™Cµ*`$\ÆOğ`£C_\å¨\æ\ä£É¿\æ$\ÊûHFÀ»”#“6Œ–br\ÉOHE\0\ãP<(\Ê+d:\İÛªò^>°öz\çD\Õ\è‚w\ŞÆ®e‚\ÕQ=¬j}\"u\êV\Ùi¦E[‰K\â±5\Ø]\ÇQm\ÏzQz²»ƒ[c0	\îÁ#­ƒZQW6¥•vù\ât·\æ\ÌÙ¨\Ó!,(\ä=lNHpóJ·„\êYøšû\Ú9ÿ\Z³Ó“x·‘ğY\'·\ã\Ù ª\î+÷aK¢\Äo{Oø\n¸Qğqª\ÂJJ˜sƒ\ÆG¥´ú’\\Š²Z—v’ğ«\n\\]bØ¡\Ök&\ÆÎ¼†\ä\ç9O²\Æ9ÿIÌš>ÖŒ!\ì»qû+\Ñw¡û—¢i6pT3,£W ›g\æ\Ôr¢\Ë\n<ı”\ÙHùH\İaœ\é`Í™İ›X\ápE~Ó’\Ó\\÷–¼ƒs~û\n–Á\ì\\\r¡‹\é\ÚôG•u’^x5±¼ÀR\Écƒy[m\İJ¥²\ë;?\Ã]\î¨úÖ´\ëÚºB~?›\è–J™‚E³\Ğ\é=J	Å@¬	ƒtİ¯\Èu„›”6³£ü<v…\äg»Øµ6­B.ˆôw˜N²9‘Ş’Œõ$\Êp€õ¦\Ój uw®:¾ì«@\Êq\ŞwYdsx\rL4\Ôb\à\"¬¥ZP’@\Êue>œ¸4Hf¹µøÎ©À‰Û‚\\ğ¼˜h§.3\çy\Ô-3<\ß\Èi\0·V\ÕVRŸ¨S—\ĞAµL®ö\Ís»(©»\áš¼\ç!\Í\ÒN”ZCaÿA•\Îb°d®—Wt/\Ê\Û\n\ä#U`im¬v¥\ç­4†¤´7´Ÿº}Y\ÌN‚‘	\ê\ÄX¿>bLl³\Ó\í¯_\Û-ùn‰2\Çi\å¼_Æ‡/°m¹\Æ@ùº‹}\Êú§\Şv¾¾\èÎ€³\Şò,€˜2Ù¨X8\Ærv0*~FU\èª2\îFŸDû§> \É\Ö\Ûe:™›v?½\"tfa¨Ÿy÷£\r0İ·I‹ŞB@ZOVò¯ieŒ Fh\İô6\Zs¥\ãôù¸lC\Âsû¥W4\ék\êo\ËG¨\Î\Õ\íY\n‚\ÅE^òƒ¯c|ı^\î´S\Ì£»w7Ø‚mD&…u7¦¬\ì\Æ8H´?.Œş\Åp¹·>?ñ!Ccó—=q ğUĞ‹ƒ\0Ÿ:¸\êN¡\í)`tC¥Œû{®\Ø\ç\á¥\ï–x\ÆÀs.K1 ƒ¸<¶!z	7¶vôw\'³ƒ~rœ—¤}»=Û¦\êÿ¨|³z[\ãJ;ç‡œ\Í\r*d\ÈNK¯+Q%\í¾\çPº\\\ä®±c\Û\áş\Ê\Åz7@Š¸¿™‹[û¦\ã>›_¹š\'½\Ü JW›?{¼†\Zx\îiwj&\ì5—Û’…f-hŒ-©ci\Â;.®ş\n	ƒ\Zt\à\"u?²t\Üóg\Â!\è%<\ÂM!Z\È<\Ş\æ\n¼/¶»JŸ‰\ËÔ•[“\ÜÂ©²Œ\Äl\Ä\"};*—UScL;ñ5²¢+”ó%¬“±®l>_ğY­¢Q\Ö\İƒ7­sv\ÄÀ\'˜\0\â\0|‚3‡G&>\â~%:\Îö\ÇK˜\ri¹*¹@0Ü!Ì‡\Ò±±x¥¹\Ù\Z\Û\Ø\\P†E‹šK±„? ‹\×b·Œ·¨¶uÉ¶¬¶§bˆœ\Äp\Ï\É1\ÎK\×:–føŒÁ…²\ÔÉ¤.YG\â¾tö?ÿœ’{\nendstream\nendobj\n2 0 obj\n<</Type /Page\n/Resources <</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState <</G3 3 0 R\n/G5 5 0 R\n/G7 7 0 R>>\n/Font <</F4 4 0 R\n/F6 6 0 R>>>>\n/MediaBox [0 0 612 792]\n/Annots [8 0 R 9 0 R]\n/Contents 10 0 R\n/StructParents 0\n/Parent 16 0 R>>\nendobj\n11 0 obj\n<</Type /Page\n/Resources <</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState <</G3 3 0 R\n/G5 5 0 R\n/G7 7 0 R>>\n/Font <</F4 4 0 R\n/F6 6 0 R\n/F12 12 0 R>>>>\n/MediaBox [0 0 612 792]\n/Annots [13 0 R 14 0 R]\n/Contents 15 0 R\n/StructParents 1\n/Parent 16 0 R>>\nendobj\n16 0 obj\n<</Type /Pages\n/Count 2\n/Kids [2 0 R 11 0 R]>>\nendobj\n17 0 obj\n<</h.3jh35tknsvgb [2 0 R /XYZ 72 760.5 0]\n/h.c6e284u7crrt [2 0 R /XYZ 72 699.31494 0]>>\nendobj\n18 0 obj\n<</Type /Catalog\n/Pages 16 0 R\n/Dests 17 0 R>>\nendobj\n19 0 obj\n<</Length1 48304\n/Filter /FlateDecode\n/Length 29464>> stream\nxœ\ì½	xTE\Ö?|ª\î½}{\ï\Û\İ\é}»NwHBHHI @C\Ù!A\" ;ˆ,AÜ‚²‰(èŒ¨¨€:*¨hC`T\ÆEq\ßQq‰¢Ã¸§û;U\İ\àUÿß¼\ßó|\Ï÷¼\ßó\ŞKı\ê\Ô^·\êœS§\ê\Ş@\0À Bñš\ÚÁd9¹€º1v\ìÑ£Æ­|ò^€\æe\0rrÈ¸	ƒô‘7\"İŒ\éÅ£\Æ•\\\î|<†ù/\Æğ´‰5#\ëF\ß2ÿ\ß\0ùq\0\ëg,œ¾XğÅ˜ş¦oœ±|™zÿ\0h[±\Îñ³\ÏYøÂŠú­\0-†/™3½q1¸A‡õWa~e\Î\Å+f¯hzo(@\ßWšŞ;s\á\å·NiÄ¾9.\Ği\çÎš>óD\Ö\ÓX9ù{\Ï\Å[©.Ša\ì#\ä\Ì]¸\ìò¢/}¹\0\ÒŒ[vñ¢Ó·\İr]@¨\Ãô¿,œ~ùbé€©	\ÓF`X½dú\ÂY®i=\ß\ÃÁÀ6H\Í\âEË’ù°iö|\êâ¥³G_y ˆeÁ8´@Á\n$™Dš\å…ğ-TÁ\İ c¼E0k{óJ€_\É\\V\ço\\X^\îŸ8ªøé±ŸV*<\æœk\n\ÑC¼¥\éK§_\êŒK/u\Î\ÒY@;ë¢¥ ^<}\Ù% ©$\Ï\ÖcÑ›§Zªş­õiyô½\ç\æ3ÿù\Ñ}÷ÿôX\ç´F\êºZd¾1MS0¤\ãş”ZÏ€\é\Ì8c|@Œ@>bw\èƒ\Øoq¼	\Ô@¯OÖ“\Í8Zi«TŠ\ÕùR¾ğ7˜MmZ‰\Z4\"e—\ÈGö¬k\ä¨óGaM*\ì–^IŒ!¥r\Ògƒ\ÄÑI\Ù\ì€\È{š*™•,ŒE^/Î…€\ã¦Bò öpL‚°_+a\ìfõ`ZºAT`K\Ãx\ÚôTZò\ãß¸g$güjvş\Ï×«\ä9ò\Õ\Ñ)xo¦/Ğ¯“P+6I‚f <E;A·†İ†¥&\ÉTz\æ6—Zf(s­v\ë\ßlƒl;\í7\Ùo\Ê*\Èú³\ãcg©\ë#÷\ë-\Ş\n\ßhÿıÁ±ÁWBW«›\Â\ÉÔ]†÷\ìÔcŠ†cCr\'v» Ïß» »»®û³=÷ø±x[\Ï;K(½·\ì¦^¾òªòo*\Ş\îc©ú¤¿~À\âøB\Ş_&³QQa>4¥i‚£¸<MSœı¹iZÀQë–¦Å³òH8ö\æ4­A\n` ,…y8¶\ÃHò1Ã³\×öB\Î\î	Å˜>’\Ç,‚e°c.ge!\Æ\ÏÁ¼— ªPˆ\îLm*Œ\Å\\s\àR¤§cì¹¡3ùva\Îl¡\'\Ş*ö`.¯û×­Uch)\Ò§c|ª‡=x›§Û›‡-\ÌÅ´\Æt\ëüi–#Î„š³„Vşš!\ä\0\\&M„:ş\\\É£\ÅG`)\æ\Ã\Ñoge\ÅF˜€\îtU\è&¢ó²¸L]Hca\Ì{à·˜O‚E\Ò\Äd\'¶·Ezf£Û†ô½\âÇ°SS	\Ó}<ŒBT\Îò`][4Á\í˜\ï.LŸq\ÛĞ¯\Ãğ=HOÁr\ÅiZ\'\ß³\Û\ÂznHû¹g\Çc\ç¡[‹mŒF0º\á˜Çş t\ë\È3°<“¼\ÓÑ‡\ë°ıu,]M\ÚŠc²\Ó`¹_‡´û¡A\ßa\äÀ”~„šR\àš±{J3r˜\Åu ´\ä\İ349‹Fı±`\ÖR\Ì{6BJ²|µ\á®/e!K\É\Å\ä|\'ù\ÄMôpnÁ¹¿ù\ê<\îöKÀ\ZrP\ïA)òw9T¢ş†sW6k´$\ç‚£6!µ	K\rK¾ƒ\Z–…¤X\\\0ıœd+Ô ŠôXt\ĞÕ¡›’ü\nµ±%Yƒ¹Y\r5˜»s\Ï\Å\Üs1÷&ÁKl\Â­X¢K´\âº%`¬%H—\n`©\0/U‚ñ5HF7\İ\Ì=}Vz\"ú¬†\ÉXf\n:\Ê1w%º>\è\ÄT‰ÀŠ\Õ%aL+æ™‹y\æb¹¼m·k\å\ímB]# \É\Ó\nõX\Ëdşd\ï\àhdñ\Ñ\É\áyŞ‘\ÚÁƒ\Î+=1†\ë$?C÷9óó’Ÿ³t\æ\Ó/q~\Ú\Ò`\'\ì&ó`7†\'\É),õJJ+<.\\Ÿ\îB\Éû#¬C\r5c®GY‹ı®?ö¥\îÁş\Ş\Ç1\ï$¸\Z\ÚÁI\Ü\É/\à\ZX#¼‚¥Ö€	²Q+ŒF\rq#‘¼gõñ:œ\é¨1“¦d]ò¦\ä-\É?Áıp@x6Ù‰3\ë…xO~%½™|5\Ù¸\î€\È-º}¨I\'¡¾= Üºd«\Ğ ’\äœ\äOØƒ0\\†}QW\'Gh\Ö>>C®»R¨\ÆZ\îK6\'b.?®\\sa+´“^d\rKS’#“\ÇÁ‰m\\µ\Ş-°\ï6ø3¼MŒÒ©äŸ’§P~»#G^ƒ\ãñ\"9\"$:W%\àˆI8JyÈ­\Ãğ¹ş\ÏÀ\Ë$B ‹$£T\"Å¥•\ÉW‘¯{\"O‚±\ä§\ä{z5\Ş\×O‹ƒ“ƒP×¯›\Ùh\Ã_\áC\â%Ed™Hó\è\"ºMXŠÔk\à™¨C¯‡Û±ö÷I\ÙOô%\á>ñañgM q\"i\Æ‰ÁhO=ALø¤*i$×’\×\ÉÇ´šN¥wÒ„?Š»Ä¿\Ë\Óñ©/D-v#<\ß© c\Èd.¹’¬#7“;\Èqò2ùœ¤\ã\é\\w\ç\nK„?‹ƒğF)^\'­•n\Ğ|¨KMü-ñ}²$¹\Æ ?¬\Â\Ş\ß\n\Ûğ\ÉÀKğ\ŞÀGD\"b\Æ[%a2\\÷\Õ\äFr/\ÙIv‘Vl\åeòù‚|KşM~¦È²TC}4L³ñĞ¥ô2úGz}	\ï—\é?é‚K\È\n„^B•P/,\Â^­6\ã½OøPôŠ/‰I\çi‹´]\Ú)=,=)\Ò\åkµ }\á—û:ó;\ßO@b}bK¢%Ñšü8‡^…ZŸcp½škö\åhgŞ|ş\n1\â\ØyQCõ\'#pd¦’ùd	¹Gr5\ÙJ\î\ç}”\ÂQzƒ|}6Q?\ïsÚ‹¢£ğ¾Î¢K\Ğj¹…¶\Ò\×\éO‚,‹\àò…!Bƒ0KX&¬¶\Í\Â\Â{\ÂG\Âw\Â/x\'E½³Å˜X §Š—Š\Û\Ä\Ï\ÄÏ¤)\Òó\Ò\'\Z½f¡f­¦Mó\Ü[\î/–\Ç\È\rò&y¿üªv\Zr\çS°?{\í \'„UB­°n¢¥¢‡¾H_D~\n3…‘9•\î$\ë\éU¤•\æH—kúÒ¾\ä|8%\Æp¬Ÿ¦\Û\éw´¯0’\'\ã`>í™ªM“%>„^•øtˆ‡ğ\Ù^Äš/\×\É\ÕôkZ_¯\É_…b±@x\Ş> ²x¼#ê‰‹t\Ğ…\Ñ\ÈûKu\î‚G…%\ä*\ØGkq\éùY»ùø|‚kŒ\'%\äwô|\ä¢r\ác¸\Ğ7¡\åx=\ÜFfŠs\à&(%W\Âgğ\0JEt‰&_\ã@+q¸\ÚI+Pq[GI¤,XM\Z„­š¯\é[hÕ¼$\ê\á}\á\ìıKôQa¤xJ\ZK\æ¢\\kaIr¬\êÄ¿“9 ‰O v»R(\Ã\è_ƒZe\n\ê´ı(\İ\í¨\n#1Æœ3ùbjˆ­xßz‚\Ù\ÎóP\Æ\'¡{Z5\ãiÌ‘\Ìµ®\æ\Ï\'Æ¢†~\0\îHÎK’·@!\êƒu\É+±Æğ	l‚dM\â\n´Ÿ‚(9\ï“\Ò`ú’48YH7Ğ·\è8º\å\Üù\ÅÑ7|‰÷£\è6ıñ\r’“¯!wwC\r{\\„+\êI|Ê¯°…¡\Â(MœO÷$‹ñy?€1\É“!\\ƒ\ç&/†Qp\î—%˜.\à7“¿\ãó^³\è\Ø\ä2aVb®^¨i\×\âX^\×Ç«\'ŒĞ¿_U\ß>•\å½\ÊJKzõ(\ì^Ÿ\×-7Í‰d‡\ÕP0\à÷y=n—Ó‘e·Y‹\Ùd4\èuZY#‰ÅOmdğ4µ96­YŒE†-d\á\ÈtŒ˜~VÄ´f£Ÿ›§YÆ³©\ç\æŒc\Î\Ùÿ%g<•3Ş•“(jTvWk#jóñšˆ\ÚF&©CúÆšH½\Ú\ÜÁé‘œ\Ş\Ìi\Ò\á0Pk\İsk\Ôf2M­m¼|\î†\Úi5X\İƒ¾:R=K_\Øö\è\rH\ZjvE\ï!®ş„\ÔU\ÛgZB&\ìT³7RS\Û\ì‰Ô°4\Ñ\Ú\é3›G©«­ñ…\Ãõ…İ›IõŒ\ÈE\Í\Ôl)\àY š7Ó¬©n–y3\ê<ö4pƒº§û‘\r\Û¸hZqfd\æô)u\Í\ÂôzÖ†µ\0Û­iv­<\é>\Ä\Êm\Õu\ë\ÎNõ	j\İóTÜ°aÚ¼cL\İÙ©a†õõX–¥\ÑÁ\Ó6Æ¦7\â §bktM}]3YƒMª\ìI\ØS¥oV¤–\ÅL›¯6\ë\"ƒ\"s7ÌŸ†S\ã\İ\ĞcW„[¼\Şø\ä	ğÖª\Æ\×E\Â\Í|‘ú\é5ş=Y°aìŠ½¸\ê97¥°ûÅš\Z\Ø=fKš0š\Î&fu¥qŠgg\Ôğ±]#KX\"Ã!š\Õ*ö¤.‚\ÏTÁ`Vl˜Q\Ùğª\'Xªy&\ÎÈ¼f]õ´\rJ\Ï\Ê7KQ%¢nø7 D:şyn\ÌôtŒ&ªü\Éø¤‹\Õ0=C74\ç\ç3‘«qN±ıy¸Wa÷\åm4Y¬¨\è\áğÁh\Û\éõ}Špø\Ãa6Á7´\Å\á\"47©K…U¸\È\×ñ¢‚úf:¥É¤8&°”¦LJWñi\ä\äVn;šµ±®\Åi¯Û§™8ÿÉ³R\é\Ã\ÇE†™\\§\Ön˜–\Û\á\ã\Ï	¥\Ò+º\Ò\ÒT³½ºNğ\Ñ4E}OE¦œÒ•™\êŒ\Íbÿi8S\Ïl“µÈ•<†¨ƒ›•iCSX¯‡ÿ\ÃBm\ÉS¬÷\ÎKw³¹OÁ¹\á¾\ç„\Ï\éqƒ€Æ¥røø\É6\è\ÏICVK58,\í!\Ç\Ãøº°Z\İP2£ø¯-y¤‚¹z_s‡¬še@şKE¥ƒ\çdô¥\éz¼wvŒŠnÃ†Áuğ†i¦·%›.Š¨Jd\Ãú$}r\Ã\â\Úi\ÆiK¶\ß\àk¼±\Çj.\éƒBAaĞY?fOœ¬7¹\î€ ®_\×B	­6¨~O¦\ÕP\â<–²X\É*Àp‚\ÙBµ<¿\ï@ ‰§Š<‚‡g´\àq\ÚLm4§d\â(Æ‰©¸8c\Ó1\Õ\ã\ë\Î\æ.’õ…|Ácg¬\Ómú¬K/ƒ(‚FA\Ã/4S4©S0ƒV–eFT’5ZY‹N\Ö\ÈZ=Û¬ò\Â<¿¨\ÑP*QmŠ\ÆJôHºtı\Ø\Ö/³úe~\Èrª~£¬\Õ\á*¦k\Ö!\ÉC²¡«~ÖœŒÅ°k‚•1$\é$I2™ô\Ú=cCX¿V\Ä\ëLı<L:va\rÖª\Ó\ã­\ÃvL\ìL€\æùyır¦~\ëG\Âb1¤\ëÇ†$	t¢$ŠZ~hµ©ú-:½\×a²^k\ĞõlU\Ö\ë,]õóüXŒ\Õob´„![\Ò*Š1]¿\Ù\ĞU?\ï.›N—ª_1ŒX¥­Ag2ñ6\è†3õó!uZQ\ĞbıX6S¿lµš\Ø>ŠuÒ€\ÓzI#Ig\ê\ç)`\Í\Ô/\éÎ®\ßÊ·`¯ŸÕ‰M°ú­ÑŠ8’²Nk·›\ÓõcCX¿\Õo\àN¹!U¿\İd2£©b\Şd°˜ğÆ\Éd\ïª_oÀ\Ôôøè¢‚¤A£—ô:Ö’ÃR¥á•˜qšÀ¨‘S±§\Ü\ÈSÀa2[°J4³\ÑjV\Ìh\Í&\ãL^Ÿ\Ç`\Ô`wpK °§“±5ƒEoĞ¹\İ6v\Ò\È*QpšÀ,#o›ø…Sn’S’bQ¬hm\ÙAcTLv«]±[³\Õ\âbœ\Ã›Xs²\Ù,iŒš,3>¬\Ö(›\rVUŸ?§ŸWb\ÃaE«\Ój-ü\Â)±¤\Ã}6[V–\Í\ê@ƒ\Æfq\ÙVG–\r\Ûğ3\Î\á…ñ\é,\äEÆ¬q²²:³\Öb²c£ 3]¿\×z=Xµz-2»o”Tı»\İ\á°\Û\\ [\ìŠ\Ëá²»cvÕ¯(Ì«(²l–=¬¬Ş¢ULœ6Uu³Sy¼üœO°#‡\èlü°\Ùx\n¨‡\Ë\å\Èò€Nq\Ø|.Ãƒ\r¸*\ã^G\Ïj\Õ[m²¬\È>›\Õj5(:|R|¨p¶\']Àù»õg;n·3\Ë:«\Ó\æs{^·\Ó\ávfŸ©ß†·Ş–©\ßf3XYı‹ù\Ùy^aò8Q:õ~\á”;x\n\Ä<Ÿ\Ï\ã\n€\Î\îq„|O\0C>OŒq&/œ\å°;²°˜¬³\Ë!V\Öh\Ó;¬>«Õ–_ ¦\ßSDı`6ƒ\Çh6\Z]üp¹Ro0\nüş`\Ğ\ï\rƒ\Ñ\áwE‚aCA?{b\ä…qô\\.“Ë…]\Óç°²\æ,¬$\àt8zE½X%y!dğ¡ô˜¼ü\Â)÷ò(\n…\Â\á?Œ®7\Z\Î	\å`(\êÁ8“öz]^¯\Ù\ë\Õ\ë]ú+kq™¼®06TRŠO\ÉNÅ¡{§	f«\Ù\ì\çN¹Ÿ§@i8œƒU\æ‚\Ùö\ç\å\ä†s1”.aZ‹öû=˜\×\ï7\ê=\Æn¬¬\Õcö{\"n§wy;Å«8\çT‹\Íb	ò \ä)P““‹U\æƒÅ—,\Ì\Í\Ï\É\ÇPnNo\Æù¼p0\èÃ¼Á€\É\ä3°¬\Íg	ør½>oŸ¾İ‘}Y%e¹`·C¶bW•_È—*O¾¹¹ùù¹‘B°rÕ¢ü\Â\ÜBl ?·\ã|^XU˜WUM¦ ©\'+k(j \Ï\ïóW\×\àS2E…¦&8kw\Ú\íQ~\á”Gy\n\Ôæ•=»0Z^\\VX†¡\â\ÂALkñ\Â\Ñh6\æF-–lK%+\ëÌ¶G\ÃEj8<|Dò!«¤º<\è\îğ8ùü\È\Ï\ç)0¢¤¤w\ï’}À+\É\ï×»OIŸ\Ş%…½K†3­\Å\ç\ç\Ç0o~¾\Õ\Z³`e=1G~´WN4:n|d/V\Éy\å8MP\ìò»\\=øĞ£Oñ\å\åUU\å¥Á•_Ş£¶j`ùÀªò²ªòqŒ3y\á=ò{ôp÷\èa³Ø†°²ş|W¼¾ù¹İ¦4Ô²·[x\í¡ôö†¼\ŞR~!ß”òh\è\×oĞ ~CÁÛ£_\éğACû\rÔ¯rP¿gòÂ¥¥=JK}e¥Y¢¬‘X´,\Ô\Ã[Z8°°°p\æl|J¦¡¾\Z\Âa\è\ãûıü¨¨\à)0»ºz\è\Ğ\ê~çƒ¿¤ºb\Ü\Ğó«\ÏZ\İhõÆ™¼pEEIEE ¼\Â\é,qÇ¢\å\áE\Ï!={ö<\0\ã…n{c\î\ĞË‡„<8\ny-\Ğ!W´ô\r\ÅÛ„\È^›£\Ä2°PP\Ñö*\â¨\".B÷º\Ã{÷7Ub¼‚x\rº&t¡;Œ\îet¸!²T\İ\"t\ÛÑ`)B@ğ·¨!e`®\àÁ²v\n/¸\àktIt„‹ĞB7\İ&t\Û\Ñix>³\İ5\è£;\ÅSâ‚«\å–Rì»«\å\î\íq	NO§4ğ\à\ŞIõ)ä˜”_3,•­O*[Ï²TtA)?·{Ê·EKš˜¯7•\èœøN\ìøbDB‚…ÁÁ\Íè¨ I\Ç\Ä\ÛŞœX\ÉöÃ‚D ™JH‹\ÉZ2PO“ôk°Aˆ~E;R)´c¯\ÙZ²}\àyô#x\İatı\ï\é‡p\r=Á\Æq\0º\í\è£{	\İ\×\è4ô\Ş\àı>},ô=(B7\0\İTt\Û\ÑF÷5:™¾‡¨\Ğw\Ù>#£ £ô]D…¾ƒõ¢…¾\Ô\Ûôm\ì\Ú+-\å•%8QP”&B\Ñ4\áò¥	›³¤ş½\å\Ç<\ä¨\Î4r\ÔA!úC©\İ\íj\Ü-UóBmô\ã½jAh\ÇÀbú*4££Ø“W±\åWAE7\Z\İ4t‹\Ñiz©×¡	\İft;\Ğ5£C.CTĞ©ôºĞ½\Å\è\â\èF£\ÓÒ—[°™6úRKlPh “¾HŸA	\Ñ\ãôY\î¿@Ÿ\æşóô¯\Üı ú\Ç\è\Ó-Á4`:`}ı\"L—\è{sl¡\ä@+=ŒcB,B7\0\İ(tS\ÑmB§¡‡iv\ËÌ\r+9\Ç\Ğ\î\Ñø‚ûÀ½Zˆ\Ï\Åc\ÕÈ€*ƒXŸ~H!lW·\Çh<¶\å2ˆ\İtRb«7\"\Å ¶rRb/GŠAl\æ|¤\Ä&OEŠAl\Ôx¤\Ú\è¶\ÇsrC\å£u …^†£t\Òe8J—H/c7ü(²¾\İÙ’Ÿ#¶5^—jj\'M‡H\ÓX\Òt/išEš®&M«HSiº4&?i\n’¦8i:H*p(šH¼õœ`e\ÜMš‘¦İ¤©‘4\ÅHS”4\å&•”\Ç\Ûh¸eX)÷j¹·w :ôûõG\íc¡a\Ñ0ò|u\ÂaÄ—\Ğ%y(™\Ô\ìTfOù\Ù{ó¤\Â=ú”,\Z8”>…Ÿ\Âix\n>@\'\â=…lôVò{†8\0\İTtG\Ğ}.‰Nƒ¹³±\ã›8Z‹\Ğ\r@7\İ5\è¾F§\á\İù\Z…E\é.>\Æ;V”\îô(¢O\á\Í^D„i8PüJ2T\Ø\ä\'– Li9[_\Ñ\è³j­mÄ´ÿ{\Óß›@7PGo¢› €±9\íojù1j#··\Ä†:\Èm‘\ëH%\ÄHı\nh\ä\á^\à\×2¿üôaôKZü±˜¥%\Ö=\ÔNÌ¬\ÔşĞş“¡/üm\É\ÏıCo¨m\"i	½†1\ï½\ê¿>ô\\Q›c\Å\Úz\í*\ÏzÀ_\Ú}Œg]…	[[BW3o\è*ÿ\Ğ?O˜•J¸°CqKhllrh(\ÖW\ã¿(o\Ä:÷‡ø/U¥rõbeö‡Š±)2;›\ç\çF‚¼\Â	\åmdn¼»¼E®“GÉ½\å¹»–Cr@ö\ÉYZ›V\Ñâ¶ƒ™ÿ¸?µ-û¬¶\ä‰x{oœ¥\áó°\×\ÔDN+økhşj™-…ó \Ù.§\Ã\Ç\r\"Ã›Ì€\á©\Íß‹´ı˜\É\ÍRdi¶\r‡\á\ã5Wo““c›\Ë†7Ë£/¨\ÛC\ÈMõ\ÛL×·_\×F’,j\0B¬knô1¿Ûš\ë\ëÁ\í\\>À=À\Ö\ßZ9¸\æ7`Z\Z\Î\\\îs\è@ó–\á\ã\êš\n\Ô7—0\"¨\Şüv€z€|KN\Õ\Ö \ß0¯¾\î€ĞŸ|[;–\Åık\êë‡·‘‰<¨\äÌ‡ó\rÏ§Å…™\åUL\åÛš\Ê\Åò˜/‡y˜wpQ/ª\Óñ|\"aùö4\æ\Ô\Ö\ì\É\É\áy\\*4ò<.õ\ì<Ç¢˜\'\Z\åyœMpŒ\ç9\ælbyšûó,~?f	úy\â?\Ï\â\'^e\â™,E\é,\×we¹·$3yü©<¦™<¦˜§\à?½f\r*( {û\ÖÏ˜\ÂŸ§Ejg¡›\Ö|\Ãò¹\îæ¦‹TuÏŒúô©tl\ÚE3\æ2ú¬\æúÈ¬š\æ‘\ZuO\ß)¿‘<…%÷\Ô\ì)µ\ã\ëöL‰Ïªi\é\ï[™^S¿w\È\è²òsÚº¾«­²Ñ¿Q\ÙhVYkkHùo$—³\ä!¬­r\ÖV9kkH|o8®Û£…Aõ\ÕSRş^j\Ğ#¿Nó…\ë9•\Åı9óö\r»¯öµ£µ²õ\Í\ÆÈ f:–„ö\é@–„2Å’\Ì\ì\rC:\É}uß°¯\ìL\')m‚‚e—6^\n\î\Úy5©xaÔ²KÙ€§° ñ÷.L«mO¯i\\0¼9\Üğ\æc&\×\í‘eŒ\Æ©¹O&\Î`¨mKIEöÀ\È>,Rº2²¸*§Ó¥3şzş/Mû\ÕL\nš\èÁ½$$Ë ±^hOQŒOå¶£-Å–‡\Æz|ÀFR@\Z3u¤»]P\0©0°gÎ¸e—¦©ôX,Kû©’X¤13$]¬‚®[†²K\0°KB\Ñ\ÌtKÿ4´Iv¸‘L°#‚d\'\Û\Èó\ïˆ¸\éFÄ­1¢™£Ìˆ\nX­ˆ¿ jE´ƒ\r1\ìˆÄŸÁ	Yˆ.p º¸ö‚ixı\àC‚?ù#š¾U †Ñ°ı²AEŒ ş\09FŒB6bñ{È…b7\ÈAÌƒb>\Ç\ÈM~İ¡b!\ÇXˆ\ÅPˆ\Øñ\ßP=K¡±Š“§¡\Ç\Ş\Ğ±J+ ,ù/¨\ä\Øz!ö\åX½ûA9b¨@\0•\Éo!}B_\ÄAP…Xø\r\Ô@?\ÄZ\è8$OÁˆ#…ˆ\Ã`\ây‡C5\â¨A	ƒ“_\ÃùGÁ\Ä\Ñ0qK~c9ƒó\Ç\ÃğdL€‘ˆ9N‚ó\ë`TòŸP£\'#vÀ0\é)0±\Æ#^\Èq*LHş¦ÁD\Ä\é0	ñ\"\Ä/a\Ô#Î„Éˆ³\à\Ä\Ù0%ù\Ì\á8\Z\çÁ…\É\Ïa>LCzÇ‹a:\âB¸\ã/ˆ‹8.†™\É\Ï`	\ÌB\\\ns9.ƒ¹\ÉO\áR˜‡¸\æ#^†ø	\\WÀBÄ•p	\â¯„EˆWÁbÄ«aIò$\\Ã±	\ZWÁ2\Äk\á\Ò${Ÿ¿q5\Ç5pYò#X—#®ƒˆ\ëa%\âõpEòC\Ø\0W\"\Ş\0Wa\ÌF\Ä\áF¸\Zñ&¸q¬BÜŒxn†ko\ëÿ\0«“À9\Ş\nk·À:\Ä\Û`=¦Şø\Ü\×#n…\r\É÷\áN¸ñ.Øˆx7\Çmp\âvØ„¸6#Şƒø\Ü7#\Ş· ş	ş€x?ü1ù.<\0·&ßa\âN¸\rqÇ‡\àvÄ‡\á\ÄG\àN\Ä\İ…»ƒ»›a\âÄ·¡¶#\î…ˆ­poò-\Ø÷%ß„ı‡?!¶Áıˆ\à\Äva\'\â!Ø•|ş!ş…\ãaxñ<‚ø\ìF|E|\nK¾G¡ñ¯°\'ù\Z<\ÍñhA|ö&_…\ç ñ\ìC|ö#¾\0#‡6\Ä\á\0\âK_†vÄ¿Á!Ä¿ÃŸ“¯À+ˆ‡W\á/ˆ¯Áa\Ä\×\áHòoğ\Ç7\áIÄ·\à)Ä·\á(\â;ß…¿\"¾O#¾\Ï$_†8€\ç’/Á‡pñ#xñc\'\á\ÄO\à8\â§ğ\"\âgğròEøœ\ãğ7\Ä/\á\ï\É\ãğxñŸ;\àUÄ¯\àõ\äğ5¼xŠ\ã7ğ&\â·ğ\â¿\àm\Ä\Óÿ\r\ï&Ÿ‡\ï\à=\Ä\ï\á}\ÄÁğ\âOpñgøñğqò9HÀI\Ä$|‚ø¿:ıÿ}ş\ÍÿpşÿX§ñ;:ı‹_\éô\ÏG§ö+ş\é \ÓOv\éô¥\ç\èôG§\ÌuúÇ¿\Ò\éqş\ÑY:ı#®\Ó?\â:ı£³tú‡¿\Ò\é\'¸N?Áuú‰ÿ:ı­ÿtú«ÿ«\ÓÿW§ÿ\Ó\éÿ\Ó\íôÿ¹:ı÷\ìôÿ\Õ\éÿ«\Ó[§?ûÿ.!‡\Ól—^A=\îB]›¥D\ë7{6{\é\\­\×\çcoS,nO–\Û\íqû·g\í\İ:2Œt{\Ü x=ø\Ü\îh7\Âøt{K\Ô\à?D·B\èI·\î\Í~¤—†…¶`•:öjöÒ²I“\İ\Êw\r§;”\ï`@Gg‡R¥T\r@§ M¬¶\ÊJ\æ\Öõ(¸J9Ú³\Ø]½\">–”\æBPªö‘\ÂRE9H™¨%.\Ñ\"V=Rv-Rùn!RF\è\Û#\Å31†ˆSBP¶d\É9·\"bi°—õ.-q:²4‘\ì\É\Ö8²œ¥%½{•\ÅRJ\È\ï¤]¶mË†}¯]³‡TV\×OTƒNÈ¾\å—\É\'\ÛnÃ„u˜Ğ‡E\Ö\ÖO\'\ßı\î_·?÷4ù\ë²;ol\\¶õ¦ÆŸ\Z5º¿\'7m{‡%<C.»s\ã2–\0\Ô%ß—rqB¸Võ&ı\âÏ®t,u.u­ì±²h­ó¢÷@»%pŸ“^_t]ozu˜¶:\É4\×ô0u:\â\Îù <|\ÛIız©w©^\nW8\é\×u>º\Ëñ¨“^Ü \Ò\rú\ëüôyõ\é\\z\Üù¤¶{ŸÎ¢óz·;\é<×¬R:«ˆL,Ò›.¢#ƒ|´\Ø[¢1_J¡°0X\ØC¯Ÿ\Óp¨N§ª¶\ë³ôú\ÂXB\Êò‚}ƒom r\á4ûbû»PdÛ©ı\İÀ&7q·\Ñ\Éq¿§p©\Z ŠŠ¼w˜ˆiG\ÏU™\ÈóË—Üæ†\åt\Ã\É\Ó\r\è!}œ\ìĞ±\ÎÜ£ÀŒœ!›«Ö™™§Tq¢g1iøõi?ªÁyËõ*\ë]cÈ§R\"½\Ë]\Z\Ù\é’c¤7›\ËŸW!šôü\n\Ç\ëÿ¾ò\Ã\Õ{tÆ —\î\Şr8ñ\"zÕ´ba\"xi\í\Ô!Ã¦G\"ddbÿ-³oºv\Ì\î\İ3f\Ü~\å\ë\ß·ô¦A«Ÿj[õ·?&ö\Ô-\ëv\äÊµl\Z,¬©;`ø\Ôk²‡\çwö\"wLºuXı‘Y(W&\Æ\Ği8\Ó\nô‹\ës-ûú°”\î…\íf-úq«¼\İ|!Š \n‚ğˆõ\î|:¿cbP|\Øó“µ–•÷./\Õ\Èx;B>¸õÅ‘“­Z‘\Û/‚œsˆü@\Ì_½\İùó\Ëõ¶üs\"”P\ÏiV\ÜØvS¨N¯°\éXô\Û‚~+l.4·%Oµ*\n€\Ä­\'N¶šLœøgÜ¢\×\Ó	s\ÈLÍ\Ø\Ò}d²õ_úi€µ,7†w©\Ó\åt(´sŠav¿Ü•«MùRb9A><t`Ë†\Éÿ¹ó\í¯\ß&\Øo*—B‡\ØGÜz«\"‚KtôG­p‰$kt—\èEı¹d\0E)õ™9™f\äéª*\ådU®\ê¬:İ³8j\r÷\n[K­aG\ØJIb	\ÙôÙ”X\ÒAn\Ù\Éü‰K°‡\ï“\ëpe\Ñ\Ãùûô\Èk\Ú\È\èxŒU”=©=0\0š\n¹\Ï(´Š¡e±õ\ê\Ã=ŒuO7œ>©`»U¨Û¸RSRZ­gqi¯R\Ôrn\ï\Ş\åûTR‰üu|\É\r±‘\é`»IO¢\äw{\Ó\ÅIFb“ ^i1fğˆ‹odOv²AùŠFvô,†%8˜½Â4´\í\Û\Ç^¶#¬\Ã\Ş»)\ëlUª‹¸\Ówˆ÷¤¬)\ßT§Ú?\Î_5&?£•\ÈŒ;\0Bòı–¬JÚ–|?®fU\Ş&*l¨°H\æ¦\ìÿz\ás Ÿ#\ì\Â\ÆÅ½+±\æ*u{j®\×I=\n\Z®J\ÉfAƒi\Ñ]›u\éŸ?e±\ß\ãOH~&Z¥#\Èwj‰›,F£q\Ğ‹\Ñ`4AÓ–ü<nea\É\ÍÂ²\Â\Ğ\Çb\rŒJ\å\Âğ\é¸\Ód\Z4Á¯ah12”†{(ûÀ:®÷E)+h2¹tX˜ó,#\âÆ´:+Y8FD#‹ƒ\"d\Ø\ã\Çq|\Øùöh~]\Ói¬I\Ãjú¹Ÿ_\Å=ƒ†U©°PŒF†,®«\Ê3u¶jT\âGqj¡ª\á/h:\Ñ\Ù\ĞY’\'\âç‹šut½a½\å9³¤“\rnZk\á8\ÏS\íoŸ\â˜\â\ë[ /0Ì°_\ìX\à™\æ[A/\Ó,7¬´¬\Ó\Ü.oQs¿M_×¼nx\Ç\â\í\ê.\ë-I$¾meÃ†\Äñ,6H®F]<)+\Ö\Ğ):\ÊŒ\å\àC\äg9t›CV>/V3K°jY¤µ\í®#q‹ªÀ¾p\ç9@\Ër\0\Ï›ƒ\Ï\ÜÀøº¡ ‘‘\rK8™Ò°7ü{1‚\î¬ ¸:\Û\Ó\ÒNª®»\í\n\Ó\ÈVµ´¬™°\à•\Ë[–\ršÿ\Ê=¯®¸ùÀ®+¯Üµ\ë\ê+\Ïk ¯‘ô{d\ê\ŞDò\íD\"ñ\Ô\î\Û\'w\'nûú™K\æ5o-\ãòõ~F®\Ó\Ã\Ûñ\Z}ª\çõü	£>õ…¸\ÉZ¶@¼†n¢wh\ÅGD¢DDŒ”\Óó¡Ğ³QÂ´i[ò×‘H|·röòsö2sö\Â9{ód8„s‹\×(¡\0”I¬.3«K\"ª—¨\ä1´“*²R‚¿$5ü\Â@\Õ\ÈNT3\\•\ÄZ\É\Æ\Z2öL8b\Õh\ä^¨jJ\éÏ­_\ÛGE\Ë\Ä+ú_ztÈ±©\Ø\Ë*”WG!H\İ@F\É`# ej‹“Fğ.T\È\Z{¹\\¥¤AgULn»]3Á\Äx\Æj\å\ÄWq¢ Ì’‚Œƒ\\,C0\ÈRƒ~3¦\ìiƒmô`\ÜHõ.—\ZR¬”ª!ÔE¯gxŠ‹`x´„‰\íj\Ğh³Q\Ş`\\g±\ÒL;\'\â›Nf±8VwVz\0\ÊxıŸq>ò¿\Õ\Z“H\Ök7\ï\İW\ê«9(\Ö”Ÿ\Ñ>ç—‡\ë\ã\ÍŒ3\Í+m+\í\×\Û\Ù>ñ~\â;\å56<n§>Å¯” ¢ùn\Æe_-ú:œaoP¯h5šc~o–\ß\ï\Õú½¨?µ^¿`\n*môO{GY‰µ¸÷±\'\0\Öå½„\ZõA\ÕgU\Ï•k3}£\ëd^&¬\ä ]*(¤\"n´\î@§\ÒEô\Z*\Òvšƒ\Æø¦=\\\ì\Z˜]Àt1—7\\ş\Ğ\Òn8iµ1^AÈ˜Q©•	22X\r¤aiZ£p¬9(c±•+e³ıeQş¥œº¢÷mız\çW\\{9`ÿ\áo¯|7ôÁ\'\ïÜ½{`ÕŒ#Wıdö‚?ÜµÁş\Ò[_\î®{\èĞŸ\ÖO\ï\É$pbòSÑ‰¼W@Z÷n®\ä\Û\ÒÈˆ½g©oƒ\Çg“\çöa²Q`\Ä\0É‹\èqµ°õú<G\Ğ/óüR)b2º=hµ¨\n“6Uñ:1{¬ˆ)\ß\ãE\ì[\å€¸&w\à\äw<­<m«T”0\Ç&¿›dršjMkMb­u’u¹O\ë¼X™Ÿ5\Óy©iE\ÖZÓ†¬\ë}÷›ô’*p¦3MfQ&\Ø.as\Ê~ıs°_Å›H/|‡\èn§\×a/%\ì¦É–™b[fŠm]º\Ø\Ö8U]¤R\Õ\ÍDDm’3Y\åLV¹+«\Ü\ãj;F ¦\Ä(>\é\é\ÇY©\Ø\æBw©hñ¼B\ÚI®\çG\â†.½¹{¹%\Í|–\ÑÇ§\Zº\Ôr\çI&h´0fIñ\nj\äT.dI=S/örgzóƒª¸¼‹\Ìğc™!\àVibk\è\Ö\×<v\ïU¥#²l†Æ¶µó\çm\Ìj\rù\è\å\ÇÌy\í\æ\Ä\ç¯?‘$×¹\ïX\×|\í•÷dm£—_5\ã\ÚÕ«\Õ}\Ï\Ìi™9õ®Á?\ßt$ñ\ïO™µ\àE¥H\í¨·M\äñ`Lş„I\Ã‡«p\rG]Js”¸:\×pÔ¥T;GY\ËG™/\\Zm*\r°–£\ÄQ\ÃQ\Ç1µ,\Ø\êŒs[»Œ\Ï¥\Â\ÓEÁ†\â\rF Kzƒ \ãzb2\Ä,AP£I”…ƒô û‹PdG\\\Ï~\re4\Â1½\ØFg?.Iúx T¦\Ï,ú”UÁ‰¯¸y¡o#\åq“Ï”\ÉM\á^òfe\Â`0e•U¨J\Ê\n³2Hœ\Ü\Ï\Ê\Ğ}\æ6²‘\Ï÷?\Ù\Z\ÌÖ\ÓL¬«”O¾l(§«¾«²VV’ô~[D}`±Xpºù‡%&4\0m•¨m_J+…\ì\ÂJAªXõ\È˜\'eŒ*M£+ñX¥1Û~a%\×õ]û\ê³.(£NJ­¥ˆU°º¥s5½ûO?İš\èE¦\Ş/\ìÿ\å¼û÷ *»µs\Ó\Ì>K@ü·\Ûùt\Ú8\Z¸\Ò\àFŠQg”H\Ü\Å(;·mwÆ \áB”\Ê\Ä(;7m\rn>\ß,Ÿ\ìsµ\Ğ 8\Ú&6¼\Äo\Ö¿-a‹(ı&3Ù‹=7.9Á5[\\˜\ÆaR…\"\ÕyµS2y6¾Z8÷®ll±?h\ÊøºñŸVgw›ó½‚®X*6´\ã‚\" ¦Q\ìz‡\Ín?f¶d™\íYf‹	\ÕM\Ü\Î:7\ïÀ½–\Ùwt§·ˆ\ä¦Špy‰[Y÷¬S•E\Ê5\Ê&ETşo”Š›+7·\â¦\îŒRqoVm‡H/°[Qò*Z\Ìû~K¹„\ÎU.ç¨—¶B…\ÂÇ¡ÁŠ5ğ\Éu\Ú²ğ%ˆ¯>d	\î~õÁ\Ó\Ùú•Œwo*\Zpd\É\ì4fÂŸw\\|m\ëî“6v\Ûu}«óñQ«o>B´\Ën<ıl\'iR6\ÜpôŞ­-£8\é7$–OI|÷·gnn9Á¾M\Z‡ü\åÁu\È(\0f\Ó\á\å%sT»¶\"\Ù<\\Ä±0³b\åuqa\ìLv¾G\É\æœ\ç\ï\n{y8/Ã‰…¼^Fñ„\ÇTq6Ùœ\'ı]a/\çex”\ç¶AOˆ¹\Ï0l«|ÁLE F\'ô\èa5R· \Ídº‘oN\ï\ç; \Û\Ó3ÎµdL&FğD‹[\Èlø…L.Y_|ó$\ä8Œ,»ƒ\×\è\à›\'Ç™Î¹\Û(fkuTVv\í¦\ç\Ñd:¢Iu\ä$\ßUY2*,\İ>‹C\â—x6‹dÍ²’.?ş¤g/\Ó¶EŠ\Ò\È8&|å½œ$\Ï9\Ì9,ö©ñ‹bIWL®‚«È•\â2\í\ÃRã¥¦•®`\Ù(®Õ®2¬6®5\İ\èzÁú´İ–\êµÅ¯z™§ªE\Ì+Tc\Ì\nğ\ä©FºÁˆ\İ\ØÑƒœ5\ÒQfD-\ÈDM\Ïf)\ØxXGt\ít¤3d2t\ÉcA£%®¢<ZXµ´‘›\ã7W€n¾†¹ùj\änlˆ\ĞF\ç\Ä9<1‡\'\æğÄœFGfK¡:\â\ê\Ø\Üó™Œ”r\Ñ\ä[³\Ó]’\Úe\Ø*ø ²µ!-\\B–.%õ¿©\Ş\ÓªgØº\Ì\0À{\Ö!²Î’h2ñÅŸ>òå‚…\ënL|÷\Ö[‰\ïn¾hí‚¹k®Ÿ=g}Ÿa›Ç­Ú¹û\Úk|y·\Ï\ßñö;fß–\×ı\èúCI \äÈ¦\'\Èø¹«¯›:c\İ\ê_’#7z \éÚ‡vfN˜d!Ÿ\î8€›\ê\Ï\ã6w\n\Ù0\årŒ¤$\\¸K”\n·&X8À(—\Í\\‘Ô_\\\Â]\Â\íT2\Ç­gXcN.£š®%\Åş†ªÙ¨•\ìwœ¿™¶\åK½›\í»1w[9‡[ù6\Ñ\ê¶v/0t²ÃµQfÁlÎ‚Ñ„p“Ø¤\àöŠ0MŸ\Ívlò4”0U\ÛQ\Â\ç™ŸI£rü\Õ\ã\Ê{\í\ÚRÕ‰3kW<Ÿ/^V.Ô¿\Ó\ê¹mı—¦Š\În(^\Ö\Ç;\Â\\\àœ™-\\\ì\\\èY\é½*¸\Ñ{Cp«s—÷÷K\ç§\êwª½Ÿs›s·S\è“7SCsÙºA\Ùr‡U\Ú-8\Ê<•-r~\Ö$ye4[\Û\è\ÜVÖ‰PF\ÆBñ	eö«¡vR	†t²\r3K6d’\rh&Ç­\ç.x›»\ë‚}Q\ÎQ.GQ.G\ÑFk—Y\ãVj\İ\\p\ár—–¡´u-wié†%¤\á7?òN­oıi¯²\\vL> øØ¬ü\à#F2\ç\Ò(0‹w;¯œ>\îªÑ½I\ïƒ÷ÿB\ä§7u\\±ò›{y›>ÿ²\Ë[v]y\Õ=dœ²ò’×¼¹\Øè¸€h\ßü€([\'¾M|–\Øû\èa¡\ì\ÎıG\ï\Úø\ØcLJ ‘µVŒ\áJ(CE\\%\Ğ\È:ª©…*¢õ´\n \ìL\ãmúlsI\Z¸}\â“\ÍUƒ½W©C@w\àøñ\ãBıñ\ã¿<xü8û±IbŒüšô\Zÿ[š\ß\Ç\'‰aEu†\Ã\Ñ^¦Rs­y˜»&<8gğ°!Ç›Wæ™\Ñ<\Ó\åby½¼½+«£\İõ\Âó&«Ÿ8\Ë=+:;o¹we`i\Î\Z÷j\ï\ÆÀ\r\áu1Yma³\Âô–\Üb\Ãh5\ÈÎƒt(T\Ãpz°µº 1s¨QĞ‚v2r\éÁıECs,2‘\Û\èuq‹2º?\ä\ØvXrŠ•\Å\nU\Ú\É.ğ\Ñm­*òs0¿\"t[\\§ö\"½<u“6¦Ï”;:™u\Ó\Ğqºó$\î‘: ¨££\Å\à$É€†“8\ã•\é-5n¤ù[¦ùQ–«¼TH\Ícyo[¯2š\É©#\Ë&–ª9\å¥\Z\É\Î\Éa\ï(\Êm.\ÙÁ8·orc$+\Í\È	f*^?ğ1õ;\ç\İ÷\í\ÒI\Û*³÷n\æzM\\º\æ\á\Ä\î\ã_&®z\í5ò‡\r¹¨n_\é‰‡¾y?q}\â‡\êñ3W’\'Hür\Ã\Ò\é/\ì³vB–)\á¼v|Å•K†®›_2?~\ßğæ¾¹j;°ã‚†;;§o´ørû&¦M’\ìG\ßI\Ìùòß‰m»š¯÷ö5K?¹õ\Ï\ïœ~Xˆúüs»ŸO¼ÿ\á±ü\\qı\íÕ«ŸŸ½~\ËÀ\Í/\"o%;¤zÜ­\É`¦f@ÿ9\Úø¥5m¼ÿ\Ùñ§‘­|®3»2˜Ú›¥3ı”Ò³Z\rC‘Y!<L¹&,<k`=\×\ÎN~”\Ç\Ó|¨\×óz8\êÌ¼~NËœ&f‹\Â÷Nß¶¦‰¸6¦¬\Şzn¨p£C\âX¤+s´suÓ”õ\Âf\å9\éi\Í\å”b\ĞJõd\"­\Ì54+ÿ2ş\Ëô/³N4Š&\Ñ,ô:I&³V#\ËF¤µ\Z£L\0\Ø[øÙ *³0‰\n‹s°8AYXJ”$mP#h\Ú\è\â¸´\Æ/\â”P\ÚN¸\Z\â6£\n³da\ìhñ%ñQ\Ø,±¸a´ñˆüQ\Øl$FV,òK2½Fn’©ü\Ë\ëo¤¤Ùƒÿ¹‘{½¥£\Üª¼\È\ÍU\ì\rF;¿goa\×õps?õr÷Š\ÊÑ£\æ£G\×I)\ÜğfÃ¸\á\ÍÁ1“\ëZE‹ •Û“§pƒğ\Ó{õdé’†ßµğŠRÂ‚=,\Är5²@KÿF\ë\Ş{¸ó\Î{\Ş\"\ß\Ü18\Û_*µÿ4˜J\Ô\Ğ\ÉdË\Ën¼\Ù\î[\0\Ä/¿¬€|²\æ\0ˆ8Sy\ì´]G&FfG\Zu«ušy\ŞK¥ÅºF\Ãu\ÒuM®S\'¸sóƒÎ€.c½w\íùf\Ò\Ç7:»-˜ŸŸ—ş@G:ZA‹kc‚—pg–\Z¶v\ÇMFf\Å4Ff$\ã\"ÿi<\ÊVR­¢\ì¯a jY¯4œs4YŒ«4ã£™Ú¢™Ú¢¬6;«-\Z3úYmF=«\Ã\È80—\Õ`ôv\Çşp‹’/LA=\ËTù¡³š>qş/\äœHŸ6ÿ\Ô\Ê,EhR\ç\Ïz~\æ\ÜP\ĞwŠ»\ë<¹¡ª“œ\Ï\Ã#S\ÇB©\ë\Ì\":\\Òª”\Î*fSXÙ›z’:!bgÏ¥\ÖğY\Ç?f\Z!\á’\Ô\éa,‚;ÿ’r®Ã\ŞBc;Ÿoœ=gÍ¦IMOlLüô[Uq\ŞğÁ\×nK¼C^«\Ügü­»¥öú³.| 4÷PÓœ=\Óz\nc­\Î\Ù#‡-\Êûy‡l¬X0x\ì\n~š8;ù™´\\zù\à\ë}3\èü\0%©9\å\Ïúy|*£T(1Í€Å°,\Ğ«›a«ô°p¿\é€\Ğjz\Æô2œü+`5\Û\Ö@@\È\×t³\æû\Õ\Ğ\ÓÄ¬I‰¹Ò‚À¶l[…;\Ì[ı;ÉŸ\èN\ëkf;dW\ÉR¼\"{A\ÖÒ­’[bµ\İ*\Ñg\Z_P\Ô)1\ËyS\Ñdò†\\|\ê\\|\ê\\|\ê\\1UKP½±ó&#\ë¥\Öœ1…¯38|\np6\à\ßI\è°ò\Æ$ö\Ş\r\í¥\Ä\Å\rT[N)®rŒ™\nlMaÆ‚\Øúd¿\ÄSŸt$Ş¸ó1Rıä»¤{\ßÃ¥Oşa\×\ÇS~ºö¾(\íùõ\ÏOKşş	™°\ç\Äó…;n¹7ñõ\Í_l8\Älƒm¨¿\'£|Y @<q›\Z\"\ÕÚ”<X• ´®ŸıV\é»xvúÁt$\Ä\Ïmuœ1uzş\Ş\Í\Íc8Cs•\ê\r>\n\ß)\Ü\êRşc†ş>\Ã\Ğ?d:ø6œ\Ã\Å=‹«W\Ä{>ö÷’\Ø\ß\ã5·\×M5\ì™ô¸L;³œv§ ñ	®0±™\ÜZ˜8õ\Ö0ğoF\ØrXE\ZÇ»œ.§Í‘E‘ß£\á’ôqy.rù6ò\ãÃ“¯®_\ÖxşÊ›¯I\ì!•7\ßß³v\ämŸ¿;ñ‚\Ô\îŒ¸(ñ\Ò\Ñ‰]\ÓKv÷\îYû\ÅŸ~Ÿ\ÏşRÁ½¨\Û\Ø_ª5@kÜ¡‘‚Z­,ƒ ²Á\×\ë‚\ĞÊŒÛŠ[™<^8OÕ«&ª÷šDM-n\\q\Óı7”ƒN÷;Z\Â\Ø÷‚4O¦‡udFQ4Œ<}òWš¡gq\êız\Ê\İ+\æü²M(ø\å5aµÔ¾;1\à‘„i7ö7i\â\Z|B\Ü\ïÇŸp\Ze™‡\Ä¼K¥ªR¯\áÿ\ÑS±M\å\Ë?”Ä¯I\ßw\Ê\ï>\ÓI´pS\Óğ_Ÿg§ğ\Ş/Ÿ\Ğ\æ\Î\Ñ\ìYú\ì\îœ\Íô\ÏB\Ô?PÿD\Éùq¯/\Ë\ç \ÓrÉ…Z;±	99¶¹h‚”+\ë!\ZW\Ğ,„ƒ\Z!±\ÜhNF’r2’”\Ã$Iaš£\nD\î4~\Â{’?)·R\ÒG½oóù\ãVJ)«›.m\Ê%¹>d>d>d˜ª\'z®jô|?©÷\Äf\\pª©4|—…{\Ğuvƒ‚\á\ÔJfß¢üÔˆŸ\ß\ë÷ø1¦D±PLc‘¨\Ûƒ\Óbc\æ,»*c([Š†‰ß€‚”eE\ê\Âa\Èø‡X(P\ì#°.“€‰\ZĞ½¢\Ösœ\Ó%÷ ¨\á\Ø\Ç-\ÌnFa³\n#\è\ÂM‰—w¼™\ØŞº—Œ~g;!·\Ä_´Ñš\'/W¬#ô\æ«Oõ§!\'–6 ¾ù:il\Óö\Ç\â\ÅM#Ç¬µ~û\Ñ\ÄM\ÓË‰•\Í\åa„UÈ—É{(F#•ùY²œ66\äó„õc\êJlh˜üs+#0ù\ç8~\ÆÒ”½\Û\İ[Ñ¿\ã\İ[Z–ò‹S~·¼”‰¦ü@0å»½©w\Âù&¥L•6KI\Èh9n‚\Ğb\Äa4|\0§@²©¹)õf€I‚;-!ÿ\ÌH\ÈW	a\ì\Å\ÍN.!÷Š¯×Ÿ¥7«§Ôµ4¡m\ÙP¿diUg—\í\Æ^ğõ\'s•ZK­‡Ÿd\Æ\\yò3a:·\Ç>‰+³\è\Í2z©f½i½U£\ã¼\ßj`¬\ßF¼¸q·\èt\×ex^\Ç:¥\ã\â\Óëµ™tm&‰\ïöó¥2f`\ç\ì\Ñ™³vC*;\'RK?‹‰;§\ZT;Q\íqûhû4»h\'1H\Ù~©ô\ÍğnZ3·\í\ÏE‡Ò°\ä».\Í\á\ÔÆ¾£`\0\Ûİ¥¥{÷\ÂA\È\âû¼¾É‹g›\ß\í\Éú\'®}\â8\Ù\á\Şyeu\ã\ÕÂ·¿xÚ\ÍŸqÚ¬\ÒX¦×©=²\Ë+µº>¹ú^š\Şú!úI\ÂZ\á\rA^®Kx &\Ñ|¹\ì&m7H‰_j%½Hz‰¯‹\ì+q-\\&¨\Ğ\0\Ùk¬´±Ø½Ö¦}‘ù\î\Ùks²ø÷\ãı<\Øf4\ÚO«óxú¡\éô:­^DQ•ôY’„!­*kp\'¢\Ñ\ëA¢\"A¾×‚V/P±ö‰[Š%²Cj–H\'$Q:O\Ë\â\Å2Qqg\Ñ,¸±^\Z¸\Ì¸2p	0¨ÿ]+õ\Û3\ë\ÏN¶Y)8³Œw6,\é`GLgT![\"0‡zŠ\íX\Økmô\İü}–¬Uª´U¸?q\ãşÄ‡û¶Qx³¢>u\Ç§ö\Z­lO\á\Ş\ÓZ¦Q\Ì\Ö2­bV\ÊtŒ\Ò+(w\éoE\ë\Ï0?{÷e\Õe\ã`v÷TŠ\Ìeû*Qğ\Ş\ß\ïD\ÒY©acm°Uj³³*\ÅxV%û}Q$•gm|\êY\Åd\ÉÒ†`;$&N$LğŸl\İò$}“Èw\Ğk“\Ğù\İ)©½3¾\Ñù\è/·\ÓO¿Lˆi^ó‘—$¸6n$T‚hU¶ù£\Æ\Ã2M©-OÀ§@ø\ï~eXi~Ë°ú´!µö³’­‘\Øé¿£6ø\×nÖ¿\Û4\ìŸ\"¸\âFm¾;@9f^©iQ\Şù2­5›¬|\rCí„„\Ä>#\é\Æ(£%K£ Bµ:ƒ´:ª7h¸\ì+iÁÿi?|\Ø[\Óô³ıy¶_Z\Ïù¤‹½Œp\äˆòò\ËGØ‹í‚‚Ô”B\æ¯\Ì¢†£ÀQ\ä(qd\Ê(a\å¦®{l\Í5Ÿ9\Ğs”3\Ç\ì\ë™xˆ¿™—ˆQ\Õ\Û\Ê,$£\0ÄŒ†œ-:ö\à¬6NğJÒ‰`…NŒ›\Ò6Œ&3!¼Z`¯6\nN\æ-²~\êa\Z\Î\Ò\Î)õÅ¯j\ÑfQŸV\\n\\k|‡\Ò8\Ì8\Ì\"\ä‰QSwsp¸\Üt¹yIk ’¶\Ò\Ô\Û<Šj\ä¸v¤iY;½C\Ø\"o\Ñ\î”56j1›‹%Šz‚j&S±¤ERkkK\â„R­–ı©Mö\ç$6O\ÓlM6jk§;ÁDz¶Hª¶ôD¬\Óóš\ÔqŒ^¯1C;>°™0mC\ÏB s`\Ë\×*~$ªe±B”6:ñqUš&5I¸\ÒÑ{­}Q_{\ØW—\rU\îN®§\ÙI†¼gO6€­:ö=f\×\íU:ø	Çº«øz¨\×\ÏdüŒÉŸ‘K_š|Ÿco6bZ7®DL\Éö˜õ,6ı®ü\Õı\áJs÷0_¾¿¼\Ò\\R\Î\É}…›~\'^P¿tIŠ:;&ï¸¡põ.\'ak\ÄJ\"\Äz;\É!;=½\ÈT\"LL|,Q\'µÿü\í\ÍCG\ß)üò\Ó`ñùŸ{‰\'~V™tİ…+Iˆ\Ù\Ï\äPú\Zdµ\Ï÷ñ7\äş=š\İQ¦uü…{‰”–¢\í kQ»k©,ZH©NÖŠ7X˜¶\È,¶,c¥j4RÆ‚ÿs\ÓBJ‰&\îÁ\â1.\rª¨†Ñ†i†Å†&ƒd\Ğv\ìFn°ó\äLØ©ÿ\ÌrÓ–û¯·xú¾g™*\rU|’–¤?m\èL*(ü$¶²r\Èg8£\ï…\ä‰\ÇQ\ÍkU\à:YŸ8‡­\Úø\àJ|\î#ûWj\ã%)²¤RF%Ï¶øû=H–¤HI}kˆT\Ê\æ,tv>½ßd Et0ò‡=]ZŸœ%œ)(%¨:q\î\ïzF \í\Ïü’À	_%^ƒ“\İôsû\ËÁ¸·xOz\Ì\à#\Îøp¯…d)YY>—\Ï\'ŠŠ˜ep|\â.\×~ó\ÓfÁ\årû¨\Zˆ[G\ÙG¹\â\Ş:©N7I™`jŸ\ìš\ê\è\ä»ÁuU<AA°\r:G\ÆÀrd\æ\ÜÁ$/û?ó)(ÿM˜œ±eöR–M“\Ì(6Sr\æ\í•Ì¦p\0×Ş¦\0	Xø*d\á¼`\á•[bŒR_Šòıh\Î\ÒpÿŒ3³\ÌHC\×lü¯_64,±+ì´œmÀùV¡\\\Ò°–\ÑX$fõ¤÷ódğÃ­‰ı‡_J´\ï|–\Şx‡øV|qó‹‰7\è1²\Üıd\âşw?H\ì\Ø÷,™ü—\Ä÷‰—Hñ\í%†?$>I‚ˆ(g&pÃ©xp–uA®Ïº@¹ K4ƒ¨Á\åN\íYm™!=\çÛ®ıü#“3_\ãVşi?\Ö\Ó*\é\åt¼=¹Ö«z	şóºM|\ÈL|\ÈL|\ÈLÿ\İı\î¯÷ğ³\×\ï3G}KRC›\Ö\Ì&¾³*u\Ç7‚G6¶\"\İu®Aónyñ-õ_%K¬\'W\Ú\Ö0¢\ç\ê\ÄõR»\Ù6kÿÂƒ‰\Î\ÎG²ñš)\×9L\ì$©.y“ôò°º‘û\â·NmQ»\ÜA\r~1Ä¶Y¡¬ˆ&_*t\ÄúJU®>±\Ò×°Xƒ4!R[$]!¬”6\n¥[a«ğ\'xXx\r^s~Ÿ¸>q{ıR\äK}%±AºÅ½%öZLŒ:óce\Î\Ê\Ø0÷0m¨62<6Q[g\à˜\ìŸ˜š¤NÊ\'\Ív,ˆ]»\ÉS\ì÷»1ÁM÷_mñU²“Å‹}•¢;Ë/õ‘D*8»	r·˜\Û)&,Ø½er‚A‹@µ9AY\ç\ÍL»73\íŞ®ƒao\Ì\îf“eÏˆ=³÷°3b\ÓeÏˆ#\âı\Ø\Ä\ÙÏ£^5¿)Ÿ\æ‡9/„9/„9/„c¨h\r\\pn¾\Ñ\á‚cğ\äœ3r32m5gÄ†Ÿ!¦÷ğ®J°–*\Ï)\Ï5¤a)[š–,²\Ä\äj\Î\Úw3\á\Â\Ø\Şi©²2+\åŠÿ^·´r\Û\İ÷ıõ™Ä¡ÇšI\ísL\Ò.\éüt\çÂ‡QÀ\ŞJ|D|\ïÎrÁ¬»\n\ÖU^qÁ2\å\í·\È\Ìö\'÷¿½/ñÁE\rw‘\Ê¢ÿC\âfN¼˜\Û\×\Ãø\å\\\Ûv£Ì¹!÷a›ÁLl½ı“C³µC¢.­\å(s\Ìa›K6¤¦\Ô\Ë\àÔ‘yf7˜\"P?\Úkó–¡jovn™•…¹eJÚ·¤}Lso –J\ÇüJ\Úg\éñaHD\Í\çù\ÏS\Ç¦øú—\ê.7¯°¬Ñ¯·\Üf\Úei³|nşÌ¢ -¨Z-YV«\Åj1\êl>\Zö:õ\ZûvYr\ëtN—\×tñ\íp\ê\ÄôH\ÜÁf\Ñ\å‚p6W#nd³6˜aª³?Iïƒ1ó]š\Ìo45 a›\Â2ş¾A\Ã\ß14¨9‹sšr„œl7=\ë“\ÎE\îÿT£h~w°]Ù¯O\Ğ\Ò\Ê\ÚsÒ>oMı¸+Ü¸a ²ˆƒœúY\êúu\ÈY[ù\ç…zm\ÜRiQúXm}Ø‚I–p[ËŒ\ë®\×SiÅ•Ù†\Î÷W*¸\ÏR²Cèº–\Úú³^F¸œ.{D\èAQyE¸\"\ã_„\ï¡¾°ò\Ø+#»M‘<ı\ä„K&†‡H\îY³\åü\Û\îKK\í£]q\×\ëh\Îù—&–«7V\ä\ÎK…\ÒòC\æò_LI~&şCzŠ\é_@núË‚X\æƒ(ŸÉ¿\Ğ\á_“x8z9š2¯ŒÂ!ü‚ÿØ¥ß™O)G\Âq†0Cl–‰b4·—P\é¯†\É#µ¡šœÁ¹\ã„zyJ`R·\ë\í\æc6\Ç9\"š!b\"7CDøô§2§ˆh†ˆeˆ\\Æ„ƒ\Õ\ÍË¡9Bn´·¥,R­-š¬NŒLˆ^l˜oZ`5Ë½Â°Ò´\Òr•riNct­°Áp½iƒ\åFeM\Îu\Ñ[L[,[Áô–«0³ùb^],\Ä\0ò¼6±¤gf¡0®ğ]ï£¾¨\ÓTÌ’¨ä”˜L½ˆ\r\ê‚A§À\Ôg\r©\ãI\æ5ğ¯–‹:R·/^\Í1›R\Øú´²F¨†Ds²1N#}…\Ş8cõM¸öv8¡Ÿ\Ór\ëV!*M¦‘\Åd3Ñ6\Ò7²&Y\Ó\Ø\ãót™O\Î>\ÃJà¥‹A\Éc\æ‘\ÙL\Ù7{§\ã!Vg·$l<K§óoKpH\ÌÆŒl–Ù–C[\×\Ûa\Ûx&­\éÛ†‘\'ùñTúQF\á§\ß)\r\ìÓ„‚\ÓlP\Î\ØK[ö’®[-9#f\ä\ì\0:{y––¤\ß_\ä\äò¹ø\İ\é7K,—Stq¡b\ËCl\Êã¦©\Ï^µ\è¡q£§ôM\\<fŞœ«¿ı\ã}?®•\Ú-»w5\ßSYAŞªkZ¹öç»ŸIü\ëò†rÉ“5\Ö\ÔÎ‰¸¦”\ß7k\Ñ3ç½°\Ê|\ÃM«.UZº [\ß}\Ë/}©q\ÙL²Š\Ñ\îj\ç_¼÷h¸ş’9jø	¬ü{\ç°\Z~+ÿ\Æ9¬•Q\r\â\ìÿO™tm´q¯šz[ş¸F%´ˆ}EG\È>’ş\Ï\çq×Ú´rü6s<òQFKş’ÑŠ‰Ô¶œÕ¨\İ\Ç\Ù\'%8[¸)9\Ùğ©\Â˜z÷t\Ö*û šÿ\ZÑˆ>É´{÷Oÿb_Ü åŸ#EŒq}\ÌR\'\ÖiŸÓŠNÆN\ÜF•‰}µƒ\Åó´\Ë-HŸ[ş¯Æ¾>ª\ê\Şÿs÷}™}If’\Ì$!	¢¹*«$5* ,*AD,¨ğ\\\Ğj•úşV­mÁ\å¹Õ–-¢}¦–Òºğ -Ú¿ô¡ô‰*\ÏGy\ndò?\çw\ïj?Ÿ`\Î=sg¹w\Îù\ßşıQc°M/‚$G8 \Êp\à9\r\×\âÀ’\Ã%K[~\á ;<\Ù(\ÊF\'GqWtqtU”~‹B\nÑ„À\ÌT²~Òº\'F”€~•’Q8ß¿\á‰¥$F”\Î5\çN‹Ï¿7\Ñ\êô]¯%…T\ÒÓ‰šm_\Ñ\Ç+ø`m®\ë9Å“ûş£xbñc~\Û{[ù§6(zúA¤\Êvœ\Úüú\ËW¿\ÂdTe¢[Œ¡t\Ä\rñ@2ÀP¹¸\ïd.¹O@‡)3ƒJ\è¯<bóœk\Øğ—şgÀõ%šC‰\ndqR·”\'P¶Z%\éù\'.\È”ƒ ´>ò\Åá‰™†…\Âğ²\Ä#\Ì7\Øm\Øm77Bj‡,£”›k\âQS\Ï\æ•&mÖ¥\İ\'\İ\'¯\Õzµ£šš\Õ&k˜Ãª„ı¤Ci*#‘¯lo‡TòiE–³–$!tù0Æ¼L.õiVa$y®„\æb	\nõm“%´JZ+‘\ç¹:v\ëÛ®\Ä\è!¼cL\Ï\ØY~2ñ]üZ¾—?\Êóüv|\ïµ\ëy\Ï=\ÓMÁkô·<xh2q$\îADıš`\â¹_\ÂSf\Í\ØÌ˜„Nş{³\ì z\Â\ÔA\è\å ROL=y\ÛPğ\Ä0°cØƒ\Äfù–\ÄT\ÊÙªP³\çkiFø‚¾\ßı\İ60S}z`W\ß\Ä\âşÓª\ÅË—s ATPq\Õ>ñJš7ZôœO^(\È¨‚\èƒ}şl\é°q·{Y(„ \ÏózšD8`ü,´Xó?vˆ\Æ¨\Çd\n\Ñöõ¨&aŸ\ÓL­=À©·1C\í6gh|<3\ÖïŒ\Ï`.·g8—Ç­Ç¤\ÇLª\İf%…Hß¢\âGi\"—ñ—iWD\æğs´…‘¥üRmE\Ä\ä#\Ô\r\éH„\Ãa ´öv «HPJ•,\ÇóX	y(\ä\ç\Êt/-rœH4«i\ä‰g\éQslztgE$9\Ëğg\á]´\â§$UF\â\áH$\îh²\\qH×±5\Ó\ÌZvØ²lGÖ¤x„7m‹01rK<·LS–%	“{Š;m3R2KZ\Èh\n“e4\ÒF\È\Ãex4ek–fW$\Û\Ñı›<…´3™˜Ø—Œ÷õ%}ñI£\çú¤¤…?ª€úe&‚Œ¦‰\å~À3„|h¤¹3\è•7„MB6¥ZG¡iA\æ\ÉÉ†\Ó4\êû\rrf‹\æò\îpl—t2eU(Jr5‡<‚\r9\äjF5ˆfG!ô\Ó\âŠ\ß~˜KWP\ì³?tÔ¤\Ïù\ä\×\Å^-¾]\'\Æ\Â\Å7	\çkô‘\Ïs\ì}\É\âÿsû‹c¸\Î²sÇ|šJ\Öû‹óq$\ë·À±„-^(0¢\Ãb,\n¿\àø<b m‰,O£¢ğ%\é\'\×ùP~\n£	’¬”H²«\"5vs\ä~ôı÷\ß/\Î§<ò\Íû\Ğ+\Õ\ç£¸R»\ãø‚(X,.‚x\Â\Ì~Á±y‘\Æ&]®ö’ü\Ä,ó|\Ë%PUk³]\ÓZ…zŠ7½ÿ>ú~qş#B\İ#\ÔV¼¸ÿ0—\æ\Îg\ê™aøy·Q\Öå†„l 74´\éC#\ÃR#\Z\Æ7t\ê\rôù\r]ƒ¾§\ß3\àG\Ñ\'’/\è‘ú RXhp\Ú{6ñbı\ÖÄ«õ;{\êÿ9P/Š\"š\ÅOÁ\Â4\Ç9\0\ØJ\Åe\íeb™x¡±¡¥kkÏkœ.\Í,Ì“\æ–ik´7µoôo\nö°qVS®%6¤*¿rÀğ€t“\Ñn<d¬3ú\r~±Áø\Ò`RŠ£¡ù•>j-s«(®Ö€„pC 	\ãF-\åø~\r#\ÍÆ¶\ã]=\"-şH8¦ƒ\ë\ß:3ºN’f\ÕWYW•{Ö¿D\Ü)Š¥®8PlòU9ª\'ø†\Ã\ã\è4\åh}\ä<¹\æ÷RE‰ô\à¾rZ”Û¯p:—\"³µƒj7\Ôòm\Ôğ¥:.1(\Ş:\ÇÀCV;¸\r<Ä•5-ƒ\Úz\Ûğú6\ÔF\ë\îBú\Õ1H\å\ã\ÕM 17ûl¶Ú”{]\Ø#\àŒ\Ğ.`!=\ìÁö@_4ÀJpŠó@+ø\ÊLeÈˆ/9È¨\"\Ò\í\éÔ…‚E„ÀØ”´ğŸ>ş˜j&‡\n\íGú\n‡<4q\é³İ9\0(°p\Ş\Ät{iÁT·ÿZ[\ê<d\Óù”\íh„V!©©e\ÑÀ^\â7y;r\Î+6¼6ö¦q­÷_‹šG\ß{Ç­\ã7\ì½\ï\Ş\'[r¬úµt\ì\ê7\Îrıüëª­¸sÚ˜Ÿ\İ=iõ¤°¡\'sy\å†sÎ›\Ù\ï¾‚{\Õ\Å—=y÷y\ÃÑú´U?±i\\\×\ç\İBW\Ó=d5Ñ¨‚\ÅT 7\İˆ\×\Ì\ßÊ\æùö\Ì\Æ\Îdª\Ó\Í\éÓ‹3k3Âˆ\Ğ\È\è\È\ä%\ÑK’R§>\Ã\ìŒ~\'¹@Z¤_g\Ş½!Ù›y_\ÛÛŸø¯\Ğ±/U\ÌôgY¾\Él\n\â\ÛM—¿Äœ\Ì\Ï\ã÷Wü;aiV\Ä\àÌ¤Ò„¿)‘´¡\Æ:\ÈCšu\éæ¸s{Ud©®Ú¥®R9/\ËL…£\Æı\àñÀûs4\Èğ\Ê5¨$	\î2JYS\éÜ«K‘¡¤‹\İ\Ì8°88XœŒ\0\å¾Ù“Ü¬W q/\"†\áz´E\\µ£\Ä\"ª?\Òuƒèšª €ôh\ÙÈ¡¤‡€ôı‰”¶\á­Qz{(\éA\"Š•c‡¡S²Z\â\å\æÀ9bB´£ŒZ=_;¤ez\è\İK˜\î*Âmb\ÆU\âˆ\Å\ÔT×±ÄŠ;\r¾9ç¹%›®\Ş\Ğ\í¿ú\åkqË´,{\é\ßn^ö¿£\ï\ïu<ô\ÖM\Å/‹\ïıığõi÷\ï~{\ï.¨2¹ÿ0{„p\İ$úŸW˜XÿQ·\Z‚y0‚2´&´–7¦R™V\Ûb\Üa\"SE4me1\Ã2œ“V\ÅxšS‘%:`\"˜øZõƒ´°°v\ï\Û\åÙ·;;‡\ĞU~\Ç\Ê\ZÊ¤/\n]›\Zš\Z\ë\nuÅÀO°?ÒŸ±Ij’P\àù\ìşfm±¾JV{YŞª¼¬iQ\í\í#\Ì\Z\ÕWš7šw˜¬‰(\ï¬¹4]\ä¶\Ö2ë™ƒ\ÌQb-x[÷˜&·¤I	h\Å\Ìğ\å\êØ\Ç®ú7w5\ĞRN-dˆ&Dô\×(]\ßkÀ½(².P„\ä0ˆ 	D0>r‹\0\éE€\ßEr{D”\ÛE,\Z{Q\è\ÇDN¢Wÿ\Ş-Nµ\ì,™¢œfpKü­\'\Û:|&yu\É1\ê\'^¤|\ÙmMV\ç!ò\Ü„”\Õ\Z\Å(ÿbl\Õ¸ ^\Ò\ÈM_şbñ—|z\ß\Ïÿ3³!qÇ¬{_|\æ®¢»c\Ûö \n¤¼„ğ\ê\rO¦.úõ\ß{\ã_\ÏCh\éC/½\î®T0§\çõ}”Î·†[Ó—\ãË”K\ÃS\Ó\×\â9ü\\ùšpWº7³7t ñq\è\ãğ—±\Ïo‰f2…$eH’”;‰‰™50:·\êğh}Lx|úreº~­ş±ğ\×\è	tÌ°P„Xo–Ix*\Úa:\ìL\ç\ëmÀtš\é|~µ\rf1o›Á\Î$‚: ‚¼e\íµ‘e»v—½\Ê&|‰R®Çl‡²\Ä1\åS¶@\é\Üneƒ!N\ç\Ñ6\è<\ÚA€ûi\Çí‚…´\Ôñ\à\ç\Z¨ÁÉ‰`@z5o^÷ˆŠı\"G\é£Cd\ÅJX? ÷\ÄJo]Í€\"!&f•-“\Ë8\rõ\n\Ù]b.p\Ò\Ë\"g\ä!\ß\"§Ó¬†F¶«Z\ÏÀ»\Ğ|–r\Ğ\ßğ¹;\ïx÷\æû\î\ìúaÓ–¾\ìK7/û·\çW,òŸ>pò\éuˆıŞ”°qbv\Şy\ëW»ö¿³“J¤	D\"UN!\ÔñS7–a\Ò<\í\ä;\åi\ê\\v!£<W•\"^\r*ªCî¥´W‘¦mó>\"|<\É\rvF$§/p&&/HOqf\'.M_\å\\Ÿ¼*½\\X9\Ç-&ŠL=›¥N6š6\×Z\ë-lY\\*­ˆ\Ìü\"]%g\ïuaª,² 	¶ó\â¡g\Øµ&\æ\êD?wˆ€ùõ \íL§_%\×5´lÔ‘\Ì\Ğ<­|m=n£jPe¢T6\Ìa³\ÇLı|i +\'º¹†–`®½U\ïq€lÙ¼§a\Ş=^‘†\Â\ì“y?S\ÂtÀ‡ˆœ#4p¼»\ÜC\Ó\0}@\ÛÈ¾\î‘>ü\Ë\Ïû‡,¦€-xñ×°X¾TU\Ê\rû{\å\Ó\â—(üŸ\ï\":¬l¾ûšúö\ã)\Úğ\é÷­|M=İƒ2D†j¨¾øAñ+»a\Çu\è‘{.º\îY*sB„Vñdbh€[–‘™hJJ¸‰Å‰\'´\ë/\èRR¯\×7&z\\‚«›Ì´TH:«™iEp!\âXQÖ…Q¸?cr9?3¦y*&Ç°øaù\n[o¼…B:Ó²–A	—®Ş„«“\ÕË„Á7X¾Ájº™F\ß+ø•;	û±“\Ï@\ÌCz”ı!zş6\ĞÊŸ\'^C;˜*\æ8R˜x¡p¼|Á\ÑX\Ê1bÁª;R8\ÒI‡#¡K›\í\åß†-[EA\"z¯%;)\Æ\Ì\"¦d\Ã\êÕ¨@\Ö\ãj45·¶£N\\Â§)›\Ğ\Ò›×­%\ï\\v\É\ì\Ôğ!—Ú³‡ı\Ñ\İ[\Æ\\\îüD\Óuõ§æ‘•waq\nûYy•LúÛ¥ª|¸QÍ‡/QG‡¹\"QÑ¨Ö†k\ÚÔ¡\á‹\Õ1\á\é\âõ:õ„ò÷ˆ1°¦±\îüšó\ë.©[Û¸¾QZ5t@{\ãuL\Õ\è—U]6`¾xM\Õ5º\ZW5\î¯;\\õ·š/\ë\ìXTˆlÇ›z\ê\Ó!D±•e ^\Åô2{‰¹\ß\æZ|:m*£«Óš4\ç›Ë‹\ä|`Ë¾v\ëÀ½–\Ç÷Æsc]±U1®‘L	\Ö\Ü8\Ü8V\â\Æ1\àÆ±(¼\Î;\È9`w\Ü8æ¥’A\çD°\ÖO¸\×\å,5Q©\Î\01e€˜2@L™\Ü\ë\æóC³\ß\ä2f»\ÙA4\r¯\ÂğjÖ¨™¤´bV\Ü>M¯\ìÕ…07›‰B\ã\Ò*Ê“N/\Ón\ß\İo•sh`Ñ°|\Ój‡|\ê!\Ïs\ÚMDxŒÀ–¨óP¦”K\ÇZƒô\Õr|ö¼\rê‹–\Şvo\Ü@\Ë6şù\è\r¿ÿşk\ß}v\îŸ\×ÿûg?{\Û\Ê\çş\İ\å\Ï\ÏHN\É™3k\Ø\Æû\Ñ\È!ôÀc«N-øz\ÏòŸ±\r¿\ï}ı_\ïú5]µk†=^\ìG^a¢dIEb-P<¯<\×Êfw\èœŠ\Ä-1\É\Ö\ì0\Ë#\ÆLóbXU´@\æjÁt ª|dy\Ùm\Ú\Ò/£^EA\àF]€›\ÔC¦+S\Ö\à	hór’¾²a¢\å0hˆÜ¨P‡@ñ»\ß\ni}“À\å> eh\Ë\Æ\è\Ñ(^]\İ\írQ†©Ã”†aò\Ãy/\Ï\É\"wu”\Ö\Ó\Ë2´`,)~¬õ„n\á™½™R¶\Ó	\Ï`0°fÇ¤\È\Ø\ÉñrÅ­»\à§_’Ş±3	 @jy6\0õqŸ0C\Ì‚–BºD8C½M«™­\Ö\ì™\ÑhÄ®±aê…ˆ½¦\çö\Şe¿˜\Ğsó\Â\É\ßIì€¯\î|\æ\Ç}W\â\'×¬˜ú\àm}¯\îp/™Ü‘4O\Ñsn+§>\0Sñ#4§gÃ© üŠ\×\áÀB\ï¨W\ÂZZZò\á¾@•\î ¢}T´\Ï\æc0\ÔXhhEh‘·`/’@ı+\Ó\\yD\é†\Ò\á\ï\×\Ê\ë\år¯ü¡|T9#/–W\É\ëüS\å~Y\É\ÈD9\Ì\ÊMsÏ«Ş8Eó<Ã­\ã\Ös¹^\î \'ôrG9\ÌpYn/y\Æq©‡\é•ı\é\ç`ú9…^ŸAÁ‚‚\ÂIpŸ\n%n’t6,	%|\ÈTJ%s\éB_R\Ó;ó€\Úd¾\ï\í\é\é\á>ß³\çd„«=¹ŸbuŸ*NA#`6t®»\ÄsW{\Ñ\r\Íû_\ê´\ë\Ú3†5hu\ï¼gC«A«C\Ëñyş\\®™¿‡\çcÏ‹‡9>\Ä ]\ÅlX\ãl^aHkƒ!U1m›k‰¤\Å\ÔóŠ²VEµ]\íPYšğ\ë£C\è\'\0ƒa­‚OG­k_££¨J`\ç/U¡ğÏ«Æ\ÍE©-=r’E=\Ä\İLûDj:\0\ÜR\ZP»¹y%y`1C²\ÌZ\ÉRRH6\Ä\ã-¢³\è#¯ \rNQôö==\Åëª‡f†\r\íi¾\à\ÑñÜ§¿ÿı7+7\Æ?\Ì\Í>¹~\ç\Ä9”G’µ\Ä~\r¨€][\Ù ˜t:\Ö¬–¯\ÜÁ^\İ	X\'^m+¿\êœ0]˜%³¦ş?üq•<ª—ÿ¢9\è°~õa\Ú4ö;B6Ğ£[œº™*´\ä\èğp¢\nN¸w‘3\Çñœ0LKfU8G™¡\Ü\ÂŞ¬\ìg?\ÄgT#ÔŠy©M.·\ëúLn¦0Cœ)\ß\Æ\İ\Ê?.\ïşÀ½\'>ÿWøFŠ8ŠÂ³,‡)A–\ÈY’òğ€å¸¼FP\Èb\ãh¸Š\ãiBU…ÛLW\æ9p\ÅVKô\Ù\è,\ØÂ–—t¸–¨\Ò>\î\0¨Oõ\êE\å¨=\"õH\ç\"Z];\ÓA\Z…‹\Æd\ÅxğXŸ\Ô#D1\ØXúLB\ÓÿR5v^9A=ù\Ê\Z\r\Ëw§aybR—¢\ÄZŠµ\Ñx\0 1!0i$­»\Ñ\'\È(#\ß\Åb9®\Ó,Ubz{5¹\\En¬h“¥ŠŠ‘a°¹‚\röm\Î\ÂaS•_yRŒ»{8¡¿wsd³n\Ò\Ã›-€\'<\Ó\à°I\rR”©‘O/\å\à’«…\Ã#¡¡©F›\ãô\Ã_lJyoG3=\Ï\æ\éd\Æ24#TƒD\ÂlĞ‹Ÿ \×?(>y¿\ã\ÔkhcqY\ßœùn‘Ö¼½“,€a€·š\è\ê\åR\ä\É\ác¬\Ê\ä\Ä²Á+\ÎT.	\Î\àş^4–^˜ªa\Ã=lUK«w4\Ø;V{\Ø+7O”“\Ïğ\ëøy®ƒ4Gy6\Ã/\æWñı<G¤º‚YO\Ğ\Óo!Zö:õ2Gé¦§¥ş×§¥~E™\Ô÷\ÈÊ³$\ß8Rúûƒ¤Ÿù3“¸3™?\åş‰ñğXğ\ì\ì?:wö\04\Ë\ÓÂ„Z¢\Ë\×\àÿz…	ù,\Å*\ËRõ:vĞ©†/tRA\'t*‚Bé “\n:É £\át=\èA\Ç:¡@{·‚t\ì \n”@+\è8A\Ç:zG)Â´ş¯;Q\Õ[ò\Ü!\îü—\Ø\ÇYş]şxÇ¤lOee–­©Lªv‹H¨I&,eo­Í¯\Ï\ã<‘=F~­lœ7\ÆiC4œ7a(\ã×’#=.=6\ÄA\ì \r·Ì‘ƒ:\İÊ¸T–Œ\Ä\ZÏ¯M¡\\ Uº@\n.¢ND›^ :b\n|})Ê¬@YMiôR© ä’¢W¨gps\r|}\r0»\Z`v5y´—AÔ±‰3ey,°¼Š`y I™¨¯‘\nl\×cnTS$\r\æò\Û\Ñò-gKV\ÏO\r¦H™÷º³¼¢\0}\Ş±\Ù\î%|«rO‹¦§–L\r-ª\rkv\n9z$P\\\Ã?SshuA\ÈZŠA*\ĞkÁô-\×pŸò\ì‚efn\ë§/n©™}ş\âÿ\Ó3c\Î%«GpµLºò\ê;6l\í«\Ã?Yt\åˆG\é{o^¾|ò~\Ğ÷¾o\Ï|BVRmrC<+„ğó\Öv\ë#ö¯¡£\ìñÀQ9YMH\îV=f\íŒ÷Ç¹¬6\ÂQ‡\Ø3Hˆ\êŠnhF@´F°\â?CŒôrq°a\â`Ï¨`É¨`É¨%KF6¢V\Ã;üJ(D\ÍKF¥¹P@ª\â\Ç<» »T0–TDş«“\â”m5R«&~4\Ç\×\Ç7\Æ{\ã\\œ\ÅÍ‘(\ĞMh(\n\Ô\Í{ˆ\Ûöb\ßj\Ì(g3v™1\ÃùÜ­\×u\Î6&Å vR\é\Ï3os\Æ…\0‰	\0ö#§-œ¨`ËŠ¤ˆ\n+Xµ¶`¤©8>ÁP,q7¢@~€­Œ*\Ö<uó®\'\'[JO\Ã\Âq7=\Ç\Õ>ºaô\â‰Cn\ë»	\ßs\Ãõ<üN\ÔC\Õ˜«#3¯3	ôú\ÖH\ÜO\Ù>K›V\Ìs\ç\Ò^^pD%¡\ÆIÓ…™Òµ\Â|Ij±F8#¢­ñ\Ñ\ÖgBtt|6?[¾\Ô\êt:£—Æ¯ç¯—\çX\×;\×G\ç\ÄoAY\àõ+\Ø\ËøË”+´E\ì\\~®²HSbiN´	£*\Ï\ê:\äy}\í†ÀÍ¥ÀÃ‘\ÒK\å§Eğ4û±” (²\á•\Øóa\Ğ\éu\\¾eˆ\Ñ³\ÖI¨2\ÅÁnE\ßq=uR’¾\ä\â†g(\äÍ 1¨‚\Â@(‡Iu€\Ò\çÀ-\0\é2.¹eL˜¦_P\ê÷0ƒ“\ÔQ\é—/§«»\ĞIÔ¬\Î3\é#À‡P4\Õd\ä©üTùjşj™£\ê\n}W\È\Z\æÕe¹\ãc\Ô3÷ı\æ\Ï(º\âóû?,yeóš{6o¹{\ÍfBu.+ş¥o÷\çÿ‚*‘ş\Î\Û\ïüş7o¿EnvMq>WE¨\Âa*\Ñİ¥šuu5Á\âÚ³³8“ \ÕT‰©¸°bqvmV\Z‘º8vqj¦t…6;6;µ@Z¨Í·®-Lõfÿ>?üc\å¡ğ¡Êƒ\Ùşl´†+X…H+7\Â\Z\Ã]lÍ²>V?¯(Zªm°\Ñ4\r”\nÑ´¡2F\" ˆD@	tHz¹½\n²W\éRV)\\\È\"\ëú¹yŸ¸*¤\ëÅƒ\\½ÀR(¡½ ©Bi»òö–¢P3nöƒ^øÁE\ä\æÛ£¡A\Ô*‚ZgAŸ…\Âğ!š;,Îˆ‚–‚ …c‡ş1ş\éa\Ú\ÊÃŸ¡@D#a(¨Vg³e3¾\æ™_w\ï\Ş7¸b\ÖC\íg—-ÿ\ÙsKo\ÚTœ\Ïÿò{S¦<\Ğÿ\Ø\ÓÅ“÷_2¢\ï$û\Ì\îo¿ûö[¢\Ü`\\q>{Ì»Å¤\Ñrw‘Š¸!~.€oÕ„öH{bBbm\åúJ¾%Ô’j¯\Z•š\Zššº&tMª«rU\å>\á]\ç\áS\í³¸5\0Wk…Hn\Õ\Æ\ã1\Ú,<¿¯ı9şQô\Ó\Ä\'©S\ØDœN¦U\Ñ\ÂiLv\Ìhf‚ù.4únO†¡Ld™®\Ùe®2¹Jp{VÂŒ›\àö4KnOÜ&¸=\Í\í^}Ng\ÃôP*‚÷öN\àpKı\Êÿ\å{\äş!\ŞT\Ì¿ÿ¦şM1\ê\Ùh^ô¡¢òlÏ¦\ï\Ø,ój>\Íc#ÿqj™ndûÈ¡¾#óŒhScÃ£\Ó~Yüò\Æ?\Şş›\î§úª^Z~Ó³–\İütq>–Î„\"q}ñ\Îg<qûóİ»ı\Û}\ïı–j\Êw“\É\İE\æ\Õf>p\'6…Å¡\Z®…»ˆ›\Ê\Í\ã–r‚lK²$\ë![\ÖVB*,DF‘\ë\×JHªÎ†PWŸ±Q‚7\\ÿ\Ü/X²¾v\í2Q*\0³<Cÿò\\ƒB™:\É»ó\Û\\ƒ‡¬\ÎcKh:^mAg\Æzs\×\Î%´p·*¼°€H\ä\à\İO?¿ıŠ\ïœ\á…\ç~\'\\\É\Õ>\Ù=n\ÄsucÛ»–ô\í#÷\Ü\Ş˜\İDFfK4/p\â)±	h\ëj¬:µA\'trA§&\èTª “¥?õğñU‡«G\ÈË£rÓ«\çV¯””\ï\Ê=úY\ã¬.Ç’ñØ 	\ï\Åø†±5)ñ\Ù\Òly¶2[­\Í\ÖH\ä\Êu¶@\ï©\í©3i:{nÀ\Ğ\Ü,e¦:§vNıÒš¥¹U¹U~¬=\\ÿh\ã#ƒQ^Ğ®{¦~K\íoj£õQtj‚N.\èø¿W~‚ü(!ø™5‘>pÊ¶YR]^S¸d¶6Â©+’4\ÄQh„\0q¢=Ñ‘¸2±!±\'!˜‰L\â\ÆÄ‡	.“x(¿$!ô±G7L\ßnQ µ…ö\"\Ì A]-\áh\Ä$i¹„Î®XT+\Ò‘ó2´À\ëøI\àYü\Ä\rQ2\â\Ò\ÕL%s	7oB?\Ş\n±­¸\×\ÒÕš€=QYú\ÉD–~*>–D\é«d\îw\à+±ÿ«­\à™\Ê5/z9İ¶·5\Ğk\Ò\Ï7@¥†€§4x¹®\Ğ9¶•~KCî ª®¡¥kH\ï\Ü>d\Õ<„†WsL\Ü3M€Ş³\Ş\àc øE@-zoY \Âl\Î\ébÂ½›YŸ¹pk\åPß¯@Q@³ú\ÃÀ”\ìGC	*/|F„p\áÈ’IAX¡\ĞMc¢e†\Ìš1Q [HtC\nµ\Ç)ş‚J%sb\êÖSYÃ‡kmË±B+T\ë\Ù#×‹)ÄŸCš\Ê0yZeÔ¤˜\ê\Z]“()T_\'+BK1«‚j´^¡hÀj(¬^½º´›YfjP”y\é\Äû\ëj\ëbº	\Ö?À:\È?Šô„HPûfó¾+—·\æÿu\×\ãoøÁ\Ô\Û~9\ËŞ¨\İ4\å‚h´)u\×\ëNŸ¿\ë¶=\ï£ó\Ò—\Ìu^M<?dü\êIco­\ÏÆ­¸6~\é\ìK‡Õ¤+BJ®ù‚•³g­»ü%\Ê[sı_\áşq&†2´z1¨\ÌZÊ¸/•É½t(ŒSK½½\îT\ÒY•@\Òt±LÔ’¦Bt!V5­j¦\Z\ég¨\'Š§h¨_”FË£»\Ä\Å\â*q­\È1D©]/n{Å½¢\0Àf\á|ˆ’ı!É³\Ôüy>´G\ÕeªBQ×«¯5{Æ€¸/`\âh\è¦ygym`_(/vsˆJ´#4»•J4»¹\Ùz³—yy4|kƒjù€tÀVò’‘W/j¼\ë®-/¿*\ÔW>¹\Î:\îSøš¸¨øıúşubc’z\Õ¯>\ÈÕ’›¸ó&I“\"±œ\rE)ñ¨›p\Â-…\ÊI¡¨†BQ•0›Œ\Ó\r\ì\Òh dDKvi4Q2	\Öi\ìÒ˜¡\ÓRh„W¬d‘\Æ\Â~Õ­\ÅÀ]ó\à±d\Èúc¨7†b“’tb\ë¨1š<šÄ‹“\ë““ıI.\é…¼„j\ĞòrI\Ò=‹²ò^ù \ÌÉ •K‚Ôö)\ã£Wù)ƒ5*ChM”8Ã±\æ\Ç\Ïş\Ñ\ìô„*$×Ê»’Åœ\ä,C7ušO‹\ÈÓ“\ÓRŒ.\Ù^t ¡a5\ÑS\È\'ı¬˜ºZ\n\ÄN—\rb\ÛW¾û§;,µGµo˜2\åÁs{~\Ü3\îúÖ›ğ\Ã}[¾?xì”©İ‹\ÛN\î\'3š¤qT2£\nJ+§|\å\×>5|Eğl\è	ú\Î\ÏcÁ\Ú:\ê\ÂRÀVY.^Œ—EP˜\ä \ÊCS¡g0“m­<bª\í6…Š4\İn“£NºE¢\r&\İB\È?*\Ô\ë&WVµ0õ¤\ãA®Î·0QÒgû\İ\Û\ë¶0YÒ˜\Ú\0¦^®UÚ˜Ve3V™¦\ã™\Òyš‡\çKó\å\å\Ì-\è|«´\\¾EYƒ\Ö\à{\Øû\Ä{¥\ï\É?a“ ¼\Ä<¥ü’\Ù&nR\Şd~£\ìg\ŞU¾`>RN2Ç”Fòs”8U\ê™Ze˜\ÒÁ¸ŠÌ»N´…\'ƒ\Ól_D\Ñ5\Õ\İ(µš\0Fb@2Ğ± \çÀ¡£g1\Ïk*\Íñ=P cC»»LS	†3L%)/+aYVã¼‡~\à…Q<(ƒ *2\Ë ¾ICZµäº®¼Šn¸…R/»ü*ó¤\ç\ÊY\ì¢jõ³?P²<’Lôuöu&\ãGuúÕ–K±»\í\Ì\Ê%\Û\ç\çŸş+G\Ãx‚P3B¿(.ú÷CùL¼ğ\Å+\Å¸Ú¾»®½ñ²eø^\ZDŒÀ0ü6Bi%\Å-ø”\æ\Ùõz¯Ğ¼\nuÇ‚ÿ’÷‚¯EË–9\Ş?ó\êX iÁGJüÀ\'<\0\'ˆ\à©ô‚(ø.ä¯¼\í:<b·\0V#p~˜\ì\Ôi\ïYÙ¶pN\0Ú’J/x\åÚ•\0p\ã\Õ\r½\Ú\áphó7e°³\ŞË¾ú <°\åôz…q¨=\ÂË|kz\ì<\Äy\åi_Vó^\è\í1¼Hp¯\ÛD{¶\Ï›EŒFq$˜„dt\r0š0§p¶\â{›=Yd\Ó\Ív[\ï\í¶öAA#´$ˆü\áwa\ÔÀ\rPğ\Åööƒ6KXóƒ\èòÁ i\î¨+gªZ¬t…ús·er-œ \É!!%\'c8A•UCr,&Ä†Å´”R+Œ“¤‚\ÑÂ´Š#¤sQ\ìXÁ\'JÔ‹Ì±ö\Å\Î\æ¥\ÎBqt­s«ğ]q©ôŠ°\Ã\Ü\êü]8)×«v=S¯\×õf\Ó\Îsn‘\î‘cÕC\Ï\ã\ç\Õgµ—™­\Â\ãw\Ü{\Âûòa\î°ùW\ç˜pBN«\0m× µ\áis\àuó\×vJ1L\ÎalI”ò¢™7¨{\ÂYiy}{ÿ{\î0*t²DÀ¡£pHPT»V)Ø—q—*³\íEöJû{¶b+Y°t:¼‰9\ÕT8\Ö\ä¡l­CôŸ§\í‘ÿ)7\ÌnJ\äeE‘9+–M\ÓG\'l\á‡(­\ã\İyŠidm‹RV´§À‹a\r2\Ïy\İ\ëº!#½ Haòq\n¦ò\Ù	ƒ‘\èp’ik†·\ç9J«ƒRşâ˜´\Z‰>n\é¨K§Ï¬¾=\ç*\Ùİ¨Ü¡`e;\æ\Ê6ºÑ¾Ã¦€\Ñi®jñ¨b[,\á@Ï½Œ‡\Ï=81ñXggœ\è±\ä?\åDñoRù¬É†öÿGEwl¥Ú§	3Sgô\èY-‹_\ë?HlƒŒÑ¿·‡df\É:>X\Úybæ„-S¡n\Ø\ŞM\"-©ONTM°±’˜¥şƒ›Ä¬w\Öñ+8\ÑR{·+€|7\á{7‹ƒ\è7nf†\ãŞ•J_^ú\\>g÷Ü¢d¹,3\Üiù…ömuÚ˜F\n…l\n\Ñ\è\ÌÀ)Uğ€†P\İ\éL\íûŸıQ–9|[Ç¢	\ÅWw¼\Ğ\Î5¿ğÊº\Öó¶n(ö¼úÂ€?ı\Ä!û-|C\ßco\ï\ÆóN\î\Ç+_>µ‡ğj“hÿMxµ…-A\åój«”C\à*§9|™1‘*pX° \Â6Á\à3›\n@\ÛP`8µ\ÍtYğŠ\ØMN´\Í2\ÈıPz\Üø‘\Ù\Ë÷\n½\âÛ¦lºÑ¶$’#z\ÒjE#\Ô\Õ\èAUjr.\çfŠ3\ÕÆ£\è1\å1uŞ®ıN}\Ëx\Ç\ÚÏ¾+ÿ^ÿ³õ±\âkT\Õ\Ç6\ã:\Ña—\rƒöLÁ:£(X€\nN”²\nŠ8OXQ’e$2Ï±D\İ7‰ú¥#\Ó\Ô-•h‚XWY\ÍR›Šµ‹\Ù%c+\Ï\Èa†‘Y¬\ïÒ‘\×Ø°¦±Š,³,ˆE©iŒ\Ò\á g¼~»V­˜W	ò\í®B¤ğ6W˜,¬‚z\ë¹F–½WwÁo¯\Ü\é\ï¬‚™\Èe\ëc\ë\Ø¨‚wzYÀ§>\Ñwú»µ™\æ\Z	ˆ\İk\Éö-–Fú´\Õc\Ä+\ÚT((UÑ¦U\Ç\ÚXò \Ï7WµY€³´¡\êª6\ÙM—\nÎ„¨\Ä\à\éS\"×›cT\Â£‘w¶™\è®\â\ãyz`º1¿\åO\Å û\ìQü×£\â7c]\Ø|²¨õıºxf±“Jıª\âöo„’’x!±§\ã^b›‡<\0{\0Z“óC¯\Ç\Ü&\Ï\åWh5\ï^ ,+\ÈSÛ1j\å\ÄX¡„MVe\Ó	\ÓT!\ä:fVuµ¬O”‰¦Bò@2¾;™°\èüY \æR[\Ì4b|\à^Ÿn«O77(¬«»d\æ³õƒZ,Úˆš\ìDõ¸S§\ÖiuúPm¨\Şj<n«õN}h\\t¦33432ß™š¹UX¦\ßj7ü\İ\È\İú÷\ìœB÷…SW_³^µw„?Sş\Zş»\Şg}\îOW¤\r©\ég2\ï2Y3Qº}\Ï\ßæ”°³\ÃLS³o\'\ê`\"\n\å%L˜\Za\ŞyU	«ª¢BU _À¤­4nJ¿\Æ\é\í¸ıe“Œ…Ş/s\Õv\Çuğ•\Î\ëv¶£·š¨šR\èK0ZnV¤uh\ìd­_\Ã\ZyÇ–&\nRÁ\í=©\ìJ\Â\È\É\àõ\Ñ\nÿ„Zi¼¸u\ìP‚\î#z$·@‰SC4 ]©<7…\Ò\î\Z TÂ¥\r\Â\ã„;¾Jl÷ÃŒ\Ú•ó\Æpÿ[‡µ)\Õ\Ã\ÚZˆ.\Òfû¥XfRSŠÖ·ô\é´L=-„\ê¼|\Ôa€sõ\ÕSº·dMõ\ásG‹Ùµ¼Z¼ş…\êLá£\â¢rƒVNo)^û‚UŸK-4+¸ú¾\Ço^½r^xòw.œ9•\Òr=\áŠû-\èW[Q©6—$\âl\ÇoJ\ØACœ\ÍvúW&t~%\ä>½\á^L:p½\Üdµ¡6e<\Zƒ\ÇH\ã\åk6º_&Í’\'[‹\Ğ5ø\Zi¼-•V\È÷£»¥û\äo\Ğ1œJHµh€TÛ¤“ş„Dºj·Y‘L¤…L!\Ü5N\Â#dKŠ’G˜HsŒ\è~ø*ŠŒ”«t\Æ\Û\Ø”“‚¡\à\í\È\ì!²^\ÅW0#R0D\îªõõb\×\è2VG\r\Ô\ß}\ÉX\Ê(·#´AÌL?\Ã2P#ŠI˜\Ö\Ò*Ê¾¨³\İ\ËT²úh\çP’Ì­>\ê\Ã\Zi}\Ü>²\ïcÀtø\æ…e\ìôkdú>%2\Ù/@µõ=z£\'Ñ±$\Ï\Ş\ØFG‘¥WÒ¹{&\êÒ3\é ø‡\Ã\ÛRm²MGu\ÍÍ±6¯jJ´\r‡\É#=\Í\àh*Q+jh…$m®Š\Ô\ãgnšQ\ì`\çôı\ê\Æ[ \Ïf%\á\á[ú¾³B~‚Œ\Ğÿ]Ü—\nendstream\nendobj\n20 0 obj\n<</Type /FontDescriptor\n/FontName /AAAAAA+ArialMT\n/Flags 4\n/Ascent 905.27344\n/Descent -211.91406\n/StemV 45.898438\n/CapHeight 715.82031\n/ItalicAngle 0\n/FontBBox [-664.55078 -324.70703 2000 1005.85938]\n/FontFile2 19 0 R>>\nendobj\n21 0 obj\n<</Type /Font\n/FontDescriptor 20 0 R\n/BaseFont /AAAAAA+ArialMT\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo <</Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0>>\n/W [0 [750 0 0 277.83203] 8 [889.16016 666.99219 0 333.00781 333.00781 0 583.98438 277.83203 333.00781 277.83203 277.83203] 19 28 556.15234 29 [277.83203] 35 [1015.13672 666.99219 666.99219 722.16797 722.16797 666.99219 610.83984 777.83203 0 277.83203 500 666.99219 556.15234 833.00781 722.16797 777.83203 666.99219 777.83203 722.16797 666.99219 610.83984 722.16797 666.99219 943.84766] 62 64 277.83203 68 69 556.15234 70 [500 556.15234 556.15234 277.83203 556.15234 556.15234 222.16797 222.16797 500 222.16797 833.00781] 81 84 556.15234 85 [333.00781 500 277.83203 556.15234 500 722.16797] 91 93 500]\n/DW 0>>\nendobj\n22 0 obj\n<</Filter /FlateDecode\n/Length 302>> stream\nxœ]Q\Ëj\Ã0¼\ë+ö˜‚\åG\ÚŒ!|èƒºı\0GZ§‚Z²|ğ\ßW\Ò:	T`/³š\r»É±>\ÕZ9H>\ì \Zt\Ğ)--\Ãd\Â/J³4©„[Pü‹¾5,ñ\âföµ\îV–\0É§¿aµ—\ÃXòn%Z¥/°ú>67“1¿Ø£vÀYU\Ä\Î;½¶\æ­\í’([\×\Ò\ß+7¯½\æ\Îøš\rBqJi\Ä q4­@\Û\ê²’ûSAù\âO\ÅP\Ë÷9©Îøimd\ç\ÍyÆ«€ò\çˆ6‡ˆ\nN\è\Í\Ó\Õ\áş\à6\Òøœ6Q\Ë\Ô<RsKM²OI\Ñ+)1\ÓS,91³%\Ö>–‚\Òed–/\Í…,®!CyL—¬”. ,\ê6]1Y\ë·\'\Zf©4\ŞnT\áû¬ƒ›\nendstream\nendobj\n4 0 obj\n<</Type /Font\n/Subtype /Type0\n/BaseFont /AAAAAA+ArialMT\n/Encoding /Identity-H\n/DescendantFonts [21 0 R]\n/ToUnicode 22 0 R>>\nendobj\n23 0 obj\n<</Length1 182488\n/Filter /FlateDecode\n/Length 1760>> stream\nxœ\í\ÕKL\\÷\Çñsgx\Ø<Œ\rl.\Æ08\Ü\áaƒ1ø…6—\Ä\Éiñt\r˜\ÚÔŠ7•»È¢Ru©»nºNo¼¨PTEQ¤J}I\í¢R¥Ê©[EU«.ÚªR¥î¦¿ÿÌµ3²²¨ºh\éûÁs\î¹\çş\ïÿ\æ\ï\È\æ™\Ù!…ëŸšLg2[™7Ì¼WUmšŸ[°Ã–\ĞùWO-¼6>ñ\è\Æ\×u\êü\ä\ÜB\ß\é\ê\ŞwV\Ìb¿\Ôùò\Êvv7³‘ü¶\Î[u¬<\Üó\íS{ftşƒõİ\í\'Ó¿Z2+û©\Æ\Ü\İ\È>ØµF+\Ó|W\İü[\ÖW¿ù\ÉOt\í±\Îg6×²«Ÿn<û–\Î\İõ³›*x¿Ÿj\Óøß¸õ7·÷ŞŒ™M™½ûóš÷¶\î­dU\ï4«4ûÎ·³o\î\Îü\"Ş¤ñ»ªû;\Ù\íµÆŸ\ÍÖš•ö«ö½\İ{örÿ´CÊ¿\ë®\ï\Ş_\ÛıùıÁ¿ª\ß_«¶ü°°\Ö÷ş\í\Ö{ø|=ï‡«n=s{—\Èÿ91k2/—³x¾^mUcù£—¹¹­+º–y\İû‹\Íªù\è»\í÷úòy¼p[\îï®¯\ÏQXó„ş\â›Ù;\Öp7»“µ†­\ìŞ5yš{ZHr²\\´\Î™\×c\ì\äó¼ÏºùlŒ«<ÿ6%®K\Åw¼¥ï™meE”šu´<{£\æÂ¿¬¥Pş\è\Ã?»w\Ã>~wÿo¹?\æ>Q/\êËš£]q3v)ÿıH+•[•\ÕXix¼Ç³\á\äpcycyrXÿ\Z•>\î*8šL&/\ës§«p<Ó¥$™\ì*\ì\İ]=\ÉR«°\Ç\æŞ \Û\Ññ©°ñ\n/VUf\å±ÒŠXIa\é\Ç/¾\ëÀ•…	K\ŞJ\Ş*\ì›Û™±˜}ÿ\Ùo•?°÷ò\Ï(öò.ş\×\åŸLƒ~KfGôÆ›>z+­\Ö\ê\ë¬>¿\Ã\êû›ö¡B±2ÿ^b\Ñn\ç¥Ê½a…¼8Úµ}»¹¨Xwsq\ßË½\Ú\Û-ù£÷öRKho-]\Û÷la1ôBï¥\'Cƒ\Öó\äô€B_¯BĞ£pª[¡«S¡ã„‚ß¦p¬\Õz>°\ãv\ÌZ\Ó\é\å\É¬];\Ò\å\'­\ÃNDyRÏ³3\Ê_±S\Ö\å)¬\'\Êû­\Ïz£üŒ¶(?kC6˜ÏŸ\Ì\Ïi\Õ\Ù\ë\n3\Ó\nS…\É	…+c\n—.*œU87\ì\Z±s6MrÁ\Î\Ûh”_¶Kv1\Ê\ÇíŠEy\Ú&m\"Ê¯\ê‰òk6c\ÓQ~C?\Ñ\ëQ~\Ó\æm.Ÿ\çŸ\Ñ{\îWQR©ükz‰\n¹§§³\å1ùj”\Çõı‚(/)\ZSª7 !\Ê\ËòO7n‰¢9Es&Š\æLÍ™(š3Q4g\âÅœ³¶ Ÿ\×W¼g{¶iwl\ÅnÙš\İ\×[}Gµ=\Å!\ë\Õ\é\×Xwõ¾ªôY\×ø\ÑüışK÷ju7ş¬}E3m\Ø7´~V÷}\Ş\Øn›\Ğ;ğ|¼o«\Z¹§Ï¨\îÖµ9m¿¯\ã=õ\Øu][U\æ\ëø\Èv5ûºÆ®\è\è\Æ/iô¸\îòõ™\ÕÃœ\Òq1÷œõ†´û\é\Ğ_^÷C{u±=¼\ÜzÙ¥µ\ÉT\èûKwd–¯¦Â˜òxú\\*Œ+©ˆŠ%\Ê+]±TIiT,S^\æŠ\åJª¢b…òjW¬T\ÒÊ›\\±JICT¬V~\Ø(9\Z*oq\Å\Z%£b­ò\ZW¬SR\ë•×»\â¡ ô\Ô\r¥Â†À«ı(\Ì_\×\á\×g:2¯-´´/¥\Â\ÆÀ^.5~\ÆmI\èg5gs\ál£pv4ğÃ¦\Ğ\×\Z-J›{ösP\Ş\Zø6â¤\ÂcA{*<¼ïµ¦\'ßSˆW(iS(õ\Ê\Ú\ÊO(Tt(TTHt*Tu)T\'t+<¥PóŠBmB] PŸR8Ô«\ĞĞ§p¸_\áÈ€B\ãi…¦3\nÍƒ\nG‡ZÎ¦õ\Û\ÔÊ°k\åœkeÄµ2\êZ9\ïZ¹\àZ¹\èZ¹\äZ¹\ìZs­\\q­Œ»V&\\+“®•´k%\ãZ™r­\\u­L»Vf\\+\×\\+\×]+³®•®•9\×Ê¼k\å¦Zùÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ğ\Öé™µ\ÑM\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ğe\ç™u\é\ÓşE÷\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À—g\ÖõiK\Én\nendstream\nendobj\n24 0 obj\n<</Type /FontDescriptor\n/FontName /BAAAAA+MS-PGothic\n/Flags 4\n/Ascent 859.375\n/Descent -140.625\n/StemV 367.1875\n/CapHeight 679.6875\n/ItalicAngle 0\n/FontBBox [-121.09375 -136.71875 996.09375 859.375]\n/FontFile2 23 0 R>>\nendobj\n25 0 obj\n<</Type /Font\n/FontDescriptor 24 0 R\n/BaseFont /BAAAAA+MS-PGothic\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo <</Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0>>\n/W [0 18012 1000]\n/DW 0>>\nendobj\n26 0 obj\n<</Filter /FlateDecode\n/Length 229>> stream\nxœ]Mj\Ã0…÷:\Å,\ÓEPbšt#Á%\àE¨\Û\È\Ò\ØÄ’\Ëß¾#Õ¤\Ğ	\Ş|\Ã\ÓÈ¦}n½K \ß)˜\Î[\Â9,dz\Ç\n¬3iS\å6“B2Ü­sÂ©õCJ\Èv\çD+\ì.6ôø \äY$\çG\Ø}5\ën‰ñ†úQ\×`q\àI/:¾\ê	Al\ßZö]Z÷\Ìüu|®¡*úø›\Æ‹s\ÔIû…:pÕ ®\\µ@oÿù\Õ\æ[“P\çS\Ã\İ\Õ\Ó\é\\º·÷\Ì\åÿ\İC™…ˆó”%” 9‚óx\ßS1Sùü\0Ošoj\nendstream\nendobj\n6 0 obj\n<</Type /Font\n/Subtype /Type0\n/BaseFont /BAAAAA+MS-PGothic\n/Encoding /Identity-H\n/DescendantFonts [25 0 R]\n/ToUnicode 26 0 R>>\nendobj\n27 0 obj\n<</Length1 24728\n/Filter /FlateDecode\n/Length 14570>> stream\nxœ\í¼y|TE\Ö?|ª\î\Òû¾w\'\é\îtö&$d!	rIX\"V\Óh$¬‚„\Õm„¨(Tp\ß%®0\âMG1£\ã6¸£#\ã®C~ ƒ\è(\é~OUwb|t\æ™\ç÷|\Ş?\Ş÷3÷R\ß\ÚÎ©\åÔ©SunH€\0€\rA„\â	uõ\rô<z\0ució„¦i3¯x\î.@8óO˜9{œöwªkHó\Å\Óf•\\R\Û]ôm˜oS7¥yÔ¶ ½Àró\Âç·‰6a\Ö\Æúk®[øa\ì\ïf¨\æ.i;÷Bõ\çûó0ı+\0\é\ís\ç¯nh°ıj¤7Ÿ{Á%KŞl;\0 ôø,]t\á\Å7-šò€ûW\ïZºxş¢£\ç¼u!\ÒEú‘K±Àº^\Â<²–^¸\æâ«šõ8~ÙeK/X±pş=·.\ÄÉŠX¿\ï\Âù·©Ç‹\ë°\î\Ì–Ï¿p±{k\éEX\Ëæ´­X½&Q\0ocúVß¶jq\ÛW“?q?†ó{\r\ËP-D\ÓL–s\ák¨†m c¹Š`6Î®š>\æ\àO\"—µùò«\ÆÆ§\Âx3|ÿı÷—šy\ÉO¹¼D\Ãñ•æ¯š¿\0/Yu\Î]µø|,]¼`.˜¿f9~l$ûeWµ÷şa©úµGÍ‹\ïÿ¨:\Å/7\Ş÷ı÷§ûÍ \ÎBZ\Í`,Ö§\Ò4•\"86\Ët|	\ä\àK \0Âˆ¥ø(Ç—@T\"\ÖÁˆSa&\âl81‚/¶ ¼A¢4\ÔÒR)6\éK\ÆÂ«°„Z\ÕÕ©D\Ê‘Kw\È3e\Ú\Ôi8«\0tJ¯Ç§“R\ÕXS˜\à¸^9\Ò~¶B ò\Ñ&9\í©±c\é\Å{q=”]\0FÁx˜M0G¶\Ú`\r¬ƒN\ÖNªn¯›ó\á|X•¬K|ô‹\ïÂŸ­\ĞYO\ìoœ\r_¥a\ÉU\â\ëc\çc\ì•\àˆL“!iœ\Çù‹W!\íPLµ\Ë\è(j\áÁ˜šy%8y{¥¸\njHO¤C]b)4`˜ˆ\áŒ\Ä{0\ãÙ‰m0c\\\r,ù\ß=…?{_J¾\äBòöO_Zƒ\ïWô+¡Zxô—_±K\Z!’\'¨¦¨^QĞŒ\Ö\\«¹V›©mÖ•\èv\êıú{ô÷LÆ˜i¾\Çx\ï*\Ü¸\Ê\"\Ú8nL¥	J}s*\ÍdÔJ¸º\r©´ˆ’,I¥%\Ô\rw*-³}µ¸\î\Ëpı/ÀùŒƒ/‚)¨s`1Ö¬ÆºÀöX9\î\Ãb”úü!!Œj\ê\×%¨e‹±f\\ˆ4\ç\"\år\Ä\0¶øEÎøÇº_cm	ö5\ß\0d)o\ï\ç=Œ\Ç\Ü*L3œ\åÉ‘\çı\\Àû˜e\ç\"ÿ\Zœ\Ë-\Æx1\×ó\Å\Ø\ãp´–C”šVı/õ\ã\ß|\è#ğ\âG#=3\Zò\ÈU°\0\Ënı—<s\à–/§?‚a˜¾\é26q5LB¾M\Ï\ÆxÆµ8^7O7¢ŒnJ\ÑmaiU:¬\Çò0\ÌÀ°•\Õ	éœ¿ùü)ZR;K©;¦zô¨ªÊŠò²Ò’\ÅE\Ã‡…òórs²³B™Á€?#=\Í\çõ¸]N‡\İfµ˜MFƒ^§Õ¨U²$\n”À°úPCk š\Ó\ZsB\'²|h>\ÌR\Ğ\Z\r`Q\ÃOi¢VNø)¥‚”Kş¥’¤T)‰9P\rÕ…\Ãõ¡@ô•ºP ›ÌŞŒ\é\ë\êB‘@´§§ğôv6`:D†@½{i] JZõÑ†uK;\ê[ë°¹½:\íø\Ğø\Å\Ú\Âa°W«Ã¤SQW¨m/q%<A]õ£ö\â^6à ¢\ŞP]}\Ôªc#ˆ\n\ÙõóE›¦7\×\×ù‚ÁH\á°(¿0´ \n¡qQS˜“Àx\ŞMTUñn\Ë\Øl`k`\ï°Şk»Í° 5¬_Z4ÿ\ì\æ¨0?\Âú°„±ßº¨\ëÒ\İ?f±q\ëø\æMCk}BG½{Y€e;:6¢½Ó›‡\ÖF\"\Øò\Ò\ì†Ö\ìúZb\ã\Ì\0öF¯4G\É\Õ\Øe€Í„\Í*9¿Å¡zV\Òz^ ª	-\í8¯—\Æ\Û…—c^¯Ò“8\n\Şú@Ç¬\æP0Z\ãE\æ×¥\íµCÇŒKº<JÀóÓš\Âa{Í–¤`÷\ZM©„\Ş04±x°§89K5\Î”,a#\nMB…ˆp$\Í!œS%ƒÅ•Ğ±°\Éğ‰\äŠ.\ÂYÕŒo\í0b\åŒ?*e›Co\05 \Ôw\ì§%óS%r¶ù`I¦\'ƒª†õ\éh8-(`*¢\ZkŠc\Ëó\å…\Ã\ÖuÓ‘¡6s\0#4¡l\çGF¡øƒA¶À[»X€™hûô\æd>\0|1PŠÂ‘(me5½5Ù¬¦} f½5„šü·‘¨:gğŸ\É\ì´\Õ/%\ÎQ½8Y\ß83\Ô8}ns ¾£5%\Û\ÆY?\É%\ë+\ëR©¨m|³à£©õ	¼•ò\ìAb–i\ÖG\Ålü\'s¥^P)y	4DÍ­“\Ñƒÿ”§[¥\ÂÔ8Á¸xô#[j”\ÑQ\áŸ\æGÿ$ÿ“\Ñ\é;¯˜Cg\Í\í\è\Ğş¤®\rPGGC(\Ğ\Ğ\Ñ\Ú1¿;Ñ¾ 0‡:z\èNº³£­¾u`A»û·ú¢\r\×FpK\É(TV\n\ãö†\È\æ\é{²y\æ\Ü\æ¼96\ÏjQBÇ·‹\ì\ÍÂº\æ\0:¼”–²\\€å ‘ ¢Ç¨šWùz€v^+ò_\ØM€—©\Ê,\ì¦\É23/Ã§ğ.š\Æ\ÃNHs \ros„ø²\ÄÇ¬\ÅôK¼Æ¥\'C\ê‰Á£ğ6\É#\è\"ßƒ¾#2o\r\"|‹÷“=Ğ§™Oÿ[‰²ğ®7&i\Âp-¹+±.ñŒÁ[\Ğı‰\'È•‰G°~ü¾\ÃüEd÷ò©H?Où/„O ’¸oF›@£aq\â\Éú¾\ß\àn‚›\áw\äW‰\ïø\éJl¯\Z\ïµ‰§§ñ¶­¸]:¢yn€DN,L,ƒÈ„\ZN¼•ø\0=‚<\0\â˜Â¤WœA¼A_\r·ğL\İBœ\èi‹0^z\n{š„÷©\åptÀ#x_´’&\éˆt\"qY\â3¼‚\Ø Ç´¾ \åd\n}H\Ô\'\Æ&Ş…³ ^Àù²·W<K\Ü)¯IÜ“xğÑ’ƒ\äi©Dº¾ÿŠ\Ä}‰ß¢×’ƒ·¥18\ï9°\0®‚§ññ|M7$6\àı&öüI\'’ƒ‹z\èzº^xo@µĞ‚£]; Š+²À“(›÷\à(|B\ì\ÄG&“\äò5\Õ\ÓEôp—ğ˜ğ†H\Ä_£¼C2ZÁ>ø#¼‡ˆ„\í“&rYAn#÷£4J\ÑoEµx•øƒ\Ø/\åÄ\ÆHLM|ƒ÷N/úL—\Â”\í\ĞÁŸ\àMô&ÿ§ˆ™T’¥\ä>%G\É1ª¡™t\Zm£·Ò‡\èo„©\Â\r\Â\Ób¹8N<_|E|WºFÚªš¯ŠŸ~8~Sü7ñWO$^E\İ1bû9xû]W V<OÁ\ë\Øú;ğ>|\Èô\ÛM\æ’s°—\Õd3¹™ü†<G^%_\â,¿™t4­\Ã^W\ĞU(§+\éMôf\ìı¾‡\é»ô}ú7ú 	™\ÂHa¥pŸº…\ÃÂ§¢Y\Ì‡‹#\Äi\â\\1+S\"MfJ»¤\İ\Ò3\Ò	¹Z^$·ÉŸ«®TmTÿ±¿ ÿ/qˆ/G\ã]¨»jÔ¤KQ÷\Âı¨÷\á\Z¼„ıø(œ\ÄUğ’ \É\ÅqW‘\ÒH¦3\É\Ùd1¹’l\"7’\Û\É]\ä~ò[œÎªp\ìaZKg\Òùt1\İH7\Ñ\ë\ècø\î§/Ò·\èÚ‡#w	!!,Œ&	s…³„\å8‡5\Âza#Jö\á\áğºğ™ğ¹Ğ‡«\æ3Äµ\â¥\â\âNñ1ñU\é\éB|ï—’z¥W¥\Ó\Òi™\Ê^9M.’Ï“w\Éªd\ÕHU“j‹\ê\r\Õ\ß\Õm$\à\ÈCo—Ôƒ{0ƒ>B\í\âÒ‡\éD\Î<Œ\ë0w\Åß¡Fˆ\ãºY=\ÍA=¢\ß1Šük\È(\'\ÏÁ™\n\ìC\ÎQˆ‘?Ó£\â³t¼‰\'¨G\Ü),—^¢AØ\Öh;=Hqğ­¦s\è\İ\èô|BvÁ\'¨\ï\Ã\Í\ä|²\Zv“>2Š\\N*\Èxƒ:…™d#T\'\î§\"ÑI\ä\à\à\nqœó¯oÍ¤\nş_\Ä\ï\r\â¯\Ğ>u\ãı;‚\Ö\íòkøH‰ch\İ´Fó\Ñ\Ê\\‹ú~50«×‚ûl\îGZ\äCğ‘\ÑÉ«ÇŠ—\Â	ø|!\íG\Z‡–ô³ø2ñ^ñ£DE¢w\î2Ø…ûn)ú\î_\ãl\ŞÁ»‹\ç\ÎÆ®E[R‚»º	½\ÅEp9Z½\Ñ\Äİ‰«—$VÀ\Ë\Èû=F¾\'¸#º‘£\Z^Àw¼C¶\â>œğ?ñ~|â‹ ¾$n’MJp?ôI\ë¤\í\Ò#\Òc\Ò\ï¤W\ä(\ípjô‡¨\ÍZœÁBx¾„o‰\Z\×\ÆÃ \Ç[‰co†hDx\Æ/zu¯\ãL*\Ğ;L\Îd5¶r%J\ïn\Ü\ÏO\â\Ş8v\âlø!”¸pF±5¶Óˆr‡\Ô\ã\n^Eº°dZ\íø\Î\ÛH*\é\Z\ìOÁ–nE«Õ‹cú3|Š\ÒNğq\rC»PG\æ`[\ßÂ™°{	Md/®À>¨B\ËZ\'ü\åE\Ì0d’‘¯w¨Ò¡JúˆPŸš¨¤Ë„\'ñŒI`y\'^>CV\â(L8~piPŸcxb”¼\ÆGq]œ\Ø$\\¿\0^F\ß÷lP\Äuª:.XæŸŸ­Ó©ÿ\Ë÷¡Ÿ<ƒ5\ìk—Z•Ê¨Ø«\ZB&\ãöT‰*•\0*A§\Â*I%‚¬\×işı¶Õƒ5¨\ÔC\ÈT\ìùY\Û½’_x~ñ¬a4´šÁŒÔš!djµJ­ñ¨D½\Z\Ç É˜4\éuÿV\ÛHŒ”?Z\ÌjuC\È\Ô\ZµF#i4\"¨E½F£Y-\Æl\Ôÿ«¶\åûP¨øn¨Ã¬V?„L£\ÅW\ÒjEĞˆF­V²Û¶\r\è ÿ{mşı¶U\Z46‹ñ_µ=¨H&C*c`¯a™N¯¬\×K “,zœŸZ\'ƒ\Îa3\İ?oÛ„Ál\ì\È\ã2½_•Á ^²°[µ^·\Ã:¤…Ş¶ƒÍ’Ê˜1k²!3˜ğU›LØ \Êa2™@cPƒÁ\çµ\'•÷—\í@‚}jt\ØS+f­ö!d&¾\Z‹E\r&µ\×b±€Î¤Sº\×ùoµ\íÀ\àr¤26\ÌZC\È\ÌV|µV«\Z\Ìj¯\ÕjY–@š;¹1ş›¶]<\ÎÁI8Á\îBfµá«³Ù´`Õ¦\Ùl60Xu`	¦{şUÛƒ„¯kpnp¸†Y\íø\ê\ìv\rX5\év»·m\Ë¦\r\İÏAEóaH÷¥2Ìº|C\È.|õ.—Ú \Ë\å£C‚\ìÀ\ß\éş*Z†`F*“†Y_\Æ2—_£×«—>\Û\ëõ‚\Ùe\×ğ¼Ğ\Ñı\ì1$‚²©Œ³\é!d\Ş4|Miizğ\êó\Ò\Ò\ÒÀ\ê1§dXÎ\Ñı\ìT\â,¹YƒeA kYš_‹?\Ãi\Æa~?\Ø\Ò,\àY”Ÿ\ÜtÿMÛ¹\nr;Ê…@\î²Œ ¾\Ö`\Ğ¦¢`0+¤*6d\æ?{7H†Â‚Á\n T0„,\Â\×\n™!`.…B\à\n\ØÀ?¾º„\í…ö*Z1†²\âT¦³y\ÅCÈ²óñu\æ\ç\Û \ÛVŸŸ\Şl\'d7¯Lnº_~\Ü‰‘FLeJ0;|\ä²‚\áøz†w@cüğ\á\Ã!½Àù3\'2ºŸ=i	öC½\Ú\êT¦³e\ÕCÈ†—\â›VZ\ê‚\á®É¥¥¥EgÏ¨g?¹ùg WB˜8.•ƒÙŠqC\ÈJ+ñõWVz¡\Ô;£²²²JıP²(\Ò8dt?{21L˜Ê°Ÿ™8„¬r¾Á1cÒ 2-2f\ÌÈ­r1\n öH‚€÷1né˜®¾S\'\Ø]!g§:¢´ˆ:\Ğ%úq\ëñ\ìA4r4½n3˜-­`A´\Ñ¶\Ä¸ª\à@t\Ñ\r®\Ä÷hAÜˆ^>ğ$şsõ\"¦ƒ1\Òı€\Ä ø3!€ñ[\Ü™ˆ\ÙBÌ,\Ä\\y˜9ˆ›8a\ÈCv\ÇB(@a\Ä\"†X…ˆ#8–@Q\â$”B1bŒ@,Gü;J¬±J+¡±\n\ÊG!~\r£¡\"Á~®Z‰8ª\Ç\"~50\nQAÿ\ä+¼OIœÀ•‹8c\Ô Öƒ‚\Ø\0µˆ8N„ñ‰\ã0	\êÿ&C=b#4 Áq\nL@œ\n“§Ád\Ä&hDœxfÀ‰>˜	SgÁT\Ä\Ù\ç@\â™0±f ef\"\Î\åx\ÌB<\æ$ş†>Î™ˆ\çpœÍˆ­I|‰\Ğ\\\Äp\âB‹ q1œƒ¸\æ%¾€s9.…\Ö\Ä\ç\ì\çBˆ\çÁB\Äóa\â/„Åˆ\Ëa	\â\n87ñú\rKW\Â2\ÄUp^\âSô\ÎG\\ ®\å¸.D¼–\'>A¯¢\rñX‰x)\Ç\Ë`\â¯`u\âcôŸ\Ö ®\ç¸\Ö%>‚v¸ñ\n¸ñJ¸ñ*\áRÄ«\á²Ä‡p\r\\¸	ñ¯°\Ö#n\rˆĞ¸®@¼–\ãup\âõ°1q}°«·\Ã5ˆ7p¼6%>€›`3\â\ÍĞx\â_\ĞwÙŠx\\‹%·\ÃuˆwÀõˆwr¼¶#Ş~\ßpÜ˜x\î\å¸nBì„›\ïƒ[\ï‡Û°8>·c\ÉCp\â\Ãp\'\âN\Ä?£gyw\â=ôJ\îÁô#p/\ânØø(\â{ğ\èDü-Ü‡¸@ŒÂƒˆ{9\Æ\à¡Ä»\èU>Œø\ìL¼s\Ü¿F|A\ì†İˆ=ğ(\â~\Ä#p\0~ƒx~‹ø$Do£—\Çğ)Ø‹\Ø1Ä§¡ñxñYÄ·\à÷°ñ9xñĞø<\Ç \'ñ&¼û_‚ˆ/Ã“‰7\Ğócø\nüñOğ\â!\èE<O#¾\n\Ï$^‡\×\àY\Ä\×\á÷‰\×\à\rxñM\Ø\â\Ûğ<\âxñx	ñ]\ÄW\á=xñ\ÏğG\Ä÷\á•\Äaø\Ç\à\âQ8ŒøWxñCx-q>\âø1¼ø	¼ø)¼…ø\Ç\Ï\á\íÄŸ\à8‚ø%¼“x=\ÙwÁ{ˆ}ğg\Äÿ\ï#‡¿ €¿Bü#|\rGÿM¼\'\á#\Äo8‚¿…O¿ƒOÿŸ%^‚\ï\ás\Ä\à\Ä\Óğ%b?ü\r1ø\"z´\Çÿc\ÓÉ¦Ÿ\ä6ı$·\é\'f\Óÿ\Îmú\ßfÓ¿\æ6ıknÓ¿\æ6ı+nÓ¿\â6ı+nÓ¿\â6ı«Ÿ\ÙôÜ¦\ç6ı8·\éÇ¹M?\ÎmúqnÓs›~œ\Ûô\ãÜ¦÷ıÇ¦ÿ_\Ùôş\×6ı¯Ü¦ÿ•\Ûô£Ü¦\å6ı(·\ép›şÁlúÿ…M?øÿa›ş\Êlúÿ«6ı·é§¸M?\Åmú)n\ÓOq›~\ê?6ıÿw6ı£ÿ\Øôÿ\Øôÿ\Øô½³\Úk\rÂ£°3b\0C\'\á\Ñ.•¡D\é\Æ\Øj\çq\Ì.\éIôbbT)//¼¹¤ı °A)\ï\ÍfÅ»»”º—N\ÆE#xS\'«Uö­ÙŠ0P0¥R\Ó0lÃ°\ÃSd\Ğnø\0Cƒ \ì\î5ø±…‡°!S­]xò!8„!AÀ\Ñ?„sy§JD\Õ]\Z=\ëş\Î\å@.¢C;†=a`\â	¦\îÇºû\n÷÷\Å\Ì~s­V¸6` Â`\"^\áö.3—\Í]&[‰Rkn&¢\Â\è\Å@±\Ù\í H\Ş+ÁE\ØØ¥5–˜‘~+z+d+vÙ‰Hx^ÁÀ\è·vÙœ¬ù«b&\ç»,V\\–Lt™\İ%M(…‹‹…\åxğù…õg`¼\ãtŒ‹ğPf\ãTºL\æ’v\ì¯\Ék~¡Vp\â©\æ\ê/³ŒlmÌ˜\ìgm,¯ g<^ps“`ÀC\Ï/¨U¬\Ä8 (\\ø›»4:6¾\Í1³£\äI\ájA…G»_hG*—\ßô¤ Å•\Õò™\Ì\ê\ÒJ¶\×\ê…Y8\ÍY(?‘ ”—ó†–Ç°¡Z‹P/¤\á…À/œ/¤\ãõÀ/4<\Ş)Ü‡¡_¸§+\'\Í\ß{@¸‰s\İ\È\Z\Å\î\Ç&Ukl—ÁX\Ò[«\ÆbmT¸\àz\Şùö®œ\Ê¨\Íò EoÀ\Ô®ô˜\êÀU\ëÀ•\êÀ•\êÀAu°Ÿb	[°f\Ò	—B›plÇ°\ÓL­1hOd\å•ôÁ‚1@Q,õviŒld\î˜\Õ\Æ\É\Ü]zcIÍ“\Âj\Ôó\ÕØ¦\"¬\ér¹KV\nøT†u¹}Œ¡-†\êú¤\àJ.\r2:Ù’<)¤¡ ˜`Ò…Œ˜\Ã­õc)²}‰fB¢¯\Ó7\Ùr³ÿ\Â\ã—Sñ+©øO\É8\ÑK\'7}\ÅGk\Ó\è\'\Ø\Ø<Š\Ç\n¦(=@ŸÅ«Ÿ¾K»\Ù(\è;´/,~zó‹0\îÁ¸\ãı±\àşn\Úİ…ı®˜Á\É&KŸ…‹R	v*\áò¥VgIm6}†>·:?}\ã,ŒŸ¦½xƒóÓ§0vc\ÜK× µ÷\Ó\Çi9Ş¡üô±Tü{z©8}‚\î\ÃÛ–ŸvÅŒlÑ˜ŠE{b2‹~ƒd®©\Èş–\î\ÆË¤Ÿş&–\ã\Å\Ò]]9Y~\ÓlĞ‡\èšXº\ßZ«¥÷‘fr‰:\á‹ÁJ\ïU°F¶\Çü=t;İ®¸+”l¥PyX(\Î..,~Xd\n‡µfz=\Z÷/İŠXŠÚƒAÁ°n‰‰\Ñ\Ú~œ›…v\ÄNjEl\ã)@4Ö\à©\Zz5L\Ã@±õ6`h\Çpˆˆ—b¸Ã¯0\\\ÎK\Ö`X‹\á\"´&m\ÈÑ†m\È\Ñ\Æ9Ú£\r9Ú£s´ñ\Ş\×b`­\ÈÑŠ­\È\Ñ\Ê9Z‘£9Z‘£•s°ñ¶\"G+\çhB&\ähB&\ÎÑ„M\ÈÑ„Mœ£	9š£‰s(È¡ ‡‚\n\çPCA9Î¡ ‡‚\n\ç(Fb\ä(Fb\ÎQŒ\Å\ÈQŒÅœ£9Š‘£˜s#€\äp\0r#€\Î@\0r8‡9\Ì\ÈaF3\ç0#‡9\Ì\Èa\æf¾>k10£\Èq9\"\ÇQ\Îq9\"\ÇQ\ä8\Ê9\"\ÇQ\ä8J/\Ú+®}Y#\Ëad9\ÌY#\Ëad9Œ,‡9\Ëad9Œ,‡SS_Ã…AQm\ÖcØ€¡\ã\íE\Ş^\ä\íE\Ş^\Î\Û\Ë\Õk-\ÆE(rD‘#\Ê9¢\ÈE(rD9G9¢\È\å\ÈÑ‰\È\Ñ\É9:‘£9:‘£“str\Å]‹qüÏ•ò¼4ô\nÒ¬Æ³–¶“|o€c<^Gx|9\ì\åñ¯\àa_WòøR¨\àñE\Ãcl\ÇkÀ¯&1…©Ö‰&`\Z†yV`Øa†§0¨x\ê†0$h¹’)šT\ÓT;T{TO©¤=ª£*j’§\É;\ä=òS²´G>*\Ó@­\Z¸e¿ôµ\ã\Ä\ãğA¬\á©\ZZ†ı–¡-Ç·Œ–)–¾Àñr¨€<U@öm¤VC\'‘[º\0TP8iVô9cıG0T\ä\äE\Ëtı¾c.,g¤¿›LFùJ\ãcöbxÃ•*0”`(ÄÁ\Ï\Ë\n¾Y\ÉL5yC.† †\0\ëœ\ì¿X-j¥‡\Z\È\Ã]\Ï@\Ãú\É\ÍC¾±\ÜbŒºc¹\Ó0z\"–»À_«!û —İŠ\È\ã¸r»1\ŞóŒÕ¿IF\Æü0\Úó—a\Ô\Ë\ÑY±\ÜWüµ2ü\"c•Šg\â¼Y<#æŸƒd\Ócş|ŒÂ±\ÜF;\É\Æ\Ú|ÒŒ7m?Ks®¬dO¡˜4F™1£VC.[x\"C!„\ÅB\èxi‰¢ó÷ùoòCö¿¡`Q=\Ş	t‹\Ê\î&s­ÿ`\á½H\\\ë\Õj={Sq”Åû\Î\Ş\â¿\Û\"\Ùûüwø‡û¯/\ìVcñu8\î-¼‹˜ÿ\Ê@7İ­\Øü\íşbÿšÂı«ı“ıóı3ü-\ÙXóŸ\í?È†	\ÒLw\ïó7aƒ“p\Ù1ÿ„\ìn>\Äÿ%~ÅŸ\ë¯\ndò…\Êd»…™ $\Ùû0”oAv7\Óñ\Ù\İÄ¢¨N¨¶«\ÎRSV…T™ªUºÊ®¶ª\Íj£Z¯Öª\ÕjY-ª©\Z\Ôö\î\ÄQ%\Ì~“\Î.ó_µ”Eşku<m¦À‘ÿ²%j\n“!j\Zi\ã\Ìq¤1Ú»\Z¢§f†º‰vúÜ¨\ZG¢\ÖFhœ5.Zn\ìV%fD+ÂQU\ÓY\Í{	¹>‚¥Qº¹›À¬\æn’`EWû\Ø\ï’\ì%põu¾ \Äsõu‘¸\ëj\Ü5Ö±–ª†º_€\Ö†|\ÜC“\é\Ñ[g6GIDKX\"‘iŒ^Á~Ó¤‡š¨¡¾®‡\ZYi\îÛ¨©~+\Û\ê\"Hö1\'Cm6\"\ä²\É\Ô\ã À\ÈĞŒcd¸FIºdGº ‹Nk€N—£5p:‘0º½Gõu{N“\rp„\ÓÉ†!4¨1\È[·7\'‡S…¤™Q‘\æP€,Ÿ7\ä÷#I¡Ÿ“¼\×ñ†ü„w-ú‘$;ER>HR\ÎûÈ4ş$=o€Æ‡4\áÿ\å³x\\˜tX»şYö\Ë;­¡ú\ÅZ£[\×-uG\Û{×¯MıVONë‚…KY<qtmhq]t}¨.°wÄ³¿Pı,«ª\Û\Ï\Ö\Ïj\Şû¬²¸.6BQš_éª©n®ıI_[ûj®ş…ÆªYcÍ¬¯š\Ú_¨®e\Õ5¬¯Z\ÖW-\ë«F©\á}\Õ/cz\ßÔ¼W\r\ã\"\ã\ÏN\Æ]T§Enõ#\ãœæ¶±L¡{F\İ\ë}ûE »@Dõ¡qQVUX[XËªpŸ±*#û\r­T•{ı\è o?Ù•ª2c±%4DŒ¨1Z>½1\Zœ9·™©JT™ÿ\Ëk¶š=¼\Ú\rõ\Ë\êğ\æ\×ğ€\ïPJXı‹Ïš_zÖ®]»šÁ\Úğj€\ÆhÁ\Ì\Æ\è\È\é8•\n»j­‹`\Ùğ2A\àe{5šú\îD/V†qd\rë¥\Â$ŒT´\èu©h§Ü©¢\ÌUX\Ó\åM/Yñ$\à0 G/Šq÷™^Ô•™\Íü—5]E\å\É\İUÇ¼Áì¡«YYœŒK!&¶go/\Ü^Ñ™\İY\ØY!cé¾‡±\Ğÿ0;JcE°&¼z@˜\\Aa\ã°X÷\Å\Ò\ÒyÇ,GÂ«	—\×Ï…M„>(\ØÕ©VWó\æ\×,H²|uª\\‰d\ïk\ØÖ¦˜x\åZÎ”l$™„\Ìû\ç\ÑF(\æ\àuK\ÃŸPId¹R\Ôjö”\Ê9$ KTÚ£~e·;l>\ÕR\İ_m®>5}5}#Šm– …`x‘x\âŸ``ñ\é¿3d†~\â3\é\éut§\ŞR¦^£\Ùb\ß\â\Ü·\Ë\Ïk\Ş\Ş\Ğ}#h²5yú<C¾=ß¹VZ«¹FR«l*—\Ë\ær\å\Ó![R\åIwH·i^\ÓI5d\Z¡d†™ı©‚8h¶ZwµŒ\É\\\Å\å.\ÕF\Åh-36\Î3‘i&bR\î2S7\ÉS2­…ZÁt\Ü8o\Ê[œF\Ò¹*bRùU\Å*A\ÕM¯\íò­Ÿ\éO5ŸlY9¥oª¹\åTË”¾“}P\Ó2Ü²ò\ã0‹Y¢eD1´––\"\Éb(\03.§K\Ê\É	e\Ê³³´d¤XCü\ã\â¯‹ÿ9¾™\\JÊˆa×¢’ø{Ş‡\Ö=ğò\ë¡¾³N|A¶‘¹d9¹e\Ç9Ñ†U¿ŒÿòØ­LrPrO¢\äpDi¨\ÌhÌ˜£Z§^§¿Z½Qµk£O#»dŸ\Õeõ\åYò\ÜyŞ¼õD\İY\â,\Í\\\İy\âe\â¥\î5\Ş}\Æ}\æ\ç\r0¿mş\Ìl\Ò\ä\0“”\â÷Vù±õlJˆ3­P\ÖX™°¬\Ól\Ä\Æ$ec’*pš<OyXœkCı€@½\Ì\âLš\é\É\í\Ô“Ö¯-\Ö\nZ&±\àú?‘XõT“}+-Öª¢\ê¤\äPp}\Ìõ¯WcqJx¤<hA\éef\Ñò2k\Å\ÈÒ€˜’Ÿ\ÃlEùU”5t}K|\Ç\ãŸ\Æy´·\çº×ˆ…”‹¿\ë\ß\İş\Ì\'Ÿl90ú¾\íï»\åir\îëŸEó&}òR\Å—Ÿú:şCü‡Ieûq(J©@\Ú:x@\ÉÖˆ’V \Zm¶h\İ#A\0Y’(¡*µZjI©\êÀV%S14Z\rB›¡\İ@†bC§¡\× \Z¨.@P½¸Q¬K?bmr\âl\ÆS\Ì-+W\âI¨©\Æ\ÂE\Ğ\ÂL‰\ŞXz•€Kóòh¯­\nw`7“ ™iõˆ\âR\ÜH\ï­$Ö‘¼ø‘şƒ\Òşş§h\í÷\rôŠ~ö\ê\0ñ;œ“	|p‘’-K=ö·0A\"\çJoI\Ôj\É6\à3\ãS¨¹{Ø¬p“hteL\Ã§?½8½5½-½=]J7›’s¢|Fi#f\Ñ\ÊSa\\SœN\r“­f5[º•¤GŠ\ê\ît\ØeY%‡BŠ\ë5²¼,\'7\'tyg¬dÁmS\Ï{ñ\éû÷¬\Î\ÄòNi¿3øşM\İ\Ë,ş·\Åg\â­\Ã\Ô6-5h±c¶F8Gp@¾S®¬2M2©:Owş\ÍNcghŸñˆF+«e­K\íÔ46L*µYc±\í&»y¤q¤i‚i­ñó\ëZ\İÅš‹=\ë\Ò7k6{®I—5N»Fo2\Î4®5n4\Şl|À(½\İ`Ğ›ôƒË™m3\ÛI«½\ÓN\ív™¸PpP\ÑmQrÁ`6P\Ã¾\ÜN9*÷Ê‡eQ\Ş\Ô\"Pqˆ†‚¡R\Ë±ğG©¡\Zœj\é;\Ù\Ò7 \\r-+1&¨úU›†‡[Œ—›O,U0°V¶0–pyªœN—-(§¡\Åò£TC·\Ò{³ı™§[/?¯+~\ï[«f³¤ú½7Ï«61\ë±Ï¤ı\Ó^ºò¡·\Ó*¯\Ùÿ\Ô\ìû\ï¦f5›|–^b\Öd\êL\ÊX«”P‘¦X,–š4mšv\ÍvJ&\Íªµ\Æ\åòŠ$\"u“BE+«¤˜Ê±¬E06\Ñ6\ÚN·S‘z\Ôı&\ç\Ü8½y/U*#\ÕSN²“¡~q\İ\Ç)aJMZPËƒ<\'>ˆO¯‹OŸù\î»\Ø\'×›\Ğ\Æe\á¨<Ğ¡Tª\Ô*ÊŒ‹¬™  Q©™c¾\Õ|›\åv\Ç]Î\æ\'œo;>‘O\É:ƒ^N…*Û¦\Ñ\ë†CFbLnX_“¯\Õ\'´ù\Ú}4\à+öuúz}¢ /ğ{z=‚‡-”÷Ÿn\Ø>¾Xl°+mA‹U›‹÷¡\ÙHC™9¸\å7‘<mÛ¯Ö·{I^ñG~û\Ú;\ë\í\é\ÒşÓŸ>Y9÷\Âsoı­>÷î­‘ùw\Í^Š«“Ÿ‹\ÃÅ±B_k¥²T\åU§I\éN\ïd\ßÄ´I\Ù\ï™?°hFz\Z<g\æ,ñœ›sMÎ›¼{{|\Ï{_ğ\ée\Ù\àp\Êg®œ\ïˆx.¢\×Ğ‡\å\Ç\å?\Èú§\Ê\Ş1\Óô¬’–a†,%<¼,K\É\ÌCğ¤—­\È:E³\ZÒ™/6š\ÊÆ¤H7§G\Óÿ‘.¦§#¥ `©	]?\n³ƒJš¥&¨ø\ÌnoY\ïB‹*½A;Œ\Ù\n¬\ã1Vó)†!…¢\Øu#r\Ôùš<CÄ¯ß¡§~=I\è‰^1:\Ëô\Şie¤¬\×õúbBHi~p‹|\à\"\Ó\\ó\\+\\‚\ËSº¬6uP¬\ÂCue_;-\Â\É\Ü\Ç|\Ğ\"¢\âôct²%ü1\ß7\á½2?«9V”NVFú’™\ÈJô>\áK/›•µ(‹¶„#-È›I0š“*·²…Y©Ü‘#KÙ¦\ìNWW0W–q)\Ë\ËF¬ÀÃ¥Œ4„\Ù/‡W‹F–“Å‰ğk‡v7\n¾\ìø—:³J˜ø`ËƒOÎ¹\ë\Æ\ç\ÎhZ\Ñ8‹œ3òË¬Š\æº3\êK\Í:ú\áğ;oly\"\Ş}\í\Õg¤Ux\Ô\r\r±\Ís¯kL\Ë¤M¯\ÍZ\âÎ­=§$§\"k1Š|j\Ã\Í\Ün§Á==`M|§Œ\ĞUUø&ø¨u<G;\Ç9\ÇIûV%—‹£\r£m\å¾z±\Ñ\Ğh«÷İ¬ºC£\Õñ\Ê^ve•Tv¶6\ÎZWP\ím\Ë \æ|*\ä˜\Ø\'=iƒv\ìÏ“^“”÷\Ê\ê)}ıÕŸNE{´\æ}L\ß\Ñò¬\ÄSx|³¢[\"/\Ñ.q.q/K“Z\"\Ğf\çŠÎŠ·\ZX®Ã†÷CRd›ˆ\ç\Ê\Ø3ñx\ÏY{kÙ¤KZ®\Úx\î\âkğ:qsü³ø?\â\'\â\ï¹›<4­m\Ç\î}÷\İ\Ã\ì\Ïlœ{\r\îüU™\ŞlŠX#Î¥¦e\Öe\Î\Ëİ—xn£·\éÿ`şƒûmó[\î/\ä/\Ô_Ø¾p|\'\Û*m•\É\Ö\É\ÎwD¿L¯\Ze­pV¸…‹¤‹L›¤kL[<»¬;=\Ö}N‘k¨¯ŒÅ[\íe\ÆR+ñd”ñ\Ød)3\ì\'\"hQfV‹$\é t;\ê\é~B@Äª€KEX)	B‘%Áih^¼>U\Ğ\îñ6\'E\Én8\ìJ>\ÙfW¼\Ù$\ï„\'F”i\êÃ´jd…Ä”\İQ\Åñ¿N[vù†ó›–8ˆ=|ò•/\â#Î¾g>¡\ÇJfÎº\á‘\'\ï>kE\Ñ\ï!9D$*’½“Y‘Y(»ù)½Ù®Z#rD±&µ\åvT\ï4š¶Œö:J(Ór”y&uúÉ:\Ï\Z«‹ibÔ©Œ&ö‡}\\ùFCašb2wÓ Ú“\Ş\\=8Ã•§’\ZÃ­xò\ÏO)\Ô\Ã2y™v™5©-rK$,OM¯l.KUq~ü‡Ú½sŸÀû\Ø3±+‰§\ßZTw\éü\Í\Ï]´\é\î³\"$—¨‰‘xn¦\æ\Ómœ±ü¡Ÿ¸oÎ·ç›‹ºb‡4ò@˜qŸ4\èª\î\Ğ\Üi¸Õ¼KÚ©= 9`\èöª\Õv2‘N´\Ó2vö\Éû¼\Ïk_Ğ¿¥=¢ÿNõ­ÁfJs(h!Š\ÑRfr<\å8\ä\\2jxltaL¯SğŠ`m2¶\Z©\Ñm%\Ì\Çóø\ÊH©•»é¤{‘™ŸŒÃ…\ÉØ\ÆcÅ„æ´“}\Ş2\ã°\çY­Ì¯uV7w–NAR\äH*QQÆ¼Œ;2\ÄSP­Le(ğ”5ÿ\Ä\Ï\èc~­İ­\ä\Ùk\ÜJ†	M°›\Ùj\æ°EjúùmÒŠƒ@\n+YS¦šÅ±R4³\Ü\É\ã€\Ö*6è˜‹E\Ñ.v,\Ï\Ök¸Cù˜Y\ĞŞ½QA)Y§F\Ö=:T®\Z\îtFğ\n¯\n‡ñ.S\ÊOK´„©x\0H¦\ã ù\Ùic{@%»\è÷\Ä=ò‹=ñ¿]½Œ\Ø_\ï#V¹_®œ?nn®pñœ³««	™Qt\ç}\ßğ>\êB8ş|ü\ÉË·N$\\ºaüø\Õ\Ìn¸q|Š^ºô¨H0,±\İ-©Å§\Ü\Ô\á´P»\Õi1\ÚL`6\Ú\ØWG»FmÒ‘yº„\ê\ØBheb19I\ÂIœ,›Á>N`\ß*mv­¦´F=Mİ¤\Ôy\æ\"\Ë<µtQ1m9\Ô>:½N\êd:¡Ñ—9=®‹{\è2H®š\Ô\Óx¿9İ‚\Ï\Ç\à\ÆmÂ®xjªJLø¤\Î![);qps¨¸Up”:Bh^Cî»«\îX{ñ\êœñcÇ”¿öZü³»Åœ¦k6\Î\Ìú½¹jz\ãû§Ÿ&ñ½Ÿ.¶òD™ª,¸(}S:µ\ê\rm#®1´\ï¢B1)¥¥‚B\Æ\Óñ\ÂY¦ˆ=’=\'.\Õù¦\ï,\ßÙ¬£\r¥\Î\Ñy¥\Ã\Z\ru\ÎÆ¼ºa\'ôı.\íõxf\ëô]Şktº…½\Ë)º³\Øxœ\ï\0®\èFW’.>\ç$7@(;(Kn\Ã\Çşy38~S.‹Œ\ÚB&pC\åö\Èùº¯›\Ç\ãõnAF 	\êV´Pš´zŠ­\ÏÉ”ı1÷™û?8¬úO®J~±8ÿw\Ã\Å\á\ê‹\×k¿SW±€>\ÂÀ·’\Û-\Ó2û²\ìsó—„—\É\ì”sIN\×À¹_&,¥À.tJ\íx\ç\àEÁfÿÑ–]Bj\Õ\éys–Wd\Û\ë{ßº|!O=\×NTc\Ûl‹ı\á\é«ZÏ½~ó\Ò\ÅW5\äV:2‚\Î¡s\îzôñmoñş\æ–\Ó\î?¯º\çz#½\ê\×÷\Üw\ïC÷ °n\Ä;y\íºbJ\ØDü¤Š-¤ygùùÑ¨$§”E›-K-!\Ôf·Xm‚jº \Òhµv‡\Ö	 \Ó\æ¨5J «l†$4Dƒb\Æ%qff•mwwºi›û„›w7\Øsœn¶¶\ÓAN8ˆ\Ã\ãªI\n~\åª0»	Oe—\âğ©T\Û\æ\Äô¡L]üz¥\æ—d<\r\Ø!ƒ:P•\Ëøq\'³$Ù½ù\ÉùwOK˜>¦ayi=“şOvLlÛ¼­ÿ:b\ç\Üòº-\×ôcj²¿øE\Å$û\êtQhpd5m¢i\Ò\ĞvMTÓ«9¬9®‘üšV\ÍM\'H‚¬IğS€ı_*ZğN$K²J\ÔR™\\ƒYe¢Gš×ó¨\á\ÛóGg7\çªğÀç«›’Ÿ¯\Ä}DŒŸşa²˜óÃ»¸B[p…\æñ¯güû]K\róİ•\Ë=…e*Á,\Ø\ä\\\Íyö)\íš—µ\ïjµ3…V\ZTnMƒ|¦z,\í\Ó| ö‰§\Åodiªjªz‰|¹x­x—x·t§|§\êNµ\Ö/Z\å°–\n\äUº\È\Ğ(6JZ¼“j´\ZµV\ÒjY\ÔI¢Œ³N­\Ò\nZ­N\ì¦*^©H]\åG\Ï~±\êrH;öYÇ£¯¹,u\Åfóö˜O­t\ã2\ãŒ\ÜÑšj\Ü%›\Ôèª«v“x!¦	–A8\Â·­ú*¼Q³[ 	ü§²l!2‰Ì\ßB®¿\Zÿ\æ*t{N‘uñ_õŸC\Ş\ß”ùrƒ«9³$”Q>[K©I¢\íRT\ê•K\Ç%\É/µJ¤N,(ûS˜Z¼³X5ğˆ?[µ\Ô:•&\×H\Úÿ}öµ@¾­b.\İù\Èİ‚}\á)¤w\ÈN}™P¦.s—…\êh½º\Ş]\Ò„¢ü™š\Öüöüù\Ê;U\ë—\×Gó\ç\Í7B~Q~V<•ÿA¾œ¯x\Ó\Êj0\ß\Î+%UPTy\ÓÙ±Óª‚üôUf‹%×—––“«E\Õ3™s¬eny«…¬@E\ê¦\rŠ\É\ë\ËIOÃ²i¤5¤a\Ùc\Ù\è@²W —_B45,VF\â¸s‘4W©\ÅP!+·,W5¦¬(÷P\î¹‚)×ŸÛ+@n ·87‘+\æzò>ªp¢R_q“¶²ú÷x$Z\ÙÂ¢­k\æÛ·¦}{H~o «\Â\ìX\"a[\ĞÁü#÷’\\N¾•s·ò»z=¶ö.¹µ¸\áş³\×ŞŸ‡{;=wú\è¥\Ã\ãŸeÔŒ¬]ZÿLÌ¹\á×³fÏ5\ï\ìº\Ûû#tŞ½Ã«\'n½5Ni\Ã]s‡5l¼£ÿ4®\Ù\r\Ì\Ú\áš9a‡\âV\Ù\\¶¹\ê¥j±[$¸Z\æ:u\é³$s\ÓfQ\r²^§Ã«*%9N\à¦\rûsÿÌ´iu9z#“¯Á ´pzrO¹ŸZ8.©Ÿ¹\ä\Æ¸\åbÒ¸\ĞĞ‰‘øgYÓ«&­	£¡¶¾\Şr\ç4?\Íxtqe\Ó\ÆX\Ü/\æ\Üı\Øø¥/cvm\Ş_\ïÄ™\Z\ĞÛ¹M™ø9ùLı­\í[‡ø<ı\\¢V\ä\ÑĞˆym3â¾\Ş.ß®¾Mß­y“¾\'ıYó¦ş3\é3ùsƒy§úeúGùYõô\ÒZõy£Z°p-Ô¹˜ˆ\ì¢\Ê^¥ò¶ú\Ú|\Ôg\ÂOÜ“¤“—¼´œ~še\æ%xg_\æ	;úH‹­ÌŠ\Ób› ”™•“=äœ›\Ñ\Ñ÷W¤,ş\â±\ã\ßvÀ­Ë—\ßr\Ëò\å·\Ò\Ìk‰\ÜşøWñg7&vİ»kW\çİ»v±ùn_ Ş†ó5£r§2¼\Ò6\ÑF­eB•¡\ÊV\æ«&&\Ù\ê|ÿği˜;à·œRıÃ§\Æı3ÔŸu\êtf“qÀŸµ\ä¦³™;*ºÿ\ê\ÑN\é«Æ…4ü3Ÿ–ŸM\ì¼g>\í?\ïa¸’l\Î)§–¹*?\Îz+‘K{^¡ñ\Ó=\ÍÛ¦\á;¯_²\à\Êk»—¶iQü/ñşø©ø;\r³û¿zºv\ßÓµóş¨›\0„\n>÷]J\Şm\Ñ\ÉLi‰´VŠ¬\ÍÆ¥\Æ6«¨Õ˜ô~=İ¦O\èi~š\ê»\éEJ¾J…ú-PY›\Z³¦XÓ¦5\Ş\r\ÖV:ÏºÁº\Çz\Ø*ZÍC>J\ÛI\'¡\Äc©\é!i0\à\Öªó©Ï”\ä5%\Ú]U’\ÅJhŒºf²û\ÍmŞ«-©D9¹N^He\éd\Z=şüº\ÖÈ™ÆŒQ$\æ\Üv~]ù7\Ãk‰…s,F}6\ã\è3J¯l‘C\ê\\—\Åº\İz»ı¶\Ü[\n4*{ƒZzŒ\Ï?	}g8•)\çfn\Ñ\İfİ™Ù£WÕ†”¬ºœs3\ål²n²_“yU–¦\"§^n\ĞM6L35\Çeª2³rs*ô\åÁò\ÌòPy–J\ÖJM\Ğm\È\Õgff†TY™Ê°\Õú‹\í—8\Ö\å¯-\Ø\ì\ØXp§ã–‚\Ç2\Ú\É6×µ\î;\n~]&»‚N%*s*iş2¿“|€WşRu°){[6\ÍV\Ü\ée\Ù^ö1Kq¡\Õm\ZFŠ‡‘¢adXF°\ØLÌ¥\èö§,sò\'KÚšä¹¤1\à¹¾¸›‰ü4Z[ş\å*eA\Ø\×qfW\Â}<J•r™™8IN\æ\È`Cp‰¸‘e®SDK\\Tô3iÍ §y\Şy\"òtM^\âm°©\ĞgÀ\ìú:ZVúz 3ñ2»q»“qfw\âhWF\Ë\íòg%ó/\Ï+>Lœo #32o7Üœùû\Ì72\å`¦\Ş Š^H\İé¡”\İ\î»\\…5$\å\0ò|fv‹•t<û€…4±•´“D\0b\Æ\\+9¥Í‰”„(S@$ó\Ä\"eSp*Ø´³Ô¥`».u)\åe.öeÒ¥d\ç#`»&—Ÿ]³½\nZo“—4y^ššüJö¹?\ì\'l-+\Ù\Ï\ÚV%³Ia$+#Ij%>-ÉŸªd%^T4:k)\åplŸ¡Jo\×W±dL_…úr¯®\nR?f =´e;ù¥¿º\\T:ô\Í\Ø\é\'%\İU‡½ ö—bÙ‡\Âb\âµ._xaE¶\İ1)ş\èY\ë\ßı\ä\İ7ò\â\ßZ\æ5¯(¤å§#\Í\'¿\ÓOŠ\Â3f\ç¥vK\ã\Ø9wt¼~ëˆ±\ãü\ÎP†#m\É\ä\Ækn|-\n\ì?No\îÁ3\á%?\0\èºióM£Œ““\Ê\ã\0·\àt€\Ëj³—•Ú‰[Ğ¨´*½›‰\Û®NW\Ô%´b\Ô\ë\\\è¢\Æ„™\Ì.p\È*şmG¯\Ói‹\0½\Äyh%˜›\çr\\\ÖÙ\Zûû»\Ğjo·o·¶Ÿ°K`7\Ûöb»h÷x/\î¸L4F+\ĞNŒF;\ÑöD/û :ù=\ß|’{¸}\ìƒ>#ı¯–Ò”‡\ÛBĞµs™º\äÔ‡rK¨¼´<\ÛB/\í\Õ\å¦\åNv/ø\Õ—V\é4W\\A¼b\Î\Ñø¬+\Ãi¾wJ§×¸…:úúƒñ-(ö‡—\æŠ9 #>\Å!\åy‹\ÊTdjxñ>Ò…1¿\ä¼£\Ê\î‰,\è\Ôj­^‡µ\n^W›	…º\çuz\ÔùŠ3=P¦Ig.\nte0J·	4É­ú˜–ô¼-\ÆU&\Ğ´PS\Ã~@\æ?ªñ)VhEV£¡”È˜\ÖT±/ŠŠ;-¯LgğŠ\rŠA4¸\\^³¶F;ÿ8´XÑ‰´J\'Öˆ\ÓDA\ÜO‹ñ\âÒ®˜ô\å@¸µ\â\Ñÿe\îaB»§ôµ oñL­_\\÷)\Ïó{›™ÿ\ä\à¸Ê‡[\ØW¾‚$hs±\Ï\×6¼˜?ŸEr_å’\æ—H0\Ò\ëÿğñzga!\Í@÷\åÿ\éÀcH\nendstream\nendobj\n28 0 obj\n<</Type /FontDescriptor\n/FontName /CAAAAA+Arial-BoldMT\n/Flags 4\n/Ascent 905.27344\n/Descent -211.91406\n/StemV 76.171875\n/CapHeight 715.82031\n/ItalicAngle 0\n/FontBBox [-627.92969 -376.46484 2000 1017.57813]\n/FontFile2 27 0 R>>\nendobj\n29 0 obj\n<</Type /Font\n/FontDescriptor 28 0 R\n/BaseFont /CAAAAA+Arial-BoldMT\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo <</Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0>>\n/W [0 [750 0 0 277.83203] 29 [333.00781] 38 [722.16797 0 0 0 777.83203 722.16797] 51 [666.99219 0 722.16797 0 610.83984 722.16797] 68 [556.15234 610.83984 556.15234 610.83984 556.15234 333.00781 610.83984 610.83984 277.83203 0 556.15234 277.83203 889.16016] 81 83 610.83984 85 [389.16016 556.15234 333.00781 0 556.15234]]\n/DW 0>>\nendobj\n30 0 obj\n<</Filter /FlateDecode\n/Length 302>> stream\nxœ]Q\Ûj„0}\ÏW\äqû°¨ñÖ‚{iÁ‡^¨\íh2n5†˜}ğ\ïg\ì\Z\Ğp2\ç2\ÌD§\æ\Ü\íyô\æ&Ù‚\çƒ6\ÊÁ<]\Ş\ÃE–®´ôÂ¿;Ë¢ n—\Ù\ÃØ˜abU\Åyôª³w\ß\Ô\Ô\Ã‹^§Í…\ï>OmÀ\í\Õ\ÚoÁx³º\æ\n†\àô\ÜÙ—n¡lß¨P\×~\Ù\Í\ãc±Àâ„º‘“‚\Ùv\\g.Àª8œšWO\á\ÔŒúW/H\Õò«s\ÈN;E\\¯(9#JˆD(K¥\ÄÌ‰™\æ„¢üQY`\æ\æÿf\İZ\n;’oIN%eŞ“a†YF”^EBD¡FŠ#EoK)¶(sÀº¨\Ût\åÕ¹0X\Ü&Nt¥6p[¸\ìªZ¿\Çaš¶\nendstream\nendobj\n12 0 obj\n<</Type /Font\n/Subtype /Type0\n/BaseFont /CAAAAA+Arial-BoldMT\n/Encoding /Identity-H\n/DescendantFonts [29 0 R]\n/ToUnicode 30 0 R>>\nendobj\nxref\n0 31\n0000000000 65535 f \n0000000015 00000 n \n0000005854 00000 n \n0000000104 00000 n \n0000037591 00000 n \n0000000141 00000 n \n0000040339 00000 n \n0000000227 00000 n \n0000000312 00000 n \n0000000487 00000 n \n0000000648 00000 n \n0000006116 00000 n \n0000056285 00000 n \n0000003257 00000 n \n0000003602 00000 n \n0000003793 00000 n \n0000006393 00000 n \n0000006456 00000 n \n0000006560 00000 n \n0000006623 00000 n \n0000036175 00000 n \n0000036411 00000 n \n0000037218 00000 n \n0000037730 00000 n \n0000039578 00000 n \n0000039813 00000 n \n0000040039 00000 n \n0000040481 00000 n \n0000055139 00000 n \n0000055380 00000 n \n0000055912 00000 n \ntrailer\n<</Size 31\n/Root 18 0 R\n/Info 1 0 R>>\nstartxref\n56430\n%%EOF','application/pdf',1);
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `user_type_id` int NOT NULL,
  `password` varchar(200) NOT NULL,
  `login_attempt` int DEFAULT NULL,
  `mobile_number` varchar(45) NOT NULL,
  `active` varchar(1) NOT NULL,
  `login_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `mobile_number_UNIQUE` (`mobile_number`),
  UNIQUE KEY `login_id_UNIQUE` (`login_id`),
  KEY `user_type_fk_idx` (`user_type_id`),
  CONSTRAINT `USER_TYPE_ID_FK` FOREIGN KEY (`user_type_id`) REFERENCES `m_user_type` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Siddhartha','Kumar','siddharthakumar4209@gmail.com',1,'password',NULL,'+918130828881','Y','sid'),(2,'RECTUITER',NULL,'recruiter@gmail.com',2,'password',NULL,'+916289447928','Y','recruiter');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `user_id` int NOT NULL,
  `user_role_id` int DEFAULT NULL,
  `skills` varchar(5000) NOT NULL,
  `profile_summary` text NOT NULL,
  `address` varchar(45) NOT NULL,
  `pin_code` varchar(10) NOT NULL,
  `home_town` varchar(25) NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `gender` varchar(20) NOT NULL,
  `martial_status` varchar(15) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `USER_ID_UNIQUE` (`user_id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,NULL,'java','I am a java developer','string','string','Muzaffarpur','1991-11-17 17:36:40','Male','string');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_education_history`
--

DROP TABLE IF EXISTS `user_education_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_education_history` (
  `user_education_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `degree_id` int NOT NULL,
  `institution_id` int DEFAULT NULL,
  `major` varchar(45) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_highest` char(1) DEFAULT NULL,
  PRIMARY KEY (`user_education_id`),
  KEY `user_education_user_id_fk_idx` (`user_id`),
  KEY `user_degree_fk_idx` (`degree_id`),
  KEY `user_institution_fk_idx` (`institution_id`),
  CONSTRAINT `user_degree_fk` FOREIGN KEY (`degree_id`) REFERENCES `m_degree` (`degree_id`),
  CONSTRAINT `user_education_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_institution_fk` FOREIGN KEY (`institution_id`) REFERENCES `m_institution` (`institution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_education_history`
--

LOCK TABLES `user_education_history` WRITE;
/*!40000 ALTER TABLE `user_education_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_education_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_employment_history`
--

DROP TABLE IF EXISTS `user_employment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_employment_history` (
  `user_employment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `designation` varchar(50) NOT NULL,
  `employer` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_employment_id`),
  UNIQUE KEY `user_employment_id_UNIQUE` (`user_employment_id`),
  KEY `user_id_employment_fk_idx` (`user_id`),
  CONSTRAINT `user_id_employment_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_employment_history`
--

LOCK TABLES `user_employment_history` WRITE;
/*!40000 ALTER TABLE `user_employment_history` DISABLE KEYS */;
INSERT INTO `user_employment_history` VALUES (1,1,'SMTS','Abcd pvt ltd','2020-11-26 10:59:06','2022-11-26 10:59:06','Y','string');
/*!40000 ALTER TABLE `user_employment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project_history`
--

DROP TABLE IF EXISTS `user_project_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_project_history` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `employement_id` int NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `project_description` text,
  `project_name` varchar(45) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `project_employment_fk_idx` (`employement_id`),
  CONSTRAINT `project_employment_fk` FOREIGN KEY (`employement_id`) REFERENCES `user_employment_history` (`user_employment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project_history`
--

LOCK TABLES `user_project_history` WRITE;
/*!40000 ALTER TABLE `user_project_history` DISABLE KEYS */;
INSERT INTO `user_project_history` VALUES (1,1,'2020-11-26 18:06:29','2022-11-26 10:59:06','make a job search paltform','fnd our job');
/*!40000 ALTER TABLE `user_project_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-26 21:29:24
