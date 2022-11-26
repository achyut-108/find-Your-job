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
INSERT INTO `resume` VALUES (1,'Rudresh Karn2.pdf',_binary '%PDF-1.4\n%\�\�\�\�\n1 0 obj\n<</Title (Rudresh Karn2)\n/Producer (Skia/PDF m109 Google Docs Renderer)>>\nendobj\n3 0 obj\n<</ca 1\n/BM /Normal>>\nendobj\n5 0 obj\n<</CA 1\n/ca 1\n/LC 0\n/LJ 0\n/LW 1.33333337\n/ML 10\n/SA true\n/BM /Normal>>\nendobj\n7 0 obj\n<</CA 1\n/ca 1\n/LC 0\n/LJ 0\n/LW 2.6666667\n/ML 10\n/SA true\n/BM /Normal>>\nendobj\n8 0 obj\n<</Type /Annot\n/Subtype /Link\n/F 4\n/Border [0 0 0]\n/Rect [72 715.93103 209.56641 729.72986]\n/A <</Type /Action\n/S /URI\n/URI (mailto:rudreshkarna@gmail.com)>>>>\nendobj\n9 0 obj\n<</Type /Annot\n/Subtype /Link\n/F 4\n/Border [0 0 0]\n/Rect [449.57227 715.93103 540 729.72986]\n/A <</Type /Action\n/S /URI\n/URI (tel:9123438201)>>>>\nendobj\n10 0 obj\n<</Filter /FlateDecode\n/Length 2537>> stream\nx�\�[Y�$7~�_�\��%E�0�\�.?\�۰?`wm0����\�Й����]=\�LU+3�q~q�ͤ�\�w���\�N��z�\�Eyʫ\�͔���\�T���\�\���`�\��t=7Mn��ߗ_/?;x;�Q�v�ϼ�_��\�d\���\�\�4�%\�\�qR\�8m\�����_�_\0�_���\������5z�\�\�\�\�\��\�\�Z\�7��\�\Z���\�/o�\"Ўy\�D\�?�6�\�\\g��\�`�\�\��I��TH\"VfYT�X\Z�/ޖ, �ޅ�\nC�9�C;\�\����\�2�x\�u�_�\�Mk���sdӵ�\�\�x\���u��dލ�\nmt!	A3��1Xtؾ播A_?_\�Z��LjA!9\�\�)\�$��7w��!J!۝r:���8�\�\�����2��4\�kw\�\�?K�7�_LY�\�Bt\�ѣb��m�.3k���m\�\�\�:!�<�\�4_!\�W\�\�<D�	[�l_\�\�LC��zf�\�m��{\�}�y��\�Q�ֲ	2%��/|�yz��0\�\��+\�``T�M�}Ű*|0�\�4�j\�\�\�׬{Y�H`\�\�1,\�_d\0\�oءf��o\�o;�?(C�\��{�\�g_\�z���=]\�\�c\n4UE[\�\�#���S��NT$�ʟ׮oX\\>ɺ\�R%cE\�[E6]1��u�zoc)\�\�%�%�t-l\�=��2��榲KUq�\��J����6(\Z�/\�t\�4Sc\�\��9T呯\��z�:\��w^�*�[5\0W\�}�\�\����\\ŵ��TM٪E?\�>�O��\�1��Z!`wg��\'h\�b\�E\�Ny�,V�h�\�H�٥\�E\�!�;b�\r5\'x�UCn��\��\"��ԴBX}�Y\�[\�\�\�l\�\�\r������#\�\�\�8�Ծd4�\��\�\�\�d4\�N\�9�U�j\r\"�\�=�k\��H\�\0T�8_��\�?P��\� \���;j�\�(.\n�3|\�Pi�MV�3r\��D�3y͉\�jݲ�&���\��G\�Pq��s\�k\�\�,@��\'o��\r?�x�\�=�pA-�}8��xp\�,MW\"��2�o�F\�\�\�\rމ\�9\Z��|sЫp\�{�j�u\�\n����\�}�\0P\�\0�\'8E#\�.��@��l.����3����\�T\0\�;�p\�G\�u_�R\��\�\�`T:X��|f\0�\��e�8\�RA��\�\�bzS��\��:��\�G��ھ\"W�P �k=�z\��~Q�\�S)�f$\�a�]�-�\n\�zD^K~D�4�&��{!\�\���p��{(�=\������\�\�w���R���#oQ�$h\r��\n��6�ګxh%~-�\'�,1�\�[\�̖/b�ȫ\��7\��T�r�Ǖ>Ӈp~�T\�MV>n�?��}=k}\�h\n\���#0V9�f\�X\Zp~4u�VTH]@�͇&\����j\�ת\����	�v$q�\�i�\�VÆu\�cȘ�����{N+s��]�\��\ZW\�8Tj\�=UڠВ}���-�n˲�qzn\�7[��`�c7\�n�p\�\�LT�	K�\�t\�:�Zp�\�&\�\Z\�ím\�&N>\"�\�\�X\�re��\r��\�\��\�fs��7\�\�\�\�vX\��\�\�\�n��k\�Tj\�\�S\�b�\�\�\�b����ơx\�nr\"?\0��\��|\�+�~2ۇ2\�\�_(��\�˫�r>��\�\�,�R\�\"mf�\�a���y��\rQ�{r�L���\�T�\�}�\�\�\�3�\�y�f\�`-d�)+\�N\�[G�r�{h��\�-#Ǉm`A�\r�\�\r,b�c\Z7g���	�dGXTm!㇋�@\�\��r�k�m�\��\ro{=<�÷��o���\�\'�=K\�+8��O\0\�7��ך}ȴ-��m�\�\�a�\�\'\�\�jmT\�\�p|9\�O<�\�\nW�9eԷ�\�\"g�\�;���RY�G��:�kM\0Qf\�b�H�[x�6޲�s�^\�*!\�\�zǺ@��D<Ӌ%�Lo�6\���.��\�\��p���q\�GB�*k~\�_�l\0�\�s�KT<\�M�9h-�e��4\'zv��z��L�L�q�#�˝����\�\�@�\�!�3\�\�u*\���|m\��qBu\�(QҊ\��̡`ê�㜄3�C\�\'\\��*\0}Y�Ŀ��uf�o��φ��QQs:�\�� %b\�ZRrR�\�|��D\��h\�&f\'}\�@\�\�͵��8u)\�{�S�4\�M�Z\��/�Nhri]�\�,L];8\�#5\�f��)�\�qN�D\� �\�\�?\�J\�\�=`\�\�zn9�\��\'8{\�^��Cg��(��2^u\�\�7tAZV�\�0s�T,�e\�˶���\�P8\�\�ڣE\�57\�TeY\�\�:i�+�\�Wp�\r����\�swzO%\\f��\�p��SW�κh�A\�-+z�hR�xV4�\�$ފF^V�ˎ�\\*\r!\�����\�\�~\"T�lT�\\h*6��\��ޑP\���\�J�\�4/;�N9�\�Nm�	\�*\�6k���]U��NO<v�]un\�]qo\�{�&�+��\�\�FNJ6x\�Bz0yq$�Ϻ\��՗N��\���\�AI\�\�L.v��g\��\r�ta\\\�!|���.p	��\0\�\�\�\�{qr�|wQ\�m�\�$ш{E\�>w$icr\"䵺\�8�y\�ڤR�s���פ 5� ������6I�81\���i\�xBgu�\�bd���XW�\�܈���\�A\�\�\\�H\�\�\�b\�7\�B��o�{�\�\�:)���\�\�f)Ԕ)U���\�X\�;b\�A��b�\�H�lJ\�qH�\��[\�|y��\�z�eS\�� �\0\�%\Z\�\�\�B\�ȲW�\�l�,�ղ\�����\�\nendstream\nendobj\n13 0 obj\n<</Type /Annot\n/Subtype /Link\n/F 4\n/Border [0 0 0]\n/Rect [372.7793 135.443115 390.78516 149.241943]\n/A <</Type /Action\n/S /URI\n/URI (https://www.techgig.com/codegladiators/coding/print_certificate?param=RXUyZzkvQzd3ZkxrdVpjbFphR3VnRERzMUJ0VzgycGV0RGJMNDVUcDAvV04zYzJtTjg0Tm5meWJ4QXFPYjJ1SVk1TTRQaE9ZZG4yelpHZkRhbHFCL3c9PQ==)>>>>\nendobj\n14 0 obj\n<</Type /Annot\n/Subtype /Link\n/F 4\n/Border [0 0 0]\n/Rect [272.51953 103.705811 290.52539 117.504639]\n/A <</Type /Action\n/S /URI\n/URI (https://www.techgig.com/rudreshkarn)>>>>\nendobj\n15 0 obj\n<</Filter /FlateDecode\n/Length 1989>> stream\nx�\�Zێ\�6}\�W���(R�(�d&�\�v��\�.Pt���\�͢\�\�\�dg���2�e\�F���̠�\�\'\��|�\��\�S.m�\\h���\�ۡ\\||x�\�\��;�\����hr\�ǿ\��\�Z�0\�\�F�qz:��p7<�;�\�=\�`�hx�pH�6U�s����><>�\�8��aP�k�\�P\������5��{\�/\�d��������ޗ{��\�\�{\��\��y�\�{��4�\�1W��\�k/٠䙶��\�\�X��tO�k��\�].p9A���M�S�\�\�ұ?�y�\�=\�6c�\�eT�\��𱷅�)䊾*�\�\�z�Cq�YZ*�h��Z�<j�>\�QZ��1[#���V\�+@\�y��\n�\�9r�Z�s�\�;W�m�ź\����\�$D�L\�æ\0\Z������m\�[����+�|��+�\"Is.`#�\rVg�f|�k\"C�X\���6V%ތ���ʶ�GV�\�j�\��\�e��>m\�ٓ\\�0��B\��m�\�؞�\�6��\�飀z\�ye\�dp\0Y\�A\�\�\�\�ǐ\���\�b��{g�\'�<�*�m\�R`L4_?���\�P\�u04�\�k*ף_��,\��Z ���\rh�6t\�(�\�3\�ŭrP(\\�	<�j��A��J\�\"��.E�����5\�&e@\r�P�y\ZZm��ۀ6U$��agx桇�	/�l��K\�\rPH\�\0\���]\���\')\�Mط\�jԸw��M�:�l\"\Z5U4�}\�+YH�\�&Stj�Rðd$[\��\�\\�јХ\�Z;\���\0-s2D	�\�\"P�g�.�,�\���\�.�S�Mhae\��˟�C�*`$\�O�`�C_\��\�\�ɿ\�$\��HF���#�6��br\�OHE\0\�P<(\�+d:\�۪�^>��z\�D\�\�w\�Ʈe�\�Q=��j}\"u\�V\�i�E[�K\�5\�]�\�Qm\�zQz���[c0	\��#��ZQ�W6��v�\�t�\�\�٨\�!,(\��=lNHp�J��\�Y���\�9�\Z�ӓx���Y\'�\�\� �\�+�aK�\�o{O�\n�Q�q�\�JJ�s�\�G�����\\��Z�v��\n\\]bء\�k&\�μ�\�\�9O�\�9�I̚>֌!�\�q�+\�w����i6pT3,�W��g\�\�r�\�\n<��\�H�H\�a�\�`͙ݛX\�pE~Ӓ\�\\�����s~�\n��\�\\\r��\�\��G�u�^�x5���R\�c�y[m\�J��\�;?\�]\��ִ\�ںB~?�\�J��E�\�\�=J	Ş@�	��tݯ\�u���6���<v�\�g�ص6�B.��w�N�9�ޒ��$\�p���\�j uw�:�쐫@\�q\�wYdsx\rL4\�b\�\"��ZP�@\�ue>��4Hf����Ω��ۂ\\�h�.3\�y\�-3<\�\�i\0�V\�VR��S�\�A�L���\�s�(��\���\�!\�\�N�ZCa�A�\�b�d��Wt/\�\��\n\�#U`im�v�\�4���7���}Y\�N��	\�\�X�>bLl��\�\�_\�-�n�2\�i\�_Ƈ/�m�\�@���}\���\�v��\�΀�\��,��2٨�X8\�r�v0*~FU\��2\�F�D��>�\�\�\�e:��v?�\"tfa��y��\r0ݷI��ޏB@ZOV�ie� Fh\��6\Zs�\����lC\�s��W4\�k\�o\�G�\�\�\�Y��\n�\�E^�c|�^\�S\���w7؂mD&�u7��\�\�8H�?.���\�p��>?�!Cc�=q �UЋ�\0�:�\�N�\�)`tC����{�\�\�\�\��x\��s.K1 ��<�!�z	7�v�w\'��~r���}�=ۦ\���|�z[\�J;燜\�\r*d\�NK�+Q%\�\�P�\\\���c�\�\��\�\�z7@�����[���\�>��_��\'�\��JW�?{��\Zx\�iwj&\�5�ے�f-h�-�ci\�;.��\n	�\Zt\�\"�u?�t\���g\�!\�%<\�M!Z\�<\�\�\n�/��J��\�ԕ[�\�©��\�l\�\"};*�UScL;�5��+��%����l>_�Y��Q\�\��7�sv\��\'�\0\�\0�|�3�G&>\�~%:\��\�K�\ri�*�@0܎!̇\���x��\�\Z\�\�\\P�E���K��? �\�b������uɞ����b��\�p\�\�1\�K\�:�f������\�ɤ.YG\�t�?���{\nendstream\nendobj\n2 0 obj\n<</Type /Page\n/Resources <</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState <</G3 3 0 R\n/G5 5 0 R\n/G7 7 0 R>>\n/Font <</F4 4 0 R\n/F6 6 0 R>>>>\n/MediaBox [0 0 612 792]\n/Annots [8 0 R 9 0 R]\n/Contents 10 0 R\n/StructParents 0\n/Parent 16 0 R>>\nendobj\n11 0 obj\n<</Type /Page\n/Resources <</ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState <</G3 3 0 R\n/G5 5 0 R\n/G7 7 0 R>>\n/Font <</F4 4 0 R\n/F6 6 0 R\n/F12 12 0 R>>>>\n/MediaBox [0 0 612 792]\n/Annots [13 0 R 14 0 R]\n/Contents 15 0 R\n/StructParents 1\n/Parent 16 0 R>>\nendobj\n16 0 obj\n<</Type /Pages\n/Count 2\n/Kids [2 0 R 11 0 R]>>\nendobj\n17 0 obj\n<</h.3jh35tknsvgb [2 0 R /XYZ 72 760.5 0]\n/h.c6e284u7crrt [2 0 R /XYZ 72 699.31494 0]>>\nendobj\n18 0 obj\n<</Type /Catalog\n/Pages 16 0 R\n/Dests 17 0 R>>\nendobj\n19 0 obj\n<</Length1 48304\n/Filter /FlateDecode\n/Length 29464>> stream\nx�\�	xTE\�?|�\�}{\�\�\�\�}��NwHBHHI @C\�!A\" ;�,A܂��(茨��:*�hC`T\�E�q\�Qq���ø��;U\�\�U�߼\��|\���\��\�K�\�\�^�\�S�\�\�@\0�� B�\��d9���1v\�ѣƭ|�^�\�e\0rrȸ	���7\"݌\�ţ\��\\\�|<��/\��5#\�F\�2�\�\0�q\0\�g,��X�Ř��o��|�z���\0h[�\��\�Y���\0-�/�3�q1�A��Wa~e\�\�+f�hzo(@\�W�ޞ;s\�\�Niľ9.\�i\�Κ>�D\�\�X9��{\�\�[�.�a\�#\�\�]�\��/}�\0\��[v�ӷ\�r]@�\���,�~�b逩	\�F`X�d�\�Y�i=\�\���6H\�\�E�˒��i�|\�⥳G_y �e�8�@�\n$�D��\��-T�\� c�E0k{�J�_\�\\V\�o\\X^\�8��鱟V*<\�k\n�\�C��\�K�_\�K/u\�\�Y@�;뢥�^<}\�%���$\�\�c�ћ�Z����iy��\�\�3��\�}���X\��F\�Zd�1MS0�\���Z�π\�\�8c|@�@>bw\�\�oq�	\�@�O֓\�8Zi�T�\��R��7�MmZ�\Z4\"e�\�G��k\��GaM*\�^I�!�r\�g��\�эI\�\�\�{�*����,�E^/΅�\�B��pL��_+a\�f�`Z�AT`K\�x\��TZ�\�߸g$g�jv�\�׫\�9�\�\�)xo�/Я�P+6I�f�<E;A��݆�&\�Tz\�6�Zf(s�v\�\�l�l;\�7\�o\�*\���\�cg�\�#�\�-\�\n\�h�����WBW��\�\�ԝ]��\�ԝc��cCr\'v� Ϟ߻ �����=���x[\�;K(��\�^���o*\�\�c����~�\��B\�_&�QQa>4�i���<MS���iZ�Q떦ų�H8�\�4�A\n` ,�y8�\�H��1Í�\��B\�\�	Ř>�\�,�e�c.ge!\�\���� �P�\�Lm*�\�\\s\�R��c칡3�va\�l�\'\�*�`.��׭Uch)\��c|��=x��ۛ�-\�Ŵ\�t\��i�#΄���V��!\�\0\\&M�:��\\\��\�G`)\�\�\�oge\�F��\�tU\�&��L]H�ca\�{ෘO�E\�\�d\'��Ezf�ۆ��\�ǰSS	\�}<�BT\��`][4�\�\�.L��q\�Я\��=HO�r\�iZ\'\���\�\�znH��g\�c�\�[�m�F0�\�ǎ� t\�\�3��<��\�ч\��u,]M\��c�\�`�_����A\�a\���~��R\���{J3r��\�u��\�\�349�F��`\�R\�{6BJ�|�\�/e!K\�\�\�|\'�\�M�pn����\�<\��K�\ZrP\�A)�w9T���sW�6k�$\��6!�	K\rK��\Z���X\\\0��d+Ԡ��Xt\�ա���\n��%Y��Y\r5��s\�\�\�s1�&�Kl\��X�K�\�%`�%H�\n`�\0/U��5HF7\�\�=}Vz\"���\�Xf\n:\�1w%�>\�\�T�����\�%aL+晋y\�b���m��k\�\�mB]# �\�\�\n�X\�d�d\�\�hd�\�\�\�yޑ\���\�+=1�\�$?C�9�󒟳t\�\�/q~\�\�`\'\�&�`7�\'\�),�JJ+<.\\�\�B\��#�C\r5c�GY����?��\���\�\�1\�$�\Z\��I\�\�/\�\ZX#���ր	�Q+�F\rq#��g��:�\��1��d]�\�-\�?��p@x6ى3\�xO~%��|5\��\�\�-�}�I\'��= ܍�d�\� �\�\�O؃0\\�}QW\'Gh\�>>C��R�\�Z\�K6\'�b.?�\\sa+��^d\rKS�#�\���m\\��\�-�\�6�3�M�ҩ䟒�P~�#G^�\��\"9\"$:W%\��I8Jyȭ\���\��\�$B���$�T\"ť�\�W��{\"O��\�\�{z5\�\�O����Pׯ��\�h\�_\�C\�%Ed�H�\�\"�MX�ԝk\���C��۱��I\�O��%\�>�a�gM q\"i\����hO=AL��*i$ג\�\�Ǵ�N�wҏ�?��Ŀ\�\��/D-v#<\�� c\�d.���#7�;\�q�2���\�\�\\w\�\nK�?���F�)^\'��n\�|��KM�-�}�$�\� ?�\�\�\�\n\��\��K�\��GD\"b\�[%a2�\\��\�\�Fr/\�Iv�Vl\�e���|K�M~�ȲTC}4L��Х�2�Gz}	\�\�?鏂K\�\n�^B�P/,\�^�6\�O�P�/�I\�i��]\�)=,=)�\�\�k��}\��:�;\�O@b}bK�%њ�8�^�Z�cp���k�\�hgޏ|�\n1\�\�yQC�\'#pd���d	�Gr5\�J\�\�}�\�Qz�|�}6Q?\�sڋ���΢K\�j���\�\�\�O�,�\��!B�0KX&��\�\�\�{\�G\�w\�/x\'E��ŘX ����\�\�\�\�Ϥ)\��\�\'\Z�f�f��M�\�[\�/��\�\�\r�&y���v\Zr\�S�?{\� \'�UB��n�����H_D~�\n3��9�\�$\�\�U��\�H�k�Ҿ\�|8%\�p���\�\�w��0�\'\�`>홪M�%>�^��t���\�^Ě/\�\�\��k�Z_�\�_�b�@x\�> �x�#ꉋt\��\�\��Ku\�G�%\�*\�Gkq\��Y���|�k�\'%\�w�|\�r\�c�\�7�\�x=\�Ff�s\�&(%W\�g�\0JE�t�&_\�@+q���\�I+Pq[GI�,XM\Z����\�[hռ$\�\�}\�\��K�Qa�xJ\ZK\�\\kaIr��\�Ŀ�9 ��O�v�R(\�\�_�Ze\n\��(\�\�\n#1ƍ�3�bj��xߎz�\�\��P\�\'�{Z5\�i̑\���\�\�\'Ƣ�~\0\�H΁K��@!\�u\�+�Ɲ�	l��dM\�\n���(9\�\�`��48YH7з\�8�\�\��\�ю7|���\�6��\r���!wwC\r{\\�+\�I|ʯ���\�(M�O�$��y?�1\��!\\�\�&/�Qp\�%�.\�7��\��^�\�\�\�2aVb��^�i\�\�X^\�ǫ\'�п_U\�>�\�\�JKz�(\�^��\�-7͉d�\�P0\��y=n�ӑe�Y�\�d4\�uZY#�ŝOmd�4�96�Y�E�-d\�\�t��~VĴf����Y�Ƴ�\�\�c\�\��%g<�3ޕ�(jTvWk#j��\�F&��C�ƚH�\�\��鑜\�\�i\�\�0Pk\�sk\�f2M�m�|\�\�i5X\���:R=K_\��\�\rH\Z�jvE\�!���\�U\�gZB&\�T�7RS\�\�԰4\�\�\�3�G�����\���ݛI��\�E\�\�l)\�Y��7Ӭ�n�y3\�<�4p�����\r\��hZ�qfd\��)u\�\��zֆ�\0ۭiv�<\�>\�\�m\�u\�\�N�	j\��Tܰa�ڼcL\�٩a���X��\��\�6Ʀ7\� �bktM}]3Y�M�\�I\�S��oV��\�L��6\�\"�\"s7̟�S\�\�\�cW�[�\���\�	�֪\�\�E\�\�|��\�5�=Y�a슽��\�97���Ś\Z\�=fK�0�\�&fu�q�gg\��]#KX�\"Ð!�\�*��.�\�T�`Vl�Q�\��\'X�y&\�ȼf]��\rJ\�\�7KQ%�n�7 D:�yn\��t�&��\����\�0=C74\�\�3��qN���y�Wa�\�m4Y��\�\���h\�\��}�p�\�a6�7�\�\�\"47��K�U�\�\���f:��ɤ8&���LJW�i\�\�Vn�;����\�i��ۧ�8�ɳR\�\�\�E���\\�\�n��\�\�\�\�	�\�+�\�\�T���N�\�4E}OE��ҕ�\�\�b�i8S\�l��ȕ<�����iCSX���\�Bm\�S��\�Kw��O��\�\�\�\�q��ƥr��\�6\�\�ICVK58,\�!\�\����Z\�P2���-y���z_s���e@�KE��\�d��\�z�wv��nÆ�u��i��%�.��Jd\��$}r\�\�\�i\�iK�\�\�k��\�j.\�BAaОY?fO��7�\���_\�B	��6�~O�\�P\�<��X\�*�p�\�B�<�\�@����<��g�\�q\�L�m4�d\�(Ɖ��8�c\�1\�\�\�\�\�.���|�cg�\�m��K/�(�FA\�/4S4�S0�V�e�FT�5ZY�N\�\�Z=۬�\�<��\�P*Qm�\�J�H��t�\�\�/��e~\�r�~��\�\�*�k\�!\�C���~֜�Űk���1$\�$I2���\�=cCX�V\�\�L�<L:va\r֪\�\�\�vL\�L�\��y�r�~\�G\�b1�\�ǆ$	t�$�Z~h���-:�\�a�^k\��lU\�\�,]���X�\�ob��![\�*�1]�\�\�U?\�.��N��_1�X��Ag2�6\��3��!uZQ\�b�X6S�l��\�>�uҀ\�zI#Ig\�\�)`\�\�/\�ή\�ʷ`��ՉM���ъ8��Nk��\��cCX��\�o\�N�!U�\�d2��b�\�d���Ɛ\�d\�_o�\���袂�A���:֒ÁR�ᕘq����S��\�\�S�a2[�J4�\�jV\�h\�&\�L^�\�`\�`wpK�����5�Eoй\�6v\�\�*Qp��,#o���Sn�S�bQ�hm\�AcTLv�]�[�\�\�b�\��Xs�\�,i��,3>�\�(�\rVU�?��Wb\�aE�\�j-�\�)��\�}6[V�\�\�@�\�fq\�VG�\r\��3\�\��\�,\�E�Ƭq��:�\�b�c���3]�\�z=X�z-2��o�T��\�\�\�\\ [\�\�᲻cvկ(̫(�l�=��ޢUL�6Uu�Sy���O�#�\�l��\�x\n��\�\�\��Nq\�|.�Ã\r�*\�^G\�j\�[m��\�>�\�j5(:|R|�p�\']����g;�n�3\�:�\�\�s{�^�\�\�vf��߆�ޖ�\�f3XY����\�y^a�8Q:�~\�;x\n\�<�\�\�\n�\�\�q�|O\0C>O�q&/�\�;�����\�!V\�h\�;�>�Ֆ_��\�SD�`6�\�h6\Z]�p�Ro0\n��`\�\�\r�\�\�wE�aCA?{b\�q�\\.�˅]\�簲\�,�$\�t8zE��X%y!d�����\�)��(\n�\�\�?���7\Z\�	\�`(\��8��z]^�\�\�\�\�]�+kq���06TR�O\�Nš{�	f�\�\�\�N���@i8��U\�\��\�\�\�s1�.aZ���=�\�\�7\�=\�n��\�c�{\"n��wy;ū8\�T�\�b	� \�)P����U\�ŗ,\�\�\�\�\�PnNo\���p0\�ü��\�\�3��\�g	�r�>o��ݑ}Y%e�`�C�bW�_ȗ*O��������B�rբ�\�\�Bl ?�\�|^XU�WUM���\'+k(j \�\��W\�\�S2E��&8��kw\�\�Q~\�Gy\n\�敁=�0Z^\\VX��\�\�ALk�\�\�h6\�F-�lK%+\�̶G\�Ej8<|D�!���<\�\��8��\�\�\�)0���w\�}�+\�\�׻OI�\�%��K�3�\�\�\�\�0o~�\�\Z�`e=1G~�WN4:n|d/V\�y\�8MP\��\\=�УO��\�\�UU\���_ޣ�j`�����q�3y\�=�{�p�\�a�؆���|W�����ݦ4Բ�[x�\������\�R~!ߔ�h\�\�oР~C�ۣ_\��AC�\rԯrP�g�¥�=JK}e�Y����X�,\�\�[Z8���p\�l|J���\Z\�a\�\������\�)0��z\�\�\�~烿��b\�\��\�Z\�h�ƙ�pEEIEE��\�\�,q�Ǣ\�\�E\�!={�<\0\�n{c\�\�ˇ�<8��\ny-�\�!W��\r\�ۄ\�^��\�2�PP\��*\�\".B��\�{�7Ub��x\r�&t��;�\�et�!�T\�\"t\�ѝ`)B@�!e`�\���v\n/�\�ktIt��ЍB7\�&t\�\�ix>�\�5\��;\�S₫\�R컫\�\�\�q	NO�4�\�\�I�)䘔_3,��O*[ϲTt�A)?�{ʷEK���7�\����N\��bDB�����\�訠I\�\�\�ޜX\��ÂD���JH�\�Z2PO��k�A�~E;R)�c�\�Z�}\�y�#x\�at�\�\�p\r=�\�q\0�\�\��{	\�\�\�4�\�\��>},�=(B7\0\�Tt\�\�F�5:����\�w\�>�#����]D���������\�\��m\�\�+-\�%8QP�&B\�4\��	������\�\�<\�\�4r\�A!�C��\�\�j\�-U�Bm�\�jAh\��b�*4��ؓW�\�WAE7\Z\�4t�\�i�z�ס	\�ft;\�5�C.CTЩ��н\�\�\�\�F�\�җ[��6�RKlPh���H�A	\�\��Y\�@�\�����\�� �\�\�\�-�4`:`}�\"L�\�{sl�\�@+=�cB,B7\0\�(tS\�mB���iv\�̐\r+9\�\�\�\������Z�\�\�c\�Ȁ*�X�~H!lW�\�h<�\�2�\�tRb�7\"\� �rRb/G�Al\�|�\�&OE�Al\�x�\�\�\�srC\�u��^��t�\�e8J��H/c7�(��\�ْ��#�5^��jj\'M�H\�X\�t/i�E��&M�HSi��4�&?i\n��8i:H*p(�H���`e\�M����ݤ��4\�HS�4\�&��\�\�h�eX)�j��w :���G\�c�a\�0�|u\�aė\�%y(��\�\�TfO��\�{��\�=��,\Z8�>��\�ix\n>@\'\�=�l�V�{�8\0\�TtG\�}�.�N����\�8Z�\�\r@7\�5\�F�\�\��\Z�E\�.>\�;V�\��(�O\�\�^D�i8P�J�2T\�\�\'� Li9[_\�\�j�mĴ�{\�ߛ@7PGo�� ��9\�oj�1j#��\��:\�m�\�H%\�H�\nh\�\�^\�\�2���a�KZ����%\�=\�N̬\��Џ���/�m\�\��Co�m\"i	��1\��\�>�\\Q�c\�\�z\�*\�z�_\�}�g]�	[[BW3o\�*��\�?O��J��CqKhllrh(\�W\�(o\�:���/U�r�be����)2;�\�\�F��\�	\�mdn���E��Gɽ\����Cr@�\�YZ�V\�ⶃ���?�-���\�x{o��\��\�\�DN+�kh�j�-��\�.�\�\�\r\"Û�̀\��\�ߍ����\�\�Rdi�\r�\�\�5Wo��c�\��7ˣ/�\�C\�M�\�L׷_\�F�,j����\0B�kn�1�ۚ\�\��\�\\>�=�\�\�Z9�\�7`Z\Z\�\\\�s\�@�\�\�\�\n\�7�0\"�\��v�z�|KN\�\� \�0��\�П|[;�\��k\�뇷��<�\�̇�\rϧŅ�\�UL\�ۚ\�\��/�y�wpQ�/�\��|\"a��4\�\�\�\�\�\�\�y\\*4�<�.�\�<Ǣ�\'\Z\�y�Mp�\�9\�lby���,~?f	�y\�?\�\�\'^�e\�,E\�,\�we���$�3y��<��<���\�?�f\r*( {�\�Ϙ\���Ejg��\�|\��\�榋Tuό���tl\�E3\�2��\��Ȭ�\��\ZuO\�)��<�%��\�\�)�\�\��L�Ϫi\�\�[�^S�w\�\��sں����ѿQ\�hVYkkH�o$��\�!��r\�V9kkH|o8���ۣ�A�\�SR�^j\�#�N�\�9�\��9��\r��������\�\�Ƞf:���\�@��2Œ\�\�\rC:\�}u߰��\�L\')m���e�6^\n\�\�y5��xaԲKـ�����.L�m�O�i\\0�9\��\�c&\�\�e��\���O&\�`�mKIE��\�>,R�2��*�ӥ3�z�/M�\�L\n�\���$$ˠ�^hOQ�O嶣-Ŗ�\�z|�FR@\Z3u��]P\0�0�gθe����X,K���X�13$]���[��K\0��KB\�\�tK�4��Iv��L�#�d\'\�\��\���\�Fĭ1���̈\nX����jE��\r1\�ğ�	Y�.p �����ix�\�C�?�#��U �Ѱ��AE� �\09F�B6b�{ȅb7\�Ãb>\�\�M~ݡb!\���X�\�P�\��\�P=K������\�\�\��J+�,�/�\�\�z!�\�X��A9b�@\0�\�o!}B_\�AP�X��\r\�@?\�Z\�8$O��#���\�`\�y�C5\��A	��_\��G�\�\�0qK~c9���\�\��dL���9N��\�`T�P�\'#v�0\�)0�\�#^\�q*LH���D\�\�0	�\"\�/a\�#΄Ɉ�\�\�\�0%�\�\�8\Z\���\�\�a>LCzǋa:\�B�\�/���8.��\�\�`	\�B\\\ns9.��\�O\�R���\�#^��	\\W�Bĕp	\���E�W�bīaI�$\\ñ	\ZW�2\�k\�\�${��q5\�5pY�#X�#���\�a%\��pE�C\�\0W\"\�\0Wa\�F\�\�F�\Z�&�q�B܌xn�ko�\��\0���9\�\nk��:\�\�`=�ގ�\�\�#n�\r\��\�N��.؈x7\�mp\�v؄�6#ރ�\�7#\�� �	��x?�1�.<\0�&߁a\�N�\rqǇ\�vć\�\�G\�N\�\������a\�ķ��#\���po�-\��%߄��?!����\�\�v�a\'\�!ؕ|�!��\�ax�<��\�F|E|\nK�G��\'�\Z<\��hA|�&_�\��\�C|�#�\0�#�6\�\�\0\�K_�vĿ�!Ŀß���+��W\�/���a\�\�\�H�o�\�7\�Iķ\�)ķ\�(\�;߅�\"�O#�\�$_�8��\�/��p�#x�c�\'\�\�O\�8\��\"\�g�r�E��\��7\�/\�\�\�\��x�;\�Uį\��\��5��x�\�7�&\��\�\�m\�\��\r\�&��\�\�=\�\�\�}\�����\�Op�g�����q�9H�I\�$|���:��}��\��p����X��;:��_\��\�G��+��\��\�Ov\���\�\��G�\�u�ǿ\�\�q��\�Y:�#�\�?\�:���t���\�\�\'�N?�u����:����t����\��W���\�\��\�\����:��\���\�\���\�[�?���.!�\�l�^A=\�B]��D�\�7{6{\�\\�\�\�coS,nO�\�\�q���g�\�\�:2�t{\� x=��\�\�h7\��t{K\�\�?D�B\�I�\�\�~�����`�:�j�ҲI�\�\�w\r�;�\�`@Gg�R�T\r@� M��\�J\�\��(�J9ڳ\�]�\">��\�BP���\�RE9H��%.\�\"V=Rv-R��n!RF\�\�#\�31��SBP�d\��9�\"bi���.-q:�4�\�\�\�8���%�{�\�RJ\�\�]�mˆ}��]��TV\�OT�NȾ\�\�\'\�nÄu�ЇE\�\�O\'\��\�_�?�4�\�;ol\\���Ɵ\Z5��\'7m{�%<C�.�s\�2�\0\�%ߗrq�B�V�&�\�Ϯt,u.u�챲h���@�%p��^_t]oz�u��:\�4\��0u:\�\�� <|\�I��z�w��^\nW8\�\�u>�\��^ܠ\�\r�\���y�\�\\z\�����{�΢�z�;\�<׬R:��L,�қ.��#��|�\�[�1_�J��0X\�C��\�p�N���\����\�X�B\��}�om r\�4�b��Pd�۩�\��&7q�\�\�q��p�\Z ����w��iG\�U�\��˗ܞ搆\�t\�\�\�\r\�!}�\�б\�ܣ���!��֙��Tq�g1i��i?��yˍ�*\�]cȧR\"�\�]\Z\�\�c�7�\��W!���\n\�\����\�\�{tƠ�\�\�r8�\"z��մba\"xi\�\�!æG\"ddb�-�o�v\�\�\�3f\�~\�\�\����A��j[��?&�\�-\�v\�ʵl\Z,���;`�\�k��\�w�\"wL�uX��Y(W&\�\�i8\�\n�\�s-�����\�\�f-�q��\�|!��\n����\�|�:�cbP|\������./\�\�x;B>��ő��Z�\�/���s��@\�_�\���\����s\"�P\�iV\�؍vS�N��\�X�\��~+l.4�%O�*\n��\��\'N��L��gܢ\�\�	s\�L͏\�\�}d��_�i���,7�w�\�\�t(�s�av�ܕ�M�Rb9A><t`ˆ\����\�\�&\�o*�B�\�G܏z�\"�Kt�G�p�$kt�\�E���d\0E)���9�f\�骎*\�dU��\�:ݳ8j\r�\n[K�aG\�JIb	\��ٔX\�An\�\����K���\�\�pe\�\����\�k\�\�\�x�U�=�=0\0�\n�\�(���e��\�\�=�uO7�>�`�U�۸RSRZ�gqi�R\�rn\�\�\�����TR��u|\�\r���\�`�I�O�\�w�{\�\�IFb��^i1f���odOv�A��Fv�,�%8���4��\�\�\�^�#�\�\���)\�lU�����\�w�����)\�T�ڏ?\�_5&?��\��;\0B����Jږ|?�fU\�&*l��H\�\��z\�s��#\�\�\�Ž+�\�*u{j�\�I=\n\Z�J\�fA��i\�]�u\�?e�\�\�OH~&Z�#\�wj��,F�q\��\�`4AӖ�<nea\�\�²\�\�\�b\r�J\�\��\�\�d\Z4��ah12��{(��:��E)+h2�tX��,#\�ƴ:+Y8�FD#��\"d\�\�\�q|\���h~]\�i�I\�j���_\�=��U��P�F�,��\�3u�jT�\�Gqj��\�/h:\�\�\�Y�\'\�狚ut�a�\�9���\rnZk\�8\�S\�o�\�\�\�[ /0̰_\�X\��\�[A/\�,7���\�\�.oQ�s�M_׼nx\�\�\�\�.\�-I$�meÆ\��,6H�F]<)+\�\�):\��\�\�C\�g9t�CV>/V3K�jY��\�#q����p\�9@\�r\0\���\�\��������\rK8�Ұ7�{1�\���:\�\�\�N���\�\n\�\�V�����\��\�[�\r��\�=������+�ܵ\�\�+\�k����{d\�\�D�\�D\"�\�\�\�\'w\'n���K\�5o-\����~F�\�\�\��\Z}�\���	��>���\�Z�@��n�wh\�GD��D�D��\��гQ´i[�בH|�r��s�2s�\�9�{�d8�s�\�(�\0�I�.3�K\"���\�1��*�R��$5��\�@\�\�NT3\\�\�Z\�\�\Z2�L8b\�h\�^�jJ\�ϭ_\�GE\�\�+�_ztȱ�\�\�*�WG!H\�@F\�`#�ej���F�.T\�\Z{�\\��AgULn�]3�\�x\�j\�\�Wq�� ̒���\\,C0\�R�~3��\�i�m�`\�H�.�\ZR���!ԏE�gx��`x���\�j\�h�Q\�`\\g�\�L;\'\���Nf�8VwV�z\0\�x��q>�\�\Z�H\�k�7\�\�W\�9(\���\�>症\�\�\��3\�+m+\�\�\�\�>�~\�;\�56<n�>ů����n\�e_-�:�aoP�h5�c~o�\�\�\����?�^�`\n*m�O{GY������\'\0\�彄\Z�A\�gU\��k3}�\�d^&�\� ]*(�\"n�\�@�\�E�\Z*\�v��\���=\\\�\Z��]�t1�7\\�\�\�n8i�1^AȘQ��	22X\r�aiZ��p�9(c��+e��eQ������m�z\�W\\{9`�\�o�|7��\'\�ܽ{`Ռ#W�d��?ܵ��\�[_\�{\�П\�O\�\�$pb�Sщ�W@Z�n�\�\�\�Ȉ�g�o�\�g�\��a�Q`\�\0ɋ\�q����<G\�/��R�)b2�=h��\n�6U��:1{��)\�\�E\�[\��&w\�\�w<�<m�T��0\�&��dr�jMkMb�u�u�O\�X��5\�y�iE\�Zӆ�\�}����*p�3MfQ&\�.as\�~�s��_śH/|�\�n��\�a/%\�ɖ�b[f�m]�\�\�8U]�R\�\�DDm�3Y\�LV�+�\�\�j;F �\�(>\�\�\�Y�\�\�Bw�h�B\�I�\�G\�.��{�%\�|�\�ǧ\Z�\�r\�I&h�0fI�\nj\�T.dI=S/�rgz󃪸��\��c�!\�Vibk\�\�\�<v\�U�#�l�ƶ��\�m\�j\r�\�\�\�̞y\�\�\�\�?�$׹\�X\�|\��dm��_5\�\�ի\�}\�\�i�9���?\�t$�\�O��\�E��H\�M\��`L����I\���p\rG]J�s��:\�pԥT;GY\�G�/\\Zm*�\r���\�Q\�Q\�1�,\�\�s�[���\��\�\�E��\�\rF� Kz� \�zb2\�,AP�I���� ��PdG\\\�~\re4\�1�\�Fg?.I�x T�\�,��U����y�o#\�q�ώ�\�M\�^�fe\�`0e�U�J\�\n�2H�\�\�\�\�}\�6��\��?\�\Z\�֍\�L���O�l(�����VV��~[D}`�Xp���%&4\0m��m_�J+�\�\�JA�X�\��\'�e�*�M�+��X�1ۏ~a%\��]�\�.(�NJ����U���s5��O?ݚ\�E�\�/\��\����*��s\�\�>K@���\��t\�8\Z�\�\�F��Qg�H\�\�(;�mwƠ\�B�\�\�(;7m\rn>\�,�\�s�\� 8\�&6�\�o\���-a�(�&3ٍ�=7.9�5[\\�\�aR�\"\�y�S2y6�Z8��ll�?h\�����Vgw�󽂮X*6�\�\"��Q\�z�\�n?f�d�\�Yf�	\�M\�\�:7\����\�w�t���\���py�[Y��S�E\�5\�&ET�o���+7�\�\�RqoVm�H/��[Q�*Z\��~K��\�U.稗�B�\�ǡ��5�\�u\���%��>d	\�~��\�\����wo*\Zpd\�\�4fw\\|m\�6v\�u}���Q�o>B�\�n<�l\'iR6\�p�ޭ-�8\�7�$�OI|��gnn9��M\Z��\��u\�(\0f\�\�\�%sT��\"\�<\\ı0�b\�uqa\�Lv�G\�\�\�\�\n{y8/É��^F�\�Tq6ٜ\'�]a/\�ex�\�AO��\�0l�|�LE�F\'�\�a5R��\�d��o�N\�\�;�\�\�3εdL&F�D�[\�l��L.�Y_|�$\�8�,��\�\�\��\'Ǚ�ι\�(fkuTVv\�\�\�d:�Iu\�$\�UY2*,\�>�C\�x6�dͲ�.?��g�/\��E�\�\�8&|彜$\�9\�9,���bIWL���ȕ\�2\�\�R㥦��`\�(�ծ2�6�5\�\�z���ݖ�\�ůz���E\�+Tc\�\n�\�F���\�\�у�5\�QfD-\�DM\�f)\�xXGt\�t�3d2t\�cA�%��<ZX����\�7W�n����j\�nl�\�F\�\�9<1�\'\��ĜFGfK�:\�\�\�\�󙌔r\�\�[�\�]�\�e\�*� ��!-�\\B�.�%���\�\��gغ\�\0�{\�!�Βh2�ş>�傅\�nL|�\�[�\�n�h킹k��=g}�a�ǭڹ�\�k|y�\�\���;fߖ\��\��CI \�Ȧ\'\������:c\�\�_�#7�z�\�ڇvfN�d!�\�8��\�\�\�6w\n\�0\�r��$�\\�K��\n�&X8�(�\�\\��ԁ_\\\�]\�\�T2\��gXcN.���%\����٨�\�w����\�K��\��1w[9�[�6\�\�v/0t�õQf�l΂фp�ؤ\���0M�\�vl�4�0U\�Q\�\���I�r�\�\�\�{\�\�R�Չ3kW<�/^V.Կ\�\�m����\�n(^\�\�;\��\\\���-\\\�\\\�Y\�*�\�{Cp�s����K\�\�w���s�s�S\�7SCsٺA\�r�U�\�-8\�<�-r~\�$ye4[\�\�\�V։PF\�B�	e���vR	�t��\r3K6d�\rh&ǭ\�.x��\�}Q\�Q.GQ.G\�Fk�Y\�Vj\�\\p�\�r����u-wi遆%�\�7?�N�o�i��\\vL�>��ج�\�#F2\�\�(0�w;��>\�ѽI\���B\�7u\\��{y�>��\�[v]y\�=d���׼�\�螸�h\���([\'�M|�\��\�a�\�\��G\�\��\�cLJ���V�\�J(CE\\%\�\�:���*���\n��\�L\�m�lsI\Z��}\�\�U��W�C@w\���\�B��\�<x�8��Ib����\Z�[�\�\�\'�aEu�\�\�^�Rs�y��&<8g�!ǛW晝\�<\�\�by���+��\���\��&��8\�=+:;o�we`i\�\Z�j\�\��\r\�u1�Yma�\���\�b\�h5\�΃t(T\�pz�����1s�QЂv2r\���ECs,2�\�\�uq�2�?\�\�vXr��\�\nU\�\�.�\�m�*�s0�\"t[\\��\"�<u�6�ϔ;:�u\�\�q��$\�:����\�\�$�ɀ��8\�\�-5n��[��Q���TH\�cyo[�2�\��#\�&��9\�\Z�\�\�\�a\�(\�m.\��8�orc$+\�\�	f*^?�1�;\�\��\�\�I\�*��n\�zM\\�\�\�\�\�\�_&�z\�5�\r��n_\����y?q}\�\��3W�\'H�r\�\�\�/\��vB�)\�v|ŕK���_2?~\��澹j;�ゆ;;�o��r��&�M�\�G\�I\���߉m������5K?��\�\�~�X���s��O��\��\\q�\�ի���~\��\�/\"o%;�zܭ\�`�f@��9\���5m���\����|�3�2��ڛ�3��ҳZ\rC�Y!<L�&,<�k`=\�\�N~�\�\�|�\��z8\�̼~N˜&f�\��N߶���6��\�zn�p�C\�X�+s�suӔ�\�f\�9\�i\�\�b\�J�d\"�\�54+�2�\��/�N4�&\�,�:I�&�V#\�F��\Z�L\0\�[�٠*�0�\n�s�8A�YXJ�$mP#h\�\�\��\�/\�P\�N�\Z\�6�\n�da\�h�%�Q\�,����a����Q\�l$FV,�K2�Fn���\�\�o��ك���{���\���\�\�U\�\rF;�goa\��ps?�r��\�ѣ\�G\�I)\��fø\�\��1�\�ZE���ۓ�p��\�{�d钆ߵ���R=,\�r5�@K�F\�\�{��\�{\�\"\�\�18\�_*��4�J\�\�\�dˁ\�n��\�\�[\0\�/����|�\�\0�8Sy\�]G&FfG\Zu�u�y\�K�źF\�u\�uM�S\'�s�΀.c�w\��f\�\�7:�-�����@G:ZA�kc��pg�\Z�v\�MFf�\�4Ff$\�\"�i<\�VR����\�a jY�4�s4Y��4㣙ڢ�ڢ�6;�-\Z3�YmF=�\�\�80�\�`�v\��p��/LA=\�T����>q��/\�H�6�\�\�,EhR\�\�z~\�\�P\�w��\�<�����\�\�#S\�B�\�\�\":\\Ҫ�\�*fSXٛz�:!bgϥ\��Y\�?f\Z!\�\�\�a,�;��r�Ð\�Bc;�o�=gͦIMOlL���[Uq\���\�nK�C^��\�g�������.|�4�PӜ=\�z\nc�\�\�#�-\��y�l�X0x\�\n~�8;���\\z�\�\�}3\��\0%�9\�\��y|*�T(1̀Ű,\���a���p�\�\�jz\��2��+`5\�\�@@\�\�t�\��\�\�\�ĬI����҂��l[�;\�[�;ɟ\�N\�kf;d�W\�R�\"{A\�ҭ�[b�\�*\�g\Z_P\�)1\�yS\�d�\\|\�\\|\�\\|\�\\1UKP���&#\�\��1��38|\np6�\�\�I\��\�$�\�\r\�\�\�\rT[N)�r��\nlMaƂ\��d�\�S�t$޸�1R�令{\�åO�a\�\�S~����(\���\�O�K��	��\�\��;n�7��\�_l8\�l�m��\'�|Y @<q�\Z\"\�ڔ<X������V\�xv��t$\�\�mu�1uz�\�\�\�c8Cs�\�\r>\n\�)\�\�R�c��>\�\�?d:��6�\�\�=��W\�{>���\�\�\�5�\�M5\����L;��v���	�0��\�Z�8�\�0�oF\�rXE\Zǻ�.�͑E�ߣ\��qy.r�6�\�Ó��_\�x�ʛ��I\�!�7\�߳v\�m��;�\�\���(�\�\��]\�Kv�\�Y�\��~�\��R���\�\�_�5@kܡ��Z�,� ��\�\�\�ʌۊ[�<^8Oի&���DM-n\\�q\��7��N�;Z\�\���4O��udFQ4�<}�W��gq\��z\�\�+\���M(�\�5a�Ծ;1\���i7�7i\�\Z|B\�\�ǟp\Ze��\��K���R�\��\�S�M\�\�?�į�I\�w\�\�>\�I�pS�\��_�g��\�/�\�\�\�\�\�Y�\�\�\��\�B\�?P�D\��q�/\�\�\�rɅZ;�	99��h��+\�!\ZW\�,��\Z!�\�hNF�r2��\�$Ia���\n�D\�4~\�{�?)�R\�G�o��\�VJ)��.m\�%�>d>d>d���\'z�j�|?��\�f\\p���4|��{\�uv��\�\��Jfߢ�Ԉ�\�\����1�D�PLc��\��\�bc\�,�*c([���߀��eE\�\�a\���X(P\�#�.���\Zн�\�s�\�%���\�\�\�-\�nFa�\n#\�\�M��w��\�޺��~g;!�\�_�њ\'/W�#�\�O��!�\'�6 ��:il�\��\�\�\�M#Ǭ�~�\�\�M\�ˉ�\�\�a�UȗɎ{(F�#��Y��66\���c\��Jlh���s+#0�\�8~\�Ҕ�\�\�[я�\�\�[Z���S~������@0廽�w\��&�L�6K�I\�h9n�\�b\�a4|\0�@���)�f�I�;-!�\�H\�W	a\�\�\�N.!���ן�7��Ե4�m\�P�diUg�\�\�^��\'s�ZK���d\��\\y�3a:�\�>�+�\�\�2z�f�i�U�\�\�j`�\�F��q�\�t�\�ex^\�:�\�\�\�뵙tm&�\���2f`\�\�\���vC*;\'RK?��;�\ZT;Q\�q�h�4�h\'1H\�~��\��nZ3�\�\�E�Ұ\�.\�\�\�ƾ�`\0\�ݥ�{�\�A\�\�����ɋg�\�\�\��\'�}\�8\�\�\�yeu\�\�·�xڎ\��qڬ\�X�ש=�\�+��>��^�\��!�I\�Z\�\rA^�Kx &\�|�\�&m7H�_j%�Hz���\�+�q�-\\&�\�\0\�k���ؽ֦}��\�\�ks���\��<\�f4\�O��x��\��:�^DQ��Y��!�*kp\'�\�\�A�\"A�ׂV/P����[�%�Cj��H\'$Q:O\�\�\�2Qqg\�,��^\Z�\��2p	0��]+�\�3\�\�N�Y)8��w6,\�`GLgT![\"0�z�\�X\�km�\��}��U��U�?q\��ć��Qx��>u\���\Z�lO\�\�\�Z�Q\�\�2�bV\�t�\�+(w\�oE\�\�0?{�e\�e\�`v�T�\�e�*Q�\�\�\�D\�Y�acm�Uj��*\�xV%�}Q$�gm|\�Y\�d\�҆`;$&N$L�l\��$}�ȝw\�k�\��\�)��3��\��\�/�\�O�L�i^�$�6n$T�hU���\�\�2M�-�O���@����\�~eXi~˰��!������\�鿣6�\�nֿ\�4\�\"�\�Fm�;@9f^�iQ\��2�5��|\rC턄\�>#\�\�(��%K��B�:��:�7h�\�+i��i?|\�[\�����y�_Z\������p\���\�G؋킂ԔB\���\�����Q\�(qd\�(a\��{l\�5�9\�s�3\�\�\�x�����Q\�\�\�,$�\0Č��-:�\�6N�J҉`�N��\�6�&3!�Z`�6\nN�\�-�~\�a\Z\�\�\�)��ůj\�fQ�V\\n\\k|�\�8\�8\�\"\�QSws�p��\�t�y�Ik���\�\�\�<�j\�v�i�Y;�C\�\"o\�\��56j1��%�z�j�&S��ERkkK\�R����M�\�$6O\�lM6jk�;�Dz�H����D��\���\�q�^��1C;>��0mC\�B s`\�\�*~$�e�B�6:�qU�&5I�\�ѝ{�}Q_{\�W�\rU\�N��\�I��gO6��:�=f\�\�U:�	Ǻ��z�\�\�d��ɟ�K_�|��co6bZ7�DL\����,6���\��\�Js�0_���\�\\R\�\�}��~\'^P�tI�:;&︡p�.\'ak\�J\"\�z;\�!;=�\�T\"LL|,Q\'���\�\�CG\�)��\�`���{�\'~V�t݅+I�\�\�\�P�\Zd�\���7\��=�\�Q�u���{�����\� kQ�k�,Z�H�N֊7X��\�,�,c�j4RƂ��s\�BJ�&\��\�1.\r����цi�ņ&�d\�v\�Fn��\�Lة�\�rӖ���x��g�*\rU|���?m\�L*(�$��r�\�g8�\�\�\�Q\�kU\�:�Y�8��\��\�J|\�#�Wj\�%)��RF%϶��=H��HI}k�T\�\�,tv>�ߎd E�t0�=]Z��%�)(%�:q\�\�zF�\�\����	_%^��\��s�\����xOz\�\�#\��p��d)YY>�\�\'���ep|\�.\�~�\�f�\�r��\Z�[G\�G�\�\�:�N7I�`�j�\�\�\�\��uU<AA�\r:G\��rd\�\��$�/��?�)(��M���e�R�M�\�(6Sr\�\�̦p\0ׁަ\0	X�*d\�`\�[b�R_���h\�\�p��3�\�HC\�l���_�64,�+촜m��V�\\�\���\�X$f�����d�í���_J�\�|�\�x��V|q�7\�1��\��d\��w?H\�\��,���\����H�\�%�?$>I����(g&péxp�uA�Ϻ@� K4���\�N\�Ym�!=\�ۮ��#�3_\�V�i?\�\�*\�\�t��=�֫z	��M|\�L|\�L|\�L�\��\���\�\�3G}KRC�\�\�&��*u�\�7�G6�\"\�u�A�ny�-�_%�K�\'W\�\�0�\�\�\��R�\�6k��\�\�G��)\�9L\�$�.y������\�N�m�Q��\�A\r~1Ķ�Y���&_*t\��JU�>�\�װX�4!R[$]!��6\n�[a��\'xXx\r^s~��>q{�R\�K}%�A�Ž%�ZL�:�ce\�\�\�0�0m�62<6Q[g�\��\����Nʞ\'\�v,�]�\�S\���1��M��_m�U��ŋ}��;˝/��D*8�	r��\�)�&,ؽe�r�A�@�9AY\�\�L�73\�ޮ�ao\�\�f�eψ�=���3b\�eψ#\��\�\�\�ϣ^5�)�\�9/�9/�9/�c�h\r\\pn�\�\�c�\��3r32m5gĆ�!���J��*\�)\�5�a)[��,��\�\�j\�\�w3\�\�\�\�i��2+�\��^��r\�\�����ġǚI\�sL\�.\��t\�Q�\�J|D|\�Νr���\n\�U^q�2\�\�\�\��\'���/���E\rw�\���C\�fN��\�\�\��\�\\\�v�̹!�a��Ll���C��C��.�\�(s\�a�K6��\�\�\�ԑyf7�\"P?\�k�jovn����eJڷ�}Lso �J\��J\�g\��aHD\�\��\�S\�����\�.7���ѯ�\�f\�ei�|n�̢�-�Z-YV�\�j1\�l>\Z�:�\Z�vYr\�tN�\�t�\�p\�\��H\��f\�\�p6W#nd�6�a��?I1�]�\�o45�a�\�2��A\�\�14�9�s�r��l7=\�\�E\��T�h~w��]ٯO\�\�\�\�sҝ>oM���+ܸa������Y\��u\�Y[�\�zm\�RiQ�Xm}؂I�p[ˌ\�\�Siŕن\��W*�\�R�C躖\���^F��.{D\�AQyE�\"\�_��\�����\�+#�M�<�\�K&��H\�Y�\��\�\�KK\�]q\�\�h\���&����7V\�\�K�\��C\��_LI~&�Cz�\�_@n�˂X\��(�ɿ\�\�_�x8z9�2���!���إߙO)G\�q�0Cl��b4��P\��\�#������\�zyJ`R�\�\�\�c6\�9\"�!b\"7CD���2��h��e�\\Ƅ�\�\�ˡ9Bn���,R�-��N�L�^l�oZ`��5˽°Ҵ\�r�riNct���p�i�\�FeM\�u\�[L[,[����0��b^],�\�\0�6��gf�0��]�\�T̍��䔘�L��\r\�A����\�g\r�\�I\�5𯖋:R�/^\�1�R\����F��Ds�1N#}�\�8c�M��v8���\�r\�V!*M��\�d3ѐ6\�7�&Y\�\�\��t��O\�>\�JोA\�c\�\�L\�7{�\�!Vg��$l<K��oKpH\�ƌl�ٖC[\�\�a\�x&���\�ۆ�\'��T�QF\�\�)�\r\�ӄ�\�lP\�\�K[����[-9#f\�\�\0:{y����\�_\�\����\�\�7K�,�Stq�b\�Cl\�㦩\�^�\�q���M\\<fޜ���\�}?��\�-�w5\�SYAުkZ��统I�\��rɍ�5\�\�Ή���\�7k\�3罰\�|\�M�.UZ��[\�}\�/}�q\�L��\�\�j\�_��h���9j�	��{\�\Z~+�\�9��Q\r\�\��O�tm�q��z[��F%��}EG\�>��\�\�q׏ڴr�6s<�QFK��ъ�Զ�ը\�\�\�\'%8[�)9\��\��z�t\�*� ��\Zў�>ɴ{�O�b_ܠ埍#�E�q}\�R\'\�i�ӊNƝN\�F��}��\��\�-H�[��ƾ>�\�\���s�}�}If�\�$!	���*�$5*�,*AD,��\\\�j���V�m�\�Ֆ-�}��Һ�-ڿ���*\�Gy\nd�?\�w\�j?�`\�=sg�w\���\���Qc�M�/�$G8�\�p\�9\r\�\���\�%K[~\�;<�\�(\�F\'GqWtqtU��~�B\nф�\�T�~Һ\'F��~��Q8߿\��$F�\�5\�N�Ͽ7\�\��]�%�T\�Ӊ�m_\�\�+�`m�\�9œ���xb�c~\�{[��6(�z�A�\�v�\���\�W��\�dTe�[��t\�\r�@2�P��\�d.��O@�)3�J�\�<b�k\���g��%�C�\ndqR��\'P��Z%\��\'.\��� �>�\�቙��\��\�#\�7\�m\�m77Bj�,���k\�QS\�\�&m�֥\�\'\�\'�\�z����\�&k�ê���Ci*#��lo�T�iE���$�!t��0ƼL.�iVa$y��\�b	\n�m�%�JZ+�\��:v\�ۮ\�\�!�cL\�\�Y~2��]�Z��?\���v|\��\�y\�=\�M�k��<xh2q$\�AD��`\�_\�Sf\�\�̘�N�{�\� z�\�\�A\�\�ROL=y\�P�\�0�c؃\�f��\�T\�٪P�\�kiF���\��\�60S}z`W\�\�\��Ӫ\�˗s �ATPq\�>�J�7Z��O^(\���\�}�l\��q�{Y(��\��z�D8`�,�X�?v�\��\�d\n\����&a��\�L�=����1C\�6gh|<3\�\�`.�g8�ǭǤ\�L�\�f%�Hߢ�\�Gi\"��iWD\��s�����RmE\�\�#\�\r\�H�\�a���v��HPJ�,\��X	y(\�\�\�t/-r�H4��i\���g\�QslztgE$9\��g\�]�\�$UF\�\�H$\�h�\\qHױ5\�\�ZvزlG֤x�7m�01rK<�LS�%	�{�;�m3R2KZ\�h\n�e4\�F\�\�ex4ek�fW$\�\���<��3��ؗ���%}�I�\������?���e&����\�~�3�|h�����3\�7�MB�6�ZG�iA�\�\�Ɇ\�4\��\rrf�\��\�p�l�t2eU(Jr5�<�\r9\�jF5�fG!�\�\�\�~�KWP\�?tԤ\��\�\�\�^-�]\'\�\�\�7	\�k��\�s\�}\�\��s��c�\��sǞ|�J\����q$\�����-^(0�\�b,\n�\��<b m�,O���%\�\'\��P~\n�	���H��\"5vs\�~���\�/\��<�\���\�+\�\��R�\���(X,.�x\�\�~��y�\�&]����\�,�|\�%PUk�]\�Z�z�7��>�~q�#B\�#\�V���0�\�\�g\�a�y�Q\�冄�l�74�\�C#\�R#\Z\�7t\�\r��\r]���\�3\�G\�\'�/\�� RXhp\�{6�b�\�ī�;{\��9P/��\"�\�O�\�4\�9�\0\�J\�e\�eb�x�����kkύk�.\�,̓\��ik�7�o�o\n��qVS�%6�*�r����t�\�n<d�3�\r~����\�`�R�����>j-s�(�ր�pC�	\�F-\��~\r#\�ƶ\�]=\"-�H8���\�\�:3�N�f\�WYW�{ֿD\�)����8Pl�U9�\'��\����\�\�4\�h}\�<�\��RE��\�r�Z�ێ�p�:�\"���j7\��m\��:.1(\�:\��CV;�\r<ĕ5-�\�z\���6\�F�\�\�B�\�1H�\�\�\�M�17�l�ڔ{]\�#\��\�.`!=\���@_4�Jp��@+�\�LeȈ/9Ȩ\"\�\�\�ԅ�E��؏���>��j&�\n\�G�\n�<4q\�ݞ9\0(�p\�\�t{i�T��Z[\�<d\���\�h�V!��e\��^\�7y;r\�+6�6��q��_��G\�{ǭ\�7\�\�\�\'[r���t\�\�7\�r��랪��sژ�\�=i����\'sy\�sΛ\�\��{\�\��=y�y\�с��U?�i\\\�\�\�BW\�=d5Ѩ�\�T�7\��\�\�\�ʏ\���\�\�\�d�\�\�\�Ӌ3k3\�\�\�\�\�%\�K��R�>\�\�~\'�@Z�_g\��!ٛy_\�۟��\��/U\��gY�\�l\n\�\�M��Ĝ\�\�\��W��;aiV\�\�̤҄�)���\�:\�C�u\�恸s{Ud��ڥ�R9/\�L��\���\����s4\��\�5�$	\�2JYS\�ܫK������\�\�8�88X��\0\�ٓܬW �q/\"�\�z�E\\��\�\"�?\�u�蚪����h\�ȡ��������\�Qz{(\�A�\"��c���S�Z\�\�\��9bB���Z=_;�ez\�\�K�\�*mb\�U\�\�\�TױĊ;\r�9繞%��\�\�\���\�kq˴,{\�\�n^���\�\�u<�\�M\�/�\�����i�\�~{\�.�2��0{�p\�$��W�X�Q�\Z�y0�2�&��7�R�V\�b\�a\"SE4me1\�2��V\�x�S�%:`\"��Z�����v\�\�\�ٷ;;�\�U~\�\�\Zʤ/\n]�\Z�\Z\�\nuŞ�O�?ҟ��Ij��P\��\��fm��JV{Yު��iQ\�\�#\�\Z\�W�7�w���(\��4]\�\�2뙃\�Qb-x[��&��I	h\�\��\�\�؍\���7w5\�RN-d�&D�\�(]\�k��(�.P�\�0� 	D0>r�\0\�E�\�Er{D�\�E,\Z{Q\�\�D�N�W�\�-N�\�,����fp�K��\'\�:|&yu\�1\�\'^�|\�mMV\�!�\���\�\Z\�(�bl\���^\�\�M_�b��|z\�\��3�!qǬ{_|\���c\���\n����\�\rO�.��\�{\�_\�Ch\�C/��\�T0�\��}�η�[ӗ\�˔K\�S\�\�\�9�\\��pW�7��7t �q\�\��\�o�f2�$eH��;���50:�\��h}Lx|�re�~����\�\�	t̰P�Xo�Ix�*\�a:\�L\�\�m�t�\�|~�\rf1o��\�$�: ��e\�e�v��\�&|�R�ǝl��\�1\�S�@\�\�ne�!N\�\�6\�<\�A��i\�킅�\��\�\�\Z��ɉ`@z5o^����\"G\�Cd\�JX? �\�Jo]̀\"!&�f�-�\�8\r�\n�\�]b.p\�\�\"g\�!\�\"��Ӭ�F��Z\���\�|�r\�\��;\�x�\��\�\��aӖ�\�K7/��\�W,�>p�\�u��ޔ�qbv\�y\�W�����J�	D\"UN!\��S7�a\�<�\�\�;\�i\�\\v!�<W�\"^\r*�CW��m��>\"|<\�\rvF$�/p&&/HOqf\'.M_\�\\��*�\\X9��\�-&�L=��N6�6\�Z\�-lY\\*��\��\"]%g\�ua�,��	��\�g\��&\�\�D?w���� \�L�_%\�5�lԑ�\�\�<�|m=n�jPe�T6\�a�\�L�|i�+\'����`��U\�q�lټ�a\�=^���\�\�y?S\�t����#4p��\�C\�\0}@\�Ⱦ\�>�\�\���,��-x�װX�TU\�\r���{\�\�\�(��\�\"�:�l�����\�)\��\���|M�=݃2D�j���A�+�a\�u\�{.�\�Y*sB�V�dbh�[���hJJ��ŉ\'�\�/\�RR�\�7&z\\���̴TH:��iEp!\�X�QօQ�?cr9?3�y*&ǰ�a�\n[o���B:Ӳ�A	��ބ��\�˄�7X��j���F\�+��;	���\�@\�Cz��!z�6\�ʟ�\'^C;�*\�8R�x�p�|�\�X\�1b��;R8\�I��#��K�\�\�߆-[�EA\"z�%;)\�\�\"�d\�\�ը@\�\�j45���N\\§)��\�\��׭%\�\\v\�\�\��!��ڳ��\�\�[\�\\\��D\�u��摕waq\n�Yy�L��ۥ�|�Q͇/QG��\"QѨֆk\�ԡ\�\�1\�\�\��:�����1���\����\�.�[۸�QZ5t@{\�uL\�\��U]6`�xM\�5�\ZW5\�;\\���/\�\�XT�lǛz\�\�!D��e� ^\��2{��\�\�Z|:m*��Ӛ�4\�ˋ\�|`˾v\�����\��Ɛsc]�U1��L	�\�\�8\�8V\�\�1\�Ʊ(�\�;\�9`w\�8楒A\�D�\�O�\�\�,5Q��\�\01e��2@L�\�\�\��C�\�\�2f�\�A4\r�\��j֨���bV\�>M�\�Յ0�7��B\�\�*ʞ�N/\�n\�\�o�sh`Ѱ|�\�j�|\�!\�s\�MDx�����P��K\�Z��\�r|��\rꐋ�\�vo\�@\�6��\�\r���k\�}v\�\���g�?{\�\�\��\�\�\�\�HN\��3k\�\��\�\��!��c�N-�z\��\r�\�}��_\��5]�k�=^\�G^a�dIEb-P<�<\�ʎfw\���\�-1\�\�\�0\�#\�L�bXU�@\�j�t �|dy\�m\�\�/�^EA\�F]��\�C�+S\�\�	h�r����a�\�0�h�ܨP�@��\�\ni}��\�>�eh\�\�\�\�(^]\�\�rQ��Ô�a�\�y/\�\�\"wu�\�\�\�2�`,)~���n\���R�\�	\�`0�fǤ\�\�\��rŭ�\�_�ޱ3	 @jy6\0�q�0C\���B�D8C�M���\�\�\�hĮ�aꅈ��\��\�e��\�s�\�\�\�I쀯\�|\�\�}W\�\'׬��\�m}�\�p/�ܑ4O�\�sn+���>\0S�#4�gé���\�\��B\�W\�ZZZ�\�@�\���}T�\�\�c0\�XhhEh��`/�@�+\�\\yD\�\�\�\�\�\�\�\�r���|T9#/�W\�\��S\�~Y\�\�D9\�\�Msρ�ގ�8E�<í\�\�s�^\� \'�rG9\�pYn/y\�q���\��\�\�`�9�^�A���\�Ip�\n%n�t6,	%|\�TJ%s\�B_R\�;��\�d�\�\�\�\�\�>߳\�d��=��bu�*NA#`6t��\�sW{\�\r\���_\�\�\�3�5hu\�gC�A�C\��y�\\����\�cϋ�9>\� ]\�lX\�l^aHk�!U1m�k���\�\��VE�]\�PY��\��C\�\'\0�a��OG�k_���J`\�/U��ϫƞ\�E�-=r�E=\�\�L�Dj:\0\�R\ZP��y�%y`1C�\�Z\�RRH6\�\�-��\�#� \rNQ��==\�몇f�\r\�i�\�\��ܧ���7+7\�?\�\�>�~\�\�9�G��\�~\r��][\� �t:\����\��^\�	X\'^m+�\�0]�%���?�q��<����9\�~�a\�4�;B6Ё�[���*�\�\��p�\nN�w�3\��0LKfU8G��\�\�ެ\�g?\�gT#Ԋy�M.�\��Ln�0C�)\�\�\�\�?.\����\'>�W�F�8�³,�)A�\�Y����帼FP\�b\�h��\�iBU�ێLW\�9p\�VK�\�\�,\��t���\�>\�\0�O�\�E\���=\"�H\�\"Z];\�A\Z��\�d\�x�X�\�#D1\�X�LB\��R5v^9A=�\�\Z\r\�w�aybR��\�Z��\�x\0��1!0i$��\�\'\�(#\�\�b9�\�,Ubz{5�\\En�h�����a���\r�m\�\�aS�_yR��{8��wsd�n�\�\��-�\'�<\�\�I\rR���O/\�\������\�#���F�\��\�_lJyoG�3=\�\�\�d\�24#T�D\�lЋ��\�?(>y�\�\�khcqY\���n�ּ��,�a���\�\�\�R\�\�\�c�\�\�\���+\�T.	\�\��^4�^��a\�=lUK�w4\�;V{\�+7O��\��\��y��4Gy6\�/\�W��<G���YO\�\�o�!Z�:�2G馝���ק�~E�\��\�ʳ$\�8R������3��3�?\�����X�\�\�?:w�\04\�\�Z�\�\�\��z�	�,\�*\�R�:vЩ�/tRA\'t*�B頓\n:ɠ�\�t=\�A\�:�@{���t\�\n�@+\�8A\�:z�G)´��;Q\�[�\�!\���\�\�Y�]�xǤl�Oee���L�v�H�I&,eo�ͯ\�\�<�=F~��l�7�\�iC4�7a(�\�ג#=.=6\�A\� \r�̑�:\�ʸT��\�\ZϯM�\\ U�@\n.��ND�^ :b\n|})ʬ@YMi�R� 䒢W�gps\r|}\r0�\Z`v5y��AԱ�3ey,���`y I�����\nl\�cnTS�$\r�\��\�\��-gKV\�O\r�H������\0}\��\�\�%|��rO����L\r-�\rkv\n9z$P\\�\�?SshuA\�Z�A*\�k��-\�p��\�e�fn\�/n��}�\��\�3c\�%�Gp��L��\�;6l\�\�?Yt\�G�\�{o^�|�~\���o\�|BVRmrC<+���\�v\�#����\���Q9YMH\�V=f\���ǹ�6\�Q�\�3H�\�nhF@�F�\�?C��rq�a\�`Ϩ`ɨ`ɨ%KF6�V\�;�J(D\�KF��P@�\�\�<�� �T0�TD���\�m5R�&~4�\�\�\�7\�{\�\\�\�͑(\�Mh(\n\�\�{�\���b\�j\�(g3v�1\��ܭ\�u\�6�&ŠvR\�\�3o���s\��\0�	\0��#�-��`ˊ��\n+X��`���8>�P,q7�@~���*\�<u�\'\'[JO\�\�q7=\�\�>�a�\�Cn\�	\�s\��<�N\�C\���#3�3	��\�H\�O\�>K�V\�s\�\�^^pD%��\�IӅ�ҵ\�|Ij�F8#���\�\�gBtt|6?[�\�\�t:��Ư篗\�X\�;\�G\�\�oAY\��+\�\��˔+�E\�\\~��HSbiN�	�*\�\�:\�y}\��ͥ�Ñ\�K\�E�4��� (�\�\��a\�\�u�\\�e��\��\�I�2\��nE\�q=uR��\�\��g(\�͠�1��\�@(�Iu�\�\��-\0\�2.�eL��_P\��0��\�Q\�/���\�IԬ\�3\�#��P�4\�d\��T�j�j��\�\n}W\�\Z\�Տ�e�\�c\�3��\�\�(�\���?,ye�{6o�{\�fBu.+��o�\���*��\�\�\���7o�EnvMq>WE�\�a*\�ݥ�u�u�5�\�ڳ�8��\�T����bqvmV\Z��8vqj�t�6;6;�@Z�ͷ��-L�f�>?��c\��ʃ\��l��+X�H+7\�\Z\�]lͲ>V?�(Z�m�\�4\r�\nѴ�2F\" �D@	tHz��\n�W\�RV)\\\�\"\���y��*�\�Ń\\��R(����Bi�����P3n��^��E\�\�ۣ�A\�*�ZgA���\��!�;,�Έ�����c��1�\�a\�\�ß�@D#a(�Vg�e3�\�_w\�\�7�b\�C\�g�-�\�sKo\�T�\���{S�<\��\�\�œ�_2�\�$�\�\�o���[�\�`\\q>{�̻Ť\�rw���!~.��oՄ�H{bBbm\��J�%Ԓj�\Z��\Z���&tM��rU\�>\�]\�\�S\�5\0Wk�Hn\�\�\�1\�,<���9�Q�\�\�\'�S\�D�N�U\�\�i�Lv\�hf��.�4�nO��Ld��\�e�2�Jp{V�\��4KnOܞ&�=\�\�^�}Ng\��P*���N\�pK�\��\�{\��!\�T\�����M1\�\�h^����lϦ\�\�,�j>\�c#�qj�nd��ȡ�#�hScã\�~Y��\�?\���\���^Z~ӳ�\��tq>�Ν�\"q}�\�g<q��ݻ�\�}\���j\�w�\�\�E\�\�f>p\'6��š\Z�����\�\�\�r�lK�$\�![\�VB*,DF�\�\�JH�ΆPW��Q�7\\�\�/X��v\�2Q*\0�<C��\\�B�:\���\�\\���\�cKh:^mA�g\�zs�\�\�%�p��*���H\�\�\�O�?���\�\�\�~\'\\\�\�>\�=n\�sucۻ��\�#�\�\��\�DFfK4/p\�)�	h\�j�:�A\'trA�&\�T�����?���U��G\�ˣrӫ\�V���\�\�=�Y\��.ǒ�ؠ	�\�\�����5)�\�\�ly�2[��\�\�H\�\�u��@\�\�3i:{n�\�\�,e�:�vN�Қ��U�U~�=\\�h\�#��Q^О�{�~K\�oj���Qtj�N.\���W~��(!��5�>p�ʶYR]^S�d�6©+�4\�Q�h�\0q�=ё�2�!�\'!��L\�\�ć	.�x(��$!��G7L\�nQ����\"\� A]�-\�h\�$i��ήXT�+\���2��\��I\�Y�\�\rQ2\�\�\�L%s	7oB?\�\n���\�\�՚�=QY�\�D�~*>�D\�d\�w\�+����\��\�5�/z9ݶ�5\�k\�\�7@����4x��\�9��~KC���kH\�\�>d\�<��WsL\�3M�޳\�\�c �E@-zoY�\�l\�\�b½�Y���pk�\�Pߏ�@Q@��\���\�GC	*/|F�p\�ȒIAX�\�Mc�e�\��1Q�[HtC\n�\�)��J%sb��\�֝SYÇkm˱B+T\�\�#׋)ğC�\�0yZeԤ�\�\Z]�()T_\'+B�K1��j�^�h�j(�^����Y�fjP�y\�\��\�j\�b�	\�?�:\�?��HP�f�+��\��u\�\�o��\�\�~9\�ި\�4\�h�)u\�\�N��\�=\��\��\�u^M<?d�\�Ico�\�ƭ�6~\�\�K�դ+BJ�����g���%\�[s�_\��q&�2�z1�\�Zʸ/�ɽ�t(�SK���\�T\�Y�@\�t�LԒ�Bt!V5�j�\Z\�g�\'���h�_�Fˣ�\�\�\�*q�\�1D�]/n{Ž�\0�f\�|���!ɳ\����y>�G\�e�BQ׫�5{ƀ�/`\�h\�ygym`_(/vs�J�#4��J4��\�z���yy4|k�j��t�V�W/j�\�-/�*\�W>�\�:\�S���������ubc�z\��>\�Ւ���&I�\"��\rE)��p\�-�\�I���BQ�0��\�\r\�\�h�dDKvi4�Q2	\�i\�Ҙ�\�R�h�W�d�\�\�~Տ�\��]�\�d\��c�7�b��tb\�1�<�ċ�\���I.\���j\��rI�\�=���^��\�Ɂ �K�ԏ�)\�W�)�5*ChM��8ñ\�\�\��\�\��*$׍ʻ�Ŝ\�,C7u�O�\�ӓ\�R�.\�^t��a5\�S\�\'����Z\n\�N�\rb\�W����;,�G�o�2\��s{~\�3\���֛�\�}[�?x씩݋\�N\�\'3��qT2�\nJ+�|\�\�>5|E�l\�	��\�\�c�\�:\�\�R�VY.^��E�P�\�\�CS�g0�m�<b�\�6��4\�n��N�E�\r&\�B�\�?*\�\�&WV�0��\�A�η0QҐg�\�\�\��0YҘ\�\0�^�UژVe3V���\�\�y��\�K�\�\�\�-\�|��\\�EY�\�\�{\��\�{�\�\�?a���\�<���\�&nR\�d~�\�g\�U�`>RN2ǔF�s�8U\�Ze�\����̻N��\'�\�l_D\�5\�\�(��\0Fb@2б�\����g1\�k*\��=P cC��LS	�3L%)/+aYV㼇~\��Q<(� *2\� �ICZ�亮��n��R/��*�\�\�Y\�j��?P�<�L�u�u&\�Gu�ՖK��\�\�\�%\�\�\���+G\�x�P3B�(.��C�L��\�+\��ھ����e�^\ZD��0�6Bi%\�-��\�\��z�м\nuǂ������E˖9\�?�\�X i�GJ���\'<\0�\'��\���(�.䯼\�:<b�\0V#p~�\�\�i\�YٶpN\0ڒJ/x\�ڕ\0p\�\�\r�\�\�ph�7e��\�˾� <�\��z�q�=\�˝|kz\�<\�y\�i�_V�^\�\�1�Hp�\�D{�\��E�Fq$��dt\r0��0�p�\�{�=Yd\�\�v[\�\��AA#�$��\�wa\��\rP�\����6KX��\��� i\�+g�Z�t��s�er-��\�!!%\'�c8A�UCr,&ĆŴ�R+����\�´�#�s�Q\�X�\'Jԋ̱�\�\�\�\�Bq�t�s��]q��\�\�\��]8)׫v=S�\��f�\�\�sn�\�c՞C\�\�\�\�g����\�\�w\�{\���a\��W\�pBN�\0mנ�\�is\�u�\�vJ1L\�alI��7�{\�Yiy}{�{\�0*t�D���pHPT�V)ؗq�*�\�E�J�{�b+Y�t:��9\�T8\�\�l�C���\��)7\�nJ\�eE�9+�M\�G\'l\��(�\�\�y�idm�RV����a�\r2\�y\�\�!#��Ha�q\n��\�	��\�p�ik��\�9J��R�☴\Z�>n\�K�Ϭ�=\�*\�ݨܡ`e;�\�\�6�Ѿæ�\�i�j�b[,\�@Ͻ����\�=81�Xgg�\�\�?\�D��oR��Ɇ��GEwl�ڧ�	3Sg�\�Y-�_\�?Hl���ѿ��df\�:>X\�yb愍-S�n\�\�M\"-�ONTM���������Ĭw\��+8\�R{�+�|7\�{7��\�7nf�\�ޕJ_^�\\>g�ܢd�,3\�i���muژF\n�l\n\�\�\��)U���P\�\�L\����Q�9|[Ǣ	\�Ww�\�\�5��ʺ\��n(���?�\�!�-|C\�co\�\��N\�\�+_>���j�h�Mx��-A\��j��C\�*�9|�1�*pX��\�6�\�3�\n@\�P`8�\�t�Y���\�MN�\�2\��Pz\���\�\��\n�\�ۦl�Ѷ$�#z\�jE#\�\�\�AUjr.\�f�3\�ƣ\�1\�1uޮ�N}\�x\�\�Ͼ+�^����\�kT\�\�6\�:\�a�\r��L��:�(X�\nN��\n�8OXQ�e$2ϱD\�7���#\�\�-�h�XWY\�R����\�%c+\�\�a��Y�\�ґ�\�ذ���,�,�E�i�\�\� g�~�V��W	�\�B��6W�,��z\��F��Ww��o�\�\�\���\�e\�c\�\���wzY���>\�w����\�\Z	�\�k\��-�F��\�c\�+\�T((UѦU\�\�X�\�7W�Y�����\�6\�M�\n΄�\�\�\�S\"כcT\���w��\�\�\�yz`�1�\�O\���\�Q�ף\�7c]\�|�����xf��J��\��o���x!��\�^b��<\0{\0Z��C�\�\�&\�\��Wh5\�^�,+\�S۝1j\�\�X��MVe\�	\�T!\�:fVu��O���B�@2�;��\��Y \�R[\�4b|\�^�n�O77(���d\���Z,ڈ�\�D��S�\�iu�Pm�\�j<n��N}h\\t�33432ߙ��UX�\�j7�\�\�\���\��B��S�W_�^�w�?S�\Z��\�g}\�OW�\r�\�g�2\�2Y3Q�}\�\�攰�\�LS�o\'\�`\"\n\�%L��\Za\�yU	����BU�_���4nJ��\�\�\��e���ގ/s\�v\�u�\�\�v�������R\�K0ZnV�uh\�d�_\�\Zyǖ&\nR�\�=�\�J\�\�\�\��\�\n��Zi��u\�P�\�#z$��@��SC4 ]�<7�\�\�\Z T¥\r\�\�;�Jl�Ì\���\�p�[��)\�\�\�Z�.\�f��XfRS�ַ�\�L=-�\�|\�a�s�\�S��dM�\�sG��ٵ�Z����\�Lᣞ\�r�VNo)^��U�K-4+���\�o^�r^x�w.�9�\�r=\��-\�W[Q�6��$\�l\�oJ\�AC�\�v�W&t~%\�>�\�^L:p�\�d��6e<\Z�\�H\�\�k6�_&͒\'[�\�5�\Zi��-�V\������\�o\�1�JH�h�T�ۤ���D�j�Y�L��L!\�5N\�#dK��G�Hs�\�~�*����t\�\�\�����\�\�\�\�!��^\�W0#R0D\���b\�\�2VG\r\�\�}\�X\�(�#��A̍L?\�2P#�I�\�\�*ʾ��\�\�T��h\�P�̭>\�\�\Zi}\�>�\�c�t�\�e\��kd�>%2\�/@��=z�\'ѱ$\�\�\�FG��Wҹ{&\�Ґ3\� ��\�\�Rm�M�Gu\�ͱ6�jJ�\r�\�#=\�\�h*Q+jh�$m��\�\�gn�Q\�`\���\�\�[�\�f%\�\�[���B~��\��]ܗ\nendstream\nendobj\n20 0 obj\n<</Type /FontDescriptor\n/FontName /AAAAAA+ArialMT\n/Flags 4\n/Ascent 905.27344\n/Descent -211.91406\n/StemV 45.898438\n/CapHeight 715.82031\n/ItalicAngle 0\n/FontBBox [-664.55078 -324.70703 2000 1005.85938]\n/FontFile2 19 0 R>>\nendobj\n21 0 obj\n<</Type /Font\n/FontDescriptor 20 0 R\n/BaseFont /AAAAAA+ArialMT\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo <</Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0>>\n/W [0 [750 0 0 277.83203] 8 [889.16016 666.99219 0 333.00781 333.00781 0 583.98438 277.83203 333.00781 277.83203 277.83203] 19 28 556.15234 29 [277.83203] 35 [1015.13672 666.99219 666.99219 722.16797 722.16797 666.99219 610.83984 777.83203 0 277.83203 500 666.99219 556.15234 833.00781 722.16797 777.83203 666.99219 777.83203 722.16797 666.99219 610.83984 722.16797 666.99219 943.84766] 62 64 277.83203 68 69 556.15234 70 [500 556.15234 556.15234 277.83203 556.15234 556.15234 222.16797 222.16797 500 222.16797 833.00781] 81 84 556.15234 85 [333.00781 500 277.83203 556.15234 500 722.16797] 91 93 500]\n/DW 0>>\nendobj\n22 0 obj\n<</Filter /FlateDecode\n/Length 302>> stream\nx�]Q\�j\�0�\�+���\�G\��!�|胺�\0GZ��Z�|�\�W\�:	T`/��\r�ɱ>\�Z9H>\� \Zt\�)--�\�d\�/J�4��[P���5,�\�f��\�V�\0ɧ���a��\�X�n%Z�/��>67�1�أv�YU�\�\�;��\�\��([\�\�\�+7��\�\���\rBqJi\� q4�@\�\����SA�\�O\�P\��9�Ν�imd\�\�yƫ��\�6��\nN\��\�\�\�\��\�6\����6Q\�\�<RsKM�OI�\�+)1\�S,91�%\�>��\�ed�/\��,�!CyL���. ,\�6]1Y\��\'\Zf�4\�nT\�����\nendstream\nendobj\n4 0 obj\n<</Type /Font\n/Subtype /Type0\n/BaseFont /AAAAAA+ArialMT\n/Encoding /Identity-H\n/DescendantFonts [21 0 R]\n/ToUnicode 22 0 R>>\nendobj\n23 0 obj\n<</Length1 182488\n/Filter /FlateDecode\n/Length 1760>> stream\nx�\�\�KL\\�\��sgx\�<�\rl.\�08\�\�a�1���6�\�\�i�t\r�\�Ԋ7��ȢRu��n�No��PTEQ�J}I\�R�ʩ[EU�.ڪR��̵3����h\���s\�\��\��\�\�\�\�\�!�럚Lg2[�7̼WUm���[�Ö\���WO-�6>�\�\�\�u\��\�\�B\�\�\�\�wV\�b�\���\�vv7����\�[u�<\��\�S{ft���ݍ\�\'ӿZ2+��\�\�\�\�>صF+\�|W\��[�\�W��\�Ot\�\�g6ײ��n<��\�\����*x��j\��߸�7��ތ�M������\�dU\�4�4�Ώ��o\�\��\"ޤ��;\�\�Ɵ\�֚�����\�{�r��Cʿ\�\�\�_\�������\�_������\���\�\�{�|=n=s{�\��91k2/��x�^mUc�������+��y\���\���\�\����y�p[\�ﮯ\�QX��\�ٝ;\�p7�����\�ގ5�y�{ZHr�\\�\��\�c\�\���Ϻ�l��<�6%�K\�w���meE��u�<{�\�¿��P�\�\�?�w\�>~w�o�?\�>Q/\�˚�]q3v)���H+�[�\�Xix�ǳ\�\�pcycyrX�\Z�>\�*8�L&/\�s��p<ӥ$�\�*\�\�]=\�R��\�\�ޠ\�\����\n/VUf\�ҊXIa\�\�/�\����	K\�J\�*\�ۙ��}�\�o�?���\�(��.�\�\�L�~KfG�ƛ>z+�\�\�\�>�\�\�����B�2�^b\�n\�ʽa��8ڵ}���Xwsq\�˽\�\�-����RKho-]\��la1�B\'C�\��\��B_�BУp�[��S�㄂ߦp�\�z>�\�v\�Z\�\�\�\��];\�\�\'�\�NDyRϳ3\�_�S\�\�)�\'\���\�z������(?kC6�ϟ\�\�i\�\�\�\n3\�\nS�\�	�+c\n�.*�U87\�\Z�s6Mr�\�\�h�_�Kv1\�\�튍Ey\�&m\"ʯ\����k6c\�Q~C?\�\�Q~\�\�m.�\�\�{\�WQR��kz�\n����\�1��j�\����(/)\ZS�7�!\�\��O7n��9Es&�\�L͙(�3Q4g\�Ŝ�����\�W�g{�iwl\�nٚ\�\�[}G�=\�!\�\�\�\�Xw����Y\��\����K��ju7��}E3m\�7�~V�}\�\�n�\�;�|�o�\Z��Ϩ\�ֵ9m��\�=�\�u][U\�\��\�v5��Ʈ\�\�\�/i��\����\�Ü\�q1������\�\�_^�C{u�=�\�z٥�\�T\��Kwd����x�\\*�+���%\�+]�TIiT,S^\�\�J��b��jW�T\�ʛ\\�JICT�V~\�(9\Z*oq\�\Z%�b��\ZW�SR\�׻\� �\�\r����(\���_\�\�\�g:2�-���/�\�\��^.5~\�mI\�g5gs\�l�pv4�æ�\�\�\Z-J�{�sP\�\Z�6⍤\�cA{*<�ﵦ\'ߏS�W(iS(�\�\�\�O(Tt(T�THt*Tu)T\'t+<�P�Bm�B]�P�R8ԫ\�Чp�_\�ȀB\�i��3\n̓\nG�ZΦ�\�\�ʰk\�keĵ2\�Z9\�Z�\�Z�\�Z�\�Z�\�Zs�\\q���V&\\+����k%\�Z�r�\\u�L�Vf\\+\�\\+\�]+�����9\�ʼk\�Z��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�陵\�M\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�e\�u\�\��E�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���g\��iK\�n\nendstream\nendobj\n24 0 obj\n<</Type /FontDescriptor\n/FontName /BAAAAA+MS-PGothic\n/Flags 4\n/Ascent 859.375\n/Descent -140.625\n/StemV 367.1875\n/CapHeight 679.6875\n/ItalicAngle 0\n/FontBBox [-121.09375 -136.71875 996.09375 859.375]\n/FontFile2 23 0 R>>\nendobj\n25 0 obj\n<</Type /Font\n/FontDescriptor 24 0 R\n/BaseFont /BAAAAA+MS-PGothic\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo <</Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0>>\n/W [0 18012 1000]\n/DW 0>>\nendobj\n26 0 obj\n<</Filter /FlateDecode\n/Length 229>> stream\nx�]�Mj\�0��:\�,\�EPb�t#�%\�E�\�\�\�\�Ē\�߾#դ\�	�\�|\�\�Ȧ}n�K \�)�\�[\�9,dz�\�\n�3iS\�6��B2ܭs©�CJ\�v\�D+\�.6�� \�Y$\�G\�}5\�n���Q\�`q\�I/:�\�	Al\�Z�]Z�\��u|��*���\��s\�I��:pՠ�\\�@o��\�\�[�P�\�S\�\�\�\�\�\\���\�\��\�C����%� 9��x\�S1S��\0O�oj\nendstream\nendobj\n6 0 obj\n<</Type /Font\n/Subtype /Type0\n/BaseFont /BAAAAA+MS-PGothic\n/Encoding /Identity-H\n/DescendantFonts [25 0 R]\n/ToUnicode 26 0 R>>\nendobj\n27 0 obj\n<</Length1 24728\n/Filter /FlateDecode\n/Length 14570>> stream\nx�\�y|TE\�?|�\�\���w\'\�\�t�&$d!	rIX\"V\�h$���\�m��(Tp\�%�0\�MG1��\�6���#\�C~��\�(\�~OUwb|t\�\��|\�?\��3�R\�\�Ω\�ԩSunH�\0�\rA�\�	u�\r�<z\0uci�i3�x\�.@8�O�9{��w�kH�\�\�f�\\R\�]��m�o�S7�y�Զ ��r�\�緉6a\�\��k�[�a\�\�f�\�.i;�B�\���0�+\0\�\�s\�nh��j�7�{�%Kގl;\0����,]t\�\�7-����W\�Z�x���\�u!\�E��K���^\�<���^�\�⫚�8~َeK/X�p�=�.\�ɊX�\�\����ǋ\�\�\��Ͽp�{k\�EX\�洭X�&Q\0oc�V߶jq\�W�?q?��{\r\�P-�D\�L�s\�k��m c��`6ή�>\�\�O\"����\�Ƨ\�x3|�����y\�O���D\��毚�\0/Yu\�]��|,]�`.��f9~l$�eW���a����G͋\���:�\�/7�\������͠\�BZ\�`�,֧\�4�\"86\�t|	\�\�K�\0��(Ǘ@T\"\���Sa&\�l81�/� �A�4\�ҝR)6\�K\�«��Z\�թD\��Kw\�3e\�\�i8�\0tJ�ǧ�R\�XS�\��^9\�~�B �\�&9\��c\�\�{q=�]\0F�x�M0G�\�`\r��N\�N�n���\�|X��K|�\��\�YO\�o�\r_�a\�U\�\�c\�c\�\��L�!i�\���W!\�PL�\�\�(j\����y%8y{��\njHO�C]b)4`��\�\�{0\�ىm0c\\\r,�\�=�?{_J�\�B��O_Z�\�W�+�Zx��_�K\Z!�\'���^QЌ\�\\��V��m֕\�v\���{��LƘi�\�x\�*\��\�\"\�8nL�	J}s*\�dԞJ��\r����,I�%\�\rw*-�}��\�\�p�/����/�)�s`1֬ƺ��X9\�\�b���!�!�j\�\�%�e��f\\�4\�\"\�r\�\0��E΁�Ǻ_cm	�5\�\0�d)o\�\�=�\�\�*L3��\�ɑ\��\\����e\�\"�\Z�\�-\�x1\��\�\�\�p��C��V�/�\�\�|\�#�\�G#=�3\Z�\�U�\0\�n��<s\��/�?�a��\�26q5LB�M\�\�xƵ8^7O7��nJ\�maiU:�\��0\����\�	霿��)Z�R;K�;�z���ʊ�Ғ\�E\�����rs��B���?#=\�\���]N�\�f��MF�^�ըU�$\n����PCk �\�\ZsB\'�|h>\�R\�\Z\r`Q\�Oi��VN�)���K����T)�9P\rՅ\���@���P��̝ތ\�\�\�B�@������v�6`:D�@�{i] JZ�цuK;\�[밹�:\��\��\�\�\�a�W�äSQW�m/q�%<A]���\�^6ࠢ\�P]}\��c#�\n\���E��7\�\����H\�(�0� \n�qQS���x\�MTU�n\�\�l`k`\�ގk�Ͱ�5�_Z4�\�\�0?\�����ߺ�\�ҏ\�?f�q\��\�MCk}BG�{Y�e;:6��ӛ�\�F\"\��\�\�֎\��Zb\�\�\0�F��4G\�\�\�e�̈́\�*9�šzV\�z^ �	�-\�8��\�\���c^�ғ8\n\��@Ǭ\�P0Z\�E\�ץ\�CǌK�<J��Ӛ\�a{͖�`�\ZM��\�04�x���89K5\��,a#\nMB��p$\�!�S%�ŕб�\���\�.\�YՌo\�0�b\�?*e�C��o\05 \�w\�%�S%r��`I�\'����\�h8-(`*�\Z�k�c\��\�\�\�uӑ�6s\0#4�l\�GF���A��[�X��h��\�d>\0|1P�(me5�5�٬�}�f��5�������:g�\�\�\�/%\�Q�8Y\�83\�8}ns���5%\�\�Y?\�%\�+\�R��m|�ࣩ�	���\�Ab�i\�G\�l�\'s�^P)y	4Dͭ�\�����[�\�ԝ8��x�#[j�\�Q\�\�G�$��\�\�;��Cg\�\�\�\����\rPGGC(\�\�\�\�1�;Ѿ 0�:z\�N�����u`A�����\r\�FpK\�(TV\n\���\�\�\�{�y\�\�\��96\�j�QBǷ��\�\�º\�\0:����\\�堑��Ǩ�W�z�v^+��_\�M���\�,\�\�23/ç�.�\�\�NHs \ros���\�Ǭ�\��K�ƥ\'C\����6\�#\�\"߃�#2o\r\"|���=Џ��O�[���7&i\�p-�+�.���[\���\'ȕ�G�~��\��Ed��H?O�/�O ��oF�@�aq\�\���\�\�n��\�w\�W�\��\�Jl�\Z\��������]:�yn�DN,L,�Ȅ\ZN���\0=�<\0�\�¤W�A�A_\r���L\�B�\�i�0^z\n{����\�pt�#x_��&\�t\"qY\�3��\� Ǵ� \�d\n}H\�\'\�&ޅ��^����W<K\�)��Iܓx�ђ�\�i�D����\�}�ߢג���18\�9�\0�����|M7$6\��&��I\'���z\�z�^xo@�Ђ�]; �+���(��\�(|B\�\�G&�\��5\�\�E��p����H\�_��C��2Z�>�#����\��&rYAn#���4J�\�oE�x���\�/\�ď\�HLM|��N/�L�\��\�\����\�M�&����T��\�>%G\�1���t\Zm��҇\�o��\�\r\�\�b�8N<_|E|W�Fڪ����~8~S�7�WO$^E\�1b�9x�]W�V<O�\�\��;�>|\��\�M\�s��\�d3����<G^%_\�,���t4�\�^W\�U(�+\�M�f\����\��}�7�� 	�\�Ha�p���\�§�Y\���#\�i\�\\1�+S\"M�fJ��\�\�3\�	�Z^$�ɟ��TmT�����/q�/�G\�]��jԤKQ�\�����\�\Z�����(�\�U� \�\�qW�\�H��3\�\�d1��l\"7�\�\�]\�~�[�΁�p\�aZKg\��t1\�H7\�\�\�c�\�/ҷ\�ڇ#w	!!,�&	s���\�8�5\�za#J�\�\����Ї�\�3ĵ\�\�\�N�1�U\�\�B|�z�W�\�\�i�\�^9M.�ϓw\��d\�HU�j�\�\r\�\�\�m$�\�\�Co�ԃ{0�>B\�\�҇\�D\�<�\�0w\�ߡF�\�Y=�\�A=��\�1��k\�(\'\���\n\�C\�Q��?ӣ\�t��\'�G\�),�^�A؍\�h;=H�q���s\�\�\��|Bv�\'�\�\�\�\�|�\Zv�>2�\\N*\�x�:��d#T\'\�\"ѐI\�\�\�\nq��oͤ\n�_\�\�\r\�\�>u\��;�\�\��k��H�ch\��F�\�\�\\��~50�ׂ�l\�GZ�\�C��\�ɫ�Ǌ�\�	�|!\�G�\Z�����2�^�DE�w\�2؅�n)�\�_\�l\����\�\�Ɲ�E[R���	�\�Ep9Z�\�\�݉��$V�\�\��=F�\'��#���\Z^�w�C�\�>��?�~|⋠�$n�MJp?�I\�\�\�#\�c\�\�W\�(\�pj�\�Z��Bx��o�\Z\�\�à\�[�co�hDx\�/zu�\�L*\�;L\�d5�r%J\�n\�\�O\�\�8�v\�l�!��pF�5�ӈr��\�\�\n^E��dZ\��\�\�H*\�\Z\�O��nE�Ջc�3|�\�N�q\rC�PG\�`[\��{	Md/��>�B\�Z\'�\�E\�0�d���w�ҡJ��P����˄\'�I`y\'�^>CV\�(L8�~p�iP��cx�b��\�Gq]�\�$\\�\0^F\��lP\�u�:.X柟�ө�\����<�5\�k�Z�ʨث\ZB&\��T�*�\0*A�\�*I%��\�i���Ճ5�\�C\�T\��Y\���_x~��a4����Ԛ!dj�J���D�\Z\� ɘ4\�u�V\�H��?Z\�juC\�\�\Z�F#i4\"�E�F�Y-�\�l\����\��P��n�ìV?�L�\�W\�jEЈF�V�۶\r\��{m���U\Z46��_�=�H&C*c`�a�N���\�K��,z��Z\'�\�a3\�?oۄ�l\�\�\�2�_�� �^��[�^�\�:��޶�͒ʘ1k�!3��U�Lؠ\�a2�@cP��\�\'���\�@�}jt\�S+f��!d&�\Z�E\r&�\�b��ΤS�\��o�\��\�r�26\�ZC\�\�V|�V�\Z\�j�\�j�Y�@�;�1���]<\��I8�\�Bf�᫳ٴ`զ\�l60Xu`	�{�Uۃ��kpnp���Y\��\�\�v\rX5\�v���m\��\r\�ϞAE�aH��2̺|C\�.|�.�ڠ\�\��C��\���\�\��*Z�`F*��Y_\�2�_�׫�>\�\���\�e\��А\��\�1$�����\�!d\�4|Miiz�\��\�\�\��\�1��dXΐ\��\�T\�,�Y�eA kY�_�?\�i\�a~?\�\�,\�Y��\�t�M۹\nr;ʅ@\��� �\�`\���`0�+��*6d\�?{7H���\n T0�,\�\�\n�!`.�B\�\n\��?���\��*Z1��\�T��y\�CȲ��u\�\�\� \�V���\�l\'d7��Ln�_~\���F�LeJ0;|\���\��z�w@�c��\�\�!���3\'�2��=i	�C�\�\�T��e\�CȆ�\�VZ\�\�ɥ���EgϨg?��g� �WB�8.��يqC\�J+��WVz�\�;����J�P�(\�8dt?{21L��ʰ���8��r��1cҠ2-2f\�ȭr1\n �H���1n阮�S\'\�]!g�:���:\�%�q\��\�A4r4��n3�-�`A��\��\����\�@t�\�\r�\��hA܈^�>�$��s�\"��1\�����\� �3!���[\���\�B́,\�\\�y���9���8a\�Cv\�B(@a\�\"�X��#8�@Q\�$�B1b�@,G�;J��J+��\n\�G!~\r��\"�~�Z�8�\�\"~50\nQA�\�+�O�I����8�c\� փ�\�\0��8N��\�0	\��&C=b#4 ��q\nL@�\n���d\�&hD��xf��>�	Sg�T\�\�\�@\�0�f ef\"\�\�x\�B<\�$��>Ι�\�p�͈�I|��\�\\\�p\�B���q1���\�%��s9.�\�\�\�\�\�B�\��B\��a\�/�ň\�a	\�\n87��\rKW\�2\�Up^\�S�\�G\\ �\�.D��\'>A��\r�X�x)\�\�`\�`u\�c��\� �\�\�%>�v��\n��J��*�\�Rī\�ćp\r\\��	�\�#n�\r�Ў��@��\�up\���1q}���\�5�7p�6%>��`3\�\�Ёx\�_\�wيx\\�%�\�u�w���wr��#ލ~\�pܘx\�\�nB섛\�[\�۰�8>�c\�Cp\�\�p\'\�N\�?�gyw\�=�J\���#p/\�n؁�(\�{�\�D�-܇�@��{9\�\�Ļ\�U>��\�L��s\��F|A\�݈=�(\�~\�#p\0~�x~��$Do��\��)؋\�1ħ��x�Yķ\����9x�Ѝ�<\��\'�&��_��/Ó�7\��c�\n��O�\�!\�E<O#�\n\�$^�\�\�Y\�\�\���\�\�\rx�M�\�\�\��<\�x�x	�]\�W\�=x�\��G\��\�\�a�\�\�\�Q8��Wx�Cx-q>\��1���	���)���\�\�\�\�ğ\�8��%��x=\�w��{�}�g\��\�#�� ���B�#|\rG�M�\'\�#\�o8�����O��O��%^�\�\�s\�\�\�\��%b?�\r1��\"z�\��c\�ɦ�\�6�$�\�\'f\��\�m�\�fӿ\�6�knӿ\�6�+nӿ\�6�+nӿ\�6���\��ܦ\�6�8�\�ǹM?\�m�qnӏs�~�\��\�ܦ��Ǧ�_\���\�6��ܦ��\���ܦ\�6�(�\�p���l���M?��a��\�l���6��駸M?\�m�)n\�Oq�~\�?6��w6���\���\���\����\�k\r£�3b\0C\'\�\�.��D\�\�\�j\�q\�.\�I�bbT)//�������A)\�\�fŻ�����N\�E#xS\'�U��ي0P0�R\�0lð\�Sd\�n�\0C� \�\�5�����!S�]x��!8�!�A�\�?�sy��JD\�]\Z=\��\�\�@.�C;�=a�`\�	�\�Ǻ��\n��\�\�~s�V�6`�`\"�^\��.3�\�]&[�Rkn�&�\�\�\�@�\��\��H\�+�E\�إ5���~+z+d+vىHx^��\�vٜ���b&\�,V\\�Lt�\�%M(�����\�x����g`�\�t���Pf\�T�L\�v\�\�k��~�Vp\�\�\�/���lm̘\�gm,��g<^ps�`�C\�/�U�\�8 (\\���4:6�\�1��\�I\�jA�G�_hG*�\����ŕ\��\�\�\�J�\�\�Y8\�Y(?������ǰ�Z�P/�\��/�/�\���/4<\�)܇�_��+\'\�\�{@��s\�\�\Z\�\�\�&Ukl��X\�[�\�bmT�\�z\�����\��\��Eo�\����\��U\���\���\��Au��b	[�f\�	�B�plǰ\�L�1hOd\�����1@Q,�vi�ld\�\�\�\�\�]zcI͓\�j\��\�ئ\"�\�r�KV\n�T�u�}��-�\���\�J.\r2:ْ<)�� �`҅��\���c�)�}�fB��\�7\�r���\�\�S�+��O\�8\�K\'7}�\�Gk\�\�\'\�\�<�\�\n�(=@�ū���K�\�(\�;�/,~z�0\���\���\��n\�݅�����\�&K����R	v*\��VgIm6}�>��:?}\�,����x��ӧ0vc\�Kנ��\�\�i9ޡ���T�{z��8}�\�\�ۖ�vŌlј�E{b2�~�d��\����\�\�ˤ��&�\�\�\�]]9Y~\�l�Ї\�X�\�Z����fr�:\���J\�U�F�\��=t;ݮ�+�l�PyX(\�..,~Xd\n���fz=\Z��/݊X�ڃA���n��\�\�~���v\�N�jEl\�)@4֞\�\Zz5L\�@���6`h\�p���b�ï0\\\�K\�`X�\�\"�&m\�цm\�\�\�9ڐ�\r9ڐ��s��\�\�b`�\�ъ�\�\�\�9Z��9Z���s��\"G+\�hB�&\�hB�&\�фM\�фM��	9����s(ȡ ��\n\�P�CA9Ρ ��\n\�(F�b\�(F�b\�Q�\�\�Q�Ŝ�9����s�#�\�p�\0r�#�\�@�\0r8�9\�\�aF3\�0#�9\�\�a\�f�>k10��\�q9�\"\�Q\�q9�\"\�Q\�8\�9�\"\�Q\�8J/\�+�}Y#\�ad9\�Y#\�ad9�,�9\�ad9�,�SS_ÅAQm\�c؀�\�\�E\�^\�\�E\�^\�\�\�\�k-\�E�(rD�#\�9�\�E�(rD9G9�\�\��\�щ�\�\�\�9:��9:���str\�]��q�ϕ��4�\nҬƳ���|o�c<^Gx|9\�\��\�a_W��R�\��E�\�cl�\�k��&1��։&`\Z�yV`؁a��0�x\��0$h��)�T\�T;T{TO��=��*j��\�;\�=�S��G>*\�@��\Z�e����\�\�\��A�\�\ZZ�����-Ƿ��)����r��<U@��m�VC\'�[�\0TP8iV�9c�G0T\�\�E\�t��c.,g���LF�J\�c�bxÕ*0�`(Đ��\�\�\n��Y\�L5yC.� �\0\��\�X-j��\Z\�\�]\�@\��\�\�C��\�b��c�\�0z\"���_�!� �݊\�\�r�1\���տIF�\��0\��a\�\��\�Y�\�W��2�\"c���g\�Y<#柃d\�c�|�±\�F��;\�\�\�|Ҍ7m?Ks��dO��4F�1�VC.[x\"C!���\�B\�xi�����o�C���`Q=\�	t�\�\�&s��`\�H\\\�\�j=�{Sq�ŏ�\�\�\�\�\"\���w����/\�Vc�u8\�-����\�@7ݭ\��\��b���������3�-\�X�\�?Ȇ	\�Lw\��7a��p\�1��\�n>\��%~ş\�\nd�\�d����$\��0�oAv7\��\�\�Ģ�N���\�R�S�V�T��U�ʮ��\�j�Z�֪\�jY-��\Z\��\�\�Q%\�~�\�.�_��E�ku<m������%j\n�!j\Zi\�\�q�1ڻ\Z��f���v�ܨ\ZG�\�Fh�5.Zn\�V%fD+QU\�Y\�{	�>��Q�����\�n�`EW�\�\�\�%p�u� \�s�u���\�j\�5ֱ����_�\��|\�C�\�\�[g6GI�DKX\"�i�^�~Ӥ�������\ZYi\�ۨ�~+\�\�\"H�1\'Cm6\"\�\�\�\� �\�О�cd�FI�dG� ��Nk�N��5p:�0��G�u{N�\rp�\�Ɇ!4�1\�[�7\'�S���Q�\�P�,�7\��#I����\����w-��$;ER>HR\��ȏ4�$�=o�ƞ�4\��\�x\\�t�X��Y�\�;���\�Z�[\�-uG\�{ׯM�VON낅KY<qtmhq]t}�.�wĳ�P�,��\�\�\�\�j\�����.6BQ�_骩n��I_[�j���ƪYcͬ��\�_��e\�5��Z\�W-\�F�\�}\�/cz\�ԼW\r\�\"\�\�N\�]T�En�#\�涱L�{F\�\�}�E �@�D��qQVUX[X˪p��*#�\r�T�{�\�o?ٕ�2c�%4D��1Z>�1\Z�9���JT��\�k��=�\�\r�\�\��\�\���\�PJX��Ϛ_z֮]���\��j�\�h�\�\�\�\�\�8�\n�j��`\���2A\�e{5��\�D/V�qd\r뎥\�$�T�\�u�h�ܩ�\�UX\�\�M/Y�$�\�0�G/�q��^ԕ�\���5]E\�\�\�UǼ�졫YY���K!&�go/\�^љ\�Y\�Y!c龇�\��0;JcE�&�z@�\\Aa\�X�\�\�\�yǝ,G«	�\�υM�>(\�թVW�\�\�,H�|u�\\�d\�k\�֦�x\�ZΔl$��\���\�\�F(\�\�uK\��PId�R\�j��\�9$ KTڣ~e�;l>\�R\�_m�>5}5}#�m���`x�x\��``�\�3d�~\�3\�\�ut�\�R�^�\�b\�\�\��\�\�k\�\�\�}#h�5y�<C�=߹VZ��FR�l*�\�\�r\�\�![R\�IwH�i^�\�I5d\Z�d�����8h�Zw���\�\\\�\�.\�F\�h-36\�3�i&bR\�2S7\�S2��Z�t\�8�o\�[�F\���*bR�U\�*A\�M�\��\�O5�lY9�o��\�T˔��}P\�2ܲ�\�0�Y�eD1����\"\�b(\03.�K\�\�	e\����d�XC�\�\���9��\\Jʈaע��{އ\�=���\����N|A���d9�e\�9цU����حLrPrO�\�pDi�\�h̘�Z�^��Z�Q�k�O#�d�\�e�\�Y�\�y޼�D\�Y\�,\�\\\�y\�e\�\�5\�}\�}\�\�\r0�m�\�l\�\�\0��\��V���lJ�3�P\�X����\�l\�\�$ec�*p�<O�yX�k�C���@��\�\�L�\�\�\�\��֯-\�\nZ&�\��?�X�T��}+-֪�\�\�Pp}\���WcqJx�<hA\�ef\��2k\�\�Ҁ���\�lE�U�5t}K|\�\�\�y��\�׈����\�\�\��\�\'�l90���\�\�ir\�럐E�&}�R\����:�C��Ie�q�(J�@\�:x@\�ֈ�V�\Zm�h\�#A\0Y�(�*�ZjI��\��V%S14Z\rB��\�@�bC��\� \Z�.@P��Q��K?bmr\�l\�S\�-+W�\�I��\�\�E\�\�L�\�Xz��K��h��\nw`7� �i��\�R\�H\�$�֑�����\����h\��\r�~�\�\0�;��	|p��-K=��0A\"\�JoI\�j\�6�\�3\�S���{جp�hteL\��?�8�5�-�=]J7��s�|Fi#f�\�\�Sa\\S�N\r��f5[���G�\�\�t\�eY%�B�\�5��,\'7\'ty�g�d�mS\�{�\����\�\��Ni�3���M\�\�,���\�g\�\�\�6-5h�c�F8Gp@�S��2M2��:Ow��\�Ncgh��F+�e�K\�Ԏ46L*�Yc�\�&�y�q�i�i���\�Z\�Ś�=\�\�7k6{�I�5N�Fo2\�4�5n4\�l|�(�\�`Л��˙m3\�I��\�N\�v��PpP\�mQr�`6P\��\�N9*�ʇeQ\�\�\"�Pq�����R\���G��\Z�j\�;\�\�7�\\r-+1&��U���[���O,U0�V�0��py��N�-(���\��TC�\�{����[/?�+~\�[�f�����7ϫ�61\�Ϥ�\�^��\�*�\���\�\��\��f5��|�^b\�d\�L\�X��P��X,��4m�v\�v�J&\���\�\��$\"u�BE+���ʱ�E06\�6\�N�S�z\���&\�\�8�y/U*#\�SN���~q\�\�)�aJMZP�˃<\'>�O��O��\�\�\'כ\�\�e\�<СT�\�*�ʌ������Q���c�\�|�\�v\�]Ν\�\'�o;>�O\�:�^�N�*ۦ\�\��CFbLnX_��\�\'��\�}4\�+�u�z}���/�{z=��-���n\�>�Xl�+mA�U����\�HC�9�\�7�<�mۯַ{I^�G~�\�;\�\�\�\��ӟ>Y9�\�so��>���w\�^������\�űB_k��T\�U�I\�N\�d\�ĴI\�\�?�hFz\Z<g\�,�sM΍���{{|\�{_�\�e\�\�p\�g��\�x.�\�Ї\�\�\�?\���\�\�1\�����a�,%<�,K\�\�C𤗭\�:�E�\Zҙ�/6�\�ƤH7�G\���.��#��`�	]?\n��J��&��\�noY\�B��*�A;�\�\n�\�1V�)�!��\�u#r\���<Cįߡ�~=I\�^1:\��\�ie��\���bBHi~p��|\�\"\�\\�\\+\\�\�S��6uP�\�Cue_;-\�\�\�\�|\�\"�\��ct�%�1\�7\�2?�9V�NVF���\�J�>\�K/���(���#-ȁ�I0��*���Y�ܑ#K٦\�NWW0W�q)\�\�F���å��4�\�/�W�F��ŉ�k�v7\n�\���:�J��`˃Oι\�\�\�\�hZ\�8��3�ˬ�\�3\�K\�:�\��;o�ly\"\�}\�\�g�Ux\�\r\r�\�s�kL\��M�\�Z\�έ=�$�\"k1�|j\�\�\�n��==`M|��\�UU�&��u�<G;\�9\�I�V%���\r�m\�z�\�\�h��ݬ�C�\��\�^ve�Tv�6�\�ZWP\�m\� \�|*\�\�\'=i�v\�ϓ^���\�\�)}�՟NE{��\�}L\�\��\�Sx|��[\"/\�.q.q/K�Z\"\�f\��Ί�\ZX�Æ�CRd��\�\�\�3�x\�Y{k٤KZ�\�x\�\�k�:qs���?\�\'\�\���<4�m\�\�}�\�\�\�\�l�{\r\��U�\�l�X#Υ�e\�e\�\�ݗxn��\��`���m�[\�/\�/\�_ؾp|\'\�*m��\�\�\�\�wD�L�\Ze�pV�����L��kL[<��;�=\�}N��k���ŏ[\�e\�R+�d��\�d)3\�\'\"hQfV�$\�t;\�\�~B@Ī�KEX)	B��%�ih^�>U\�\��6\'E\�n8\�J>\�fW�\�$\�\'�F�i\�ôjd�Ĕ�\�Q\��N[v���8�=|�/\�#ξg>�\�Jfκ\�\'\�>kE\�\�!9D$*���Y�Y(��)�ٮZ#rD�&�\�vT�\�4����:J(ӏr�y&u�Ɏ:\�\Z�����i�bԩ�&��}\\�FCa�b2�wӝ�ړ\�\\=8Õ��\Zíx�\�O)\�\�2y�v�5�-rK$,OM�l.K�Uq~��ڽs���\�3�+��\�ZTw\��\�\�]�\�\�\"$����xn�\�\�m�������oη盋�b�4�@�q�4\�\�\�\�i�ռKک=�9`\���\�v2�N��\�2v�\���\�k_п�=��N����fJs(h!�\�Rfr<\�8\�\\2jxltaL�S��`m2�\Z�\�m%\�\���\�H���遤{����Å\�؝\�cń洓}\�2\�\�Y�̯uV7w�NAR\�H*QQƼ�;2\�SP�Le(�5�\�\�\�c~�ݭ\�\�k\�J�	M��\�j\�Ej��mҊ�@\n+YS��űR4�\�\�\��\�*6蘋E\�.�v,\�\�k�C��Y\�޽QA)Y�F\�=:T�\Z\�tF�\n�\n��.S\�OK���x\0H�\� �\�ic{@%�\��\�=�=�]��\�_\�#V�_��?nn�p񜳫�	�Qt\�}�\��>\�B8�|�\�˷N$\\�a��\�\�n�q|�^����H�0,�\�-�ŧ\�\�\�P�\�i1\�L`6\�\�WG�Fmґy���\�\�Bheb19I\�I�,��>N�`\�*mv���F=Mݤ\�y\�\"\�<�tQ1m9\�>:��N\�d:�ї9=��{\�2H��\�\�x�9݂\�\�\�\�m®xj�JL��\�![);qps��Up�:Bh^C\�X{�\��cǔ��Z���Ŝ�k6\�\����jz\����&��.��D��,�(}S:�\�\rm#�1��\�B1)���B\�\��\�Y��=�=\'.\���\�,\�٬�\r�\�\�y�\�\Z\ru\�Ƽ�a\'��.\��xf\��]�ސkt���\�)��\�x�\�\0�\�FW�.�>\�$7@(;�(Kn�\�\��y38~S.��\�B&p�C\��\������\�\��nAF�	\�V�P��z��\�ɔ�1���?8��O�J~�8���w\�\�\�\�\�k�SW��>\����\�-\�2��\�s󗄗\�\�sIN\���_�&,��.tJ\�x\�\�E�f�і]Bj\�\�ys�Wd\�\�{ߺ|!O=\�NTc\�l��\�\�ZϽ~�\�\�W5\�V:2�\��s\�z��mo��\�\�\�?��\�z#�\�\��\�w\�C����n\�;y\�bJ\�D���-�yg��Ѩ$��E�-K-!\�f�Xm��j��\�h�v�\�	�\�\�5J �l��$4D�b\�%qff�mww�i����w7\�s�n���\�AN8�\�\�I\n~\�0�	Oe�\��T�\�\�\���L]�z�\�d<\r\�!�:P�\��q\'�$ٽ�\��wOK��>�ayi=��OvLlۼ��:b\�\��-\��cj����E\�$�\�tQhpd5m��i\�\�vMTӫ9�9����V\�M\'H��I�S��_*Z�N$K�J\�R��\\�Ye�G��׏�\�\��Gg7\���竛���\�}D���a���û�B[p�\��g��]K\r�ݕ\�=�e*�,\�\�\\\�y��)\����\�j�3�V�\ZTnM�|�z�,\�\�| ���\�odi�j�z�|�x�x�x�t�|�\�N�\�/Z\��\n\�U��\�\�(6JZ��j�\Z�V\�jY\�I����N�\�\nZ�N\�*^�H]\�G\�~��\�rH;�Yǣ��,u\�f���O�t\�2\�\�њj\�%�\�聪�v��x!�	�A8\����*�Q�[ 	���l!2�̍\�B���\Z�\�*t{N�u�_��C\�\���r��9�$�Q>[K�I�\�RT\�K\�%\�/�J�N,�(�S�Z��X5��?[�\�:�&\�H\��}��@��b.\��\�݂}\�)�w\�N}�P�.s��\�h��\�]\������\�����\�;U\��\�G�\�\�7B~Q~V<��A���x\�\�j0\�\�+%UPTy\�ٱӪ���Uf�%ח����E\�3�s�eny���@E\�\r�\�\�\�IOòi�5��a\�c\�\�@�W �_B45,VF\�s�4W�\�P�!+�,W5��(�P\���)ן۞+@n �87�+\�z�>�p�R_q������x$�Z\�¢��k\�۷��}{H~o �\�\�X\"a[\���#��\\N��s��z=��.���\���\�ޟ�{;=w�\�\�\�eԌ�]Z�L̹\�׳fϞ5\�\�\��#t޽ë\'n�5Ni\�]s�5l���4�\�\r\�\�\�9a�\�V\�\\��\�j�[$�Z\�:u�\��$s\�fQ\r�^�ë*%9N\�\r�s��̴iu9z#�����pzrO��Z8.���\�\��\�bҸ�\�Љ��gYӫ&�	�����\�r\�4?\�xtqe\�\�X\�/\�\��\���/cvm\�_\�ę\Z\�۹M��9�L��\�[��<�\\�V�\�\�Јy�m�3⾍\�.߮�M߭y��\'�Y��3\�3�s�y��e�G�Y��\�Z�y�Z�p-Թ��\�\�^���\�|\�g\�Oܓ������~�e\�%xg_\�	;�H��̊\�b� ����=䜛\�\��W�,�\�\�\�v���˗\�r\��\�\�\�k�\���W�g7&vݻkW\�ݻv��n�_ ކ�5�r�2�\�6\�F�eB��\�V\�&&\�\�|��i��;ොR�ç\��3ԟu\�tf�q���\�����;*��\�\�N\�ƅ4�3���M\�g>\�?\�a��l\�)���*?\�z+�K{^��\�=\�ۦ\�;�_�\�\�k����iQ�/�����;\r���z�v\�ӵ�����\0�\n>�]J\�m\�\�Li��V��\�ƥ\�6��՘�~=ݦO\�i�~��\�\�EJ�J��-PY�\Z��XӦ5\�\r\�V:Ϻ��\�z\�*Z͐C>J\�I\'�\�c�\�!i0\�\���ϔ\�5%�\�]U�\�Jh��f��\�mޫ-�D9�N^He\�d\Z=���\�șƌ�Q$\�\�v~]�7\�k��s,F}6\�\�3J�l�C\�\\�\��\�z���\�[\n4*{��Zz�\�?	}g8�)\�fn\�\�fݙ٣WՆ����s3\�l�n�_�yU��\"�^n\�M6L35\�e�2�rs*�\���\��Py�J\�JM\�m\�\�gff�TY�ʰ\���\�8\�\�-\�\�\�Xp�㖂\�2\�\�6׵\�;\n~]&��N%*s*i�2��|�W�Ru�){[6\�V\�\�e\�^�1Kq�\�m\ZF����adXF�\�L̥\���,s�\'Kښ乤1\������4Z[�\�*eA\�\�qfW\�}�<J�r��8IN\�\�`Cp���e�SDK\\T�3i�͠�y\�y\"�tM^\�m��\�g�\��:ZV�z 3�2�q��qfw\�hWF\�\��g%�/\�+>L�o #32o7ܜ��\�72\�`�\� �^H\�顔\�\�\\�5$\�\0�|fv��t<���4����D\0b\�\\+9�͉��(S@$�\�\"eSp*ش�ԥ`�.u)\�e.�eҥd\�#`�&��]��\nZo��4y^���J���?\�\'l-+\�\�\�V%�Ia$+#I�j%>-ɟ�d%^T4:k�)\�pl��Jo\�W�dL_��r��\nR?f��=�e;�����\\T:�\�\�\�\'%\�U�� ��bه\�b\�._xaE�\�1)�\�Y\�\��\�\�7�\�\�Z\�5�(�吧#\�\'��\�O�\�3f\�vK\�\�9wt�~눱\��\�P�#m\�\�\�kn|-\n\�?No�\��3\�%?\0\�i�M�����\�\�\0�\�t�\�j���ډ[Ш�*���\��NW\�%�b\�\�\\\�\���\�.p\�*�mG�\�i�\0�\�yh%��\�r\\\�َ\Z���\�jo�o����K`7\��b�h�x/\��L4F+\�N�F;\��D/��:�=\�|�{�}\�>#���Ҕ�\�BН�s��\�ԇrK���<\�B/\�\�\�\�Nv/�\��V\�4W\\A�b\�\���+\�i�wJ�׏��:����-(���\�9�#>\�!\�y�\�Tdjx�>҅1�\���\�\��,\�\�j�^���\n^�W�	��\�uz\���3=P�Ig�.\nte0J�	4ɭ�����-�\�U&\��PS\�~@\�?��)VhE�V���Ș\�T�/��;-�Lg��\r�A4�\\^��F;��8�Xщ�J\'ֈ\�DA\�O��\�Ү��\�@��\�\��e\�aB�����o�L�_\\�)\��{���\�\��ʇ[\�W��$hs�\�\�6��?�Er_咍\�H0�\�\����zga!\�@�\��\��cH\nendstream\nendobj\n28 0 obj\n<</Type /FontDescriptor\n/FontName /CAAAAA+Arial-BoldMT\n/Flags 4\n/Ascent 905.27344\n/Descent -211.91406\n/StemV 76.171875\n/CapHeight 715.82031\n/ItalicAngle 0\n/FontBBox [-627.92969 -376.46484 2000 1017.57813]\n/FontFile2 27 0 R>>\nendobj\n29 0 obj\n<</Type /Font\n/FontDescriptor 28 0 R\n/BaseFont /CAAAAA+Arial-BoldMT\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo <</Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0>>\n/W [0 [750 0 0 277.83203] 29 [333.00781] 38 [722.16797 0 0 0 777.83203 722.16797] 51 [666.99219 0 722.16797 0 610.83984 722.16797] 68 [556.15234 610.83984 556.15234 610.83984 556.15234 333.00781 610.83984 610.83984 277.83203 0 556.15234 277.83203 889.16016] 81 83 610.83984 85 [389.16016 556.15234 333.00781 0 556.15234]]\n/DW 0>>\nendobj\n30 0 obj\n<</Filter /FlateDecode\n/Length 302>> stream\nx�]Q\�j�0}\�W\�q����ւ{i��^�\�h2n5��}�\�g\�\Z\�p2\�2\�D�\�\�\�y�\�&ق\�6\��<]�\�\�E����¿;ˢ n�\�\�ؘabU\�y���w\�\�\�\��^��ͅ\�>Om�\�\�\�o�x��\�\n�\��\�ٗn�lߨP\�~\�\�\�c��℺���\�v\\g.��8��WO\�\���W/H\��s\�N;�E\\�(9#J�D�(K�\�̉�\���QY`\�\��f\�Z\n;�oIN%eޓa��YF�^EB��D�F�#Eo��K)�(s���\�t\�չ0X\�&Nt��6p[��\�Z�\�a��\nendstream\nendobj\n12 0 obj\n<</Type /Font\n/Subtype /Type0\n/BaseFont /CAAAAA+Arial-BoldMT\n/Encoding /Identity-H\n/DescendantFonts [29 0 R]\n/ToUnicode 30 0 R>>\nendobj\nxref\n0 31\n0000000000 65535 f \n0000000015 00000 n \n0000005854 00000 n \n0000000104 00000 n \n0000037591 00000 n \n0000000141 00000 n \n0000040339 00000 n \n0000000227 00000 n \n0000000312 00000 n \n0000000487 00000 n \n0000000648 00000 n \n0000006116 00000 n \n0000056285 00000 n \n0000003257 00000 n \n0000003602 00000 n \n0000003793 00000 n \n0000006393 00000 n \n0000006456 00000 n \n0000006560 00000 n \n0000006623 00000 n \n0000036175 00000 n \n0000036411 00000 n \n0000037218 00000 n \n0000037730 00000 n \n0000039578 00000 n \n0000039813 00000 n \n0000040039 00000 n \n0000040481 00000 n \n0000055139 00000 n \n0000055380 00000 n \n0000055912 00000 n \ntrailer\n<</Size 31\n/Root 18 0 R\n/Info 1 0 R>>\nstartxref\n56430\n%%EOF','application/pdf',1);
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
