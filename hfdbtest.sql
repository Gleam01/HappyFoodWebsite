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
(2, 3, 2, 2, 1, 1),
(3, 4, 2, 2, 1, 1),
(4, 5, 2, 2, 1, 1),
(323, 329, 109, 3, 2, NULL),
(324, 330, 110, 329, 3, NULL),
(325, 331, 111, 330, 4, NULL),
(326, 332, 112, 331, 5, NULL),
(327, 333, 113, 332, 6, NULL),
(328, 334, 114, 333, 7, NULL),
(329, 335, 114, 333, 7, NULL),
(330, 336, 114, 333, 7, NULL),
(331, 337, 113, 332, 6, NULL),
(332, 338, 113, 332, 6, NULL),
(333, 339, 111, 330, 4, NULL),
(334, 340, 111, 330, 4, NULL),
(335, 342, 115, 334, 8, NULL),
(336, 344, 110, 329, 3, NULL),
(337, 345, 112, 331, 5, NULL),
(338, 346, 112, 331, 5, NULL),
(339, 349, 116, 335, 8, NULL),
(340, 350, 110, 329, 3, NULL),
(341, 354, 116, 335, 8, NULL),
(342, 355, 117, 336, 8, NULL),
(343, 356, 117, 336, 8, NULL),
(344, 357, 117, 336, 8, NULL),
(345, 358, 116, 335, 8, NULL),
(346, 359, 118, 337, 7, NULL),
(347, 362, 118, 337, 7, NULL),
(348, 363, 118, 337, 7, NULL),
(349, 368, 115, 334, 8, NULL),
(350, 374, 119, 328, 1, NULL),
(351, 379, 115, 334, 8, NULL),
(352, 397, 120, 338, 7, NULL),
(353, 398, 120, 338, 7, NULL),
(354, 418, 120, 338, 7, NULL),
(355, 427, 121, 339, 5, NULL),
(356, 428, 121, 339, 5, NULL),
(357, 433, 119, 328, 1, NULL),
(358, 441, 122, 4, 2, NULL),
(359, 442, 123, 441, 3, NULL),
(360, 443, 123, 441, 3, NULL),
(361, 444, 124, 443, 4, NULL),
(362, 445, 125, 444, 5, NULL),
(363, 446, 126, 445, 6, NULL),
(364, 447, 127, 446, 7, NULL),
(365, 448, 127, 446, 7, NULL),
(366, 449, 127, 446, 7, NULL),
(367, 450, 125, 444, 5, NULL),
(368, 452, 128, 447, 8, NULL),
(369, 453, 128, 447, 8, NULL),
(370, 454, 128, 447, 8, NULL),
(371, 455, 125, 444, 5, NULL),
(372, 456, 124, 443, 4, NULL),
(373, 457, 126, 445, 6, NULL),
(374, 458, 124, 443, 4, NULL),
(375, 459, 123, 441, 3, NULL),
(376, 461, 126, 445, 6, NULL),
(377, 466, 129, 448, 8, NULL),
(378, 467, 129, 448, 8, NULL),
(379, 468, 129, 448, 8, NULL),
(380, 470, 130, 449, 8, NULL),
(381, 471, 130, 449, 8, NULL),
(382, 472, 130, 449, 8, NULL),
(383, 478, 131, 450, 6, NULL),
(384, 479, 131, 450, 6, NULL),
(385, 480, 131, 450, 6, NULL),
(386, 482, 132, 440, 1, NULL),
(387, 483, 133, 442, 4, NULL),
(388, 484, 133, 442, 4, NULL),
(389, 496, 133, 442, 4, NULL),
(390, 509, 132, 440, 1, NULL),
(391, 530, 134, 5, 2, NULL),
(392, 531, 135, 530, 3, NULL),
(393, 532, 136, 531, 4, NULL),
(394, 533, 136, 531, 4, NULL),
(395, 534, 137, 529, 1, NULL),
(396, 535, 137, 529, 1, NULL),
(397, 536, 138, 532, 5, NULL),
(398, 537, 139, 533, 5, NULL),
(399, 538, 140, 534, 2, NULL),
(400, 539, 139, 533, 5, NULL),
(401, 540, 141, 535, 2, NULL),
(402, 541, 139, 533, 5, NULL);

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
(109, 1, 0, 0, 3),
(110, 3, 0, 0, 329),
(111, 3, 0, 0, 330),
(112, 3, 0, 0, 331),
(113, 3, 0, 0, 332),
(114, 3, 0, 0, 333),
(115, 3, 0, 0, 334),
(116, 3, 0, 0, 335),
(117, 3, 0, 0, 336),
(118, 3, 0, 0, 337),
(119, 2, 0, 0, 328),
(120, 3, 0, 0, 338),
(121, 2, 0, 0, 339),
(122, 1, 0, 0, 4),
(123, 3, 0, 0, 441),
(124, 3, 0, 0, 443),
(125, 3, 0, 0, 444),
(126, 3, 0, 0, 445),
(127, 3, 0, 0, 446),
(128, 3, 0, 0, 447),
(129, 3, 0, 0, 448),
(130, 3, 0, 0, 449),
(131, 3, 0, 0, 450),
(132, 2, 0, 0, 440),
(133, 3, 0, 0, 442),
(134, 1, 0, 0, 5),
(135, 1, 0, 0, 530),
(136, 2, 0, 0, 531),
(137, 2, 0, 0, 529),
(138, 1, 0, 0, 532),
(139, 3, 0, 0, 533),
(140, 1, 0, 0, 534),
(141, 1, 0, 0, 535);

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
(324, 3, 'zertyuiopsdfghj'),
(325, 329, 'zertyuiopsdfghj'),
(326, 330, 'zertyuiopsdfghj'),
(327, 331, 'zertyuiopsdfghj'),
(328, 332, 'zertyuiopsdfghj'),
(329, 333, 'zertyuiopsdfghj'),
(330, 333, 'zertyuiopsdfghj'),
(331, 333, 'zertyuiopsdfghj'),
(332, 332, 'zertyuiopsdfghj'),
(333, 332, 'zertyuiopsdfghj'),
(334, 330, 'zertyuiopsdfghj'),
(335, 330, 'zertyuiopsdfghj'),
(336, 333, 'zertyuiopsdfghj'),
(337, 334, 'zertyuiopsdfghj'),
(338, 333, 'zertyuiopsdfghj'),
(339, 329, 'zertyuiopsdfghj'),
(340, 331, 'zertyuiopsdfghj'),
(341, 331, 'zertyuiopsdfghj'),
(342, 333, 'zertyuiopsdfghj'),
(343, 333, 'zertyuiopsdfghj'),
(344, 335, 'zertyuiopsdfghj'),
(345, 329, 'zertyuiopsdfghj'),
(346, 332, 'zertyuiopsdfghj'),
(347, 333, 'zertyuiopsdfghj'),
(348, 333, 'zertyuiopsdfghj'),
(349, 335, 'zertyuiopsdfghj'),
(350, 336, 'zertyuiopsdfghj'),
(351, 336, 'zertyuiopsdfghj'),
(352, 336, 'zertyuiopsdfghj'),
(353, 335, 'zertyuiopsdfghj'),
(354, 337, 'zertyuiopsdfghj'),
(355, 333, 'zertyuiopsdfghj'),
(356, 336, 'zertyuiopsdfghj'),
(357, 337, 'zertyuiopsdfghj'),
(358, 337, 'zertyuiopsdfghj'),
(359, 337, 'zertyuiopsdfghj'),
(360, 336, 'zertyuiopsdfghj'),
(361, 336, 'zertyuiopsdfghj'),
(362, 332, 'zertyuiopsdfghj'),
(363, 334, 'zertyuiopsdfghj'),
(364, 335, 'zertyuiopsdfghj'),
(365, 332, 'zertyuiopsdfghj'),
(366, 335, 'zertyuiopsdfghj'),
(367, 335, 'zertyuiopsdfghj'),
(368, 335, 'zertyuiopsdfghj'),
(369, 328, 'zertyuiopsdfghj'),
(370, 330, 'zertyuiopsdfghj'),
(371, 331, 'zertyuiopsdfghj'),
(372, 332, 'zertyuiopsdfghj'),
(373, 333, 'zertyuiopsdfghj'),
(374, 334, 'zertyuiopsdfghj'),
(375, 334, 'zertyuiopsdfghj'),
(376, 334, 'zertyuiopsdfghj'),
(377, 333, 'zertyuiopsdfghj'),
(378, 335, 'zertyuiopsdfghj'),
(379, 335, 'zertyuiopsdfghj'),
(380, 335, 'zertyuiopsdfghj'),
(381, 332, 'zertyuiopsdfghj'),
(382, 334, 'zertyuiopsdfghj'),
(383, 335, 'zertyuiopsdfghj'),
(384, 334, 'zertyuiopsdfghj'),
(385, 332, 'zertyuiopsdfghj'),
(386, 335, 'zertyuiopsdfghj'),
(387, 336, 'zertyuiopsdfghj'),
(388, 336, 'zertyuiopsdfghj'),
(389, 336, 'zertyuiopsdfghj'),
(390, 335, 'zertyuiopsdfghj'),
(391, 335, 'zertyuiopsdfghj'),
(392, 338, 'zertyuiopsdfghj'),
(393, 338, 'zertyuiopsdfghj'),
(394, 331, 'zertyuiopsdfghj'),
(395, 333, 'zertyuiopsdfghj'),
(396, 334, 'zertyuiopsdfghj'),
(397, 334, 'zertyuiopsdfghj'),
(398, 336, 'zertyuiopsdfghj'),
(399, 336, 'zertyuiopsdfghj'),
(400, 336, 'zertyuiopsdfghj'),
(401, 334, 'zertyuiopsdfghj'),
(402, 337, 'zertyuiopsdfghj'),
(403, 337, 'zertyuiopsdfghj'),
(404, 337, 'zertyuiopsdfghj'),
(405, 331, 'zertyuiopsdfghj'),
(406, 334, 'zertyuiopsdfghj'),
(407, 335, 'zertyuiopsdfghj'),
(408, 336, 'zertyuiopsdfghj'),
(409, 336, 'zertyuiopsdfghj'),
(410, 335, 'zertyuiopsdfghj'),
(411, 337, 'zertyuiopsdfghj'),
(412, 335, 'zertyuiopsdfghj'),
(413, 338, 'zertyuiopsdfghj'),
(414, 334, 'zertyuiopsdfghj'),
(415, 336, 'zertyuiopsdfghj'),
(416, 337, 'zertyuiopsdfghj'),
(417, 336, 'zertyuiopsdfghj'),
(418, 338, 'zertyuiopsdfghj'),
(419, 338, 'zertyuiopsdfghj'),
(420, 338, 'zertyuiopsdfghj'),
(421, 336, 'zertyuiopsdfghj'),
(422, 339, 'zertyuiopsdfghj'),
(423, 339, 'zertyuiopsdfghj'),
(424, 330, 'zertyuiopsdfghj'),
(425, 330, 'zertyuiopsdfghj'),
(426, 333, 'zertyuiopsdfghj'),
(427, 334, 'zertyuiopsdfghj'),
(428, 328, 'zertyuiopsdfghj'),
(429, 331, 'zertyuiopsdfghj'),
(430, 331, 'zertyuiopsdfghj'),
(431, 331, 'zertyuiopsdfghj'),
(432, 334, 'zertyuiopsdfghj'),
(433, 335, 'zertyuiopsdfghj'),
(434, 335, 'zertyuiopsdfghj'),
(435, 335, 'zertyuiopsdfghj'),
(436, 4, 'zertyuiopsdfghj'),
(437, 441, 'zertyuiopsdfghj'),
(438, 441, 'zertyuiopsdfghj'),
(439, 443, 'zertyuiopsdfghj'),
(440, 444, 'zertyuiopsdfghj'),
(441, 445, 'zertyuiopsdfghj'),
(442, 446, 'zertyuiopsdfghj'),
(443, 446, 'zertyuiopsdfghj'),
(444, 446, 'zertyuiopsdfghj'),
(445, 444, 'zertyuiopsdfghj'),
(446, 446, 'zertyuiopsdfghj'),
(447, 447, 'zertyuiopsdfghj'),
(448, 447, 'zertyuiopsdfghj'),
(449, 447, 'zertyuiopsdfghj'),
(450, 444, 'zertyuiopsdfghj'),
(451, 443, 'zertyuiopsdfghj'),
(452, 445, 'zertyuiopsdfghj'),
(453, 443, 'zertyuiopsdfghj'),
(454, 441, 'zertyuiopsdfghj'),
(455, 444, 'zertyuiopsdfghj'),
(456, 445, 'zertyuiopsdfghj'),
(457, 446, 'zertyuiopsdfghj'),
(458, 447, 'zertyuiopsdfghj'),
(459, 447, 'zertyuiopsdfghj'),
(460, 446, 'zertyuiopsdfghj'),
(461, 448, 'zertyuiopsdfghj'),
(462, 448, 'zertyuiopsdfghj'),
(463, 448, 'zertyuiopsdfghj'),
(464, 446, 'zertyuiopsdfghj'),
(465, 449, 'zertyuiopsdfghj'),
(466, 449, 'zertyuiopsdfghj'),
(467, 449, 'zertyuiopsdfghj'),
(468, 445, 'zertyuiopsdfghj'),
(469, 447, 'zertyuiopsdfghj'),
(470, 448, 'zertyuiopsdfghj'),
(471, 447, 'zertyuiopsdfghj'),
(472, 447, 'zertyuiopsdfghj'),
(473, 450, 'zertyuiopsdfghj'),
(474, 450, 'zertyuiopsdfghj'),
(475, 450, 'zertyuiopsdfghj'),
(476, 445, 'zertyuiopsdfghj'),
(477, 440, 'zertyuiopsdfghj'),
(478, 442, 'zertyuiopsdfghj'),
(479, 442, 'zertyuiopsdfghj'),
(480, 444, 'zertyuiopsdfghj'),
(481, 445, 'zertyuiopsdfghj'),
(482, 445, 'zertyuiopsdfghj'),
(483, 445, 'zertyuiopsdfghj'),
(484, 448, 'zertyuiopsdfghj'),
(485, 449, 'zertyuiopsdfghj'),
(486, 449, 'zertyuiopsdfghj'),
(487, 449, 'zertyuiopsdfghj'),
(488, 448, 'zertyuiopsdfghj'),
(489, 450, 'zertyuiopsdfghj'),
(490, 448, 'zertyuiopsdfghj'),
(491, 442, 'zertyuiopsdfghj'),
(492, 445, 'zertyuiopsdfghj'),
(493, 446, 'zertyuiopsdfghj'),
(494, 447, 'zertyuiopsdfghj'),
(495, 447, 'zertyuiopsdfghj'),
(496, 449, 'zertyuiopsdfghj'),
(497, 449, 'zertyuiopsdfghj'),
(498, 447, 'zertyuiopsdfghj'),
(499, 446, 'zertyuiopsdfghj'),
(500, 448, 'zertyuiopsdfghj'),
(501, 449, 'zertyuiopsdfghj'),
(502, 448, 'zertyuiopsdfghj'),
(503, 446, 'zertyuiopsdfghj'),
(504, 440, 'zertyuiopsdfghj'),
(505, 443, 'zertyuiopsdfghj'),
(506, 444, 'zertyuiopsdfghj'),
(507, 445, 'zertyuiopsdfghj'),
(508, 445, 'zertyuiopsdfghj'),
(509, 447, 'zertyuiopsdfghj'),
(510, 445, 'zertyuiopsdfghj'),
(511, 448, 'zertyuiopsdfghj'),
(512, 448, 'zertyuiopsdfghj'),
(513, 450, 'zertyuiopsdfghj'),
(514, 450, 'zertyuiopsdfghj'),
(515, 450, 'zertyuiopsdfghj'),
(516, 444, 'zertyuiopsdfghj'),
(517, 444, 'zertyuiopsdfghj'),
(518, 447, 'zertyuiopsdfghj'),
(519, 448, 'zertyuiopsdfghj'),
(520, 449, 'zertyuiopsdfghj'),
(521, 449, 'zertyuiopsdfghj'),
(522, 448, 'zertyuiopsdfghj'),
(523, 448, 'zertyuiopsdfghj'),
(524, 447, 'zertyuiopsdfghj'),
(525, 5, 'zertyuiopsdfghj'),
(526, 530, 'zertyuiopsdfghj'),
(527, 531, 'zertyuiopsdfghj'),
(528, 531, 'zertyuiopsdfghj'),
(529, 529, 'zertyuiopsdfghj'),
(530, 529, 'zertyuiopsdfghj'),
(531, 532, 'zertyuiopsdfghj'),
(532, 533, 'zertyuiopsdfghj'),
(533, 534, 'zertyuiopsdfghj'),
(534, 533, 'zertyuiopsdfghj'),
(535, 535, 'zertyuiopsdfghj'),
(536, 533, 'zertyuiopsdfghj');

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
(1, 1, 1, 0, 0, NULL),
(2, 2, 1, 0, 0, NULL),
(109, 3, 1, 0, 0, NULL),
(110, 329, 1, 0, 0, NULL),
(111, 330, 1, 0, 0, NULL),
(112, 331, 1, 0, 0, NULL),
(113, 332, 1, 0, 0, NULL),
(114, 333, 1, 0, 0, NULL),
(115, 334, 1, 0, 0, NULL),
(116, 335, 1, 0, 0, NULL),
(117, 336, 1, 0, 0, NULL),
(118, 337, 1, 0, 0, NULL),
(119, 328, 1, 0, 0, NULL),
(120, 338, 1, 0, 0, NULL),
(121, 339, 1, 0, 0, NULL),
(122, 4, 1, 0, 0, NULL),
(123, 441, 1, 0, 0, NULL),
(124, 443, 1, 0, 0, NULL),
(125, 444, 1, 0, 0, NULL),
(126, 445, 1, 0, 0, NULL),
(127, 446, 1, 0, 0, NULL),
(128, 447, 1, 0, 0, NULL),
(129, 448, 1, 0, 0, NULL),
(130, 449, 1, 0, 0, NULL),
(131, 450, 1, 0, 0, NULL),
(132, 440, 1, 0, 0, NULL),
(133, 442, 1, 0, 0, NULL),
(134, 5, 1, 0, 0, NULL),
(135, 530, 1, 0, 0, NULL),
(136, 531, 1, 0, 0, NULL),
(137, 529, 1, 0, 0, NULL),
(138, 532, 1, 0, 0, NULL),
(139, 533, 1, 0, 0, NULL),
(140, 534, 1, 0, 0, NULL),
(141, 535, 1, 0, 0, NULL);

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
(3, 'admin1', '', '$2y$10$0c/9Xc4rmAQ9h//nEyFBt.COTan6mTXOsk5xe4J.8B6.kE5/D1zra', 'John1', 'John1', '66159865', 'M', '1990-08-30', NULL, 'calavi', 'Benin', 'Commerçant ', 0, 0),
(4, 'admin2', '', '$2y$10$M0YGAr3N7XNO86x9sYZxaOKqjbZk2yzZEXwluSrBtjI9USrz41PzC', 'John2', 'John2', '54879685', 'M', '0000-00-00', NULL, 'calavi', 'Benin', 'soudeur', 0, 0),
(5, 'admin3', '', '$2y$10$3IAcd/YF0gXXXY5sG9eW2e.J6tp3epVE7T9ZdgWXJhvvQQaGLrfRq', 'John3', 'John3', '54879685', 'F', '0000-00-00', NULL, 'calavi', 'Benin', 'soudeur', 0, 0),
(328, 'test', 'test', 'test', 'test', 'test', '787878', 'm', NULL, NULL, NULL, NULL, NULL, 0, 1),
(329, 'admin11', NULL, '$2y$10$PK2JRn/HIc8FuoOV.i4ILuCJzkTXZIxr2Z2ZkXm8.5vSrIGrloFVW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(330, 'admin111', NULL, '$2y$10$iMOGs2PTjusbzb.k3d2TDuEFvfXMOfSnotZmWcatmdEfE1pt1N61a', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(331, 'admin1111', NULL, '$2y$10$dRajH2/o7qc6pzhelssKh.jXc0yTj10QLaKxbpR7ZCXRv4UOlrEhS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(332, 'admin11111', NULL, '$2y$10$aTBq0zcbgcDvningjQv03ORalimK70qQaAolQgzxYQcRUzD2wRoV2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(333, 'admin111111', NULL, '$2y$10$z9ytAqzRRoaJszd6bFiXZ.e8wnhHHA9H1eZWF3ltNzt94R82iuxvO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(334, 'admin1111111', NULL, '$2y$10$gsVmQXmhAaFe/82NK2UjzOPayyz1CA8nZhpwkCzBHvUh749.C5H0m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(335, 'admin1111112', NULL, '$2y$10$.zPYO5f.ar5BGczrkX5.K.S5cn7PXeCnuRWlGGScI63t5KbwQAYQ6', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(336, 'admin1111113', NULL, '$2y$10$Wu7UvlSrIXZZG/Us7F8q5O4LBMZe2OebXfGX09V43wenEHgAlzaSi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(337, 'admin111112', NULL, '$2y$10$ef5UOxj7wc7Y/gTBIeG91.MS3yfZOpFPmzu4ysHbWZMDVfTijbnvi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(338, 'admin111113', NULL, '$2y$10$nsBz7cA7X/sHoWlwle646O8uFcgXhWBB7OCxKZNPX2biqrWqqIkZC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(339, 'admin1112', NULL, '$2y$10$IuC9ebOF23O5HQBeMk14ouMPkI2kzG1tRlGFYE4TgOsqYBo.rRFsO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(340, 'admin1113', NULL, '$2y$10$ksYOjrFWE6E0EmhNH2A5b.ZdBibTvCoqkNlHqM3llCOB4OnnnDTnO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(341, 'admin11131', NULL, '$2y$10$s.JPYYKLDHKMKasLyax6WuFa5quj4vSm0gHEGO97b.J5y7JtYjQ7W', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(342, 'admin111311', NULL, '$2y$10$8hA3CNGSk0/I5R/4lRSpie6b1lYD1K94/zVJ9LdPfz5Bb5Q7WtX5y', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(343, 'admin11132', NULL, '$2y$10$9ZJ4nj6tNLtZ3r8t6kwQfOABLBYOqmx8AcXpUdEEA5ZDUsX87n2gO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(344, 'admin112', NULL, '$2y$10$3MnEbeQuxN3uPMLm3JU8UuZawe.TfmsUYrkxfzmpEh.N6Cz5/1Iiu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(345, 'admin1121', NULL, '$2y$10$5wrYci0Q6B86pD7pxte59eQhem.7wkPLa23vfFEdqXtMNyG0YezfG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(346, 'admin1122', NULL, '$2y$10$q1lsqTV60yYj3tkAgiIGdu20TFIHxTx9BFajIDbZK.MgguX0DimLu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(347, 'admin11221', NULL, '$2y$10$jW1quWMrjZCIZkKLSo3CEuRk1SlNqyW3MIncqQmNE9DGlJaePO50u', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(348, 'admin11222', NULL, '$2y$10$oDFZEFlAN3VOmIeZA/6GX.TatVsWddr5GEfDzlyjaEWFyZSyMeOJG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(349, 'admin112221', NULL, '$2y$10$kqPZ9TqBXefIqNReec6TVOvpKJh4ufUxLBfxImerQ7SKKoZNwMuGa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(350, 'admin113', NULL, '$2y$10$mhEkaLWYUboc4.0iHfR/4eAAkqLA6gXmFrpaUQXi99aI4Sh9XYqD2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(351, 'admin1131', NULL, '$2y$10$Cf0meNdZUztR79X8K9C6xOlFYWbFWcXTOrr19oM3IDyzWsOaL6FNC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(352, 'admin11311', NULL, '$2y$10$Q4q9eFvt1NBrXOoRx2FIK.zk3Mly.Lp.9e3nmxnt6YFreIwSjlM.2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(353, 'admin11312', NULL, '$2y$10$2QiDTRsObmcRozUgrBt3Nu/VqCdpZ1tjxedVTXmMQ4zzMFSQKPZ6q', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(354, 'admin113121', NULL, '$2y$10$gpNFzKZLX.DpCkzJBgGrjez3LNPrbLVdv2CUEJqaQbQe8.R9RDzdS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(355, 'admin1131211', NULL, '$2y$10$jHFbe6xUSGE0tOTZ5Uu8PeR1KL4YAD.CbQclpIhfupoGdNzzYmaUC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(356, 'admin1131212', NULL, '$2y$10$CesjP4CVFZwyifbOVt3qr.cOU58TOdt3mqnmRmqIFLXa78ITwrHJO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(357, 'admin1131213', NULL, '$2y$10$Nzg681Oz2i5nogrzxoWPpuZamZSD7UhDUNIDwVRSP3G5N9RjJa/mu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(358, 'admin113122', NULL, '$2y$10$OF6FjQTQkl0td3UBm.8kkuUuIIXJPfPEz26vJgE0ekOgR.R7IkC46', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(359, 'admin1131221', NULL, '$2y$10$3sz5zrclw8igh1CXJKmfPuJVF.jIdcnA9TP1/0SzpgwVaF8acViCm', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(360, 'admin11313', NULL, '$2y$10$1C/fhVsYenT6Ee/PjI367eN7Spbr5gXwIjdi61QZMCEaM0wjpBpvG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(361, 'admin113131', NULL, '$2y$10$UPSBF9guHb/pkw.aHsTL0.xNDfg7iDt01bLbxe5BDmR.VROonGjnW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(362, 'admin1131311', NULL, '$2y$10$nsVr0Q52JW4MB15nK./Fbe3JARsreL7x0q.h9DB9TFimuFkvK9z5m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(363, 'admin1131312', NULL, '$2y$10$TSH.eOUSgoZ5XNb1XDUpkuFEO1VhQSOOu1Decgoid17DLfK9xqTEy', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(364, 'admin1131313', NULL, '$2y$10$7F3FBLWesl3FXviYB0sqle8QuaYBKJDIAH3aqXjgUtK59xzXQoKfC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(365, 'admin113132', NULL, '$2y$10$sBwHNQs.zQkeJi0Agt3CneraG8MMLbzWgLHuoBGWZXeAt.M2c1kMq', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(366, 'admin113133', NULL, '$2y$10$T0pi7w2ejw8QiGE/QtQDu.zVSyzaVeANC4ZbZDo8nOxR7qjLO/6f6', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(367, 'admin1132', NULL, '$2y$10$MrXUW.gAim/6p0gyHSNgn.OdiMTpLWEyXRaNfBi.lzxqfEKFWyzxe', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(368, 'admin11321', NULL, '$2y$10$23OBxmcFHgAgBaEYhdcS1.0aU6Oa73wmeDQ5IaadoqWCdEsvCUvAG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(369, 'admin113211', NULL, '$2y$10$zB3dee8REl/Vo3HiFVFfIOuKpGKy2WZIYRTS8aVGB1IK6l3yQLvbK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(370, 'admin1133', NULL, '$2y$10$pJy2COYDg5LilOBCboVR1uUXaoOdmwht/1evFo2StSIK73g7xnFzO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(371, 'admin11331', NULL, '$2y$10$q7uGuSfVgkXaU3Yo/1lfZ.SyYAfliRIzhKRBz3EzWGsgjie9vhTDa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(372, 'admin11332', NULL, '$2y$10$tO3ln12hQtRrIpwzsDmTDeRQKFZpApfZvaZeHF4cEHowzNdCQsIby', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(373, 'admin11333', NULL, '$2y$10$WihO0mTRM2XuxcAjJeyvBusqPPmNQ0Cs1GOEVOeW9Vethsg1GMUAG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(374, 'admin12', NULL, '$2y$10$zyav/z4pvKSewhNyZzSIV.tB/hUod2X7zmlo7hTbk2UfuyojGo2Ji', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(375, 'admin121', NULL, '$2y$10$lNWcIINTBtfAhJ.wgUNvHOL7mDixuCxvwMK4rgw9.doYu.VrfRrey', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(376, 'admin1211', NULL, '$2y$10$cILFflknSuzx/HeD9DlTL.V1.OoevA9habrDclsy8eztKvFxvYJZu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(377, 'admin12111', NULL, '$2y$10$EAZ4c/1CNADKHZq2Mjeb9uP2pjpRWEEL1GbXrhFvJCcuJ0T.SFOWK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(378, 'admin121111', NULL, '$2y$10$Ir2aUqKJuIKpCDUTr/RUq.NyggbeIY06l/mZPqmYUnkr3uidWGSeC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(379, 'admin1211111', NULL, '$2y$10$wdLDBENrS6tueJB.t5hH1uH7m/zlmIEdcX7IqaCg8trG41rvS3E2i', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(380, 'admin1211112', NULL, '$2y$10$.TsyyjSSr69YEsvlj5N1LeB66LPDY2TvUvEL93PF9v6cGGxJmc866', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(381, 'admin1211113', NULL, '$2y$10$rXNTZPS9iP3e7ur0sWLhwOC3etHXSJ8qfttFBSuLMLBr.EtwIVEWW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(382, 'admin121112', NULL, '$2y$10$dgV2apu.Z7EldJbrvrcJYuGjEeuK37NszNvC08jgU.0cj3mLjBX6m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(383, 'admin1211121', NULL, '$2y$10$onkaMb8JVOzZVF/JWT.YauNsqWkHqbl1bPrfHpc7Y1GTF/96xaiD.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(384, 'admin1211122', NULL, '$2y$10$NcHtMj3D64UsL8WriEZ.XuTcgNTx2RzvGNPG5MPRFAJ5gwMBrNhBi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(385, 'admin1211123', NULL, '$2y$10$NtD94AL.9lJ3UiCOaUZEvulD.stJvajWQIlHfJHiRAn5mFnX2gBJa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(386, 'admin12112', NULL, '$2y$10$wjWa0Z5/MSW0NxBWZQDzkeFkhbit3uY96uBQjMeLvE2997vhMQkey', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(387, 'admin121121', NULL, '$2y$10$Z20rDrS.IRtnBH75YYZ65u3MsEIHAcsge/p2UI.vzOF4AkUoCxRre', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(388, 'admin1211211', NULL, '$2y$10$JNtlQd1XU/aXZiejcZS2c.M.MUZp1EphxX/HodGdGglPBj3tarCwG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(389, 'admin121122', NULL, '$2y$10$zeMs2TWHbnztQEHao7othOPu5GoIPSLjoxtee8E9M33z3M3q2/Rby', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(390, 'admin12113', NULL, '$2y$10$Zx/FTqWtNCJhmTu6BLPKautGWhj6bYzFLETr.2MWWQwVOC91.dZCG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(391, 'admin121131', NULL, '$2y$10$d82.BsoCCcC5sk8t/MvkceJ12DS1p1NEnDLJZ08F2UyEpqnGjyVD2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(392, 'admin1211311', NULL, '$2y$10$krfEsR.8A8qH72vNGsbLD.h0RjTb3Fxv3t8ln.hGEtLBf.tw9Anq2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(393, 'admin1211312', NULL, '$2y$10$Wh.Eyv5RsZGzgX3aslq/NudFjOwAg5qA44ICp8T0Nm8SXqUKuRd3.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(394, 'admin1211313', NULL, '$2y$10$vvNwiuv4QIHWw6qi1YpdL.V6LdF56xraJlpesyyvVU4iApWTfin0e', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(395, 'admin121132', NULL, '$2y$10$NeL3JCTDYrdfJf5Gkrb3wuW7.o7RvJAcnb57p/bfORE35LAL.NYdW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(396, 'admin121133', NULL, '$2y$10$/IZ33MwRF81LzUQyn9pXgOPtOGR6H7.LAzfd9mkLzhTl25wyqhEGC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(397, 'admin1211331', NULL, '$2y$10$OGHvftlyk4pDvB664kFPieM9L4aOpVuihrDaBHklB0FM3RycMUT1O', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(398, 'admin1211332', NULL, '$2y$10$A/CyyX9QCVy7BUyNUfEw7ODmODKSfIzlJG/Qgp7G0KAlKBefu3Zqi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(399, 'admin1212', NULL, '$2y$10$ke2toR0b00S0QcJU3CRkRuTjVXCedtWYOyy1lmk8YJULWgl3PaJpS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(400, 'admin12121', NULL, '$2y$10$bjQAvYLfQVQyip7m2gjuuOQm7VLq8V2DNPhnGlBsKRJBesqjI.xrm', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(401, 'admin121211', NULL, '$2y$10$LFOUKCmYvidSa824Wxs8peEn95OSvWxglgJ8LBL4x8UeNBtNFzZ/W', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(402, 'admin121212', NULL, '$2y$10$kfNjIgYDDHUpYlMDjaTUXOteSaVDypoJYaIUe73nqNSsEDmp01GLW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(403, 'admin1212121', NULL, '$2y$10$7Mh9E8.iGMn/9A8Vp8BYtuGBRXqxz1qbiJOYTmSL6ECG/R/5e9gPy', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(404, 'admin1212122', NULL, '$2y$10$P62.ZmX3IlP2YhGcmCgJ7.qhki4Z7PM8ghN/z/l9cHcVoP1BxyyYK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(405, 'admin1212123', NULL, '$2y$10$zx677U/yuyZ9bqv9MVwxnuRcZqp/4pM0HR7awNq1tRl6SpvF4CESK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(406, 'admin121213', NULL, '$2y$10$8iEGUpspf/cpgCuleHoLauxYOQkXRWOYUW75xmeeBi8OfQ4eMpNSG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(407, 'admin1212131', NULL, '$2y$10$5dkGGyUjW17Nbyoh8.liy.gIsj05IdYgt/o2SGHFs9vkVkdJYC8zC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(408, 'admin1212132', NULL, '$2y$10$F3api1OGrQpXROdbeZ22VeNqEYQue9CcudgWbKwjoCq/JjtKZLCEq', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(409, 'admin1212133', NULL, '$2y$10$yM1IoxWnUzWONevPXpssEej4ENF/hFjmFi1I3tSuJTkPmNHmPVTiu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(410, 'admin1213', NULL, '$2y$10$VgxunGzVysDYHPNtMyJxK.hBPnqpPuMXuxuNAHzyKRoa9ChdpdQGm', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(411, 'admin12131', NULL, '$2y$10$JvMxYK.hx/ZmeObrwEScv.qPHxRCivkqpIdbL5rrhqp.OH813wpOS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(412, 'admin121311', NULL, '$2y$10$aSuMO91cNxNv7yeD9UAvC.XtqpPncv0oTxZdGrBy9akDkNHCOOski', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(413, 'admin1213111', NULL, '$2y$10$uR28LUjnAmrO32KON/Gk8OUvQ5uG/5wnetm82A693JH32gjJqymO.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(414, 'admin1213112', NULL, '$2y$10$Dh4WmWcwoAFyBXqM5lT1v.BMunj5JSvHC6dpjpWb3ErQi8fTh6WJS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(415, 'admin121312', NULL, '$2y$10$WoPxIIy7aSmfLOZarNxECux/oKWgedtPdUoBso.f28PYGYZ5nKH7e', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(416, 'admin1213121', NULL, '$2y$10$/oo4Z/hldLPD3P6MJ5cafuERIUvrvRBDL4y3yXHMS2H0CKUVD42yK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(417, 'admin121313', NULL, '$2y$10$1mZ4mIit08i9vzCxs.RV5uBji5y8lVdD1fgxSUw6CB1PxbTOXSu1O', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(418, 'admin1213131', NULL, '$2y$10$eAmDzQOfdL3ipDG//SJgROluKuGzi9JMDA.kYYsCvZjjJYetY0HbO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(419, 'admin12132', NULL, '$2y$10$FI77j7.LfbpJl/dehs.zUu7bWIQ6apn1qczK41YMaf4/8Qafj2VTW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(420, 'admin121321', NULL, '$2y$10$HZEFe1pDl4evgjkXG3CX8uwbByEAJXJLtxZJPm7Qn09pgwfxUiZMG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(421, 'admin1213211', NULL, '$2y$10$Pg86lNYZic6KrmwXPxN3suAC/2dwyBUOiEtsXGqu6ijQtm3E42t5y', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(422, 'admin121322', NULL, '$2y$10$VPnQxvIrcYlQFlql048QieRkPcNECld.L5n0TwdGtxn2eD5Re8UKi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(423, 'admin1213221', NULL, '$2y$10$sWOSJwSPyyBLGEWRjU4TcOLxIY3L57V.BVJ4LG88Pxuo7CIyJy9qW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(424, 'admin1213222', NULL, '$2y$10$WCHrDbrHFxLSlTBQn8Xe9eTBf/PdYvZRM4ZRdrN8C/wCpWEMW7MVa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(425, 'admin1213223', NULL, '$2y$10$xuTrPUsG8wQm8I5NgbZ8we9clyvL9BNbpzYPF7In352s81olBcu/e', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(426, 'admin121323', NULL, '$2y$10$vFQX63w2hx5B8OeQ.BfkSeRUCgc81zUPrRvs6PGS7s/9jC3VH0zky', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(427, 'admin1213231', NULL, '$2y$10$Q8JSVjyL63r3CWyEdqlvheiiZ/ry4v7bDTbfydEPj10dm1EvYC.ly', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(428, 'admin1213232', NULL, '$2y$10$QfUn7ln6m5AZQLTw5oNbAesEtzAbcLQ/5IEHJ6/RKW2PeqX67jtJ2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(429, 'admin122', NULL, '$2y$10$WKWHr5XmzPU5SZjJpPFc1eyM3pw7MBZcFQVJjOHw7LtmS32MN9sMq', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(430, 'admin123', NULL, '$2y$10$QsUrS4i7HmoEJxmm3yP0qePNzOpMJ2C.VZ7tP7G/el3A5xr.wbeUa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(431, 'admin1231', NULL, '$2y$10$UXrXqXnBd4lCRzi2c.k7J.9cvGRZcsQ0MGDWqMK4Kp0TOl32fykjq', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(432, 'admin12311', NULL, '$2y$10$nv75NSYMjYXL8/Hb5MpFjeBDWgf7TV5mkdoFBTsSqS/KFSnNnq6NK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(433, 'admin13', NULL, '$2y$10$hyg6zoBaDVhLW/hXR5cU/OdTA454o6tC...Gas34N6QGYqDei7bBC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(434, 'admin131', NULL, '$2y$10$vl7i/JuG2iRwKDijz4463eyK0SllqV8v9YBfg2byqW1xqBkGlL4sO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(435, 'admin132', NULL, '$2y$10$ieLxisfyFtu.xQtqeaRI7eVibHNunpvQQJhNsyBN6FOmRPHmiXKSu', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(436, 'admin133', NULL, '$2y$10$ZuwzFyEsR17ATX/lRjbI2O7aPtAXK0q0fNLbrAR86mDVn6ogu4CMi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(437, 'admin1331', NULL, '$2y$10$xkY6EWN0XY/t/2WmPqx82umwcscGauZqujx3eqrQoSN3QgaTyWMRi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(438, 'admin13311', NULL, '$2y$10$c5GEjH761sFwlsxCNcGPVegaaj5FKyBTvGxWtm447.hKLDLR.Hvfa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(439, 'admin13312', NULL, '$2y$10$kGWwzFKadaggpi8wzAs8S.gGYyr.3IwWRiS6celE85M4USXJNwe4.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(440, 'admin13313', NULL, '$2y$10$JSfgIO0ACKlf5sPy.Ap5weWor5DFHOZOkIiuSyQVGFFLCcpZVeyIK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(441, 'admin21', NULL, '$2y$10$GtGaHaRXQXa/adSW5LotSu4yYJSaA4Q4TK2lh1SNEMQKNtU.TYeJW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(442, 'admin211', NULL, '$2y$10$5FC3zMuxAu2bcTM2NxF9MOubET8SQoFu/pzXcW9l74UkOkjSp7Zdy', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(443, 'admin212', NULL, '$2y$10$O.w.QoDbAoPZecfOZ8tiduEUlxbIW8WOBXu9s49ucaHe5UbSpgF8m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(444, 'admin2121', NULL, '$2y$10$g.L6rTBZQkr2KRrAhLouM.kHNtK4LO2UiWwGuEHwA2UZVxpAOXyOC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(445, 'admin21211', NULL, '$2y$10$Gtzx4mpW2wQzjGjrksQSI.SfWUVnu/b2oY1U5XQ/Fjq3z9fcpZ59e', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(446, 'admin212111', NULL, '$2y$10$Uuob6rZuvSfd7XkyCp3HGuMLS6BgcBiit.gpoGeIc0ywTRpp.nrsG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(447, 'admin2121111', NULL, '$2y$10$5XjDZd3qihrZ.6rPADwIBOEGXQ/tTj53CYL7HLUknrstQrYNYpBpG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(448, 'admin2121112', NULL, '$2y$10$bjxrv4LCLBc10wPsMKxCJuCoNJ23g7l9/t5m9vUEAW6HPtd7IRTn2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(449, 'admin2121113', NULL, '$2y$10$TYqJIrZMvIv1Xi.MOf.pt.BIvzs6Vexl0OmPvXNfjNJmdom.hEcg.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(450, 'admin21212', NULL, '$2y$10$q1.yyTSC7ssFI9aqNWL4AO9EQqUefqcld8httM9ak2k.wjAxOs.BO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(451, 'admin212121', NULL, '$2y$10$ioPVuwp.ja6hfEJMJUvK4.0Wvc0J3ukX.GyYAiDhrldayG6qecMxa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(452, 'admin2121211', NULL, '$2y$10$TR1F4CxYJ/En52DxeIcf6.WvH4xAEFyes6hD6C0pVZVFzy7AVISbW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(453, 'admin2121212', NULL, '$2y$10$jFpP4kt8UbzzW4Y/aN46o.bjWHgt.d5kSohr/6NB22PFnlro4jvSe', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(454, 'admin2121213', NULL, '$2y$10$uTaI0lWxWVSyjpuSgjaWBencsaAmNwEZJ8rcXDBiZU33ff3C3rt8S', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(455, 'admin21213', NULL, '$2y$10$lwwAHrDk8Iz.sWIAUTfOwe3ii2be1K9hQAuOQ.zZLaW4GAUEbyb82', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(456, 'admin2122', NULL, '$2y$10$65TZXgHfMlxgmYMqvATjku6CIFFzw2OkDqGKZGVjI1X/W.4bwye3m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(457, 'admin21221', NULL, '$2y$10$jOSItcyiwqCwMWBiR01S2O.RjluAgz7.Ls1swDiETtLFXyTztnTAK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(458, 'admin2123', NULL, '$2y$10$eB3y/t81pdYV3Xe6DjwDIewWkK10RCUXTuGq7sVeN4ATPtNJgzAeO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(459, 'admin213', NULL, '$2y$10$4Xwg9OWKVEfuCNpBnIDgq.7ct5xpYhvSHNW9ccGCGDvY9uHY0lEwK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(460, 'admin2131', NULL, '$2y$10$LVLP7UYoneZ/soD/uhCRfernz4e1FM9rql67EG/yenltiNdsN68XO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(461, 'admin21311', NULL, '$2y$10$yf7V.oroO02kHNzLJpACXeO02GmrDMfKZ2ExvG5szvrI49MBhinhi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(462, 'admin213111', NULL, '$2y$10$13jHKIucAJPlIpjHVKT5qO9GIWJ7KVSCwf78oXLYoL7L3cslxn0sW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(463, 'admin2131111', NULL, '$2y$10$dxAPy2PNty2wWQUUztRJ4eTvAAh9Eq.zjPapdwEbnRlYI3wM4kaJK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(464, 'admin2131112', NULL, '$2y$10$ICkFdSSJTFxob7PlKuWIJO5EwFnnd0Zt1N5PWqmFhOTcHP..lzW8y', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(465, 'admin213112', NULL, '$2y$10$1wcXQ17oVOrBLAtQKIApruAf03JKfvOfbBUDTegjLT05nlE3lu6Ua', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(466, 'admin2131121', NULL, '$2y$10$woOWitpmoN/fqIJirHfGluZ7/mJ4gZHz04GwIirKpcbJvDUP62eqa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(467, 'admin2131122', NULL, '$2y$10$CP9uUsKA/Pgqk2gSVLnN6.f/BlrLbx/hPF63HLXpgQwJsDUBYNuJO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(468, 'admin2131123', NULL, '$2y$10$.jNYj0HBTTNkHsV5OzJlFOJ2Kkjf/dJ6SRoyDluaq9VAriWTseI/e', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(469, 'admin213113', NULL, '$2y$10$iUmIEU80FcLlDwrHDCXglOWT/w7SO5Bblygjmr4evnYx0LIJy9MUe', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(470, 'admin2131131', NULL, '$2y$10$iS3Rk6PQkWLtxddBt3jsX.Du1Luz1mxK/2TfOXus.5393NvquEA5a', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(471, 'admin2131132', NULL, '$2y$10$mGpbs7x7jLDpSeG6Yur5Ver/jXw6Pi79ZuM33E0/4dAUnpgUnhjfK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(472, 'admin2131133', NULL, '$2y$10$qM/HD1E91MouWbp0wcmYqeD9XR8U5Qs6LC2a5DbL1Q8JHEgo9.jyi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(473, 'admin21312', NULL, '$2y$10$h94uPyHhSyAzy8z4PFf3pu/1AK.k9w4R.3pdQgXr9fY6VjpL9MV7y', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(474, 'admin213121', NULL, '$2y$10$q4/uN3LqGUZoT.dGFd/t7u5N9K9Iiq4Pe81D6lWfdYZJxlMGjyDaK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(475, 'admin2131211', NULL, '$2y$10$mP8/YMY9AeZCMPAw5KtxhOxcU9O9k1ZZ5bRWrbwwKU1h9SCcJKQTO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(476, 'admin213122', NULL, '$2y$10$pKOp4i1LI04Pgld2IiRe1ua8biXTTfNBmFuMQTFtGYRK5S4ogQwwW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(477, 'admin213123', NULL, '$2y$10$CWfEPB22GC94bWMbF60mneqtNeLc7lHnRhkKQb5KBVNr97gqXWy/C', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(478, 'admin2131231', NULL, '$2y$10$KDxJZXTMRKPnaKVHD1H1yeeblhyLXXFcJ.MjaoI303M8VIbHbgcYa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(479, 'admin2131232', NULL, '$2y$10$mr0uSmPRk1clIhjvTvHXzee6OrWkhoBD4djjm.gicofFVORemhDum', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(480, 'admin2131233', NULL, '$2y$10$XVXtSgdN35uDQNoUnXc5J.YNe6gNqcyc.tFHXKIR09KQyWQsfVMn.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(481, 'admin21313', NULL, '$2y$10$yRqNctcPs6eESWFQWjgMDO6xTKukeQd5lIyzpKYn6XSHjDygh1o96', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(482, 'admin22', NULL, '$2y$10$c/XOwNKU7PJ/a44JH9Cv1.bWfgE7JqBAqQkSFR5WylsCMnHvW1M5O', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(483, 'admin221', NULL, '$2y$10$Bd50IskIcIVAIpOBxeGk6.EoPdHCxIQ0WrBKeNDzfsE/mHF18VOU.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(484, 'admin222', NULL, '$2y$10$ethZ6WYKN6TV8OLeSIGcxuIOInDj/wBjiWMCjdCavySXjd6JeTli2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(485, 'admin2221', NULL, '$2y$10$8VytaQAb.mXRUWkSiJrUrONVT.HBoAPASDR47Yo2/QDmg5U4II84S', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(486, 'admin22211', NULL, '$2y$10$VF9FAML9Qo3KA0JdybTIb.Z4upTueLCv1QTdaJ98NJfluJlObyqIm', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(487, 'admin22212', NULL, '$2y$10$mFb5yuJewwwLXJ9GIraPaur4CkfqMZVczhrO0NAhErGpbv.Lrrjx.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(488, 'admin22213', NULL, '$2y$10$lzrDx8RKR5U/rjEZt9jsX.C.oIqQhetmKCb0.RctCbtVWpU3iwm1u', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(489, 'admin222131', NULL, '$2y$10$Sba23m.vSed0dV4TA3NG6eCfnday0hPYKPeaZSp5cJ/uOKSEOBGHO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(490, 'admin2221311', NULL, '$2y$10$qO0uHze9eLUToHk0BZmy4eoZsOskNJzgjIBbyKCK6KuYCiYOYm7oC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(491, 'admin2221312', NULL, '$2y$10$UIEKd70iHuQ3z/zUZv/R4.JgiG/Vlmso4Ido8yJTSdSYwAEkrTy5q', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(492, 'admin2221313', NULL, '$2y$10$0e88t6KYsZ3GpX.7REUKaunXb1d5Otvjv8NjvL.8TPHOqyxexn1Yy', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(493, 'admin222132', NULL, '$2y$10$2jIkv9LkI83dKvkjtwGy9.Z2rE20RCZVoqO8CF8N24W5rJEPSNZD2', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(494, 'admin2221321', NULL, '$2y$10$TK85GJ8vKMYP3Ghi5iuTq.ga7gNJprTFemaVPz6zMcxAExVM2C6tO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(495, 'admin222133', NULL, '$2y$10$7dQ40EO..7V79z4.85EnGuVhshz/TMFz.qHYQ/o0WrsCXGWx.H19W', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(496, 'admin223', NULL, '$2y$10$vk4YJFkNROZwB5268Nr/EOOqh5ck/27Z1BPrCLgWr4bFbu3ixNeQ6', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(497, 'admin2231', NULL, '$2y$10$nCw92zzZuWTgTgtqLQ2ueuOzDGA/zZoWdOVAh5UxXBDrkg1DWhrBa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(498, 'admin22311', NULL, '$2y$10$lZmBtGYVrcdDE4DZMxSfGegFzW7owYav0H1UNTobi52N.5lUYRC0e', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(499, 'admin223111', NULL, '$2y$10$vNW4MA2ZcwDPYDep43XdJe9VPWQVmGTu5O9otD0jzdfOTS9wYLz5O', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(500, 'admin223112', NULL, '$2y$10$0cs.r8LAI0a.rXvQabYXHOV62Hbkt9Aco9b8yfzCrrjv9TEfbEuum', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(501, 'admin2231121', NULL, '$2y$10$NJGbA8EbiwmCpP8jpXmNQOW3H9vStIxbqMwKSbq.smI43GqxJtXzy', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(502, 'admin2231122', NULL, '$2y$10$0CJOX2fKB8KhTe8ic6ctVeb5QhX2GNf61nR/tK5cQtWbZNvjI0uvq', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(503, 'admin223113', NULL, '$2y$10$mFH.FIQprjbV5YU6zmZBtu8//vL.XoexQGee7EePPyPGg8OrHIsP6', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(504, 'admin22312', NULL, '$2y$10$o3RoQtcAkqIGKYXpIzjFMO04Cnzv/StzOaHapWZy26qZHh0j9pTGS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(505, 'admin223121', NULL, '$2y$10$6pc4W8aCjG1k.Ri8MygTxONw1d61u4XZ9HwQZ4gZkhr5WnMTMlbVe', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(506, 'admin2231211', NULL, '$2y$10$09/IR6wB8WwV4ZWbk8//1.zqCBYQNe0THYHTKTimANa41XuCxtZxC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(507, 'admin223122', NULL, '$2y$10$rPx2IZvdr5w4VhQOZgDCVeE6eWBbfKrCApHJkgbEbBHszDPg2Hp4S', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(508, 'admin22313', NULL, '$2y$10$Fsog8y9v.JGm1s8RJa4SpOMQIFs8TMiy3Fc81NvxxBRI/j/97aouG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(509, 'admin23', NULL, '$2y$10$ZfCfHWFPT1OG80Kv.x3GauijJ3LDMJBeUXdo.SySkAgdUPflnsBoq', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(510, 'admin231', NULL, '$2y$10$wwSG4hnLOSJQrxkFpYD.d.PPsVAAknZ5cX1W7qaWVrkPMD/DZoUUi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(511, 'admin2311', NULL, '$2y$10$Uf4KtbCwnSUZ77dh1/g41eIQfpJVh.QB55lUuDal8GYd7gAHY8bfS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(512, 'admin23111', NULL, '$2y$10$HSe3sqpukLrHRu4Ju2fSJOysmLMdekHX.g38FPOML9wVBtUsrABWS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(513, 'admin23112', NULL, '$2y$10$n3pL.mdVw1bECQExzqqqk.k0RgOv2uDe8pOANIvnRfk4DfLks3baS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(514, 'admin231121', NULL, '$2y$10$kGmjn4wuzLjTADBJOdldX.6.YUjAXwww8GqGbJ3zMGcdtEj4tHTP6', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(515, 'admin23113', NULL, '$2y$10$DziyM5DgUixBetCxltqT9ulcE4FRy/Ku7eOSVDQJ2vNe4Rt3elYKi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(516, 'admin231131', NULL, '$2y$10$2l5LnfBB7lbIURRd7YdfQOwYlOykJaL6D6t.nEobHaFBv74LIuDr6', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(517, 'admin231132', NULL, '$2y$10$OSsZ2LIBMA/n2XYRB/Y2T.UTDmju92zhrxp4l.CsbEWdqwsMsQ6YW', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(518, 'admin2311321', NULL, '$2y$10$ao/3KdHVKQBBZ7x51pzCU.aIfsX1KRSJPkaDyG5iShktuQ1UjRLLC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(519, 'admin2311322', NULL, '$2y$10$lYoE4S5GtDz/iWi4nBd42.6ym7lEf6v0.lW32DKLKtKRMeOZ3dg2.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(520, 'admin2311323', NULL, '$2y$10$DASlURmNeTkpAtLRxmTmtu0b2HCz2CHS6r6TJLa98h/QkpNWsO2Le', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(521, 'admin2312', NULL, '$2y$10$R0tGRrC6Jczx/QyvkRSnRePlbV8LMxpOrFKYB5G6AbAdNpGF6PfU.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(522, 'admin2313', NULL, '$2y$10$JS5ZhoDB5Wkw7dbkA/MfduD4RpwEU4FswtfJJNO.Q/2ZuSMRkBPry', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(523, 'admin23131', NULL, '$2y$10$bt0jXSyz1je7W1QeDMv.tuCRqHDloL1z8ELd8akXeqWVTlDECj5ZG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(524, 'admin231311', NULL, '$2y$10$.SmpYr/dirwKIyy0hBU/Du7H1BVcn5Rn/Pgq4waVtDY9zPn2AzWNe', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(525, 'admin2313111', NULL, '$2y$10$4UQ5.QRbp6gIXHJ6eJQlcO6opuX7gjBlOQQ1bCDxMU3LC8vwO1HvG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(526, 'admin2313112', NULL, '$2y$10$99Suk776Dc08cgyL/NLhCeiK6h6.HpqBgXrHJ1zPQ2VR0rLuHB3RC', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(527, 'admin231312', NULL, '$2y$10$GEr8OkYhkB4He0P8Vv8smuDEym3FjReblzUWqCV/a1sM2Sa0kxmwK', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(528, 'admin231313', NULL, '$2y$10$bGDS6CGRXnJw3GLPVsG7AesIFUrBO3/a727QXXc8KRVOkefFWpC5m', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(529, 'admin23132', NULL, '$2y$10$uMhXfCAiJcgYqhXvsmO8guJiuy2nulkVdnfJG08bzqe0dCsa1t0iS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(530, 'admin31', NULL, '$2y$10$G2KHtUMkltz1dC0rvn.Kw.OoivnpKYmBQVVVW2mPlDg.oQgWSAR3a', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(531, 'admin311', NULL, '$2y$10$0k34wPqRTlbpgiQv8gAa.OGkaJnN9pVs/YzSQLL1.f.cxLQsttLcm', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(532, 'admin3111', NULL, '$2y$10$vJmjJGsSJyvpxP/ysgDJ4O6KqQgu4WQ.NnKz1UFDaP9107KMxLvWa', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(533, 'admin3112', NULL, '$2y$10$NOUtF/x/zH5tmRN1JSzin.wq.ruPuVLTNMja4G.riHoPAUJnKLRhm', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(534, 'admin32', NULL, '$2y$10$Xg9QGTI5RrdUP.6rHEJ3kORxlyrFebhJvCLBiRd54m/B1NYEpQrK.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(535, 'admin33', NULL, '$2y$10$wEiUTK11fVJ4K9I0gsdO/uiTtIJeM3LY7brhaFt9cacvQuAYEv4uG', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(536, 'admin331', NULL, '$2y$10$NjkS9LFIccsH3217n5e3l.gHHJvl0mjbZjLYdGaogtvRnKHZkCp2C', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(537, 'admin3311', NULL, '$2y$10$TXszO4WqYv75Zgoh/Kcy6exHz1Mrs9JLnm0oszGk7X9O3QnvogiNi', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(538, 'admin33111', NULL, '$2y$10$Ow.Pg9fPnMmpQSeMgAjE2uyHJUrzLHpNyVkIjWhzxiunRZPVrDLz.', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(539, 'admin3312', NULL, '$2y$10$rpkyUK1OoIr51e/UTVBjveZyERQrBPv9CiK5bYqvU0.DU7QqvBGaO', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(540, 'admin33121', NULL, '$2y$10$YNxWl81NtbqOzCi633vnVeXl5S7BNmx8boyUCU73A57fjbiFPoMPq', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(541, 'admin3313', NULL, '$2y$10$hx6/MZ3XCbC5xv0V/slCeOXbsnSIaIzndCfCD8dczgwsnCY2IlHrS', 'John', 'John', '54678909', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);

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
