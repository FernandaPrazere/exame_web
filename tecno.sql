-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Jan-2023 às 20:08
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tecno`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `categoria`) VALUES
(1, 'Nokia'),
(2, 'itel'),
(3, 'Samsung'),
(4, 'Tecno'),
(5, 'Alcatel'),
(6, 'Iphone');

-- --------------------------------------------------------

--
-- Estrutura da tabela `po`
--

CREATE TABLE `po` (
  `id` int(11) NOT NULL,
  `idCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `produto` varchar(30) NOT NULL,
  `preco` float NOT NULL,
  `estado` varchar(100) NOT NULL,
  `foto` text NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `produto`, `preco`, `estado`, `foto`, `categoria`) VALUES
(1, 'Iphone 6', 25000, 'disponivel', 'product-thumb-1.jpg', 'IPHONE'),
(2, 'Sansumg S1', 254000, 'disponivel', 'product-1.jpg', 'sansumg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(90) DEFAULT NULL,
  `precoUnitario` float DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `supplid` int(11) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `imagem` varchar(90) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `precoUnitario`, `qtd`, `estado`, `supplid`, `idCategoria`, `descricao`, `imagem`, `data`, `total`) VALUES
(1, 'de', 1233, 3, 'sim', 2, 2, 'xww', '38', '2023-01-04 21:41:34', 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `passe` varchar(40) DEFAULT NULL,
  `privilegio` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `passe`, `privilegio`) VALUES
(1, 'Florencia Joaquim', 'florencia@gmail.com', '12345', 1),
(2, 'Fernanda Domingos', 'fernanda@gmail.com', '123456', 0),
(3, 'Eluck Júnior', 'eluck@gmail.com', '', 1),
(6, 'Patricia Venacio', 'patricia@gmail.com', '1', 1),
(7, 'Patricia Venacio', 'venacio@gmail.com', '12', 1),
(20, 'leonildo', 'leon@gmail.com', '1234', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL,
  `produto` varchar(100) NOT NULL,
  `preco` float NOT NULL,
  `data` date NOT NULL,
  `qtd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`idVenda`, `produto`, `preco`, `data`, `qtd`) VALUES
(1, 'Iphone 6', 40000, '2022-10-12', 6),
(2, 'Iphone 7', 60000, '2022-10-04', 10),
(3, 'Iphone X', 150000, '2022-08-04', 7),
(4, 'Iphone 7', 60000, '2022-09-13', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `po`
--
ALTER TABLE `po`
  ADD CONSTRAINT `po_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
