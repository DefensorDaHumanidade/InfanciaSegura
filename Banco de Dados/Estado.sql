SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-03:00";

-- --------------------------------------------------------

--
-- Estrutura da tabela `Estado`
--

CREATE TABLE `Estado` (
  `Id` int(11) NOT NULL,
  `CodigoUf` int(11) NOT NULL,
  `Nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Uf` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `Regiao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `Estado`
--

INSERT INTO `Estado` (`Id`, `CodigoUf`, `Nome`, `Uf`, `Regiao`) VALUES
(1, 12, 'Acre', 'AC', 1),
(2, 27, 'Alagoas', 'AL', 2),
(3, 16, 'Amapá', 'AP', 1),
(4, 13, 'Amazonas', 'AM', 1),
(5, 29, 'Bahia', 'BA', 2),
(6, 23, 'Ceará', 'CE', 2),
(7, 53, 'Distrito Federal', 'DF', 5),
(8, 32, 'Espírito Santo', 'ES', 3),
(9, 52, 'Goiás', 'GO', 5),
(10, 21, 'Maranhão', 'MA', 2),
(11, 51, 'Mato Grosso', 'MT', 5),
(12, 50, 'Mato Grosso do Sul', 'MS', 5),
(13, 31, 'Minas Gerais', 'MG', 3),
(14, 15, 'Pará', 'PA', 1),
(15, 25, 'Paraíba', 'PB', 2),
(16, 41, 'Paraná', 'PR', 4),
(17, 26, 'Pernambuco', 'PE', 2),
(18, 22, 'Piauí', 'PI', 2),
(19, 33, 'Rio de Janeiro', 'RJ', 3),
(20, 24, 'Rio Grande do Norte', 'RN', 2),
(21, 43, 'Rio Grande do Sul', 'RS', 4),
(22, 11, 'Rondônia', 'RO', 1),
(23, 14, 'Roraima', 'RR', 1),
(24, 42, 'Santa Catarina', 'SC', 4),
(25, 35, 'São Paulo', 'SP', 3),
(26, 28, 'Sergipe', 'SE', 2),
(27, 17, 'Tocantins', 'TO', 1);

--
-- Índices para a tabela `Estado`
--

ALTER TABLE `Estado`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT para a tabela `Estado`
--

ALTER TABLE `Estado`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;