-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Dez-2022 às 20:56
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
-- Estrutura da tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cadastro`
--

INSERT INTO `cadastro` (`email`, `senha`, `nome`, `foto`) VALUES
('edirock_racionais@gmail.com', '123', 'Edi Rock', 'err.jpg'),
('iceblue_racionais@gmail.com', '123', 'Ice Blue', 'ibr.jpg'),
('kljay_racionais@hotmail.com', '123', 'KL Jay ', 'kjr.jpg'),
('manobrown_racionais@hotmail.com', '123', 'Mano Brown', 'mbr.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `telefone` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`id`, `nome`, `endereco`, `numero`, `bairro`, `cidade`, `telefone`) VALUES
(1, 'Restaurante Romeu', 'Rua Camilo Camargo', 146, 'Remanso Campineiro', 'Hortolândia', '(19) 3503-0600'),
(2, 'Restaurante Dona Cidona', 'Av. Thereza', 3370, 'Jardim das Laranjeiras', 'Hortolândia', '(19) 3819-5972'),
(3, 'Runner Records', 'Rua Elisabeth II', 390, 'Spring Years', 'Londres', '4420558678'),
(4, 'The Arcade', 'Church Street', 6501, 'Douglasville', 'Georgia', '18054574992'),
(5, 'Simpson Gallery', 'Evergreen Terrace', 742, 'Henderson', 'Nevada', '1324243556'),
(6, 'Plástico Fashion', 'Rua Terra Maria de Belle', 175, 'Jardim Botânico', 'Vinhedo', '(87) 39204-9595');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `listagem_recicla`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `listagem_recicla` (
`nome` varchar(50)
,`descricao` varchar(100)
,`data_reciclagem` date
,`valor` float
,`peso` float
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor_peso` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `descricao`, `valor_peso`) VALUES
(1, 'Lacre de lata de refrigerante', 0.42),
(2, 'Caixa de leite', 0.33),
(3, 'Garrafa plástica', 1.47),
(4, 'Pneu de bicicleta', 7.12),
(5, 'Caixa de sapato', 0.59);

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

-- --------------------------------------------------------

--
-- Estrutura para vista `listagem_recicla`
--
DROP TABLE IF EXISTS `listagem_recicla`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listagem_recicla`  AS SELECT `empresa`.`nome` AS `nome`, `produto`.`descricao` AS `descricao`, `data_reciclagem` AS `data_reciclagem`, `valor` AS `valor`, `peso` AS `peso` FROM ((`empresa` join `produto`) join `recicla`) WHERE `empresa`.`id` = `reci_emp` AND `produto`.`id` = `reci_prod` ORDER BY `empresa`.`nome` ASC  ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `recicla`
--
ALTER TABLE `recicla`
  ADD KEY `recicla_ibfk_1` (`reci_prod`),
  ADD KEY `recicla_ibfk_2` (`reci_emp`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
