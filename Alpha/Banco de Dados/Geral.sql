SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-03:00";

-- --------------------------------------------------------

--
-- Estrutura da tabela `Geral`
--

CREATE TABLE `Geral` (
  `Id` int(11) NOT NULL,
  `Aluno` int(11) NOT NULL,
  `Cadastro` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `UltimoAcesso` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `Geral`
--

INSERT INTO `Geral` (`Id`, `Aluno`, `Cadastro`, `UltimoAcesso`) VALUES
(1, 1, '2019-03-11 00:00:00.000000', '2019-03-27 00:00:00.000000'),
(2, 2, '2019-03-12 00:00:00.000000', '2019-03-27 00:00:00.000000'),
(3, 3, '2019-03-19 00:00:00.000000', '2019-03-20 09:35:00.000000');

--
-- Índices para a tabela `Geral`
--

ALTER TABLE `Geral`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT para a tabela `Geral`
--

ALTER TABLE `Geral`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;