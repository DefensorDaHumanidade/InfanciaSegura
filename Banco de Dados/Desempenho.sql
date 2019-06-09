SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-03:00";

-- --------------------------------------------------------

--
-- Estrutura da tabela `Desempenho`
--

CREATE TABLE `Desempenho` (
  `Id` int(11) NOT NULL,
  `Aluno` int(11) NOT NULL,
  `Tipo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Fase` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Dificuldade` int(11) NOT NULL,
  `Descricao` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `Pontuacao` int(11) NOT NULL,
  `Visualizacao` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `UltimoJogo` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `Desempenho`
--

INSERT INTO `Desempenho` (`Id`, `Aluno`, `Tipo`, `Fase`, `Dificuldade`, `Descricao`, `Pontuacao`, `Visualizacao`, `UltimoJogo`) VALUES
(1, 2, 'Acerto', 'Hospital', 1, '', 10, 'Visivel', '2019-03-27 00:00:00.000000'),
(2, 1, 'Acerto', 'Parque', 1, '', 10, 'Visivel', '2019-03-26 00:00:00.000000'),
(3, 1, 'Acerto', 'Hospital', 2, '', 10, 'Invisivel', '2019-03-26 00:00:00.000000'),
(4, 1, 'Erro', 'Hospital', 3, 'Descricao do Erro', -10, 'Visivel', '2019-03-20 00:00:00.000000'),
(5, 2, 'Erro', 'Parque', 2, 'Descricao do Erro', -10, 'Visivel', '2019-03-21 00:00:00.000000'),
(6, 3, 'Erro', 'Parque', 2, 'Descricao do Erro', -10, 'Visivel', '2019-03-27 00:00:00.000000');

--
-- Índices para a tabela `Desempenho`
--

ALTER TABLE `Desempenho`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT para a tabela `Desempenho`
--

ALTER TABLE `Desempenho`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;