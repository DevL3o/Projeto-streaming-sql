-----------------------------AQUI ESTOU PROCURANDO O NOME DOS USUÁRIOS E O NOME DO PLANO QUE ESTÃO ASSINANDO--------------------------------------------------

SELECT u.Name as nome_usuario, p.name as plano_assinado, p.Price as valor_mensalidade FROM  Users u 
INNER JOIN Plans p ON u.PlanID  = p.PlanID;

-----------------------------------------------AQUI ESTOU PEGANDO OS TITULOS E SEUS GENEROS------------------------------------------------------------------ 

SELECT m.Title, g.Name  FROM Movies m
INNER JOIN Movie_Genres mg ON  m.MovieID = mg.MovieID 
INNER JOIN Genres g ON mg.GenreID = g.GenreID 
ORDER BY m.Title DESC;

------------------------------------------------AQUI ESTOU PEGANDO QUAIS USUÁRIOS PASSA MAIS TEMPO ASSISTINDO------------------------------------------------

SELECT u.Name as cliente, SUM(wh.MinutesWatched ) as total_minutos_assistidos FROM Users u 
INNER JOIN WatchHistory wh on u.UserID = wh.UserID 
GROUP BY u.Name 
ORDER BY total_minutos_assistidos DESC;

------------------------------------------------AQUI PEGUEI QUAL USUÁRIO POSSUI O PLANO PREMIUM--------------------------------------------------------------

SELECT u.Name as nome_usuario, p.name as plano_assinado FROM  Users u 
INNER JOIN Plans p ON u.PlanID  = p.PlanID
WHERE p.Name = 'Premium';

------------------------------------------------AQUI ESTOU PEGANDO O TEMPO TOTAL ASSISTIDO POR GENERO--------------------------------------------------------

SELECT g.Name as Genero, SUM(wh.MinutesWatched ) as Minutos_totais FROM WatchHistory wh 
INNER JOIN Movies m on wh.MovieID = m.MovieID 
INNER JOIN Movie_Genres mg on m.MovieID = mg.MovieID 
INNER JOIN Genres g on mg.GenreID = g.GenreID 
GROUP BY g.Name 
ORDER BY Minutos_totais DESC;

---------------------------------------------AQUI ESTOU ATUALIZANDO O PLANO DE UM USUÁRIO BÁSICO ID 1 PARA ID 3----------------------------------------------

UPDATE Users 
SET PlanID = 3 
WHERE UserId = 3;

---------------------------------------------E AQUI FAZENDO UMA CONSULTA PARA VER SE FOI ATUALIZADO CORRETAMENTE---------------------------------------------

SELECT u.Name, u.PlanID  FROM Users u 
WHERE u.UserID = 3;

------------------------AQUI ESTOU DELETANDO A CONTA DE UM CLIENTE EM DUAS TABELAS E NO FINAL VERIFICANDO SE DEU CERTO COM UM SELECT-------------------------Vai lá

DELETE FROM WatchHistory
WHERE UserID = 1;

DELETE FROM Users 
WHERE UserID = 1;

SELECT * FROM Users u;

-------------------------------------------------------------------------------------------------------------------------------------------------------------














