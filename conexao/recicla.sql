-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Dez-2022 às 20:26
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `recicla`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `recicla`
--

CREATE TABLE `recicla` (
  `reci_prod` int(11) DEFAULT NULL,
  `reci_emp` int(11) DEFAULT NULL,
  `data_reciclagem` date DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `peso` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `recicla`
--

INSERT INTO `recicla` (`reci_prod`, `reci_emp`, `data_reciclagem`, `valor`, `peso`) VALUES
(1, 1, '2022-11-30', 0.25, 0.27),
(3, 2, '2022-11-02', 0.27, 0.13),
(4, 5, '2022-10-14', 0.86, 1.23),
(2, 2, '2022-11-06', 0.41, 1.21),
(3, 4, '2022-12-08', 4.81, 1.81);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `recicla`
--
ALTER TABLE `recicla`
  ADD KEY `recicla_ibfk_1` (`reci_prod`),
  ADD KEY `recicla_ibfk_2` (`reci_emp`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `recicla`
--
ALTER TABLE `recicla`
  ADD CONSTRAINT `recicla_ibfk_1` FOREIGN KEY (`reci_prod`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `recicla_ibfk_2` FOREIGN KEY (`reci_emp`) REFERENCES `empresa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
