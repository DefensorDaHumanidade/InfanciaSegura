SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-03:00";

-- --------------------------------------------------------

--
-- Estrutura da tabela `Professor`
--

CREATE TABLE `Professor` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(147) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(147) COLLATE utf8_unicode_ci NOT NULL,
  `Senha` varchar(147) COLLATE utf8_unicode_ci NOT NULL,
  `Escola` varchar(147) COLLATE utf8_unicode_ci NOT NULL,
  `Cidade` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `Estado` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `Registro` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `TamanhoLetra` int(11) NOT NULL,
  `FonteLetra` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `EstiloLetra` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Idioma` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `Professor`
--

INSERT INTO `Professor` (`Id`, `Nome`, `Email`, `Senha`, `Escola`, `Cidade`, `Estado`, `Registro`, `TamanhoLetra`, `FonteLetra`, `EstiloLetra`, `Idioma`) VALUES
(1, 'Fulana da Silva', 'fulano.silva@provedor.com', 'Senha Criptografada', 'Universidade do Estado de Santa Catarina', 'Joinville', 'SC', '2019-03-22 01:05:00.000000', 18, 'Arial ', 'Normal', 'Português'),
(2, 'Ciclana de Souza', 'ciclano.souza@servico.com', 'Senha Criptografada', 'Universidade do Estado de Santa Catarina', 'Joinville', 'SC', '2019-03-22 03:00:10.000000', 22, 'Arial', 'Normal', 'Português'),
(3, 'Beltrano Silva Souza', 'beltrano@provedor.com', 'Senha Criptografada', 'Universidade do Estado de Santa Catarina', 'Joinville', 'SC', '2019-03-23 19:20:10.000000', 20, 'Arial', 'Normal', 'Português');

--
-- Índices para a tabela `Professor`
--

ALTER TABLE `Professor`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT para a tabela `Professor`
--

ALTER TABLE `Professor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;