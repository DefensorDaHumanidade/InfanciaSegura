SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-03:00";

-- --------------------------------------------------------

--
-- Estrutura da tabela `Aluno`
--

CREATE TABLE `Aluno` (
  `Id` int(11) NOT NULL,
  `Turma` int(11) NOT NULL,
  `Nome` varchar(147) COLLATE utf8_unicode_ci NOT NULL,
  `Nick` varchar(147) COLLATE utf8_unicode_ci NOT NULL,
  `Idade` int(11) NOT NULL,
  `Senha` int(11) NOT NULL,
  `Cadastro` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `UltimoAcesso` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `Aluno`
--

INSERT INTO `Aluno` (`Id`, `Turma`, `Nome`, `Nick`, `Idade`, `Senha`, `Cadastro`, `UltimoAcesso`) VALUES
(1, 1, 'Fulano', 'Fulaninho', 6, 2, '2019-04-05 19:00:40.000000', '2019-03-04 01:05:00.000000'),
(2, 1, 'Ciclano', 'Ciclaninho', 5, 1, '2019-03-04 00:00:00.000000', '2019-03-13 00:00:00.000000'),
(3, 2, 'Beltrano', 'Beltraninho', 7, 3, '2019-03-13 01:00:00.000000', '2019-03-25 00:00:00.000000');

--
-- Índices para a tabela `Aluno`
--

ALTER TABLE `Aluno`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT para a tabela `Aluno`
--

ALTER TABLE `Aluno`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;
