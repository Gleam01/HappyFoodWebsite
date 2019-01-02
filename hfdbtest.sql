-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 23 déc. 2018 à 16:47
-- Version du serveur :  10.1.34-MariaDB
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hfdbtest`
--

-- --------------------------------------------------------

--
-- Structure de la table `codesvalidation`
--

CREATE TABLE `codesvalidation` (
  `idCodesValidation` int(11) NOT NULL,
  `code` varchar(60) NOT NULL,
  `deja_genere` int(11) NOT NULL DEFAULT '0',
  `selt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `codesvalidation`
--

INSERT INTO `codesvalidation` (`idCodesValidation`, `code`, `deja_genere`, `selt`) VALUES
(1, '_hK422Af6sA', 1, 0),
(2, '_cFiCl89Xa8', 1, 0),
(3, '_hVn39KsDg9', 1, 0),
(4, '_n1o6hFrJoF', 1, 0),
(5, '_p4f8kQa8hG', 1, 0),
(6, '_oSePg9mGqE', 1, 0),
(7, '_j0xA5T67eF', 1, 0),
(8, '_vGk5cXaU9T', 1, 0),
(9, '_c0b8q8gH18', 1, 0),
(10, '_i4sE7L5QkF', 1, 0),
(11, '_0OrRdIxJvV', 1, 0),
(12, '_4TzI6A56f2', 1, 0),
(13, '_0QdQg8fB2A', 1, 0),
(14, '_fSw84H4K41', 1, 0),
(15, '_wTdRx9nV6C', 1, 0),
(16, '_27zZiB3Mv1', 1, 0),
(17, '_bMxV2M4YmB', 1, 0),
(18, '_kPc10QzDiR', 1, 0),
(19, '_jVqEkZp49D', 1, 0),
(20, '_uPqSmXiJ5B', 1, 0),
(21, '_hQzQzQkW3I', 1, 0),
(22, '_u0qPsJkUoL', 1, 0),
(23, '_15w62J1JvN', 1, 0),
(24, '_13z42635u3', 1, 0),
(25, '_nB6Ua0kHgG', 1, 0),
(26, '_i423r8z1pK', 1, 0),
(27, '_bE5HoQzEv2', 1, 0),
(28, '_i6o7zRiNmF', 1, 0),
(29, '_m7jKqJhI2R', 1, 0),
(30, '_6JzLcV79gU', 1, 0),
(31, '_yEyZyGwXe5', 1, 0),
(32, '_u07VrRiN2K', 1, 0),
(33, '_qOmRc3nWj7', 1, 0),
(34, '_h1jNuNsZzG', 1, 0),
(35, '_o2u7yNxY5U', 1, 0),
(36, '_u15X9LaH2L', 1, 0),
(37, '_xBjOpFrZmF', 1, 0),
(38, '_5Hh66NmSgR', 1, 0),
(39, '_cTlQkWkMzD', 1, 0),
(40, '_qCaMw8lZ7N', 1, 0),
(41, '_tFv50AiRvH', 1, 0),
(42, '_39gFy60Z04', 1, 0),
(43, '_oZbAhPwFxC', 1, 0),
(44, '_9JcL6Z51u1', 1, 0),
(45, '_bTuAnS4IyA', 1, 0),
(46, '_47hJ9EjCu4', 1, 0),
(47, '_2WaGyFhUvG', 1, 0),
(48, '_4P4S0RqNiJ', 1, 0),
(49, '_2MqM28aDvQ', 1, 0),
(50, '_zWeWaDfJvG', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `filleuls`
--

CREATE TABLE `filleuls` (
  `idFilleuls` int(11) NOT NULL,
  `User_idUser` int(11) NOT NULL,
  `Parrain_idParrain` int(11) NOT NULL,
  `Parrain_User_idUser` int(11) NOT NULL,
  `numInGenePrincipal` int(11) DEFAULT NULL,
  `geneFocus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `filleuls`
--

INSERT INTO `filleuls` (`idFilleuls`, `User_idUser`, `Parrain_idParrain`, `Parrain_User_idUser`, `numInGenePrincipal`, `geneFocus`) VALUES
(1, 2, 1, 1, NULL, NULL),
(2, 3, 2, 2, 1, 2),
(3, 4, 2, 2, 1, 2),
(4, 5, 2, 2, 1, 2),
(5, 6, 3, 3, 2, NULL),
(6, 7, 3, 3, 2, NULL),
(7, 8, 3, 3, 2, NULL),
(8, 9, 4, 6, 3, NULL),
(9, 10, 4, 6, 3, NULL),
(10, 11, 4, 6, 3, NULL),
(11, 12, 5, 7, 3, NULL),
(12, 13, 5, 7, 3, NULL),
(13, 14, 5, 7, 3, NULL),
(14, 15, 6, 8, 3, NULL),
(15, 16, 6, 8, 3, NULL),
(16, 17, 6, 8, 3, NULL),
(17, 18, 7, 9, 4, NULL),
(18, 19, 7, 9, 4, NULL),
(19, 20, 7, 9, 4, NULL),
(20, 21, 8, 10, 4, NULL),
(21, 22, 8, 10, 4, NULL),
(22, 23, 8, 10, 4, NULL),
(23, 24, 9, 11, 4, NULL),
(24, 25, 9, 11, 4, NULL),
(25, 26, 9, 11, 4, NULL),
(26, 27, 10, 12, 4, NULL),
(27, 28, 10, 12, 4, NULL),
(28, 29, 10, 12, 4, NULL),
(29, 30, 11, 13, 4, NULL),
(30, 31, 11, 13, 4, NULL),
(31, 32, 11, 13, 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `parrain`
--

CREATE TABLE `parrain` (
  `idParrain` int(11) NOT NULL,
  `nbGene1` int(11) DEFAULT '0',
  `nbGene2` int(11) DEFAULT '0' COMMENT '	',
  `nbGene3` int(11) DEFAULT '0',
  `User_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `parrain`
--

INSERT INTO `parrain` (`idParrain`, `nbGene1`, `nbGene2`, `nbGene3`, `User_idUser`) VALUES
(1, 1, 0, 0, 1),
(2, 3, 0, 0, 2),
(3, 3, 9, 15, 3),
(4, 3, 9, 0, 6),
(5, 3, 6, 0, 7),
(6, 3, 0, 0, 8),
(7, 3, 0, 0, 9),
(8, 3, 0, 0, 10),
(9, 3, 0, 0, 11),
(10, 3, 0, 0, 12),
(11, 3, 0, 0, 13);

-- --------------------------------------------------------

--
-- Structure de la table `parrain_has_code`
--

CREATE TABLE `parrain_has_code` (
  `id` int(11) NOT NULL,
  `id_pere` int(11) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `parrain_has_code`
--

INSERT INTO `parrain_has_code` (`id`, `id_pere`, `code`) VALUES
(1, 2, 'zertyuiopsdfghj'),
(2, 3, 'zertyuiopsdfghj'),
(3, 6, 'zertyuiopsdfghj'),
(4, 7, 'zertyuiopsdfghj'),
(5, 8, 'zertyuiopsdfghj'),
(6, 9, 'zertyuiopsdfghj'),
(7, 10, 'zertyuiopsdfghj'),
(8, 11, 'zertyuiopsdfghj'),
(9, 12, 'zertyuiopsdfghj'),
(10, 13, 'zertyuiopsdfghj');

-- --------------------------------------------------------

--
-- Structure de la table `parrain_has_filleuls`
--

CREATE TABLE `parrain_has_filleuls` (
  `Parrain_idParrain` int(11) NOT NULL,
  `Filleuls_idFilleuls` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `parrain_has_step`
--

CREATE TABLE `parrain_has_step` (
  `Parrain_idParrain` int(11) NOT NULL,
  `Parrain_User_idUser` int(11) NOT NULL,
  `Step_idStep` int(11) NOT NULL,
  `readyUp` tinyint(1) NOT NULL DEFAULT '0',
  `giftTaken` tinyint(1) NOT NULL DEFAULT '0',
  `date_taken` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `parrain_has_step`
--

INSERT INTO `parrain_has_step` (`Parrain_idParrain`, `Parrain_User_idUser`, `Step_idStep`, `readyUp`, `giftTaken`, `date_taken`) VALUES
(2, 2, 1, 0, 0, NULL),
(3, 3, 2, 0, 0, NULL),
(4, 6, 1, 1, 0, NULL),
(5, 7, 1, 0, 0, NULL),
(6, 8, 1, 0, 0, NULL),
(7, 9, 1, 0, 0, NULL),
(8, 10, 1, 0, 0, NULL),
(9, 11, 1, 0, 0, NULL),
(10, 12, 1, 0, 0, NULL),
(11, 13, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `recuperation`
--

CREATE TABLE `recuperation` (
  `id` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `confirme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `step`
--

CREATE TABLE `step` (
  `idStep` int(11) NOT NULL,
  `nbFilleulLimStep3` int(11) DEFAULT '39',
  `nbFilleulLimStep2` int(11) DEFAULT '39',
  `nbFilleulLimStep1` int(11) DEFAULT '39',
  `nbFilleulLimStep0` int(11) DEFAULT '12',
  `num` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `step`
--

INSERT INTO `step` (`idStep`, `nbFilleulLimStep3`, `nbFilleulLimStep2`, `nbFilleulLimStep1`, `nbFilleulLimStep0`, `num`) VALUES
(1, 39, 39, 39, 12, 0),
(2, 39, 39, 39, 12, 1),
(3, 39, 39, 39, 12, 2),
(4, 39, 39, 39, 12, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `inscriptionDate` date DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `newUser` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `login`, `email`, `password`, `lastName`, `firstName`, `phone`, `sex`, `birthday`, `inscriptionDate`, `adress`, `pays`, `job`, `admin`, `newUser`) VALUES
(1, 'admin', '', '$2y$10$R9kORb49MpClhEysm90TxOaF4o7dEeTaNtf/gjqmUC/f1ry/Bw4nS', 'Food', 'Happy', '54879685', 'M', '2000-01-01', NULL, 'calavi', 'Benin', 'soudeur', 1, 0),
(2, 'admin0', '', '$2y$10$L1TN7GOpfm0WjoomuhvWYe9cVtUoZYN9gAu33lJH4MJYVA2HmpHgm', 'John', 'John', '54879685', 'M', '2000-01-01', NULL, 'calavi', 'Benin', 'soudeur', 1, 0),
(3, 'admin1', '', '$2y$10$0c/9Xc4rmAQ9h//nEyFBt.COTan6mTXOsk5xe4J.8B6.kE5/D1zra', 'John1', 'John1', '66159865', 'M', '1990-08-30', NULL, 'calavi', 'Benin', 'Commerçant ', 1, 0),
(4, 'admin2', '', '$2y$10$M0YGAr3N7XNO86x9sYZxaOKqjbZk2yzZEXwluSrBtjI9USrz41PzC', 'John2', 'John2', '54879685', 'M', '0000-00-00', NULL, 'calavi', 'Benin', 'soudeur', 0, 0),
(5, 'admin3', '', '$2y$10$3IAcd/YF0gXXXY5sG9eW2e.J6tp3epVE7T9ZdgWXJhvvQQaGLrfRq', 'John3', 'John3', '54879685', 'F', '0000-00-00', NULL, 'calavi', 'Benin', 'soudeur', 0, 0),
(6, 'test', 'test', 'test', 'test', 'test', '787878', 'm', NULL, NULL, NULL, NULL, NULL, 0, 1),
(7, 'admin11', NULL, '$2y$10$PK2JRn/HIc8FuoOV.i4ILuCJzkTXZIxr2Z2ZkXm8.5vSrIGrloFVW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(8, 'admin111', NULL, '$2y$10$iMOGs2PTjusbzb.k3d2TDuEFvfXMOfSnotZmWcatmdEfE1pt1N61a', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(9, 'admin1111', NULL, '$2y$10$dRajH2/o7qc6pzhelssKh.jXc0yTj10QLaKxbpR7ZCXRv4UOlrEhS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(10, 'admin11111', NULL, '$2y$10$aTBq0zcbgcDvningjQv03ORalimK70qQaAolQgzxYQcRUzD2wRoV2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(11, 'admin111111', NULL, '$2y$10$z9ytAqzRRoaJszd6bFiXZ.e8wnhHHA9H1eZWF3ltNzt94R82iuxvO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(12, 'admin1111111', NULL, '$2y$10$gsVmQXmhAaFe/82NK2UjzOPayyz1CA8nZhpwkCzBHvUh749.C5H0m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(13, 'admin1111112', NULL, '$2y$10$.zPYO5f.ar5BGczrkX5.K.S5cn7PXeCnuRWlGGScI63t5KbwQAYQ6', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(14, 'admin1111113', NULL, '$2y$10$Wu7UvlSrIXZZG/Us7F8q5O4LBMZe2OebXfGX09V43wenEHgAlzaSi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(15, 'admin111112', NULL, '$2y$10$ef5UOxj7wc7Y/gTBIeG91.MS3yfZOpFPmzu4ysHbWZMDVfTijbnvi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(16, 'admin111113', NULL, '$2y$10$nsBz7cA7X/sHoWlwle646O8uFcgXhWBB7OCxKZNPX2biqrWqqIkZC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(17, 'admin1112', NULL, '$2y$10$IuC9ebOF23O5HQBeMk14ouMPkI2kzG1tRlGFYE4TgOsqYBo.rRFsO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(18, 'admin1113', NULL, '$2y$10$ksYOjrFWE6E0EmhNH2A5b.ZdBibTvCoqkNlHqM3llCOB4OnnnDTnO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(19, 'admin11131', NULL, '$2y$10$s.JPYYKLDHKMKasLyax6WuFa5quj4vSm0gHEGO97b.J5y7JtYjQ7W', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(20, 'admin111311', NULL, '$2y$10$8hA3CNGSk0/I5R/4lRSpie6b1lYD1K94/zVJ9LdPfz5Bb5Q7WtX5y', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(21, 'admin11132', NULL, '$2y$10$9ZJ4nj6tNLtZ3r8t6kwQfOABLBYOqmx8AcXpUdEEA5ZDUsX87n2gO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(22, 'admin112', NULL, '$2y$10$3MnEbeQuxN3uPMLm3JU8UuZawe.TfmsUYrkxfzmpEh.N6Cz5/1Iiu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(23, 'admin1121', NULL, '$2y$10$5wrYci0Q6B86pD7pxte59eQhem.7wkPLa23vfFEdqXtMNyG0YezfG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(24, 'admin1122', NULL, '$2y$10$q1lsqTV60yYj3tkAgiIGdu20TFIHxTx9BFajIDbZK.MgguX0DimLu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(25, 'admin11221', NULL, '$2y$10$jW1quWMrjZCIZkKLSo3CEuRk1SlNqyW3MIncqQmNE9DGlJaePO50u', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(26, 'admin11222', NULL, '$2y$10$oDFZEFlAN3VOmIeZA/6GX.TatVsWddr5GEfDzlyjaEWFyZSyMeOJG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(27, 'admin112221', NULL, '$2y$10$kqPZ9TqBXefIqNReec6TVOvpKJh4ufUxLBfxImerQ7SKKoZNwMuGa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(28, 'admin113', NULL, '$2y$10$mhEkaLWYUboc4.0iHfR/4eAAkqLA6gXmFrpaUQXi99aI4Sh9XYqD2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(29, 'admin1131', NULL, '$2y$10$Cf0meNdZUztR79X8K9C6xOlFYWbFWcXTOrr19oM3IDyzWsOaL6FNC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(30, 'admin11311', NULL, '$2y$10$Q4q9eFvt1NBrXOoRx2FIK.zk3Mly.Lp.9e3nmxnt6YFreIwSjlM.2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(31, 'admin11312', NULL, '$2y$10$2QiDTRsObmcRozUgrBt3Nu/VqCdpZ1tjxedVTXmMQ4zzMFSQKPZ6q', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(32, 'admin113121', NULL, '$2y$10$gpNFzKZLX.DpCkzJBgGrjez3LNPrbLVdv2CUEJqaQbQe8.R9RDzdS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(33, 'admin1131211', NULL, '$2y$10$jHFbe6xUSGE0tOTZ5Uu8PeR1KL4YAD.CbQclpIhfupoGdNzzYmaUC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(34, 'admin1131212', NULL, '$2y$10$CesjP4CVFZwyifbOVt3qr.cOU58TOdt3mqnmRmqIFLXa78ITwrHJO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(35, 'admin1131213', NULL, '$2y$10$Nzg681Oz2i5nogrzxoWPpuZamZSD7UhDUNIDwVRSP3G5N9RjJa/mu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(36, 'admin113122', NULL, '$2y$10$OF6FjQTQkl0td3UBm.8kkuUuIIXJPfPEz26vJgE0ekOgR.R7IkC46', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(37, 'admin1131221', NULL, '$2y$10$3sz5zrclw8igh1CXJKmfPuJVF.jIdcnA9TP1/0SzpgwVaF8acViCm', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(38, 'admin11313', NULL, '$2y$10$1C/fhVsYenT6Ee/PjI367eN7Spbr5gXwIjdi61QZMCEaM0wjpBpvG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(39, 'admin113131', NULL, '$2y$10$UPSBF9guHb/pkw.aHsTL0.xNDfg7iDt01bLbxe5BDmR.VROonGjnW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(40, 'admin1131311', NULL, '$2y$10$nsVr0Q52JW4MB15nK./Fbe3JARsreL7x0q.h9DB9TFimuFkvK9z5m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(41, 'admin1131312', NULL, '$2y$10$TSH.eOUSgoZ5XNb1XDUpkuFEO1VhQSOOu1Decgoid17DLfK9xqTEy', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(42, 'admin1131313', NULL, '$2y$10$7F3FBLWesl3FXviYB0sqle8QuaYBKJDIAH3aqXjgUtK59xzXQoKfC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(43, 'admin113132', NULL, '$2y$10$sBwHNQs.zQkeJi0Agt3CneraG8MMLbzWgLHuoBGWZXeAt.M2c1kMq', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(44, 'admin113133', NULL, '$2y$10$T0pi7w2ejw8QiGE/QtQDu.zVSyzaVeANC4ZbZDo8nOxR7qjLO/6f6', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(45, 'admin1132', NULL, '$2y$10$MrXUW.gAim/6p0gyHSNgn.OdiMTpLWEyXRaNfBi.lzxqfEKFWyzxe', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(46, 'admin11321', NULL, '$2y$10$23OBxmcFHgAgBaEYhdcS1.0aU6Oa73wmeDQ5IaadoqWCdEsvCUvAG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(47, 'admin113211', NULL, '$2y$10$zB3dee8REl/Vo3HiFVFfIOuKpGKy2WZIYRTS8aVGB1IK6l3yQLvbK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(48, 'admin1133', NULL, '$2y$10$pJy2COYDg5LilOBCboVR1uUXaoOdmwht/1evFo2StSIK73g7xnFzO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(49, 'admin11331', NULL, '$2y$10$q7uGuSfVgkXaU3Yo/1lfZ.SyYAfliRIzhKRBz3EzWGsgjie9vhTDa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(50, 'admin11332', NULL, '$2y$10$tO3ln12hQtRrIpwzsDmTDeRQKFZpApfZvaZeHF4cEHowzNdCQsIby', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(51, 'admin11333', NULL, '$2y$10$WihO0mTRM2XuxcAjJeyvBusqPPmNQ0Cs1GOEVOeW9Vethsg1GMUAG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(52, 'admin12', NULL, '$2y$10$zyav/z4pvKSewhNyZzSIV.tB/hUod2X7zmlo7hTbk2UfuyojGo2Ji', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(53, 'admin121', NULL, '$2y$10$lNWcIINTBtfAhJ.wgUNvHOL7mDixuCxvwMK4rgw9.doYu.VrfRrey', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(54, 'admin1211', NULL, '$2y$10$cILFflknSuzx/HeD9DlTL.V1.OoevA9habrDclsy8eztKvFxvYJZu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(55, 'admin12111', NULL, '$2y$10$EAZ4c/1CNADKHZq2Mjeb9uP2pjpRWEEL1GbXrhFvJCcuJ0T.SFOWK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(56, 'admin121111', NULL, '$2y$10$Ir2aUqKJuIKpCDUTr/RUq.NyggbeIY06l/mZPqmYUnkr3uidWGSeC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(57, 'admin1211111', NULL, '$2y$10$wdLDBENrS6tueJB.t5hH1uH7m/zlmIEdcX7IqaCg8trG41rvS3E2i', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(58, 'admin1211112', NULL, '$2y$10$.TsyyjSSr69YEsvlj5N1LeB66LPDY2TvUvEL93PF9v6cGGxJmc866', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(59, 'admin1211113', NULL, '$2y$10$rXNTZPS9iP3e7ur0sWLhwOC3etHXSJ8qfttFBSuLMLBr.EtwIVEWW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(60, 'admin121112', NULL, '$2y$10$dgV2apu.Z7EldJbrvrcJYuGjEeuK37NszNvC08jgU.0cj3mLjBX6m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(61, 'admin1211121', NULL, '$2y$10$onkaMb8JVOzZVF/JWT.YauNsqWkHqbl1bPrfHpc7Y1GTF/96xaiD.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(62, 'admin1211122', NULL, '$2y$10$NcHtMj3D64UsL8WriEZ.XuTcgNTx2RzvGNPG5MPRFAJ5gwMBrNhBi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(63, 'admin1211123', NULL, '$2y$10$NtD94AL.9lJ3UiCOaUZEvulD.stJvajWQIlHfJHiRAn5mFnX2gBJa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(64, 'admin12112', NULL, '$2y$10$wjWa0Z5/MSW0NxBWZQDzkeFkhbit3uY96uBQjMeLvE2997vhMQkey', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(65, 'admin121121', NULL, '$2y$10$Z20rDrS.IRtnBH75YYZ65u3MsEIHAcsge/p2UI.vzOF4AkUoCxRre', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `codesvalidation`
--
ALTER TABLE `codesvalidation`
  ADD PRIMARY KEY (`idCodesValidation`),
  ADD UNIQUE KEY `idCodesValidation_UNIQUE` (`idCodesValidation`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `filleuls`
--
ALTER TABLE `filleuls`
  ADD PRIMARY KEY (`idFilleuls`,`User_idUser`,`Parrain_idParrain`,`Parrain_User_idUser`),
  ADD UNIQUE KEY `idFilleuls_UNIQUE` (`idFilleuls`),
  ADD KEY `fk_Filleuls_User1_idx` (`User_idUser`),
  ADD KEY `fk_Filleuls_Parrain1_idx` (`Parrain_idParrain`,`Parrain_User_idUser`);

--
-- Index pour la table `parrain`
--
ALTER TABLE `parrain`
  ADD PRIMARY KEY (`idParrain`,`User_idUser`),
  ADD UNIQUE KEY `idParrain_UNIQUE` (`idParrain`),
  ADD KEY `fk_Parrain_User1_idx` (`User_idUser`);

--
-- Index pour la table `parrain_has_code`
--
ALTER TABLE `parrain_has_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idpere` (`id_pere`);

--
-- Index pour la table `parrain_has_filleuls`
--
ALTER TABLE `parrain_has_filleuls`
  ADD PRIMARY KEY (`Parrain_idParrain`,`Filleuls_idFilleuls`),
  ADD KEY `fk_Parrain_has_Filleuls_Filleuls1_idx` (`Filleuls_idFilleuls`),
  ADD KEY `fk_Parrain_has_Filleuls_Parrain1_idx` (`Parrain_idParrain`);

--
-- Index pour la table `parrain_has_step`
--
ALTER TABLE `parrain_has_step`
  ADD PRIMARY KEY (`Parrain_idParrain`,`Parrain_User_idUser`,`Step_idStep`),
  ADD KEY `fk_Parrain_has_Step_Step1_idx` (`Step_idStep`),
  ADD KEY `fk_Parrain_has_Step_Parrain1_idx` (`Parrain_idParrain`,`Parrain_User_idUser`);

--
-- Index pour la table `recuperation`
--
ALTER TABLE `recuperation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `step`
--
ALTER TABLE `step`
  ADD PRIMARY KEY (`idStep`),
  ADD UNIQUE KEY `idStep_UNIQUE` (`idStep`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `codesvalidation`
--
ALTER TABLE `codesvalidation`
  MODIFY `idCodesValidation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2255;

--
-- AUTO_INCREMENT pour la table `filleuls`
--
ALTER TABLE `filleuls`
  MODIFY `idFilleuls` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT pour la table `parrain`
--
ALTER TABLE `parrain`
  MODIFY `idParrain` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT pour la table `parrain_has_code`
--
ALTER TABLE `parrain_has_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT pour la table `recuperation`
--
ALTER TABLE `recuperation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `step`
--
ALTER TABLE `step`
  MODIFY `idStep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=542;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `filleuls`
--
ALTER TABLE `filleuls`
  ADD CONSTRAINT `fk_Filleuls_Parrain1` FOREIGN KEY (`Parrain_idParrain`,`Parrain_User_idUser`) REFERENCES `parrain` (`idParrain`, `User_idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Filleuls_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `parrain`
--
ALTER TABLE `parrain`
  ADD CONSTRAINT `fk_Parrain_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `parrain_has_code`
--
ALTER TABLE `parrain_has_code`
  ADD CONSTRAINT `fk_idpere` FOREIGN KEY (`id_pere`) REFERENCES `parrain` (`User_idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `parrain_has_filleuls`
--
ALTER TABLE `parrain_has_filleuls`
  ADD CONSTRAINT `fk_Parrain_has_Filleuls_Filleuls1` FOREIGN KEY (`Filleuls_idFilleuls`) REFERENCES `filleuls` (`idFilleuls`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Parrain_has_Filleuls_Parrain1` FOREIGN KEY (`Parrain_idParrain`) REFERENCES `parrain` (`idParrain`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `parrain_has_step`
--
ALTER TABLE `parrain_has_step`
  ADD CONSTRAINT `fk_Parrain_has_Step_Parrain1` FOREIGN KEY (`Parrain_idParrain`,`Parrain_User_idUser`) REFERENCES `parrain` (`idParrain`, `User_idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Parrain_has_Step_Step1` FOREIGN KEY (`Step_idStep`) REFERENCES `step` (`idStep`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
