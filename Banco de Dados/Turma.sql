SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+03:00";

-- --------------------------------------------------------

--
-- Estrutura da tabela `Turma`
--

CREATE TABLE `Turma` (
  `Id` int(11) NOT NULL,
  `Professor` int(11) NOT NULL,
  `Nome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Senha` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Escola` varchar(147) COLLATE utf8_unicode_ci NOT NULL,
  `Cadastro` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `Turma`
--

INSERT INTO `Turma` (`Id`, `Professor`, `Nome`, `Senha`, `Status`, `Escola`, `Cadastro`) VALUES
(1, 1, 'Turma A', 'Senha Criptografada', 'Aberto', 'Universidade do Estado de Santa Catarina', '2019-04-08 03:30:50.000000'),
(2, 1, 'Turma B', '', 'Aberto', 'Universidade do Estado de Santa Catarina', '2019-04-05 20:02:10.000000'),
(3, 2, 'Turma C', '', 'Fechado', 'Universidade do Estado de Santa Catarina', '2019-04-03 22:40:30.000000'),
(4, 2, 'Turma D', 'Senha Criptografada', 'Fechado', 'Universidade do Estado de Santa Catarina', '2019-04-03 20:40:30.000000'),
(16, 1, 'Turma E', 'Senha Criptografada', 'Aberto', 'Universidade do Estado de Santa Catarina', '2019-04-05 20:30:50.000000'),
(17, 1, 'Turma F', '', 'Fechado', 'Universidade do Estado de Santa Catarina', '2019-04-05 21:30:30.000000'),
(18, 1, 'Turma G', '', 'Aberto', 'Universidade do Estado de Santa Catarina', '2019-04-07 03:10:50.000000');

--
-- Índices para a tabela `Turma`
--

ALTER TABLE `Turma`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT para a tabela `Turma`
--

ALTER TABLE `Turma`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;