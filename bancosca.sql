CREATE DATABASE  IF NOT EXISTS `sca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sca`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: sca
-- ------------------------------------------------------
-- Server version	5.5.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='-03:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `dtNascimento` date DEFAULT NULL,
  `endLogradouro` varchar(60) DEFAULT NULL,
  `endNumero` int(11) DEFAULT NULL,
  `endComplemento` varchar(10) DEFAULT NULL,
  `endBairro` varchar(35) DEFAULT NULL,
  `endCEP` varchar(15) DEFAULT NULL,
  `endCidade` varchar(45) DEFAULT NULL,
  `endEstado` varchar(45) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `anoIngresso` int(11) DEFAULT NULL,
  `semestreIngresso` int(11) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `posicaoVestibular` int(11) DEFAULT NULL,
  `codCurso` int(11) NOT NULL,
  `codTurma` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_Aluno_Curso_idx` (`codCurso`),
  CONSTRAINT `fk_Aluno_Curso` FOREIGN KEY (`codCurso`) REFERENCES `curso` (`codCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (3,'João','2013-03-04','3',3,'3','3','3','3','AP','3','3','3',3,1,'Matriculado',3,3,1),(6,'José','2013-03-04','6',6,'6','6','6','6','CE','6','6','6',6,1,'Matriculado',6,4,3);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `matriculaAluno` int(11) NOT NULL,
  `codTurma` int(11) NOT NULL,
  `nota1` float DEFAULT NULL,
  `nota2` float DEFAULT NULL,
  `numFaltas` int(11) DEFAULT NULL,
  `notaProvaFinal` float DEFAULT NULL,
  PRIMARY KEY (`matriculaAluno`,`codTurma`),
  KEY `fk_Avaliacao_Turma1_idx` (`codTurma`),
  CONSTRAINT `fk_Avaliacao_Aluno1` FOREIGN KEY (`matriculaAluno`) REFERENCES `aluno` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_Turma1` FOREIGN KEY (`codTurma`) REFERENCES `turma` (`codTurma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (6,4,NULL,NULL,NULL,NULL),(6,5,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `codCurso` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cargaHoraria` int(11) DEFAULT NULL,
  `tipoCurso` varchar(45) DEFAULT NULL,
  `totalPeriodos` int(11) DEFAULT NULL,
  `professorCoordenador` int(11) DEFAULT NULL,
  PRIMARY KEY (`codCurso`),
  KEY `fk_Curso_Professor1_idx` (`professorCoordenador`),
  CONSTRAINT `fk_Curso_Professor1` FOREIGN KEY (`professorCoordenador`) REFERENCES `professor` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Bacharelado em Sistemas de Informacao',3090,'superior',8,1),(3,'Engenharia Mecatronica',3200,'superior',10,NULL),(4,'Tecnico Informatica',1200,'tecnicoIntegrado',4,NULL),(10,'Tecnologo Eventos',10,'tecnicoIntegrado',10,4),(21,'Gerencia de Projetos',21,'mestrado',21,6),(22,'Psicologia',22,'superior',22,5),(23,'Administracao',23,'superior',23,1),(24,'Tecnico Redes',24,'tecnicoIntegrado',24,5),(25,'Tecnico contabilidade',25,'tecnicoIntegrado',25,4),(26,'Tecnico dev web',26,'tecnicoIntegrado',26,6),(99,'Direito',360,'superior',9,7);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `codDisciplina` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `ementa` varchar(255) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `qtdeCreditos` int(11) DEFAULT NULL,
  `codCurso` int(11) NOT NULL,
  PRIMARY KEY (`codDisciplina`),
  KEY `fk_Disciplina_Curso1_idx` (`codCurso`),
  CONSTRAINT `fk_Disciplina_Curso1` FOREIGN KEY (`codCurso`) REFERENCES `curso` (`codCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (3,'3','3213213213',1,3,4),(4,'4','44444',1,4,3),(20,'2','2',2,2,21),(22,'2','222222',2,2,21),(30,'Algoritmos','assadsadsa',1,4,99);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `codHorario` int(11) NOT NULL AUTO_INCREMENT,
  `diaSemana` int(11) DEFAULT NULL,
  `horarioInicio` varchar(15) DEFAULT NULL,
  `codTurma` int(11) NOT NULL,
  PRIMARY KEY (`codHorario`),
  KEY `fk_Horario_Turma1_idx` (`codTurma`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (55,3,'8:40',2),(56,3,'7:50',2),(57,3,'7:00',2),(58,2,'7:00',2),(59,4,'10:35',4),(60,4,'11:25',4),(61,4,'13:30',4),(67,4,'20:20',1),(68,3,'9:45',1),(69,3,'8:40',1),(70,3,'8:40',3),(71,3,'7:00',3),(72,3,'7:50',3),(76,5,'9:45',5);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisito`
--

DROP TABLE IF EXISTS `prerequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prerequisito` (
  `codDisciplinaPreRequisito` int(11) NOT NULL,
  `codDisciplinaPreRequisitada` int(11) NOT NULL,
  PRIMARY KEY (`codDisciplinaPreRequisito`,`codDisciplinaPreRequisitada`),
  KEY `fk_PreRequisito_Disciplina2_idx` (`codDisciplinaPreRequisitada`),
  CONSTRAINT `fk_PreRequisito_Disciplina1` FOREIGN KEY (`codDisciplinaPreRequisito`) REFERENCES `disciplina` (`codDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PreRequisito_Disciplina2` FOREIGN KEY (`codDisciplinaPreRequisitada`) REFERENCES `disciplina` (`codDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisito`
--

LOCK TABLES `prerequisito` WRITE;
/*!40000 ALTER TABLE `prerequisito` DISABLE KEYS */;
INSERT INTO `prerequisito` VALUES (20,3),(20,4),(20,22),(4,30);
/*!40000 ALTER TABLE `prerequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `dtNascimento` date DEFAULT NULL,
  `endLogradouro` varchar(60) DEFAULT NULL,
  `endNumero` int(11) DEFAULT NULL,
  `endComplemento` varchar(10) DEFAULT NULL,
  `endBairro` varchar(45) DEFAULT NULL,
  `endCEP` varchar(20) DEFAULT NULL,
  `endCidade` varchar(45) DEFAULT NULL,
  `endEstado` varchar(25) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dtIngresso` date DEFAULT NULL,
  `titulacao` varchar(45) DEFAULT NULL,
  `cursoAtuacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_Professor_Curso1_idx` (`cursoAtuacao`),
  CONSTRAINT `fk_Professor_Curso1` FOREIGN KEY (`cursoAtuacao`) REFERENCES `curso` (`codCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Marco Antonio','1111-11-11','Rua A',10,'A','Fabrica','10101-010','Juiz de Fora','Minas Gerais','marco@antonio.com','1111-01-11','graduacao',1),(4,'Lovisi','2013-03-01','4',5,'4','4','4','4','4','4','2013-03-01','graduacao',NULL),(5,'Welington','1000-11-10','5',5,'5','5','5','5','GO','55','1001-11-10','doutorado',1),(6,'Tatiane','2013-06-11','6',6,'66','6','6','6','mg','6','2013-06-11','graduacao',3),(7,'Sandro Fernandes','2013-06-11','3',3,'3','3','3','3','3','3','2013-06-11','graduacao',1),(9,'Alberto','2013-06-17','9',9,'9','9','9','9','9','9','2013-06-17','graduacao',4),(12,'Manoel','2013-06-24','1',1,'1','1','1','1','1','1','2013-06-24','graduacao',21),(321321321,'Jose','1991-09-26','ewqeqw',212,'eqwe','ewqewq','weqewq',NULL,'AM','ewqwqewqe','1991-09-26','doutorado',99);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `codTurma` int(11) NOT NULL AUTO_INCREMENT,
  `semestre` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `numVagas` int(11) DEFAULT NULL,
  `numSala` varchar(25) DEFAULT NULL,
  `codDisciplina` int(11) NOT NULL,
  `matriculaProfessor` int(11) NOT NULL,
  `codCurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`codTurma`),
  KEY `fk_Turma_Disciplina1_idx` (`codDisciplina`),
  KEY `fk_Turma_Professor1_idx` (`matriculaProfessor`),
  CONSTRAINT `fk_Turma_Disciplina1` FOREIGN KEY (`codDisciplina`) REFERENCES `disciplina` (`codDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_Professor1` FOREIGN KEY (`matriculaProfessor`) REFERENCES `professor` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,1,2010,34,'f3',20,4,3),(2,2,2010,3,'3',22,5,1),(3,2,2012,1,'1',20,4,1),(4,1,2010,32,'',4,7,1),(5,2,2010,36,'5',30,321321321,3);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-15 21:36:10
