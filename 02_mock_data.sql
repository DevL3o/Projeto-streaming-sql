-- 1. Inserindo os Planos
INSERT INTO Plans (Name, Price, MaxScreens) VALUES 
('Básico', 19.90, 1),
('Premium', 39.90, 4),
('Família', 59.90, 6);

-- 2. Inserindo Usuários (Note que estamos usando os IDs dos planos que acabamos de criar: 1, 2 e 3)
INSERT INTO Users (Name, Email, PlanID) VALUES 
('João Silva', 'joao@email.com', 2),
('Maria Souza', 'maria@email.com', 3),
('Carlos Pedro', 'carlos@email.com', 1);

-- 3. Inserindo Filmes
INSERT INTO Movies (Title, ReleaseYear, DurationMinutes) VALUES 
('Matrix', 1999, 136),
('O Poderoso Chefão', 1972, 175),
('Vingadores: Ultimato', 2019, 181),
('Interestelar', 2014, 169);

-- 4. Inserindo Gêneros
INSERT INTO Genres (Name) VALUES 
('Ficção Científica'), ('Ação'), ('Drama'), ('Crime');

-- 5. Ligando Filmes e Gêneros (Tabela Associativa Muitos-para-Muitos)
-- Matrix (1) é Ficção (1) e Ação (2)
INSERT INTO Movie_Genres (MovieID, GenreID) VALUES (1, 1), (1, 2);
-- O Poderoso Chefão (2) é Drama (3) e Crime (4)
INSERT INTO Movie_Genres (MovieID, GenreID) VALUES (2, 3), (2, 4);
-- Vingadores (3) é Ação (2) e Ficção (1)
INSERT INTO Movie_Genres (MovieID, GenreID) VALUES (3, 2), (3, 1);
-- Interestelar (4) é Ficção (1) e Drama (3)
INSERT INTO Movie_Genres (MovieID, GenreID) VALUES (4, 1), (4, 3);

-- 6. Simulando o Histórico (Quem assistiu o quê)
INSERT INTO WatchHistory (UserID, MovieID, MinutesWatched) VALUES 
(1, 1, 136), -- João assistiu Matrix inteiro
(1, 4, 60),  -- João assistiu 1h de Interestelar e parou
(2, 2, 175), -- Maria maratonou O Poderoso Chefão
(3, 3, 181); -- Carlos assistiu Vingadores