-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Lug 10, 2025 alle 08:14
-- Versione del server: 9.0.1
-- Versione PHP: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `_fullstack06`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `agenti`
--

CREATE TABLE `agenti` (
  `id_agente` int NOT NULL,
  `nome_agente` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cognome_agente` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `agenti`
--

INSERT INTO `agenti` (`id_agente`, `nome_agente`, `cognome_agente`) VALUES
(1, 'Ag.Rossi', 'Antonio'),
(2, 'Ag.Ricci', 'Annarita'),
(3, 'Ag.Belli', 'Rosita'),
(4, 'Ag.Barbanera', 'Franco');

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `id_cliente` int NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cognome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indirizzo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localita` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cap` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prov` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `clienti`
--

INSERT INTO `clienti` (`id_cliente`, `nome`, `cognome`, `indirizzo`, `localita`, `cap`, `prov`) VALUES
(1, 'Marco', 'Rossi', 'Viale Roma, 18', 'Milano', '20019', ''),
(2, 'Angelo', 'Di Vittorio', 'Via Piana, 55', 'Roma', '00042', ''),
(3, 'Franco', 'De Angelissss', 'Via del Circo, 34', 'Grosseto', '58100', ''),
(4, 'Gigliola', 'Fiorentini', 'Strada Principale 4', 'Vicenza', '36100', ''),
(6, 'Franco', 'Bianchi', 'Piazza Firenze 9', 'Livorno', '57100', ''),
(7, 'Giovannino', 'Bambini', 'Viale dei Pioppi 9', 'Ascoli Piceno', '63100', ''),
(8, 'Michele', 'Rossi', 'Strada Comunale 55', 'Lucca', '55100', ''),
(9, 'Francesca', 'Romani', 'Via Esterna 88', 'Siena', '53100', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `ordini`
--

CREATE TABLE `ordini` (
  `id_ordine` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_agente` int DEFAULT NULL,
  `data_ordine` date DEFAULT NULL,
  `data_consegna` date DEFAULT NULL,
  `note_spedizione` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `ordini`
--

INSERT INTO `ordini` (`id_ordine`, `id_cliente`, `id_agente`, `data_ordine`, `data_consegna`, `note_spedizione`) VALUES
(1, 4, 2, '2020-05-18', '2020-06-18', NULL),
(2, 2, 1, '2020-09-25', '2020-10-25', NULL),
(3, 4, 2, '2020-08-16', '2020-09-16', NULL),
(4, 3, 2, '2022-07-01', '2022-08-01', NULL),
(6, 9, 3, '2022-04-09', '2022-05-09', NULL),
(7, 1, 4, '2024-03-08', '2024-04-08', NULL),
(9, 4, 1, '2024-12-08', '2025-01-08', NULL),
(10, 8, 3, '2021-08-10', '2021-09-10', NULL),
(11, 3, 4, '2022-04-02', '2022-05-02', NULL),
(13, 7, 3, '2023-08-12', '2023-09-12', NULL),
(14, 7, 3, '2023-07-14', '2023-08-14', NULL),
(15, 8, 4, '2022-02-18', '2022-03-18', NULL),
(17, 2, 1, '2024-11-21', '2024-12-21', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id_prodotto` int NOT NULL,
  `descr_prodotto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_prodotto` int DEFAULT NULL,
  `id_um` int DEFAULT NULL,
  `prezzo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id_prodotto`, `descr_prodotto`, `id_tipo_prodotto`, `id_um`, `prezzo`) VALUES
(1, 'Acqua aromatizzata', 1, 1, 2.30),
(2, 'Acqua gassata', 1, 1, 2.20),
(3, 'Acqua naturale', 1, 1, 2.00),
(4, 'Bibite', 1, 1, 1.40),
(5, 'Birra', 1, 1, 1.35),
(6, 'Caffè', 1, 2, 18.30),
(7, 'Latte', 1, 3, 1.80),
(8, 'Succhi di frutta', 1, 1, 1.70),
(9, 'Tè', 1, 1, 1.00),
(10, 'Vino', 1, 3, 1.30),
(11, 'Costolette di agnello', 2, 2, 17.50),
(12, 'Uova', 2, 4, 1.30),
(13, 'Tagliata', 2, 2, 55.00),
(14, 'Faraona', 2, 2, 12.03),
(15, 'Braciola di maiale', 2, 2, 9.90),
(16, 'Pollo', 2, 2, 6.70),
(17, 'Tacchino', 2, 2, 16.50),
(18, 'Fagioli', 3, 2, 5.00),
(19, 'Farina di grano', 3, 2, 3.20),
(20, 'Grano', 3, 2, 7.00),
(21, 'Orzo', 3, 2, 1.90),
(22, 'Farro', 3, 2, 3.98),
(23, 'Riso', 3, 2, 3.67),
(24, 'maionese', 4, 4, 1.50),
(25, 'Spezie/senape', 4, 4, 1.20),
(26, 'spezie/basilico tritato', 4, 4, 1.20),
(27, 'spezie/rosmarino', 4, 4, 1.20),
(28, 'ketchup', 4, 4, 1.30),
(29, 'spezie/menta', 4, 4, 1.20),
(30, 'Aceto', 4, 3, 0.80),
(31, 'Olio extravergine di oliva', 4, 2, 13.10),
(32, 'Peperoncino', 4, 4, 1.10),
(33, 'Sale', 4, 2, 0.50),
(34, 'Sottaceti', 4, 4, 2.50),
(35, 'Biscotti', 5, 4, 1.40),
(36, 'Cioccolato', 5, 4, 1.80),
(37, 'Confetture', 5, 4, 2.85),
(38, 'Gelati', 5, 4, 7.90),
(39, 'Miele', 5, 2, 12.00),
(40, 'Torte', 5, 2, 18.00),
(41, 'Zucchero', 5, 2, 1.15),
(42, 'Burro', 6, 2, 12.00),
(43, 'Formaggi', 6, 2, 18.40),
(44, 'Mozzarella', 6, 2, 11.30),
(45, 'Yogurt', 6, 4, 79.00),
(46, 'Latte', 6, 3, 1.32),
(47, 'frutta secca', 7, 2, 25.50),
(48, 'Fagiolini', 7, 2, 1.80),
(49, 'Cetrioli', 7, 2, 1.50),
(50, 'Patate', 7, 2, 1.40),
(51, 'Rucola', 7, 2, 14.20),
(52, 'Pere', 7, 2, 2.10),
(53, 'Mele', 7, 2, 1.40),
(54, 'Pesce spada congelato', 8, 2, 9.80),
(55, 'Tonno in scatola', 8, 2, 25.00),
(56, 'Gamberoni', 8, 2, 15.20),
(57, 'Cozze', 8, 2, 7.05),
(58, 'Spigola', 8, 2, 20.40);

-- --------------------------------------------------------

--
-- Struttura della tabella `righe_ordine`
--

CREATE TABLE `righe_ordine` (
  `id_riga_ordine` int NOT NULL,
  `id_ordine` int DEFAULT NULL,
  `id_prodotto` int DEFAULT NULL,
  `quantita` decimal(10,2) DEFAULT NULL,
  `prezzo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `righe_ordine`
--

INSERT INTO `righe_ordine` (`id_riga_ordine`, `id_ordine`, `id_prodotto`, `quantita`, `prezzo`) VALUES
(1, 15, 4, 4.00, 1.40),
(4, 13, 3, 3.00, 2.00),
(5, 14, 18, 6.00, 5.00),
(6, 2, 5, 5.00, 1.35),
(7, 14, 5, 5.00, 1.35),
(8, 14, 37, 2.00, 2.85),
(9, 7, 3, 3.00, 2.00),
(11, 6, 6, 6.00, 18.30),
(12, 2, 16, 6.00, 6.70),
(13, 7, 13, 5.00, 55.00),
(14, 4, 31, 5.00, 13.10),
(17, 6, 23, 4.00, 3.67),
(18, 2, 2, 2.00, 2.20),
(19, 6, 2, 2.00, 2.20),
(20, 11, 28, 4.00, 1.30),
(24, 10, 38, 5.00, 7.90),
(25, 13, 35, 5.00, 1.40),
(26, 11, 32, 5.00, 1.10),
(28, 11, 36, 6.00, 1.80),
(30, 6, 48, 4.00, 1.80),
(31, 7, 5, 5.00, 1.35),
(32, 13, 41, 4.00, 1.15),
(35, 10, 3, 3.00, 2.00),
(36, 14, 2, 2.00, 2.20),
(37, 11, 26, 4.00, 1.20),
(38, 14, 32, 6.00, 1.10),
(39, 15, 24, 5.00, 1.50),
(40, 7, 24, 6.00, 1.50);

-- --------------------------------------------------------

--
-- Struttura della tabella `tipi_prodotto`
--

CREATE TABLE `tipi_prodotto` (
  `id_tipo_prodotto` int NOT NULL,
  `sigla_tipo_prodotto` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descr_tipo_prodotto` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `tipi_prodotto`
--

INSERT INTO `tipi_prodotto` (`id_tipo_prodotto`, `sigla_tipo_prodotto`, `descr_tipo_prodotto`) VALUES
(1, 'Bevande', 'Bibite analcoliche, caffè, tè e birra'),
(2, 'Carne/pollame', 'Carni conservate'),
(3, 'Cereali', 'Pane, cracker, pasta e cereali'),
(4, 'Condimenti', 'Salse dolci e piccanti, sottaceti, paste spalmabili e condimenti'),
(5, 'Dolciumi', 'Dessert, caramelle e dolci'),
(6, 'Latticini', 'Formaggi'),
(7, 'Prod. agricoli', 'Frutta secca e formaggio di soia'),
(8, 'Prod. ittici', 'Alghe e pesce'),
(9, 'Formaggi', 'Camembert'),
(10, 'Formaggi', 'Formaggi stagionati'),
(11, 'Verdura', 'Insalata');

-- --------------------------------------------------------

--
-- Struttura della tabella `um`
--

CREATE TABLE `um` (
  `id_um` int NOT NULL,
  `sigla_um` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descr_um` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `um`
--

INSERT INTO `um` (`id_um`, `sigla_um`, `descr_um`) VALUES
(1, 'bott.', 'bottiglie'),
(2, 'kg', 'chilogrammi'),
(3, 'lt', 'litri'),
(4, 'conf', 'confezione');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `agenti`
--
ALTER TABLE `agenti`
  ADD PRIMARY KEY (`id_agente`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indici per le tabelle `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`id_ordine`),
  ADD KEY `FK_ordini_agenti` (`id_agente`),
  ADD KEY `FK_ordini_clienti` (`id_cliente`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id_prodotto`),
  ADD KEY `FK_prodotti_tipi_prodotto` (`id_tipo_prodotto`),
  ADD KEY `FK_prodotti_um` (`id_um`);

--
-- Indici per le tabelle `righe_ordine`
--
ALTER TABLE `righe_ordine`
  ADD PRIMARY KEY (`id_riga_ordine`),
  ADD KEY `FK_righe_ordine_prodotti` (`id_prodotto`),
  ADD KEY `FK_righe_ordine_ordini` (`id_ordine`);

--
-- Indici per le tabelle `tipi_prodotto`
--
ALTER TABLE `tipi_prodotto`
  ADD PRIMARY KEY (`id_tipo_prodotto`);

--
-- Indici per le tabelle `um`
--
ALTER TABLE `um`
  ADD PRIMARY KEY (`id_um`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `agenti`
--
ALTER TABLE `agenti`
  MODIFY `id_agente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `ordini`
--
ALTER TABLE `ordini`
  MODIFY `id_ordine` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id_prodotto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT per la tabella `righe_ordine`
--
ALTER TABLE `righe_ordine`
  MODIFY `id_riga_ordine` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT per la tabella `tipi_prodotto`
--
ALTER TABLE `tipi_prodotto`
  MODIFY `id_tipo_prodotto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `um`
--
ALTER TABLE `um`
  MODIFY `id_um` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `FK_ordini_agenti` FOREIGN KEY (`id_agente`) REFERENCES `agenti` (`id_agente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_ordini_clienti` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`id_cliente`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `FK_prodotti_tipi_prodotto` FOREIGN KEY (`id_tipo_prodotto`) REFERENCES `tipi_prodotto` (`id_tipo_prodotto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_prodotti_um` FOREIGN KEY (`id_um`) REFERENCES `um` (`id_um`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `righe_ordine`
--
ALTER TABLE `righe_ordine`
  ADD CONSTRAINT `FK_righe_ordine_ordini` FOREIGN KEY (`id_ordine`) REFERENCES `ordini` (`id_ordine`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_righe_ordine_prodotti` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
