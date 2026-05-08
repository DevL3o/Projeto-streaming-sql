-- Ativando a checagem de chaves estrangeiras no SQLite (Regra de Ouro)
PRAGMA foreign_keys = ON;

-- ==========================================
-- 🧹 LIMPEZA DO TERRENO (Ordem Inversa)
-- ==========================================
DROP TABLE IF EXISTS WatchHistory;
DROP TABLE IF EXISTS Movie_Genres;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Plans;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Genres;

-- ==========================================
-- 🏗️ CRIAÇÃO DAS TABELAS (Ordem de Independência)
-- ==========================================

-- 1. Tabela de Planos de Assinatura
CREATE TABLE Plans (
    PlanID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(50) NOT NULL, -- Ex: Basic, Premium
    Price REAL NOT NULL,
    MaxScreens INTEGER NOT NULL
);

-- 2. Tabela de Usuários
CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATE DEFAULT CURRENT_DATE,
    PlanID INTEGER,
    -- A chave estrangeira liga o usuário ao plano dele
    FOREIGN KEY (PlanID) REFERENCES Plans(PlanID)
);

-- 3. Tabela de Filmes
CREATE TABLE Movies (
    MovieID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title VARCHAR(200) NOT NULL,
    ReleaseYear INTEGER,
    DurationMinutes INTEGER
);

-- 4. Tabela de Gêneros
CREATE TABLE Genres (
    GenreID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(50) NOT NULL
);

-- 5. A Tabela Associativa (Onde a mágica do Muitos-para-Muitos acontece)
CREATE TABLE Movie_Genres (
    MovieID INTEGER,
    GenreID INTEGER,
    -- A chave primária aqui é a união dos dois IDs!
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- 6. Histórico de Visualização (O coração da sua análise de dados no futuro)
CREATE TABLE WatchHistory (
    HistoryID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    MovieID INTEGER,
    WatchDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    MinutesWatched INTEGER,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);