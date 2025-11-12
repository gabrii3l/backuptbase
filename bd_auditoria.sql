/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.32-MariaDB : Database - bd_auditoria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd_auditoria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `bd_auditoria`;

/*Table structure for table `log_usuarios` */

DROP TABLE IF EXISTS `log_usuarios`;

CREATE TABLE `log_usuarios` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `ip_usuario` varchar(45) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idperfil` int(11) DEFAULT NULL,
  `idpersona` int(11) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL,
  `unidad` varchar(255) DEFAULT NULL,
  `dependencia` varchar(255) DEFAULT NULL,
  `td_run` varchar(255) DEFAULT NULL,
  `nombrerepa` varchar(255) DEFAULT NULL,
  `idta_reparticionsistema` int(11) DEFAULT NULL,
  `dotacions` varchar(255) DEFAULT NULL,
  `repartcion` varchar(255) DEFAULT NULL,
  `repaodepto` varchar(255) DEFAULT NULL,
  `altareparticion` varchar(255) DEFAULT NULL,
  `td_nombrecompleto` varchar(255) DEFAULT NULL,
  `td_primernombre` varchar(255) DEFAULT NULL,
  `td_segundonombre` varchar(255) DEFAULT NULL,
  `td_primerapellido` varchar(255) DEFAULT NULL,
  `td_segundoapellido` varchar(255) DEFAULT NULL,
  `td_escalafon` varchar(255) DEFAULT NULL,
  `td_grado` varchar(255) DEFAULT NULL,
  `td_cf` varchar(255) DEFAULT NULL,
  `accion` longtext DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `navegador` text DEFAULT NULL,
  `url_pagina` text DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `log_usuarios` */

/*Table structure for table `ta_altareparticion` */

DROP TABLE IF EXISTS `ta_altareparticion`;

CREATE TABLE `ta_altareparticion` (
  `idta_altareparticion` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(500) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_altareparticion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_altareparticion` */

insert  into `ta_altareparticion`(`idta_altareparticion`,`td_descripcion`,`td_estado`) values (1,'Ministerio de  Transportes y Telecomunicaciones',0);

/*Table structure for table `ta_anos` */

DROP TABLE IF EXISTS `ta_anos`;

CREATE TABLE `ta_anos` (
  `idta_anos` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` int(11) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_anos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_anos` */

insert  into `ta_anos`(`idta_anos`,`td_descripcion`,`td_estado`) values (1,2024,0);
insert  into `ta_anos`(`idta_anos`,`td_descripcion`,`td_estado`) values (2,2025,0);
insert  into `ta_anos`(`idta_anos`,`td_descripcion`,`td_estado`) values (3,2026,0);
insert  into `ta_anos`(`idta_anos`,`td_descripcion`,`td_estado`) values (4,2027,1);

/*Table structure for table `ta_antegenerales` */

DROP TABLE IF EXISTS `ta_antegenerales`;

CREATE TABLE `ta_antegenerales` (
  `idta_antegenerales` int(11) NOT NULL AUTO_INCREMENT,
  `td_antecedentesgenerales` longtext DEFAULT NULL,
  `td_objetivogeneral` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_objetivoespecifico` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idta_antegenerales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_antegenerales` */

/*Table structure for table `ta_aprobadaorden` */

DROP TABLE IF EXISTS `ta_aprobadaorden`;

CREATE TABLE `ta_aprobadaorden` (
  `idta_aprobadaorden` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(50) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_aprobadaorden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_aprobadaorden` */

/*Table structure for table `ta_area` */

DROP TABLE IF EXISTS `ta_area`;

CREATE TABLE `ta_area` (
  `idta_area` int(11) NOT NULL AUTO_INCREMENT,
  `idta_seccion` int(11) DEFAULT NULL,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_area`),
  KEY `fk_seccionarea` (`idta_seccion`),
  CONSTRAINT `fk_seccionarea` FOREIGN KEY (`idta_seccion`) REFERENCES `ta_seccion` (`idta_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_area` */

/*Table structure for table `ta_auditoria` */

DROP TABLE IF EXISTS `ta_auditoria`;

CREATE TABLE `ta_auditoria` (
  `idta_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `idta_tipoauditoria` int(11) DEFAULT NULL,
  `idta_estadoauditoria` int(11) DEFAULT NULL,
  `idta_validacion` int(11) DEFAULT 9,
  `idta_anos` int(11) DEFAULT NULL,
  `idta_usuario` int(11) DEFAULT NULL,
  `idrunencargado` varchar(15) DEFAULT NULL,
  `td_estadoencargado` int(11) DEFAULT 0,
  `td_run` varchar(15) DEFAULT NULL,
  `td_digito` char(1) DEFAULT NULL,
  `td_nombre` varchar(5000) DEFAULT NULL,
  `td_objetivo` varchar(5000) DEFAULT NULL,
  `td_horas` int(11) DEFAULT NULL,
  `td_fechainicio` date DEFAULT NULL,
  `td_fechatermino` date DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `idta_revisor` int(11) DEFAULT NULL,
  `td_estadorevicion` int(11) DEFAULT 1,
  `td_comentariorevision` varchar(500) DEFAULT NULL,
  `idta_revisorgabinete` int(11) DEFAULT NULL,
  `td_estadoreviciongabinete` int(11) DEFAULT NULL,
  `td_comentariorevisiongabinete` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idta_auditoria`),
  KEY `fk_tipoauditoria_audi_idx` (`idta_tipoauditoria`),
  KEY `fk_estado_audi_idx` (`idta_estadoauditoria`),
  KEY `fk_usuario_idx` (`idta_usuario`),
  KEY `fk_ano_auditorai` (`idta_anos`),
  KEY `fk_reparticioncontrol` (`idta_reparticion`),
  CONSTRAINT `fk_ano_auditorai` FOREIGN KEY (`idta_anos`) REFERENCES `ta_anos` (`idta_anos`),
  CONSTRAINT `fk_estado_audi` FOREIGN KEY (`idta_estadoauditoria`) REFERENCES `ta_estadoauditoria` (`idta_estadoauditoria`),
  CONSTRAINT `fk_reparticioncontrol` FOREIGN KEY (`idta_reparticion`) REFERENCES `ta_reparticion` (`idta_reparticion`),
  CONSTRAINT `fk_tipoauditoria_audi` FOREIGN KEY (`idta_tipoauditoria`) REFERENCES `ta_tipoauditoria` (`idta_tipoauditoria`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_auditoria` */

insert  into `ta_auditoria`(`idta_auditoria`,`idta_reparticion`,`idta_tipoauditoria`,`idta_estadoauditoria`,`idta_validacion`,`idta_anos`,`idta_usuario`,`idrunencargado`,`td_estadoencargado`,`td_run`,`td_digito`,`td_nombre`,`td_objetivo`,`td_horas`,`td_fechainicio`,`td_fechatermino`,`td_fecha`,`td_estado`,`idta_revisor`,`td_estadorevicion`,`td_comentariorevision`,`idta_revisorgabinete`,`td_estadoreviciongabinete`,`td_comentariorevisiongabinete`) values (1,5,3,5,9,2,22,'1-9',0,'1','9','Auditoria de prueba','Auditoria de pruebaAuditoria de pruebaAuditoria de pruebaAuditoria de prueba',22,'2025-11-12','2025-11-30','2025-11-12 18:41:38',0,NULL,1,NULL,NULL,NULL,NULL);

/*Table structure for table `ta_auditoriahistory_materia` */

DROP TABLE IF EXISTS `ta_auditoriahistory_materia`;

CREATE TABLE `ta_auditoriahistory_materia` (
  `idta_auditoriahistory_materia` int(11) NOT NULL AUTO_INCREMENT,
  `idta_auditoriahistory` int(11) NOT NULL,
  `idta_materia` int(11) NOT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_auditoriahistory_materia`),
  KEY `fk_controlhm_idx` (`idta_auditoriahistory`),
  KEY `fk_materiam_idx` (`idta_materia`),
  CONSTRAINT `fk_controlhm1` FOREIGN KEY (`idta_auditoriahistory`) REFERENCES `ta_auditorialhistory` (`idta_auditorialhistory`),
  CONSTRAINT `fk_materiam1` FOREIGN KEY (`idta_materia`) REFERENCES `ta_materia` (`idta_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_auditoriahistory_materia` */

/*Table structure for table `ta_auditorialhistory` */

DROP TABLE IF EXISTS `ta_auditorialhistory`;

CREATE TABLE `ta_auditorialhistory` (
  `idta_auditorialhistory` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `idta_anos` int(11) DEFAULT NULL,
  `idta_tipoauditoria` int(11) DEFAULT NULL,
  `idta_usuario` int(11) DEFAULT NULL,
  `td_nombre` varchar(5000) DEFAULT NULL,
  `td_fechainicio` date DEFAULT NULL,
  `td_archivo_PDF` varchar(2000) DEFAULT NULL,
  `td_archivoencryp_PDF` varchar(2000) DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_auditorialhistory`),
  KEY `fk_usuario_idx` (`idta_usuario`),
  KEY `fk_ano_auditora_idx` (`idta_anos`),
  KEY `fk_tipocontrol_idx` (`idta_tipoauditoria`),
  KEY `fk_historicorepa` (`idta_reparticion`),
  CONSTRAINT `fk_ano_auditora3` FOREIGN KEY (`idta_anos`) REFERENCES `ta_anos` (`idta_anos`),
  CONSTRAINT `fk_historicorepa` FOREIGN KEY (`idta_reparticion`) REFERENCES `ta_reparticion` (`idta_reparticion`),
  CONSTRAINT `fk_tipocontrol2` FOREIGN KEY (`idta_tipoauditoria`) REFERENCES `ta_tipoauditoria` (`idta_tipoauditoria`),
  CONSTRAINT `fk_usuario2` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_auditorialhistory` */

/*Table structure for table `ta_auditoriareparticion` */

DROP TABLE IF EXISTS `ta_auditoriareparticion`;

CREATE TABLE `ta_auditoriareparticion` (
  `idta_auditoriareparticion` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `idta_auditoria` int(11) DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_auditoriareparticion`),
  KEY `fk_repauditoria_idx` (`idta_auditoria`),
  CONSTRAINT `fk_repauditoria` FOREIGN KEY (`idta_auditoria`) REFERENCES `ta_auditoria` (`idta_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_auditoriareparticion` */

insert  into `ta_auditoriareparticion`(`idta_auditoriareparticion`,`idta_reparticion`,`idta_auditoria`,`td_fecha`,`td_estado`) values (1,17,1,'2025-11-12 18:41:39',0);

/*Table structure for table `ta_auditoriareparticionh` */

DROP TABLE IF EXISTS `ta_auditoriareparticionh`;

CREATE TABLE `ta_auditoriareparticionh` (
  `idta_auditoriareparticionh` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `idta_auditoriahistory` int(11) DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_auditoriareparticionh`),
  KEY `fk_repauditoriah_idx` (`idta_auditoriahistory`),
  CONSTRAINT `fk_repauditoriah` FOREIGN KEY (`idta_auditoriahistory`) REFERENCES `ta_auditorialhistory` (`idta_auditorialhistory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_auditoriareparticionh` */

/*Table structure for table `ta_biblioteca` */

DROP TABLE IF EXISTS `ta_biblioteca`;

CREATE TABLE `ta_biblioteca` (
  `idta_biblioteca` int(11) NOT NULL AUTO_INCREMENT,
  `idta_usuario` int(11) DEFAULT NULL,
  `idta_tipodoc` int(11) DEFAULT NULL,
  `idta_tipodocdet` int(11) DEFAULT NULL,
  `td_nombre` varchar(600) DEFAULT NULL,
  `td_archivo` varchar(2000) DEFAULT NULL,
  `td_archivoencryp` varchar(2000) DEFAULT NULL,
  `td_archivo_DOE` varchar(2000) DEFAULT NULL,
  `td_archivoencryp_DOE` varchar(2000) DEFAULT NULL,
  `td_repa` int(11) DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_biblioteca`),
  KEY `fk_biblioiusu` (`idta_usuario`),
  KEY `fk_tipodocbiblio` (`idta_tipodoc`),
  KEY `fk_tipodetall` (`idta_tipodocdet`),
  CONSTRAINT `fk_biblioiusu` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`),
  CONSTRAINT `fk_tipodetall` FOREIGN KEY (`idta_tipodocdet`) REFERENCES `ta_tipodocdet` (`idta_tipodocdet`),
  CONSTRAINT `fk_tipodocbiblio` FOREIGN KEY (`idta_tipodoc`) REFERENCES `ta_tipodoc` (`idta_tipodoc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_biblioteca` */

insert  into `ta_biblioteca`(`idta_biblioteca`,`idta_usuario`,`idta_tipodoc`,`idta_tipodocdet`,`td_nombre`,`td_archivo`,`td_archivoencryp`,`td_archivo_DOE`,`td_archivoencryp_DOE`,`td_repa`,`td_fecha`,`td_estado`) values (1,1,1,NULL,'adasd','Boleta 28 Gabriel Loyola.pdf','L-_SSNHlKbgDQvttb_pxE9ziza7lC4PEDPnun9CBlvRmpqDHzBmNXTkp6_Mh0EoE.pdf',NULL,NULL,NULL,'2025-11-05 20:22:11',1);
insert  into `ta_biblioteca`(`idta_biblioteca`,`idta_usuario`,`idta_tipodoc`,`idta_tipodocdet`,`td_nombre`,`td_archivo`,`td_archivoencryp`,`td_archivo_DOE`,`td_archivoencryp_DOE`,`td_repa`,`td_fecha`,`td_estado`) values (2,1,1,NULL,'asdasd','Boleta 29 Gabriel Loyola.pdf','CsQvqEvsXZjUHneEQTKKAOnk1QEp1fdGEThj5bvLKxyJylauz7jJ80JzCNd93t-m.pdf',NULL,NULL,NULL,'2025-11-05 20:22:29',1);
insert  into `ta_biblioteca`(`idta_biblioteca`,`idta_usuario`,`idta_tipodoc`,`idta_tipodocdet`,`td_nombre`,`td_archivo`,`td_archivoencryp`,`td_archivo_DOE`,`td_archivoencryp_DOE`,`td_repa`,`td_fecha`,`td_estado`) values (3,1,1,NULL,'Archivo de ejemplo','Ficha Técnica Python para análisis de datos (1) (1).pdf','6k_Ac_YQ55rYb_0QE7ophY2Gkvk5JnN4c4pN9oNqtOXj98oX8AdRiE59kF4ngWuEEJAq7vyOf2wfbN1G-LLjNDOR-uHhf4lSHpoKIXVIfHU..pdf',NULL,NULL,NULL,'2025-11-08 00:25:13',1);

/*Table structure for table `ta_conclusion` */

DROP TABLE IF EXISTS `ta_conclusion`;

CREATE TABLE `ta_conclusion` (
  `idta_conclusion` int(11) NOT NULL AUTO_INCREMENT,
  `idta_control` int(11) DEFAULT NULL,
  `td_descripcion` varchar(3000) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  PRIMARY KEY (`idta_conclusion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_conclusion` */

/*Table structure for table `ta_contrato` */

DROP TABLE IF EXISTS `ta_contrato`;

CREATE TABLE `ta_contrato` (
  `idta_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_contrato`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_contrato` */

insert  into `ta_contrato`(`idta_contrato`,`td_descripcion`,`td_estado`) values (1,'PLANTA',0);
insert  into `ta_contrato`(`idta_contrato`,`td_descripcion`,`td_estado`) values (2,'CONTRATA',0);

/*Table structure for table `ta_criticidad` */

DROP TABLE IF EXISTS `ta_criticidad`;

CREATE TABLE `ta_criticidad` (
  `idta_criticidad` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_color` varchar(100) DEFAULT NULL,
  `td_background` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_criticidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_criticidad` */

insert  into `ta_criticidad`(`idta_criticidad`,`td_descripcion`,`td_color`,`td_background`,`td_estado`) values (1,'Alta','white','red',0);
insert  into `ta_criticidad`(`idta_criticidad`,`td_descripcion`,`td_color`,`td_background`,`td_estado`) values (2,'Media','black','yellow',0);
insert  into `ta_criticidad`(`idta_criticidad`,`td_descripcion`,`td_color`,`td_background`,`td_estado`) values (3,'Baja','white','green',0);

/*Table structure for table `ta_criticidadactivo` */

DROP TABLE IF EXISTS `ta_criticidadactivo`;

CREATE TABLE `ta_criticidadactivo` (
  `idta_criticidadactivo` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(50) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_criticidadactivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_criticidadactivo` */

/*Table structure for table `ta_datosbasicos` */

DROP TABLE IF EXISTS `ta_datosbasicos`;

CREATE TABLE `ta_datosbasicos` (
  `idta_datosbasicos` int(11) NOT NULL AUTO_INCREMENT,
  `idta_estado` int(11) DEFAULT NULL,
  `td_fechainforme` date DEFAULT NULL,
  `td_titulo` varchar(200) DEFAULT NULL,
  `td_referencia` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_informejecutivo` varchar(15000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idta_datosbasicos`),
  KEY `fk_basicoetapa` (`idta_estado`),
  CONSTRAINT `fk_basicoetapa` FOREIGN KEY (`idta_estado`) REFERENCES `ta_estadoauditoria` (`idta_estadoauditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_datosbasicos` */

/*Table structure for table `ta_documentofiscalizacion` */

DROP TABLE IF EXISTS `ta_documentofiscalizacion`;

CREATE TABLE `ta_documentofiscalizacion` (
  `idta_documentocomisaria` int(11) NOT NULL AUTO_INCREMENT,
  `idta_tipodoccomi` int(11) DEFAULT NULL,
  `idta_persona` int(11) DEFAULT NULL,
  `idta_usuario` int(11) DEFAULT NULL,
  `td_ano` int(11) DEFAULT NULL,
  `td_archivo` varchar(800) DEFAULT NULL,
  `td_archivoencryp` varchar(1000) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `idta_dotacion` int(11) DEFAULT NULL,
  `idta_reparticion` int(11) DEFAULT NULL,
  `idta_altareparticion` int(11) DEFAULT NULL,
  `td_dotacion` varchar(500) DEFAULT NULL,
  `td_reparticion` varchar(500) DEFAULT NULL,
  `td_altareparticion` varchar(500) DEFAULT NULL,
  `td_nombrecompleto` varchar(500) DEFAULT NULL,
  `td_grado` varchar(500) DEFAULT NULL,
  `td_primernombre` varchar(500) DEFAULT NULL,
  `td_segundonombre` varchar(500) DEFAULT NULL,
  `td_primerapellido` varchar(500) DEFAULT NULL,
  `td_segundoapellido` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idta_documentocomisaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_documentofiscalizacion` */

/*Table structure for table `ta_documentos` */

DROP TABLE IF EXISTS `ta_documentos`;

CREATE TABLE `ta_documentos` (
  `idta_documentos` int(11) NOT NULL AUTO_INCREMENT,
  `idta_auditoria` int(11) DEFAULT NULL,
  `idta_usuario` int(11) DEFAULT NULL,
  `idta_estadoauditoria` int(11) DEFAULT NULL,
  `td_archivo_DOE` longtext DEFAULT NULL,
  `td_archivoencryp_DOE` longtext DEFAULT NULL,
  `td_archivo_PDF` longtext DEFAULT NULL,
  `td_archivoencryp_PDF` longtext DEFAULT NULL,
  `td_archivo_WORD` longtext DEFAULT NULL,
  `td_archivoencryp_WORD` longtext DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_documentos`),
  KEY `fk_auditoriadoc_idx` (`idta_auditoria`),
  KEY `fk_etapadoc_idx` (`idta_estadoauditoria`),
  KEY `fk_usuario_idx` (`idta_usuario`),
  CONSTRAINT `fk_auditoriadoc` FOREIGN KEY (`idta_auditoria`) REFERENCES `ta_auditoria` (`idta_auditoria`),
  CONSTRAINT `fk_estadocontrol` FOREIGN KEY (`idta_estadoauditoria`) REFERENCES `ta_estadoauditoria` (`idta_estadoauditoria`),
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_documentos` */

insert  into `ta_documentos`(`idta_documentos`,`idta_auditoria`,`idta_usuario`,`idta_estadoauditoria`,`td_archivo_DOE`,`td_archivoencryp_DOE`,`td_archivo_PDF`,`td_archivoencryp_PDF`,`td_archivo_WORD`,`td_archivoencryp_WORD`,`td_fecha`,`td_estado`) values (1,1,22,3,NULL,NULL,'GANTT SITIO CONTRALORIA.pdf','g0tIuMl2uapPomfIebMSSwfxhiWSWwUXgqpxACLEy7y1dOH-qOoqY7rRML9lm23c.pdf','DOR PROFORMA CONGECAR.docx','c9cl3tmCb8Qnqty-khpeVv2ue_Cvih60OGIbtgMmkmCpQLwYFTxbWf3buPcKtL7h.docx','2025-11-12 18:41:39',0);
insert  into `ta_documentos`(`idta_documentos`,`idta_auditoria`,`idta_usuario`,`idta_estadoauditoria`,`td_archivo_DOE`,`td_archivoencryp_DOE`,`td_archivo_PDF`,`td_archivoencryp_PDF`,`td_archivo_WORD`,`td_archivoencryp_WORD`,`td_fecha`,`td_estado`) values (2,1,22,4,'','','GANTT SITIO CONTRALORIA.pdf','I0wh7sleuG2Pff2yaVrJJ_Zj5N1CMMmFjiaeHgvHm-NSC5mCPwhopZJyEHUdKmcb.pdf','DOR PROFORMA CONGECAR.docx','uftmta8qiZgfG4oKLbGNQTlqYEICVNwnWKXVSAaj1s5hZrdokt1vTbemvr42UJlE.docx','2025-11-12 19:08:44',0);
insert  into `ta_documentos`(`idta_documentos`,`idta_auditoria`,`idta_usuario`,`idta_estadoauditoria`,`td_archivo_DOE`,`td_archivoencryp_DOE`,`td_archivo_PDF`,`td_archivoencryp_PDF`,`td_archivo_WORD`,`td_archivoencryp_WORD`,`td_fecha`,`td_estado`) values (3,1,22,5,'','','Boleta 28 Gabriel Loyola.pdf','91TgabJo5U6orf0m9ZCCFgyx0WVaVBc5xcumPLOopM5uwAmb4CDw29lj7KpYoMUN.pdf','DOR PROFORMA CONGECAR.docx','9z6zqEGom4quWdtouCrVa9A8s9aFB98gaxkl0EO5qVIcG_OM_FxUxnpj4iLby6ab.docx','2025-11-12 20:11:32',0);

/*Table structure for table `ta_equipo` */

DROP TABLE IF EXISTS `ta_equipo`;

CREATE TABLE `ta_equipo` (
  `idta_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `idta_usuario` int(11) DEFAULT NULL,
  `idta_perfil` int(11) DEFAULT NULL,
  `idta_auditoria` int(11) DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_equipo`),
  KEY `fk_usuarioequipo_idx` (`idta_usuario`),
  KEY `fk_perfilequipo_idx` (`idta_perfil`),
  KEY `fk_auditoria_idx` (`idta_auditoria`),
  CONSTRAINT `fk_auditoria` FOREIGN KEY (`idta_auditoria`) REFERENCES `ta_auditoria` (`idta_auditoria`),
  CONSTRAINT `fk_perfilequipo` FOREIGN KEY (`idta_perfil`) REFERENCES `ta_perfil` (`idta_perfil`),
  CONSTRAINT `fk_usuarioequipo` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_equipo` */

insert  into `ta_equipo`(`idta_equipo`,`idta_usuario`,`idta_perfil`,`idta_auditoria`,`td_fecha`,`td_estado`) values (1,22,1,1,'2025-11-12 18:41:39',0);
insert  into `ta_equipo`(`idta_equipo`,`idta_usuario`,`idta_perfil`,`idta_auditoria`,`td_fecha`,`td_estado`) values (2,21,2,1,'2025-11-12 18:41:39',0);

/*Table structure for table `ta_estadoauditoria` */

DROP TABLE IF EXISTS `ta_estadoauditoria`;

CREATE TABLE `ta_estadoauditoria` (
  `idta_estadoauditoria` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(45) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_estadoingreso` int(11) DEFAULT 0,
  PRIMARY KEY (`idta_estadoauditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_estadoauditoria` */

insert  into `ta_estadoauditoria`(`idta_estadoauditoria`,`td_descripcion`,`td_estado`,`td_estadoingreso`) values (1,'Por Ejecutar',0,0);
insert  into `ta_estadoauditoria`(`idta_estadoauditoria`,`td_descripcion`,`td_estado`,`td_estadoingreso`) values (2,'En Ejecución',0,0);
insert  into `ta_estadoauditoria`(`idta_estadoauditoria`,`td_descripcion`,`td_estado`,`td_estadoingreso`) values (3,'Pre Informe',0,0);
insert  into `ta_estadoauditoria`(`idta_estadoauditoria`,`td_descripcion`,`td_estado`,`td_estadoingreso`) values (4,'Informe Final',0,1);
insert  into `ta_estadoauditoria`(`idta_estadoauditoria`,`td_descripcion`,`td_estado`,`td_estadoingreso`) values (5,'Seguimiento',0,1);
insert  into `ta_estadoauditoria`(`idta_estadoauditoria`,`td_descripcion`,`td_estado`,`td_estadoingreso`) values (6,'Finiquitado',0,1);
insert  into `ta_estadoauditoria`(`idta_estadoauditoria`,`td_descripcion`,`td_estado`,`td_estadoingreso`) values (9,'Sin Efecto',0,1);

/*Table structure for table `ta_estadorevision` */

DROP TABLE IF EXISTS `ta_estadorevision`;

CREATE TABLE `ta_estadorevision` (
  `idta_estadorevision` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_estadorevision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_estadorevision` */

/*Table structure for table `ta_estadosistema` */

DROP TABLE IF EXISTS `ta_estadosistema`;

CREATE TABLE `ta_estadosistema` (
  `idta_estadosistema` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(50) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_estadosistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_estadosistema` */

/*Table structure for table `ta_etapa` */

DROP TABLE IF EXISTS `ta_etapa`;

CREATE TABLE `ta_etapa` (
  `idta_etapa` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(45) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_etapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_etapa` */

/*Table structure for table `ta_etapaauditoria` */

DROP TABLE IF EXISTS `ta_etapaauditoria`;

CREATE TABLE `ta_etapaauditoria` (
  `idta_etapaauditoria` int(11) NOT NULL AUTO_INCREMENT,
  `idta_auditoria` int(11) DEFAULT NULL,
  `idta_etapa` int(11) DEFAULT NULL,
  `td_fechainicio` date DEFAULT NULL,
  `td_fechatermino` date DEFAULT NULL,
  `td_horas` int(11) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_etapaauditoria`),
  KEY `fk_estapaauditoria_idx` (`idta_auditoria`),
  KEY `fk_etapa_etapas_idx` (`idta_etapa`),
  CONSTRAINT `fk_estapaauditoria` FOREIGN KEY (`idta_auditoria`) REFERENCES `ta_auditoria` (`idta_auditoria`),
  CONSTRAINT `fk_etapa_etapas` FOREIGN KEY (`idta_etapa`) REFERENCES `ta_etapa` (`idta_etapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_etapaauditoria` */

/*Table structure for table `ta_evidencia` */

DROP TABLE IF EXISTS `ta_evidencia`;

CREATE TABLE `ta_evidencia` (
  `idta_evidencia` int(11) NOT NULL AUTO_INCREMENT,
  `idta_usuario` int(11) DEFAULT NULL,
  `idta_auditoria` int(11) DEFAULT NULL,
  `idta_estadoauditoria` int(11) DEFAULT NULL,
  `idta_tipodoc` int(11) DEFAULT NULL,
  `idta_riesgoperativos` int(11) DEFAULT NULL,
  `td_nombre` varchar(800) DEFAULT NULL,
  `td_archivo` varchar(2000) DEFAULT NULL,
  `td_archivoencryp` varchar(2000) DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_estadomuestra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_evidencia`),
  KEY `fk_evidenciacontrol` (`idta_auditoria`),
  KEY `fk_estadocontroevi` (`idta_estadoauditoria`),
  KEY `fk_usuevi` (`idta_usuario`),
  KEY `fk_tipodocevi` (`idta_tipodoc`),
  CONSTRAINT `fk_estadocontroevi` FOREIGN KEY (`idta_estadoauditoria`) REFERENCES `ta_estadoauditoria` (`idta_estadoauditoria`),
  CONSTRAINT `fk_evidenciacontrol` FOREIGN KEY (`idta_auditoria`) REFERENCES `ta_auditoria` (`idta_auditoria`),
  CONSTRAINT `fk_tipodocevi` FOREIGN KEY (`idta_tipodoc`) REFERENCES `ta_tipodoc` (`idta_tipodoc`),
  CONSTRAINT `fk_usuevi` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_evidencia` */

insert  into `ta_evidencia`(`idta_evidencia`,`idta_usuario`,`idta_auditoria`,`idta_estadoauditoria`,`idta_tipodoc`,`idta_riesgoperativos`,`td_nombre`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`,`td_estadomuestra`) values (1,22,1,4,7,NULL,'240790479','240790479.pdf','dyjbTi2s-eS43Oc6Ee9vs_U7Se66QMDeVjqkggLsIhU..pdf','2025-11-12 19:06:33',0,0);
insert  into `ta_evidencia`(`idta_evidencia`,`idta_usuario`,`idta_auditoria`,`idta_estadoauditoria`,`idta_tipodoc`,`idta_riesgoperativos`,`td_nombre`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`,`td_estadomuestra`) values (2,22,1,5,8,NULL,'241672179_ACIPOL','241672179_ACIPOL.pdf','Awa9wT3lr6jr_urW6l-VPvEI3fHx8GWLJUHj4fdh_-4..pdf','2025-11-12 19:10:49',0,1);
insert  into `ta_evidencia`(`idta_evidencia`,`idta_usuario`,`idta_auditoria`,`idta_estadoauditoria`,`idta_tipodoc`,`idta_riesgoperativos`,`td_nombre`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`,`td_estadomuestra`) values (3,22,1,5,8,NULL,'GANTT SITIO CONTRALORIAPGOA','GANTT SITIO CONTRALORIAPGOA.pdf','w6IF8QAsykFgwIKt_4FhSGaPV51yxmZ6iwWax33UbiinbqwQ-OOwhrfiZwycSS56.pdf','2025-11-12 19:12:28',0,0);

/*Table structure for table `ta_evidenciaoperativa` */

DROP TABLE IF EXISTS `ta_evidenciaoperativa`;

CREATE TABLE `ta_evidenciaoperativa` (
  `idta_evidenciaoperativa` int(11) NOT NULL AUTO_INCREMENT,
  `idta_tipolibro` varchar(200) DEFAULT NULL,
  `idta_tiposervicio` varchar(200) DEFAULT NULL,
  `idta_riesgoperativos` int(11) DEFAULT NULL,
  `td_fechaevi` date DEFAULT NULL,
  `td_folio` int(11) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  `td_unidad` int(11) DEFAULT NULL,
  `td_dependencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_evidenciaoperativa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_evidenciaoperativa` */

/*Table structure for table `ta_firmas` */

DROP TABLE IF EXISTS `ta_firmas`;

CREATE TABLE `ta_firmas` (
  `idta_firmas` int(11) NOT NULL AUTO_INCREMENT,
  `idta_control` int(11) DEFAULT NULL,
  `idta_informe` int(11) DEFAULT NULL,
  `idta_estadocontrol` int(11) DEFAULT NULL,
  `idta_persona` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_firmas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_firmas` */

/*Table structure for table `ta_generadores` */

DROP TABLE IF EXISTS `ta_generadores`;

CREATE TABLE `ta_generadores` (
  `idta_generadores` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_generadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_generadores` */

/*Table structure for table `ta_hallazgo` */

DROP TABLE IF EXISTS `ta_hallazgo`;

CREATE TABLE `ta_hallazgo` (
  `idta_hallazgo` int(11) NOT NULL AUTO_INCREMENT,
  `idta_auditoria` int(11) DEFAULT NULL,
  `idta_criticidad` int(11) DEFAULT NULL,
  `idta_hallazgoestado` int(11) DEFAULT NULL,
  `idta_idhallazgorevision` int(11) DEFAULT 7,
  `td_comentariorevision` longtext DEFAULT NULL,
  `td_archivo` longtext DEFAULT NULL,
  `td_archivoencryp` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_digito` char(1) DEFAULT NULL,
  `td_descripcion` longtext DEFAULT NULL,
  `td_descargo` longtext DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_fechacomnpro` date DEFAULT curdate(),
  `td_estado` int(11) DEFAULT NULL,
  `td_responsableacccion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_responsableacccion_estado` int(11) DEFAULT 2,
  `td_plazoimplementacion` date DEFAULT NULL,
  `idta_tipoauditoria` int(11) DEFAULT NULL,
  `idta_patrones` int(11) DEFAULT NULL,
  `idta_patronesdetalle` int(11) DEFAULT NULL,
  `td_area` longtext DEFAULT NULL,
  `td_areadetalle` longtext DEFAULT NULL,
  `td_criterios` longtext DEFAULT NULL,
  `td_cursosaccion` longtext DEFAULT NULL,
  `td_estadoinforme` int(11) DEFAULT 1,
  `td_detallehallazgo` longtext DEFAULT NULL,
  `td_condicion` longtext DEFAULT NULL,
  `td_cursoaccionsugerigo` longtext DEFAULT NULL,
  `td_cursoaccionadoptado` longtext DEFAULT NULL,
  `td_cursoaccionadoptado_estado` int(11) DEFAULT 2,
  `td_fechaimplementa` date DEFAULT NULL,
  `td_fechaimplementa_estado` int(11) DEFAULT 2,
  PRIMARY KEY (`idta_hallazgo`),
  KEY `fk_hallazgocriti` (`idta_criticidad`),
  KEY `fk_hallazest` (`idta_hallazgoestado`),
  KEY `fk_controlahallaz` (`idta_auditoria`),
  KEY `fk_ta_idhallazgorevision` (`idta_idhallazgorevision`),
  CONSTRAINT `fk_controlahallaz` FOREIGN KEY (`idta_auditoria`) REFERENCES `ta_auditoria` (`idta_auditoria`),
  CONSTRAINT `fk_hallazest` FOREIGN KEY (`idta_hallazgoestado`) REFERENCES `ta_hallazgoestado` (`ta_hallazgoestado`),
  CONSTRAINT `fk_hallazgocriti` FOREIGN KEY (`idta_criticidad`) REFERENCES `ta_criticidad` (`idta_criticidad`),
  CONSTRAINT `fk_ta_idhallazgorevision` FOREIGN KEY (`idta_idhallazgorevision`) REFERENCES `ta_hallazgorevision` (`ta_idhallazgorevision`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_hallazgo` */

insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (1,1,1,1,8,NULL,NULL,NULL,NULL,'HALLAZGO 1: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','comentario hallazgo 1','2025-11-12 18:41:39','2025-11-12',0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,2,NULL,2);
insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (2,1,2,1,8,NULL,NULL,NULL,NULL,'HALLAZGO 2: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','asdasd','2025-11-12 18:41:39','2025-11-12',0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,2,NULL,2);
insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (3,1,2,1,8,NULL,NULL,NULL,NULL,'HALLAZGO 3: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','asadasdasd','2025-11-12 18:41:40','2025-11-12',0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,2,NULL,2);
insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (4,1,1,1,8,NULL,NULL,NULL,NULL,'HALLAZGO 4: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','adadasdasdasd','2025-11-12 18:41:40','2025-11-12',0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,2,NULL,2);
insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (5,1,1,1,8,NULL,NULL,NULL,NULL,'HALLAZGO 5: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','adadasd','2025-11-12 18:41:40','2025-11-12',0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,2,NULL,2);
insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (6,1,1,1,8,NULL,NULL,NULL,NULL,'HALLAZGO 6: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','adasdasd','2025-11-12 18:41:40','2025-11-12',0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,2,NULL,2);
insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (7,1,2,1,8,NULL,NULL,NULL,NULL,'HALLAZGO 7: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','asdadasdas','2025-11-12 18:41:41','2025-11-12',0,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,2,NULL,2);
insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (8,1,3,3,8,NULL,NULL,NULL,NULL,'HALLAZGO 8: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','sadddddddddasd','2025-11-12 18:41:41','2025-11-30',0,'gabriel loyola',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'ACCION SUGERIDO 1','se adopta curso',0,'2025-11-30',0);
insert  into `ta_hallazgo`(`idta_hallazgo`,`idta_auditoria`,`idta_criticidad`,`idta_hallazgoestado`,`idta_idhallazgorevision`,`td_comentariorevision`,`td_archivo`,`td_archivoencryp`,`td_digito`,`td_descripcion`,`td_descargo`,`td_fecha`,`td_fechacomnpro`,`td_estado`,`td_responsableacccion`,`td_responsableacccion_estado`,`td_plazoimplementacion`,`idta_tipoauditoria`,`idta_patrones`,`idta_patronesdetalle`,`td_area`,`td_areadetalle`,`td_criterios`,`td_cursosaccion`,`td_estadoinforme`,`td_detallehallazgo`,`td_condicion`,`td_cursoaccionsugerigo`,`td_cursoaccionadoptado`,`td_cursoaccionadoptado_estado`,`td_fechaimplementa`,`td_fechaimplementa_estado`) values (9,1,3,3,8,NULL,NULL,NULL,NULL,'HALLAZGO 9: BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA.','adasdasdasdasd','2025-11-12 18:41:41','2025-11-13',0,'gabriel loyola zuleta',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'ACCION SUGERIDO 2','se adopta cursos',0,'2025-11-13',0);

/*Table structure for table `ta_hallazgodocumentos` */

DROP TABLE IF EXISTS `ta_hallazgodocumentos`;

CREATE TABLE `ta_hallazgodocumentos` (
  `idta_hallazgodocumentos` int(11) NOT NULL AUTO_INCREMENT,
  `idta_auditoria` int(11) DEFAULT NULL,
  `idta_hallazgo` int(11) DEFAULT NULL,
  `td_archivo` varchar(800) DEFAULT NULL,
  `td_archivoencryp` varchar(2000) DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_hallazgodocumentos`),
  KEY `fk_hallazgodocumento` (`idta_hallazgo`),
  CONSTRAINT `fk_hallazgodocumento` FOREIGN KEY (`idta_hallazgo`) REFERENCES `ta_hallazgo` (`idta_hallazgo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_hallazgodocumentos` */

insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (1,NULL,1,'CV Gabriel Loyola_Z.pdf','2uOs-kC1l91vab8NKr8hwhnlPG_whkb8jakyCZ3cKUo..pdf','2025-11-12 19:03:28',0);
insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (2,NULL,2,'GANTT SITIO CONTRALORIA.mpp','KeVjZWsZrUvKEgCHuD7qWhmfyVu37XnMzCAAIKtbPQ3yNIV-xvjv8bQ_QMhE2swd.mpp','2025-11-12 19:03:51',0);
insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (3,NULL,3,'ORGANIGRAMA CONGECAR.pptx','bcyCj9zbK-j9LybQko7_Hta2-hnr_fum5UfDfSa_hy-urvpK8H-w6mEzj5GI1_GL.pptx','2025-11-12 19:04:26',0);
insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (4,NULL,4,'CV Gabriel Loyola_Z.pdf','cD6qu_0HXGo-x4GJAstdCeIEPnZ1988xrIfOxJ47bB0..pdf','2025-11-12 19:04:41',0);
insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (5,NULL,5,'240790479.pdf','9ZsC03pce4tKcNskgR_M2vyJSn7N7nBiFpp3gDbkkf4..pdf','2025-11-12 19:04:52',0);
insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (6,NULL,6,'240790479.pdf','fdwLgDX90d5tEzEcquGA7Dow5PUrfRQRNQkz7OG0HN0..pdf','2025-11-12 19:05:02',0);
insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (7,NULL,7,'GANTT SITIO CONTRALORIAPGOA.pdf','WXTDd1VY71n54ASPlywyv83CFMlVT4O8txL2MaT0ZZ1TMFOZRMf1CmamuAWYRyi3.pdf','2025-11-12 19:05:15',0);
insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (8,NULL,8,'241672179_ACIPOL.pdf','RCbTbVkpDU63woRI6z1Cw1Jsu1rUL98oGwtQyVvyVhU..pdf','2025-11-12 19:05:31',0);
insert  into `ta_hallazgodocumentos`(`idta_hallazgodocumentos`,`idta_auditoria`,`idta_hallazgo`,`td_archivo`,`td_archivoencryp`,`td_fecha`,`td_estado`) values (9,NULL,9,'GANTT SITIO CONTRALORIA.pdf','_TuKS5HpNKh2q7eYI0S7qZifPwZWfPI7fKexAhVvEUqVblWiI-d4GvxZiNvldxr0.pdf','2025-11-12 19:05:42',0);

/*Table structure for table `ta_hallazgoestado` */

DROP TABLE IF EXISTS `ta_hallazgoestado`;

CREATE TABLE `ta_hallazgoestado` (
  `ta_hallazgoestado` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`ta_hallazgoestado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_hallazgoestado` */

insert  into `ta_hallazgoestado`(`ta_hallazgoestado`,`td_descripcion`,`td_estado`) values (1,'Subsanada',0);
insert  into `ta_hallazgoestado`(`ta_hallazgoestado`,`td_descripcion`,`td_estado`) values (2,'Subsanada con salvedad',0);
insert  into `ta_hallazgoestado`(`ta_hallazgoestado`,`td_descripcion`,`td_estado`) values (3,'Pendiente',0);
insert  into `ta_hallazgoestado`(`ta_hallazgoestado`,`td_descripcion`,`td_estado`) values (4,'Levantada',0);

/*Table structure for table `ta_hallazgorevision` */

DROP TABLE IF EXISTS `ta_hallazgorevision`;

CREATE TABLE `ta_hallazgorevision` (
  `ta_idhallazgorevision` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`ta_idhallazgorevision`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_hallazgorevision` */

insert  into `ta_hallazgorevision`(`ta_idhallazgorevision`,`td_descripcion`,`td_estado`) values (5,'Rechazado',0);
insert  into `ta_hallazgorevision`(`ta_idhallazgorevision`,`td_descripcion`,`td_estado`) values (6,'Aceptado',0);
insert  into `ta_hallazgorevision`(`ta_idhallazgorevision`,`td_descripcion`,`td_estado`) values (7,'Adjuntar Descargos',0);
insert  into `ta_hallazgorevision`(`ta_idhallazgorevision`,`td_descripcion`,`td_estado`) values (8,'En Revisión',0);

/*Table structure for table `ta_informe` */

DROP TABLE IF EXISTS `ta_informe`;

CREATE TABLE `ta_informe` (
  `idta_informe` int(11) NOT NULL AUTO_INCREMENT,
  `idta_datosbasicos` int(11) DEFAULT NULL,
  `idta_antegenerales` int(11) DEFAULT NULL,
  `idta_metodologia` int(11) DEFAULT NULL,
  `idta_universoymuestra` int(11) DEFAULT NULL,
  `idta_oportunidad` int(11) DEFAULT NULL,
  `idta_limitaciones` int(11) DEFAULT NULL,
  `idta_conclusion` int(11) DEFAULT NULL,
  `idcontrol` int(11) DEFAULT NULL,
  `td_observaciones` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`idta_informe`),
  KEY `fk_basicosinforme` (`idta_datosbasicos`),
  KEY `fk_antegeneralesinforme` (`idta_antegenerales`),
  KEY `fk_metodologiainforme` (`idta_metodologia`),
  KEY `fk_universoymuestrainforme` (`idta_universoymuestra`),
  KEY `fk_oportunidadinforme` (`idta_oportunidad`),
  KEY `fk_limitacionesinforme` (`idta_limitaciones`),
  KEY `fk_informeconclu` (`idta_conclusion`),
  CONSTRAINT `fk_antegeneralesinforme` FOREIGN KEY (`idta_antegenerales`) REFERENCES `ta_antegenerales` (`idta_antegenerales`),
  CONSTRAINT `fk_basicosinforme` FOREIGN KEY (`idta_datosbasicos`) REFERENCES `ta_datosbasicos` (`idta_datosbasicos`),
  CONSTRAINT `fk_informeconclu` FOREIGN KEY (`idta_conclusion`) REFERENCES `ta_conclusion` (`idta_conclusion`),
  CONSTRAINT `fk_limitacionesinforme` FOREIGN KEY (`idta_limitaciones`) REFERENCES `ta_limitaciones` (`idta_limitaciones`),
  CONSTRAINT `fk_metodologiainforme` FOREIGN KEY (`idta_metodologia`) REFERENCES `ta_metodologia` (`idta_metodologia`),
  CONSTRAINT `fk_oportunidadinforme` FOREIGN KEY (`idta_oportunidad`) REFERENCES `ta_oportunidad` (`idta_oportunidad`),
  CONSTRAINT `fk_universoymuestrainforme` FOREIGN KEY (`idta_universoymuestra`) REFERENCES `ta_universoymuestra` (`idta_universoymuestra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_informe` */

/*Table structure for table `ta_internet` */

DROP TABLE IF EXISTS `ta_internet`;

CREATE TABLE `ta_internet` (
  `idta_internet` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_internet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_internet` */

/*Table structure for table `ta_limitaciones` */

DROP TABLE IF EXISTS `ta_limitaciones`;

CREATE TABLE `ta_limitaciones` (
  `idta_limitaciones` int(11) NOT NULL AUTO_INCREMENT,
  `td_limitaciones` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idta_limitaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_limitaciones` */

/*Table structure for table `ta_log` */

DROP TABLE IF EXISTS `ta_log`;

CREATE TABLE `ta_log` (
  `idta_log` int(11) NOT NULL AUTO_INCREMENT,
  `idta_usuario` int(11) DEFAULT NULL,
  `td_pagina` varchar(45) DEFAULT NULL,
  `td_ip` varchar(45) DEFAULT NULL,
  `td_fecha` datetime DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_log`),
  KEY `fk_ususariolog_idx` (`idta_usuario`),
  CONSTRAINT `fk_ususariolog` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_log` */

/*Table structure for table `ta_materia` */

DROP TABLE IF EXISTS `ta_materia`;

CREATE TABLE `ta_materia` (
  `idta_materia` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `td_descripcion` varchar(2000) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_materia`),
  KEY `fk_reparticionmateria` (`idta_reparticion`),
  CONSTRAINT `fk_reparticionmateria` FOREIGN KEY (`idta_reparticion`) REFERENCES `ta_reparticion` (`idta_reparticion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_materia` */

/*Table structure for table `ta_menu` */

DROP TABLE IF EXISTS `ta_menu`;

CREATE TABLE `ta_menu` (
  `idta_menu` int(11) NOT NULL AUTO_INCREMENT,
  `idta_menupadre` int(11) DEFAULT NULL,
  `td_descripcion` varchar(45) DEFAULT NULL,
  `td_ruta` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_menu`),
  KEY `fk_menupadre_idx` (`idta_menupadre`),
  CONSTRAINT `fk_menupadre` FOREIGN KEY (`idta_menupadre`) REFERENCES `ta_menupadre` (`idta_menupadre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_menu` */

insert  into `ta_menu`(`idta_menu`,`idta_menupadre`,`td_descripcion`,`td_ruta`,`td_estado`) values (1,1,'- Ingresar Auditoria','IngresaAuditoria',0);
insert  into `ta_menu`(`idta_menu`,`idta_menupadre`,`td_descripcion`,`td_ruta`,`td_estado`) values (2,1,'- Listar Auditoria','ListaAuditoria',0);
insert  into `ta_menu`(`idta_menu`,`idta_menupadre`,`td_descripcion`,`td_ruta`,`td_estado`) values (3,2,'- Mantenedor Usuario','InicioUsuario',0);
insert  into `ta_menu`(`idta_menu`,`idta_menupadre`,`td_descripcion`,`td_ruta`,`td_estado`) values (4,2,'- Mantenedor de Listas','MantenedorListas',0);
insert  into `ta_menu`(`idta_menu`,`idta_menupadre`,`td_descripcion`,`td_ruta`,`td_estado`) values (5,3,'- Archivos Relevantes','Iniciobiblio',0);
insert  into `ta_menu`(`idta_menu`,`idta_menupadre`,`td_descripcion`,`td_ruta`,`td_estado`) values (6,1,'- Lista Planificacion','ListaPlanificacion',0);
insert  into `ta_menu`(`idta_menu`,`idta_menupadre`,`td_descripcion`,`td_ruta`,`td_estado`) values (7,1,'- Reporteria','IndexReporte',0);

/*Table structure for table `ta_menudetalle` */

DROP TABLE IF EXISTS `ta_menudetalle`;

CREATE TABLE `ta_menudetalle` (
  `idta_menudetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idta_menu` int(11) DEFAULT NULL,
  `idta_perfil` int(11) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_menudetalle`),
  KEY `fk_menu_detallle_idx` (`idta_menu`),
  KEY `fk_menuperfil_idx` (`idta_perfil`),
  CONSTRAINT `fk_menu_detallle` FOREIGN KEY (`idta_menu`) REFERENCES `ta_menu` (`idta_menu`),
  CONSTRAINT `fk_menuperfil` FOREIGN KEY (`idta_perfil`) REFERENCES `ta_perfil` (`idta_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_menudetalle` */

insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (1,1,1,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (2,2,1,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (3,3,1,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (4,4,1,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (5,5,1,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (6,6,1,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (7,7,1,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (8,1,4,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (9,2,4,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (10,3,4,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (11,4,4,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (12,5,4,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (13,6,4,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (14,7,4,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (15,1,2,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (16,2,2,0);
insert  into `ta_menudetalle`(`idta_menudetalle`,`idta_menu`,`idta_perfil`,`td_estado`) values (17,6,2,0);

/*Table structure for table `ta_menupadre` */

DROP TABLE IF EXISTS `ta_menupadre`;

CREATE TABLE `ta_menupadre` (
  `idta_menupadre` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(200) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_menupadre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_menupadre` */

insert  into `ta_menupadre`(`idta_menupadre`,`td_descripcion`,`td_estado`) values (1,'Auditoria',0);
insert  into `ta_menupadre`(`idta_menupadre`,`td_descripcion`,`td_estado`) values (2,'Mantenedor',0);
insert  into `ta_menupadre`(`idta_menupadre`,`td_descripcion`,`td_estado`) values (3,'Biblioteca',0);

/*Table structure for table `ta_metodologia` */

DROP TABLE IF EXISTS `ta_metodologia`;

CREATE TABLE `ta_metodologia` (
  `idta_metodologia` int(11) NOT NULL AUTO_INCREMENT,
  `td_metodologiaaplicada` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_alcancetrabajo` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idta_metodologia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_metodologia` */

/*Table structure for table `ta_oficina` */

DROP TABLE IF EXISTS `ta_oficina`;

CREATE TABLE `ta_oficina` (
  `idta_oficina` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `idreparticion` int(11) DEFAULT NULL,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_oficina`),
  KEY `fk_oficinarepa` (`idta_reparticion`),
  CONSTRAINT `fk_oficinarepa` FOREIGN KEY (`idta_reparticion`) REFERENCES `ta_reparticion` (`idta_reparticion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_oficina` */

/*Table structure for table `ta_oportunidad` */

DROP TABLE IF EXISTS `ta_oportunidad`;

CREATE TABLE `ta_oportunidad` (
  `idta_oportunidad` int(11) NOT NULL AUTO_INCREMENT,
  `td_oportunidad` varchar(15000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idta_oportunidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_oportunidad` */

/*Table structure for table `ta_origen` */

DROP TABLE IF EXISTS `ta_origen`;

CREATE TABLE `ta_origen` (
  `idta_origen` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(50) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  PRIMARY KEY (`idta_origen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_origen` */

/*Table structure for table `ta_patrones` */

DROP TABLE IF EXISTS `ta_patrones`;

CREATE TABLE `ta_patrones` (
  `idta_patrones` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `idta_tipocontrol` int(11) DEFAULT NULL,
  `td_descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  PRIMARY KEY (`idta_patrones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_patrones` */

/*Table structure for table `ta_patronesdetalle` */

DROP TABLE IF EXISTS `ta_patronesdetalle`;

CREATE TABLE `ta_patronesdetalle` (
  `idta_patronesdetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idta_patrones` int(11) DEFAULT NULL,
  `td_descripcion` varchar(1000) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  PRIMARY KEY (`idta_patronesdetalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_patronesdetalle` */

/*Table structure for table `ta_perfil` */

DROP TABLE IF EXISTS `ta_perfil`;

CREATE TABLE `ta_perfil` (
  `idta_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_sitio` char(1) DEFAULT NULL,
  PRIMARY KEY (`idta_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_perfil` */

insert  into `ta_perfil`(`idta_perfil`,`td_descripcion`,`td_estado`,`td_sitio`) values (1,'Jefe de Equipo ',0,NULL);
insert  into `ta_perfil`(`idta_perfil`,`td_descripcion`,`td_estado`,`td_sitio`) values (2,'Auditor',0,NULL);
insert  into `ta_perfil`(`idta_perfil`,`td_descripcion`,`td_estado`,`td_sitio`) values (3,'Auditor Histórico',1,NULL);
insert  into `ta_perfil`(`idta_perfil`,`td_descripcion`,`td_estado`,`td_sitio`) values (4,'Administrador',0,NULL);
insert  into `ta_perfil`(`idta_perfil`,`td_descripcion`,`td_estado`,`td_sitio`) values (5,'Encargado Descargos',0,NULL);
insert  into `ta_perfil`(`idta_perfil`,`td_descripcion`,`td_estado`,`td_sitio`) values (6,'Ministro',1,NULL);

/*Table structure for table `ta_persona` */

DROP TABLE IF EXISTS `ta_persona`;

CREATE TABLE `ta_persona` (
  `idta_persona` int(11) NOT NULL AUTO_INCREMENT,
  `td_nombrecompleto` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_primernombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_segundonombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_apellidopaterno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_apellidomaterno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_run` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_digito` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_fechanac` date DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  `td_correo` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`idta_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_persona` */

insert  into `ta_persona`(`idta_persona`,`td_nombrecompleto`,`td_primernombre`,`td_segundonombre`,`td_apellidopaterno`,`td_apellidomaterno`,`td_run`,`td_digito`,`td_fechanac`,`td_estado`,`td_fecha`,`td_correo`) values (1,'Gabriel Antonio Loyola Zuleta','Gabriel','Antonio','Loyola','Zuleta','17808433','K','1991-07-31',0,NULL,'gabriel.loyola.info@gmail.com');
insert  into `ta_persona`(`idta_persona`,`td_nombrecompleto`,`td_primernombre`,`td_segundonombre`,`td_apellidopaterno`,`td_apellidomaterno`,`td_run`,`td_digito`,`td_fechanac`,`td_estado`,`td_fecha`,`td_correo`) values (21,'Rogelio Mauricio Loyola Zuleta','Rogelio','Mauricio','Loyola','Zuleta','17876442','k','1991-07-31',0,'2025-11-11','gabriel.loyola.info@gmail.com');
insert  into `ta_persona`(`idta_persona`,`td_nombrecompleto`,`td_primernombre`,`td_segundonombre`,`td_apellidopaterno`,`td_apellidomaterno`,`td_run`,`td_digito`,`td_fechanac`,`td_estado`,`td_fecha`,`td_correo`) values (22,'Rodrigo Gabriel Salas Hernandez','Rodrigo','Gabriel','Salas','Hernandez','17282763','2','1991-01-31',0,'2025-11-11','gabriel.loyola.info@gmail.com');
insert  into `ta_persona`(`idta_persona`,`td_nombrecompleto`,`td_primernombre`,`td_segundonombre`,`td_apellidopaterno`,`td_apellidomaterno`,`td_run`,`td_digito`,`td_fechanac`,`td_estado`,`td_fecha`,`td_correo`) values (23,'Alex  Ramirez Rivera','Alex',NULL,'Ramirez','Rivera','1','9','1991-07-31',0,'2025-11-12','gabriel.loyola.info@gmail.com');

/*Table structure for table `ta_probabilidad` */

DROP TABLE IF EXISTS `ta_probabilidad`;

CREATE TABLE `ta_probabilidad` (
  `idta_probabilidad` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(50) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_probabilidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_probabilidad` */

/*Table structure for table `ta_reparticion` */

DROP TABLE IF EXISTS `ta_reparticion`;

CREATE TABLE `ta_reparticion` (
  `idta_reparticion` int(11) NOT NULL AUTO_INCREMENT,
  `id_altareparticion` int(11) DEFAULT 1,
  `id_dependencia` int(11) DEFAULT NULL,
  `id_reparticion` int(11) DEFAULT NULL,
  `td_descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_reparticion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_reparticion` */

insert  into `ta_reparticion`(`idta_reparticion`,`id_altareparticion`,`id_dependencia`,`id_reparticion`,`td_descripcion`,`td_estado`) values (1,1,NULL,NULL,'Subsecretaría de Telecomunicaciones',0);
insert  into `ta_reparticion`(`idta_reparticion`,`id_altareparticion`,`id_dependencia`,`id_reparticion`,`td_descripcion`,`td_estado`) values (2,NULL,NULL,NULL,'Division Administración y Finanzas',0);
insert  into `ta_reparticion`(`idta_reparticion`,`id_altareparticion`,`id_dependencia`,`id_reparticion`,`td_descripcion`,`td_estado`) values (3,NULL,NULL,NULL,'División Política Regulatoria y Estudios',0);
insert  into `ta_reparticion`(`idta_reparticion`,`id_altareparticion`,`id_dependencia`,`id_reparticion`,`td_descripcion`,`td_estado`) values (4,NULL,NULL,NULL,'División Jurídica',0);
insert  into `ta_reparticion`(`idta_reparticion`,`id_altareparticion`,`id_dependencia`,`id_reparticion`,`td_descripcion`,`td_estado`) values (5,NULL,NULL,NULL,'División Fiscalización',0);
insert  into `ta_reparticion`(`idta_reparticion`,`id_altareparticion`,`id_dependencia`,`id_reparticion`,`td_descripcion`,`td_estado`) values (6,NULL,NULL,NULL,'Divisón Concesiones',0);
insert  into `ta_reparticion`(`idta_reparticion`,`id_altareparticion`,`id_dependencia`,`id_reparticion`,`td_descripcion`,`td_estado`) values (7,NULL,NULL,NULL,'División Gerencia del Fondo de Desarrollo de las Telecomunicaciones',0);

/*Table structure for table `ta_seccion` */

DROP TABLE IF EXISTS `ta_seccion`;

CREATE TABLE `ta_seccion` (
  `idta_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `id_reparticion` int(11) DEFAULT NULL,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_seccion` */

/*Table structure for table `ta_session` */

DROP TABLE IF EXISTS `ta_session`;

CREATE TABLE `ta_session` (
  `idta_session` int(11) NOT NULL AUTO_INCREMENT,
  `idta_usuario` int(11) DEFAULT NULL,
  `td_token` varchar(2000) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_session`),
  KEY `fk_sessionusuario_idx` (`idta_usuario`),
  CONSTRAINT `fk_sessionusuario` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_session` */

/*Table structure for table `ta_tipoauditoria` */

DROP TABLE IF EXISTS `ta_tipoauditoria`;

CREATE TABLE `ta_tipoauditoria` (
  `idta_tipoauditoria` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT 1,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_estadopatron` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_tipoauditoria`),
  KEY `fk_repatipocontrol` (`idta_reparticion`),
  CONSTRAINT `fk_repatipocontrol` FOREIGN KEY (`idta_reparticion`) REFERENCES `ta_reparticion` (`idta_reparticion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_tipoauditoria` */

insert  into `ta_tipoauditoria`(`idta_tipoauditoria`,`idta_reparticion`,`td_descripcion`,`td_estado`,`td_estadopatron`) values (1,1,'Gubernamental',0,NULL);
insert  into `ta_tipoauditoria`(`idta_tipoauditoria`,`idta_reparticion`,`td_descripcion`,`td_estado`,`td_estadopatron`) values (2,1,'Ministerial',0,NULL);
insert  into `ta_tipoauditoria`(`idta_tipoauditoria`,`idta_reparticion`,`td_descripcion`,`td_estado`,`td_estadopatron`) values (3,1,'Institucional',0,NULL);
insert  into `ta_tipoauditoria`(`idta_tipoauditoria`,`idta_reparticion`,`td_descripcion`,`td_estado`,`td_estadopatron`) values (4,1,'Extraordinaria',0,NULL);

/*Table structure for table `ta_tipodesarrollo` */

DROP TABLE IF EXISTS `ta_tipodesarrollo`;

CREATE TABLE `ta_tipodesarrollo` (
  `idta_tipodesarrollo` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_tipodesarrollo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_tipodesarrollo` */

/*Table structure for table `ta_tipodoc` */

DROP TABLE IF EXISTS `ta_tipodoc`;

CREATE TABLE `ta_tipodoc` (
  `idta_tipodoc` int(11) NOT NULL AUTO_INCREMENT,
  `idta_usuario` int(11) DEFAULT NULL,
  `td_descripcion` varchar(500) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_tipodoc`),
  KEY `fk_docusu` (`idta_usuario`),
  CONSTRAINT `fk_docusu` FOREIGN KEY (`idta_usuario`) REFERENCES `ta_usuario` (`idta_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_tipodoc` */

insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (1,NULL,'Archivos Relevantes',0);
insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (2,NULL,'Informes Gestion',0);
insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (3,NULL,'Reportes',0);
insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (4,NULL,'Anexos',0);
insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (5,NULL,'Otros Documentos',0);
insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (6,NULL,'Revision',1);
insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (7,NULL,'Descargos',1);
insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (8,NULL,'Plan Accion',1);
insert  into `ta_tipodoc`(`idta_tipodoc`,`idta_usuario`,`td_descripcion`,`td_estado`) values (9,NULL,'PDF',2);

/*Table structure for table `ta_tipodocdet` */

DROP TABLE IF EXISTS `ta_tipodocdet`;

CREATE TABLE `ta_tipodocdet` (
  `idta_tipodocdet` int(11) NOT NULL AUTO_INCREMENT,
  `idta_tipodoc` int(11) DEFAULT NULL,
  `td_descripcion` varchar(500) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_tipodocdet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_tipodocdet` */

/*Table structure for table `ta_tipohistorica` */

DROP TABLE IF EXISTS `ta_tipohistorica`;

CREATE TABLE `ta_tipohistorica` (
  `ta_tipohistorica` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(2000) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`ta_tipohistorica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_tipohistorica` */

/*Table structure for table `ta_tipolibro` */

DROP TABLE IF EXISTS `ta_tipolibro`;

CREATE TABLE `ta_tipolibro` (
  `idta_tipolibro` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(200) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  PRIMARY KEY (`idta_tipolibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_tipolibro` */

/*Table structure for table `ta_tipopersonal` */

DROP TABLE IF EXISTS `ta_tipopersonal`;

CREATE TABLE `ta_tipopersonal` (
  `idta_tipopersonal` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(50) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  PRIMARY KEY (`idta_tipopersonal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_tipopersonal` */

/*Table structure for table `ta_tiposervicio` */

DROP TABLE IF EXISTS `ta_tiposervicio`;

CREATE TABLE `ta_tiposervicio` (
  `idta_tiposervicio` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(200) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  PRIMARY KEY (`idta_tiposervicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_tiposervicio` */

/*Table structure for table `ta_unidad` */

DROP TABLE IF EXISTS `ta_unidad`;

CREATE TABLE `ta_unidad` (
  `idta_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `idta_reparticion` int(11) DEFAULT NULL,
  `td_descripcion` varchar(500) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_unidad`),
  KEY `fk_unidadrepa` (`idta_reparticion`),
  CONSTRAINT `fk_unidadrepa` FOREIGN KEY (`idta_reparticion`) REFERENCES `ta_reparticion` (`idta_reparticion`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_unidad` */

insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (1,1,'Unidad de Auditoria Interna',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (2,1,'Unidad de Comunicaciones',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (3,1,'Departamento de Control de Gestión',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (4,1,'Area Gestión Territorial, Participacion Ciudadana y Asuntos Indígenas',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (5,2,'Departamento de Finanzas',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (6,2,'Departamento Gestión de Personas',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (7,2,'Departamento Adquisiciones e Inventario',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (8,2,'Unidad Jurídica de Administración Interna',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (9,2,'Unidad de Gestión Documental',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (10,2,'Departamento de Desarrollo Tecnológico',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (11,3,'Departamento Administración del Espectro Radioeléctrico y Números',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (12,3,'Departamento de Estudios y Económicos y Tarificación',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (13,3,'Departamento de Estudios de Mercado',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (14,4,'Departamento Autorizaciones Estudios y Análisis Jurídico',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (15,4,'Departamento Análisis Jurídico de la Política Regulatoria',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (16,4,'Departamento de Cargos y Defensa Judicial',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (17,5,'Departamento Análisis y Planificación',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (18,5,'Departamento de Operaciones',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (19,5,'Departamento de Gestión de Reclamos',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (20,6,'Departamento Servicios Limitados',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (21,6,'Departamento Servicios Públicos',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (22,6,'Departamento Servicios de Radiodifusión',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (23,7,'Departamento Ingeniería de Proyectos',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (24,7,'Unidad de Planificación y Gestión de Proyectos',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (25,7,'Unidad Jurídica del FDT',0);
insert  into `ta_unidad`(`idta_unidad`,`idta_reparticion`,`td_descripcion`,`td_estado`) values (26,7,'Unidad de Seguimiento y Control de Impacto',0);

/*Table structure for table `ta_universoymuestra` */

DROP TABLE IF EXISTS `ta_universoymuestra`;

CREATE TABLE `ta_universoymuestra` (
  `idta_universoymuestra` int(11) NOT NULL AUTO_INCREMENT,
  `td_universo` longtext DEFAULT NULL,
  `td_muestra` longtext DEFAULT NULL,
  PRIMARY KEY (`idta_universoymuestra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_universoymuestra` */

/*Table structure for table `ta_usuario` */

DROP TABLE IF EXISTS `ta_usuario`;

CREATE TABLE `ta_usuario` (
  `idta_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `idta_persona` int(11) DEFAULT NULL,
  `idta_perfil` int(11) DEFAULT NULL,
  `idta_contrato` int(11) DEFAULT NULL,
  `idta_altareparticion` int(11) DEFAULT NULL,
  `idta_reparticion` int(11) DEFAULT NULL,
  `idta_unidad` int(11) DEFAULT NULL,
  `td_run` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_digito` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_correo` varchar(500) DEFAULT NULL,
  `td_password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  `td_primeravez` int(11) DEFAULT NULL,
  `td_activo` int(11) DEFAULT NULL,
  `td_runcompleto` varchar(30) DEFAULT NULL,
  `td_cargo` int(11) DEFAULT NULL,
  `td_img` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `td_fecha` date DEFAULT NULL,
  PRIMARY KEY (`idta_usuario`),
  KEY `fk_personas_usuario_idx` (`idta_persona`),
  KEY `fk_perfil_usuario_idx` (`idta_perfil`),
  CONSTRAINT `fk_perfil_usuario` FOREIGN KEY (`idta_perfil`) REFERENCES `ta_perfil` (`idta_perfil`),
  CONSTRAINT `fk_personas_usuario` FOREIGN KEY (`idta_persona`) REFERENCES `ta_persona` (`idta_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_usuario` */

insert  into `ta_usuario`(`idta_usuario`,`idta_persona`,`idta_perfil`,`idta_contrato`,`idta_altareparticion`,`idta_reparticion`,`idta_unidad`,`td_run`,`td_digito`,`td_correo`,`td_password`,`td_estado`,`td_primeravez`,`td_activo`,`td_runcompleto`,`td_cargo`,`td_img`,`td_fecha`) values (1,1,4,1,1,1,4,'17808433','K','gabriel.loyola.info@gmail.com','123456',0,NULL,NULL,'17808433K',NULL,NULL,'2025-11-11');
insert  into `ta_usuario`(`idta_usuario`,`idta_persona`,`idta_perfil`,`idta_contrato`,`idta_altareparticion`,`idta_reparticion`,`idta_unidad`,`td_run`,`td_digito`,`td_correo`,`td_password`,`td_estado`,`td_primeravez`,`td_activo`,`td_runcompleto`,`td_cargo`,`td_img`,`td_fecha`) values (21,21,2,NULL,1,1,1,'17876442','k','gabriel.loyola.info@gmail.com','123456789nN!',0,0,0,'17876442k',NULL,NULL,'2025-11-11');
insert  into `ta_usuario`(`idta_usuario`,`idta_persona`,`idta_perfil`,`idta_contrato`,`idta_altareparticion`,`idta_reparticion`,`idta_unidad`,`td_run`,`td_digito`,`td_correo`,`td_password`,`td_estado`,`td_primeravez`,`td_activo`,`td_runcompleto`,`td_cargo`,`td_img`,`td_fecha`) values (22,22,1,NULL,1,1,1,'17282763','2','gabriel.loyola.info@gmail.com','123456789nN!',0,0,0,'172827632',NULL,NULL,'2025-11-11');
insert  into `ta_usuario`(`idta_usuario`,`idta_persona`,`idta_perfil`,`idta_contrato`,`idta_altareparticion`,`idta_reparticion`,`idta_unidad`,`td_run`,`td_digito`,`td_correo`,`td_password`,`td_estado`,`td_primeravez`,`td_activo`,`td_runcompleto`,`td_cargo`,`td_img`,`td_fecha`) values (23,23,5,NULL,1,2,10,'1','9','gabriel.loyola.info@gmail.com','123456789nN!',0,0,0,'19',NULL,NULL,'2025-11-12');

/*Table structure for table `ta_validacion` */

DROP TABLE IF EXISTS `ta_validacion`;

CREATE TABLE `ta_validacion` (
  `idta_validacion` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_validacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_validacion` */

/*Table structure for table `ta_versioncontrol` */

DROP TABLE IF EXISTS `ta_versioncontrol`;

CREATE TABLE `ta_versioncontrol` (
  `idta_versioncontrol` int(11) NOT NULL AUTO_INCREMENT,
  `idta_control` int(11) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_versioncontrol`),
  KEY `fk_ver_audi_idx` (`idta_control`),
  CONSTRAINT `fk_ver_audi` FOREIGN KEY (`idta_control`) REFERENCES `ta_auditoria` (`idta_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_versioncontrol` */

/*Table structure for table `ta_vigencia` */

DROP TABLE IF EXISTS `ta_vigencia`;

CREATE TABLE `ta_vigencia` (
  `idta_vigencia` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(50) DEFAULT NULL,
  `td_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idta_vigencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ta_vigencia` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
