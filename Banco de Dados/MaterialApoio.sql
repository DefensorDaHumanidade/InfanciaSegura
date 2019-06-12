SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-03:00";

-- --------------------------------------------------------

--
-- Estrutura da tabela `MaterialApoio`
--

CREATE TABLE `MaterialApoio` (
  `Id` int(11) NOT NULL,
  `Tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Analise` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `MaterialApoio`
--

INSERT INTO `MaterialApoio` (`Id`, `Tipo`, `Nome`, `Endereco`, `Analise`) VALUES
(1, 'Livro', 'Pipo e Fifi para bebês', 'https://docs.wixstatic.com/ugd/5117a5_bb37acfb40f14e36a2f9a84c29014933.pdf', 'analisado'),
(2, 'Livro', 'Pipo e FiFI em: Como conversar com as crianças sobre nudez?', 'https://docs.wixstatic.com/ugd/5117a5_dc61270940974548aa8078f2fd46eb54.pdf', 'analisado'),
(3, 'Livro', 'Pipo e Fifi: Prevenção de violência sexual na infância', 'http://www.institutoapicedown.org.br/wp-content/uploads/2017/04/Pipo_Fifi.pdf', 'analisado'),
(4, 'Livro', 'Kiko e a Mão', 'https://biblioteca.sns.gov.pt/wp-content/uploads/2017/05/crescer_Kiko-e-a-ma~o.pdf', 'analisado'),
(5, 'Livro', 'Kiko e a Mão: Aqui ninguém toca!', 'http://www.underwearrule.org/source/PT/text_pt.pdf', 'analisado'),
(6, 'Livro', 'Abuso Sexual: Mitos e Realidade', 'http://bvsms.saude.gov.br/bvs/publicacoes/Abuso_Sexual_mitos_realidade.pdf', 'analisado'),
(7, 'Livro', 'Abuso Sexual: Que violência é essa?', 'http://www.usp.br/cearas/cartilha/cartilha.pdf', 'analisado'),
(8, 'Manual', 'Proteção da Criança e do Adolescente', 'https://www.escoteiros.org.br/arquivos/infantojuvenil/protecao_da_crianca_e_do_adolescente_manual_para_pais.pdf', 'analisado'),
(9, 'Manual', 'Abuso Sexual: Saiba o que é e aprenda a se proteger', 'http://www.mpgo.mp.br/portal/arquivos/2015/05/07/12_30_04_637_Cartilha_Abuso_Sexual_Saiba_o_que_é_e_aprenda_a_se_proteger.pdf', 'analisado'),
(10, 'Cartilha', 'Abuso e Exploração Sexual de Crianças e Adolescentes: A Infância pede Socorro!', 'http://www.conselhodacrianca.al.gov.br/sala-de-imprensa/publicacoes/Cartilha-abuso.pdf', 'analisado'),
(11, 'Guia Escolar', 'Rede de Proteção à Infância: Identificação de sinais de abuso e exploração sexual de crianças e adolescentes', 'http://portaldoprofessor.mec.gov.br/storage/materiais/0000016936.pdf', 'analisado'),
(12, 'Vídeo', 'Como diferenciar um toque de afeto de um toque de abuso sexual?', 'https://www.youtube.com/watch?v=HhIsgHgJqWE', 'analisado'),
(13, 'Vídeo', 'Prevenção ao Abuso Sexual Infantil', 'https://www.youtube.com/watch?v=UlTCQZJtWAs', 'analisado'),
(14, 'Vídeo', 'Defenda-se: autodefesa de crianças contra a violência sexual', 'https://www.youtube.com/watch?v=0mTpFWuyk6g', 'analisado');

--
-- Índices para a tabela `MaterialApoio`
--

ALTER TABLE `MaterialApoio`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT para a tabela `MaterialApoio`
--

ALTER TABLE `MaterialApoio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;
