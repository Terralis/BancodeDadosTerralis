-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Fev-2021 às 19:54
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `terralis`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alternativa`
--

CREATE TABLE `alternativa` (
  `id_alternativa` int(11) NOT NULL,
  `texto` blob NOT NULL,
  `veracidade` tinyint(1) NOT NULL,
  `id_questao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desempenho`
--

CREATE TABLE `desempenho` (
  `id_usuario` int(11) NOT NULL,
  `id_questionario` int(5) NOT NULL,
  `qtd_questao_correta` int(5) NOT NULL,
  `qtd_questao_errada` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `id_disciplina` int(11) NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `questao`
--

CREATE TABLE `questao` (
  `id_questao` int(11) NOT NULL,
  `enunciado` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `questionario`
--

CREATE TABLE `questionario` (
  `id_questionario` int(11) NOT NULL,
  `num_questoes` int(5) NOT NULL,
  `id_tema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `questionario_questao`
--

CREATE TABLE `questionario_questao` (
  `id_questao` int(11) NOT NULL,
  `id_questionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tema`
--

CREATE TABLE `tema` (
  `id_tema` int(11) NOT NULL,
  `link_video` blob NOT NULL,
  `assunto` varchar(255) NOT NULL,
  `resumo` blob NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alternativa`
--
ALTER TABLE `alternativa`
  ADD PRIMARY KEY (`id_alternativa`),
  ADD KEY `id_questao` (`id_questao`);

--
-- Índices para tabela `desempenho`
--
ALTER TABLE `desempenho`
  ADD PRIMARY KEY (`id_usuario`,`id_questionario`),
  ADD KEY `id_questionario` (`id_questionario`);

--
-- Índices para tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_disciplina`);

--
-- Índices para tabela `questao`
--
ALTER TABLE `questao`
  ADD PRIMARY KEY (`id_questao`);

--
-- Índices para tabela `questionario`
--
ALTER TABLE `questionario`
  ADD PRIMARY KEY (`id_questionario`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Índices para tabela `questionario_questao`
--
ALTER TABLE `questionario_questao`
  ADD PRIMARY KEY (`id_questao`,`id_questionario`),
  ADD KEY `id_questionario` (`id_questionario`);

--
-- Índices para tabela `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alternativa`
--
ALTER TABLE `alternativa`
  MODIFY `id_alternativa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `questao`
--
ALTER TABLE `questao`
  MODIFY `id_questao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `questionario`
--
ALTER TABLE `questionario`
  MODIFY `id_questionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alternativa`
--
ALTER TABLE `alternativa`
  ADD CONSTRAINT `alternativa_ibfk_1` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`);

--
-- Limitadores para a tabela `desempenho`
--
ALTER TABLE `desempenho`
  ADD CONSTRAINT `desempenho_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `desempenho_ibfk_2` FOREIGN KEY (`id_questionario`) REFERENCES `questionario` (`id_questionario`),
  ADD CONSTRAINT `desempenho_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `questionario`
--
ALTER TABLE `questionario`
  ADD CONSTRAINT `questionario_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`);

--
-- Limitadores para a tabela `questionario_questao`
--
ALTER TABLE `questionario_questao`
  ADD CONSTRAINT `questionario_questao_ibfk_1` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`),
  ADD CONSTRAINT `questionario_questao_ibfk_2` FOREIGN KEY (`id_questionario`) REFERENCES `questionario` (`id_questionario`),
  ADD CONSTRAINT `questionario_questao_ibfk_3` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`),
  ADD CONSTRAINT `questionario_questao_ibfk_4` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`),
  ADD CONSTRAINT `questionario_questao_ibfk_5` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`),
  ADD CONSTRAINT `questionario_questao_ibfk_6` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`);

--
-- Limitadores para a tabela `tema`
--
ALTER TABLE `tema`
  ADD CONSTRAINT `tema_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
