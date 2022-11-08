-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: job_search
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
  `job_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `salary_per_hour` int(11) NOT NULL,
  `skills_required` text NOT NULL,
  `active` char(1) NOT NULL,
  `job_location` varchar(100) NOT NULL,
  `creation_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `ctc_offered` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_details_id`),
  KEY `job_id_fk_idx` (`job_id`),
  CONSTRAINT `job_id_fk` FOREIGN KEY (`job_id`) REFERENCES `company_jobs` (`job_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_job_details`
--

LOCK TABLES `company_job_details` WRITE;
/*!40000 ALTER TABLE `company_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_jobs`
--

DROP TABLE IF EXISTS `company_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `job_title` varchar(200) NOT NULL,
  `job_description` text NOT NULL,
  `job_type_id` int(11) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `company_id_fk_idx` (`company_id`),
  KEY `job_type_id_fk_idx` (`job_type_id`),
  CONSTRAINT `company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `m_company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `job_type_id_fk` FOREIGN KEY (`job_type_id`) REFERENCES `m_job_type` (`job_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_jobs`
--

LOCK TABLES `company_jobs` WRITE;
/*!40000 ALTER TABLE `company_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_company`
--

DROP TABLE IF EXISTS `m_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) NOT NULL,
  `company_description` varchar(500) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_name_UNIQUE` (`company_name`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_company`
--

LOCK TABLES `m_company` WRITE;
/*!40000 ALTER TABLE `m_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_degree`
--

DROP TABLE IF EXISTS `m_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_degree` (
  `degree_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `institution_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `job_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type` varchar(50) NOT NULL,
  `job_type_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`job_type_id`),
  UNIQUE KEY `job_type_UNIQUE` (`job_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_job_type`
--

LOCK TABLES `m_job_type` WRITE;
/*!40000 ALTER TABLE `m_job_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_job_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user_role`
--

DROP TABLE IF EXISTS `m_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `password` varchar(200) NOT NULL,
  `login_attempt` int(11) DEFAULT NULL,
  `mobile_number` varchar(45) NOT NULL,
  `active` varchar(1) NOT NULL,
  `login_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `mobile_number_UNIQUE` (`mobile_number`),
  UNIQUE KEY `login_id_UNIQUE` (`login_id`),
  KEY `user_type_fk_idx` (`user_type_id`),
  CONSTRAINT `USER_TYPE_ID_FK` FOREIGN KEY (`user_type_id`) REFERENCES `m_user_type` (`user_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Siddhartha','Kumar','siddharthakumar4209@gmail.com',1,'76543',NULL,'+918130828881','Y','RERERER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
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
  UNIQUE KEY `user_role_id_UNIQUE` (`user_role_id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_role_fk` FOREIGN KEY (`user_role_id`) REFERENCES `m_user_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_education_history`
--

DROP TABLE IF EXISTS `user_education_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_education_history` (
  `user_education_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `degree_id` int(11) NOT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `major` varchar(45) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_highest` char(1) DEFAULT NULL,
  PRIMARY KEY (`user_education_id`),
  KEY `user_education_user_id_fk_idx` (`user_id`),
  KEY `user_degree_fk_idx` (`degree_id`),
  KEY `user_institution_fk_idx` (`institution_id`),
  CONSTRAINT `user_degree_fk` FOREIGN KEY (`degree_id`) REFERENCES `m_degree` (`degree_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_education_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_institution_fk` FOREIGN KEY (`institution_id`) REFERENCES `m_institution` (`institution_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `user_employment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `employer` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_employment_id`),
  UNIQUE KEY `user_employment_id_UNIQUE` (`user_employment_id`),
  KEY `user_id_employment_fk_idx` (`user_id`),
  CONSTRAINT `user_id_employment_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_employment_history`
--

LOCK TABLES `user_employment_history` WRITE;
/*!40000 ALTER TABLE `user_employment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_employment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project_history`
--

DROP TABLE IF EXISTS `user_project_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_project_history` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `employement_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `project_description` text,
  `project_name` varchar(45) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `project_employment_fk_idx` (`employement_id`),
  CONSTRAINT `project_employment_fk` FOREIGN KEY (`employement_id`) REFERENCES `user_employment_history` (`user_employment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project_history`
--

LOCK TABLES `user_project_history` WRITE;
/*!40000 ALTER TABLE `user_project_history` DISABLE KEYS */;
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

-- Dump completed on 2022-03-16 18:48:56
