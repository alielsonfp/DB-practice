-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-173003-db.mariadb-173003:10031
-- Generation Time: May 22, 2024 at 07:09 PM
-- Server version: 11.1.2-MariaDB-1:11.1.2+maria~ubu2004
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viagens`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do Destino',
  `descricao` varchar(255) NOT NULL COMMENT 'Descrição do Destino'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinos`
--

INSERT INTO `destinos` (`id`, `nome`, `descricao`) VALUES
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(2, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(3, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL COMMENT 'Referencia ao ID do usuário que fez a reserva',
  `id_destino` int(11) DEFAULT NULL COMMENT 'Referencia ao ID do destino da reserva',
  `data` date DEFAULT NULL COMMENT 'Data da reserva',
  `status` varchar(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, pendente, cancelada, etc)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservas`
--

INSERT INTO `reservas` (`id`, `id_usuario`, `id_destino`, `data`, `status`) VALUES
(1, 1, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do usúario',
  `email` varchar(100) NOT NULL COMMENT 'Email do usuario',
  `data_nascimento` date NOT NULL COMMENT 'Data de nascimento do usuario',
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `data_nascimento`, `rua`, `numero`, `cidade`, `estado`) VALUES
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A', ' 123', ' Cidade X', ' Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B', ' 456', ' Cidade Y', ' Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C', ' 789', ' Cidade X', ' Estado Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservas_destinos` (`id_destino`),
  ADD KEY `fk_reservas_usuarios` (`id_usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reservas_destinos` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id`),
  ADD CONSTRAINT `fk_reservas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
