-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 18 déc. 2020 à 13:59
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_projet_recette`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `slug`) VALUES
(1, 'Entrees', 'entrees'),
(2, 'Plats', 'plats'),
(3, 'Desserts', 'desserts');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201210103629', '2020-12-10 10:37:16', 2369),
('DoctrineMigrations\\Version20201211093855', '2020-12-11 09:39:48', 1770),
('DoctrineMigrations\\Version20201217101858', '2020-12-17 10:19:44', 1679);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D053A93BCF5E72D` (`categorie_id`),
  KEY `IDX_7D053A93A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `categorie_id`, `user_id`, `nom`, `image`, `ingredients`, `slug`, `created_at`, `updated_at`, `actif`) VALUES
(9, 1, 4, 'Salade de tomate', 'food3-5fdb59f9b186f721850322.jpg', '<ol>\r\n	<li>\r\n	<p>Monder les tomates (enlever la peau). D&eacute;couper les tomates en rondelles et les mettre dans un plat &agrave; plat en les chevauchant l&eacute;g&egrave;rement.</p>\r\n	</li>\r\n	<li>\r\n	<p>Emincer les oignons tr&egrave;s finement. Disposer harmonieusement sur les tomates dans le plat. Saler, poivrer et ajouter une pinc&eacute;e de piment d&#39;Espelette.</p>\r\n	</li>\r\n	<li>\r\n	<p>Arroser avec l&#39;huile d&#39;olives et le vinaigre. D&eacute;corer avec les feuilles de basilic. Garder au frais 30 minutes et d&eacute;guster sans tarder !</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'salade-de-tomate', '2020-12-17 13:15:29', '2020-12-17 13:15:32', 1),
(12, 1, 3, 'Salade crevette carotte', 'food2-5fdc67cda2a8f556966026.jpg', '<ol>\r\n	<li>Laver la laitue, essorer et couper grossi&egrave;rement les feuilles puis r&eacute;server. &Eacute;plucher et r&acirc;per les carottes et les ajouter.</li>\r\n	<li>Dorer rapidement les crevettes dans une po&ecirc;le avec une noix de beurre. Les ajouter &agrave; la salade, remuer.</li>\r\n	<li>Remuer les ingr&eacute;dients de la vinaigrette pour les &eacute;mulsionner. Dans un plat, mettre un fond de vinaigrette puis le m&eacute;lange de salade.</li>\r\n	<li>R&eacute;server au r&eacute;frig&eacute;rateur. A la derni&egrave;re minute, verser le reste de la vinaigrette sur la salade et remuer.</li>\r\n</ol>', 'salade-crevette-carotte', '2020-12-18 08:26:47', '2020-12-18 08:26:48', 1),
(13, 3, 3, 'Salade de fruits', 'food10-5fdc67fbee309183090334.jpg', '<ol>\r\n	<li>Pelez et coupez tous les fruits en morceaux et mettez-les dans un grand saladier.</li>\r\n	<li>Faites votre jus en m&eacute;langeant dans un pichet le sirop, le sucre et l&#39;eau.</li>\r\n	<li>Versez ce m&eacute;lange sur vos fruits, ajoutez les b&acirc;tons de cannelle et de vanille.</li>\r\n	<li>Mettez au r&eacute;frig&eacute;rateur minimum 2 h (plus vous la laisserez au frais, meilleure sera votre salade de fruits frais!).</li>\r\n	<li>Vous pouvez aussi ajouter un peu d&#39;alcool selon les go&ucirc;ts comme du Kirsh, du Rhum, Soho, Pisang...</li>\r\n	<li>Bonne d&eacute;gustation! S&#39;il en reste encore le lendemain, elle n&#39;en sera que meilleure car les fruits auront pris le temps de bien mac&eacute;rer dans leur jus !!!</li>\r\n</ol>', 'salade-de-fruits', '2020-12-18 08:27:35', '2020-12-18 08:27:37', 1),
(14, 2, 3, 'Poulet caramel', 'food6-5fdc89dd29f92372408901.jpg', '<ol>\r\n	<li>Commencez la pr&eacute;paration de votre&nbsp;<strong>recette de poulet caramel</strong>&nbsp;en taillant la viande&nbsp;en petits morceaux. &Eacute;pluchez, puis hachez l&rsquo;ail et l&rsquo;oignon.</li>\r\n	<li>Faites mariner le poulet avec l&rsquo;<strong>ail</strong>, l&rsquo;<strong>oignon</strong>, la moiti&eacute; de la&nbsp;<strong>sauce soja</strong>, 1 c. &agrave; caf&eacute; d&rsquo;huile de s&eacute;same et le&nbsp;<strong>vinaigre de riz</strong>.</li>\r\n	<li>Mettez les morceaux de sucre avec 1 c. &agrave; soupe d&rsquo;eau dans une casserole. Laissez caram&eacute;liser jusqu&rsquo;&agrave; obtention d&rsquo;un caramel clair. &Ocirc;tez du feu, puis incorporez le reste de&nbsp;<strong>sauce soja</strong>&nbsp;et d&rsquo;<strong>huile de s&eacute;same</strong>&nbsp;en remuant avec une cuill&egrave;re en bois. R&eacute;servez au chaud.</li>\r\n	<li>Chauffez un wok avec 1 c. &agrave; soupe d&rsquo;huile. Saisissez le poulet et sa marinade dans le wok br&ucirc;lant et laissez cuire 10 min &agrave; feu vif en remuant. Ajoutez le caramel au poulet. Laissez cuire quelques minutes avant d&rsquo;ajouter la moiti&eacute; des graines de s&eacute;same.</li>\r\n	<li>M&eacute;langez et dressez votre&nbsp;<strong>poulet au caramel</strong>&nbsp;dans un plat de service. Parsemez du reste des graines de s&eacute;same et d&eacute;gustez avec un bol de riz parfum&eacute;.</li>\r\n</ol>', 'poulet-caramel', '2020-12-18 09:55:25', '2020-12-18 10:52:09', 1),
(15, 2, 4, 'Courgette', 'food2-5fdc80b3e0d2e197834642.jpg', '<ol>\r\n	<li>Couper les courgettes en tr&egrave;s fines rondelles. Les faire revenir dans de l&#39;huile d&#39;olive. Saler, poivrer, cuire environ 10 mm &agrave; petit feu.</li>\r\n	<li>Battre les oeufs et ajouter le fromage + sel + poivre + basilic + lait.</li>\r\n	<li>Jeter la pr&eacute;paration sur les courgettes. Remuer. NE PAS FAIRE PRENDRE &quot;L&#39;OMELETTE&quot;.</li>\r\n	<li>Mettre au four 180&deg;C pendant 35 mn.</li>\r\n	<li>SERVIR FROID OU CHAUD avec une sauce mayonnaise + ketchup hot.</li>\r\n</ol>', 'courgette', '2020-12-18 10:13:02', '2020-12-18 10:13:03', 1),
(17, 2, 6, 'Pâtes aux haricots', 'food7-5fdcaeb25972f726038914.jpg', '<ol>\r\n	<li>Rincez et essorez le basilic et le persil. Pelez l&rsquo;ail et retirez le germe.</li>\r\n	<li>Dans un robot, mixez les herbes et l&rsquo;ail avec les pignons, ajoutez l&rsquo;huile d&rsquo;olive et assaisonnez &agrave; votre convenance. Laissez tourner jusqu&rsquo;&agrave; obtenir une belle sauce verte. R&eacute;servez au frais.</li>\r\n	<li>Effilez les haricots et coupez-les en tron&ccedil;ons de 3 cm. Plongez-les dans une grande casserole d&rsquo;eau bouillante sal&eacute;e, comptez 8 min de cuisson. Ajoutez les mini penne et faites cuire encore 8 min.</li>\r\n	<li>Egouttez les haricots et les penne, disposez-les dans un plat creux, ajoutez la sauce verte et m&eacute;langez. D&eacute;corez avec des tomates&nbsp;<a href=\"https://www.cuisineactuelle.fr/recettes-de-cuisine/fruits/cerise\">cerise</a>&nbsp;et du basilic. D&eacute;gustez chaud ou ti&egrave;de.</li>\r\n</ol>', 'pates-aux-haricots', '2020-12-18 13:29:09', '2020-12-18 13:29:15', 1),
(18, 1, 6, 'Salade au citron', 'food8-5fdcaf721aa23574531994.jpg', '<ol>\r\n	<li>Dans un grand bol, m&eacute;langer tous les ingr&eacute;dients.</li>\r\n	<li>Au moment de servir, ajouter la laitue et l&rsquo;oignon &agrave; la vinaigrette. Bien m&eacute;langer. Rectifier l&rsquo;assaisonnement.</li>\r\n</ol>', 'salade-au-citron', '2020-12-18 13:32:26', '2020-12-18 13:32:28', 1),
(19, 3, 6, 'Crêpes fruits rouges', 'food9-5fdcb014d9f00501897039.jpg', '<ol>\r\n	<li>Pr&eacute;parer la p&acirc;te &agrave; cr&ecirc;pes : faire fondre le beurre. Dans une terrine, m&eacute;langer la farine, le sucre et le sel. Creuser un puits, y casser les &oelig;ufs et d&eacute;layer peu &agrave; peu avec le lait et le beurre fondu. Lorsque la p&acirc;te est bien lisse et homog&egrave;ne, la parfumer avec le kirsch et ajouter l&rsquo;huile. Bien battre et laisser reposer 1 heure. Au bout de ce temps, pr&eacute;parer les cr&ecirc;pes selon la m&eacute;thode habituelle en graissant la po&ecirc;le entre chaque cr&ecirc;pe.</li>\r\n	<li>Pr&eacute;parer la garniture : trier et laver d&eacute;licatement les fruits rouges, puis les s&eacute;cher sur un linge. Les mettre dans un saladier avec le sucre en poudre et le kirsch, puis m&eacute;langer.</li>\r\n	<li>Fouetter la cr&egrave;me bien froide en chantilly en lui ajoutant le sucre glace et le sucre vanill&eacute;, puis incorporer d&eacute;licatement les fruits rouges et leur jus.</li>\r\n	<li>Pour servir, fourrer les cr&ecirc;pes de cr&egrave;me aux fruits rouges, puis les plier en quatre en rabattant les bords vers le centre sans masquer la cr&egrave;me. D&eacute;corer chaque cr&ecirc;pe avec quelques fruits rouges. Servir aussit&ocirc;t.</li>\r\n</ol>', 'crepes-fruits-rouges', '2020-12-18 13:35:10', '2020-12-18 13:35:12', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64986CC499D` (`pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `roles`, `password`, `email`) VALUES
(1, 'CarpeDiem', '[]', '$argon2id$v=19$m=65536,t=4,p=1$MXBvRFo5alY5WnRrWmpKbQ$pEbNSyUMiNeBrn7vxjK7itIlQwVtZx/pIUV/WlLSi9U', 'azerty@gmail.com'),
(2, 'Admin', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$QWNaMUs2RWttN01URmVERg$0E6VNEEOK79rs174PpOq2k1slt+6//K2PV08Q4zqREk', 'azerty2@gmail.com'),
(3, 'CookMasters', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$dVJJL0hpcVBkSDVpemVRMA$Wk8bcxmUB/370ZdiLO/GNrf4ivRspdYWhxFW4N9KHTE', 'theo@gmail.com'),
(4, 'Nadmin', '[]', '$argon2id$v=19$m=65536,t=4,p=1$dEJ1Y0l2OEpuLmtCRGV4SQ$QVqzORyWF+8fPbrHh5sGMY5gBObPyTWJKCMVFOZZ9YU', 'test2@gmail.com'),
(5, 'Afro1985', '[]', '$argon2id$v=19$m=65536,t=4,p=1$b0F0Ym1pYjA0SVpRbVdDRw$YuglLXpmLC479M7XbYOLYNt4WNHoBL0w9bNqKUgcBsk', 'LauretteLafreniere@jourrapide.com'),
(6, 'Joho1942', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$anM4TktZbXNSVGU1cExOSw$c5hpmfN4Idn8FsSWrDrrgAU8++zPZXb5hwfNX4ulpyw', 'EricVadeboncoeur@dayrep.com');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_7D053A93A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_7D053A93BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
