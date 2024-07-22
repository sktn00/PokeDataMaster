-- Creacion de Tablas desde el Diagrama:

CREATE TABLE `Pokemon` (
  `id` integer PRIMARY KEY,
  `Nombre` varchar(255),
  `Region` varchar(255),
  `Tipo1` varchar(255),
  `Tipo2` varchar(255),
  `Total` integer,
  `HP` integer,
  `Ataque` integer,
  `Defensa` integer,
  `Sp. Atk` integer,
  `Sp. Def` integer,
  `Speed` integer
);

CREATE TABLE `Entrenadores` (
  `id` integer PRIMARY KEY,
  `Nombre` varchar(255),
  `Region` varchar(255),
  `Medallas` varchar(255)
);

CREATE TABLE `Entrenador_Pokemon` (
  `id` integer PRIMARY KEY,
  `Entrenador_id` integer,
  `Pokemon_id` integer,
  `Fecha_Captura` date
);

CREATE TABLE `Batallas` (
  `id` integer PRIMARY KEY,
  `fecha` date,
  `Entrenador_1_id` integer,
  `Entrenador_2_id` integer,
  `Pokemon_1_id` integer,
  `Pokemon_2_id` integer,
  `Resultado` varchar(255)
);

CREATE UNIQUE INDEX `Entrenador_Pokemon_index_0` ON `Entrenador_Pokemon` (`Entrenador_id`, `Pokemon_id`);

ALTER TABLE `Entrenador_Pokemon` ADD FOREIGN KEY (`Entrenador_id`) REFERENCES `Entrenadores` (`id`);

ALTER TABLE `Entrenador_Pokemon` ADD FOREIGN KEY (`Pokemon_id`) REFERENCES `Pokemon` (`id`);

ALTER TABLE `Batallas` ADD FOREIGN KEY (`Entrenador_1_id`) REFERENCES `Entrenadores` (`id`);

ALTER TABLE `Batallas` ADD FOREIGN KEY (`Entrenador_2_id`) REFERENCES `Entrenadores` (`id`);

ALTER TABLE `Batallas` ADD FOREIGN KEY (`Pokemon_1_id`) REFERENCES `Pokemon` (`id`);

ALTER TABLE `Batallas` ADD FOREIGN KEY (`Pokemon_2_id`) REFERENCES `Pokemon` (`id`);

-- Agregar 151 Pokemon de Generacion 1 a la tabla Pokemon

BULK INSERT Pokemon
FROM 'C:\Users\MT\Downloads\pokemon\gen01.csv'
WITH
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  -- Use this if your CSV has a header row
)

-- Agregar Entrenadores de Generacion 1 a la tabla Entrenadores

INSERT INTO Entrenadores (id, Nombre, Region, Medallas) VALUES
(1, 'Red', 'Kanto', 8),
(2, 'Blue', 'Kanto', 8),
(3, 'Misty', 'Kanto', 1),
(4, 'Brock', 'Kanto', 1),
(5, 'Lt. Surge', 'Kanto', 1),
(6, 'Erika', 'Kanto', 1),
(7, 'Koga', 'Kanto', 1),
(8, 'Sabrina', 'Kanto', 1),
(9, 'Blaine', 'Kanto', 1),
(10, 'Giovanni', 'Kanto', 1),
(11, 'Lorelei', 'Kanto', 4),
(12, 'Bruno', 'Kanto', 4),
(13, 'Agatha', 'Kanto', 4),
(14, 'Lance', 'Kanto', 4),
(15, 'Ash Ketchum', 'Kanto', 8),
(16, 'Gary Oak', 'Kanto', 10),
(17, 'Leaf', 'Kanto', 8),
(18, 'Jessie', 'Kanto', 0),
(19, 'James', 'Kanto', 0),
(20, 'Green', 'Kanto', 8),
(21, 'Professor Oak', 'Kanto', 0),
(22, 'Daisy Oak', 'Kanto', 0),
(23, 'Tracey Sketchit', 'Kanto', 0),
(24, 'Bill', 'Kanto', 0),
(25, 'Mr. Fuji', 'Kanto', 0);

-- Agregar los Pokemon a cada Entrenador en la tabla Entrenadores_Pokemon

INSERT INTO Entrenador_Pokemon (id, Entrenador_id, Pokemon_id, Fecha_Captura) VALUES
-- Red
(1, 1, 6, '2024-03-01'),   -- Charizard
(2, 1, 9, '2024-03-02'),   -- Blastoise
(3, 1, 3, '2024-03-03'),   -- Venusaur
(4, 1, 25, '2024-03-04'),  -- Pikachu
(5, 1, 143, '2024-03-05'), -- Snorlax

-- Blue
(7, 2, 18, '2024-03-01'),  -- Pidgeot
(8, 2, 65, '2024-03-02'),  -- Alakazam
(9, 2, 112, '2024-03-03'), -- Rhydon
(10, 2, 130, '2024-03-04'),-- Gyarados
(11, 2, 59, '2024-03-05'), -- Arcanine
(12, 2, 103, '2024-03-06'),-- Exeggutor

-- Misty
(13, 3, 121, '2024-03-01'),-- Starmie
(14, 3, 55, '2024-03-02'), -- Golduck
(15, 3, 134, '2024-03-03'),-- Vaporeon

-- Brock
(16, 4, 95, '2024-03-01'), -- Onix
(17, 4, 74, '2024-03-02'), -- Geodude
(18, 4, 141, '2024-03-03'),-- Kabutops

-- Lt. Surge
(19, 5, 26, '2024-03-01'), -- Raichu
(20, 5, 100, '2024-03-02'),-- Voltorb
(21, 5, 101, '2024-03-03'),-- Electrode
(22, 5, 145, '2024-03-04'),-- Zapdos

-- Erika
(23, 6, 45, '2024-03-01'), -- Vileplume
(24, 6, 71, '2024-03-02'), -- Victreebel
(25, 6, 114, '2024-03-03'),-- Tangela

-- Koga
(26, 7, 109, '2024-03-01'),-- Koffing
(27, 7, 110, '2024-03-02'),-- Weezing
(28, 7, 89, '2024-03-03'), -- Muk
(29, 7, 42, '2024-03-04'), -- Golbat

-- Sabrina
(30, 8, 64, '2024-03-01'), -- Kadabra
(31, 8, 65, '2024-03-02'), -- Alakazam
(32, 8, 122, '2024-03-03'),-- Mr. Mime
(33, 8, 49, '2024-03-04'), -- Venomoth

-- Blaine
(34, 9, 58, '2024-03-01'), -- Growlithe
(35, 9, 77, '2024-03-02'), -- Ponyta
(36, 9, 78, '2024-03-03'), -- Rapidash
(37, 9, 59, '2024-03-04'), -- Arcanine
(38, 9, 146, '2024-03-05'),-- Moltres

-- Giovanni
(39, 10, 111, '2024-03-01'),-- Rhyhorn
(40, 10, 51, '2024-03-02'), -- Dugtrio
(41, 10, 31, '2024-03-03'), -- Nidoqueen
(42, 10, 34, '2024-03-04'), -- Nidoking
(43, 10, 112, '2024-03-05'),-- Rhydon
(44, 10, 150, '2024-03-06'),-- Mewtwo

-- Lorelei
(45, 11, 87, '2024-03-01'), -- Dewgong
(46, 11, 91, '2024-03-02'), -- Cloyster
(47, 11, 124, '2024-03-03'),-- Jynx
(48, 11, 131, '2024-03-04'),-- Lapras
(49, 11, 144, '2024-03-05'),-- Articuno

-- Bruno
(50, 12, 95, '2024-03-01'), -- Onix
(51, 12, 68, '2024-03-02'), -- Machamp
(52, 12, 107, '2024-03-03'),-- Hitmonchan
(53, 12, 106, '2024-03-04'),-- Hitmonlee

-- Agatha
(54, 13, 94, '2024-03-01'), -- Gengar
(55, 13, 42, '2024-03-02'), -- Golbat
(56, 13, 93, '2024-03-03'), -- Haunter
(57, 13, 24, '2024-03-04'), -- Arbok

-- Lance
(58, 14, 130, '2024-03-01'),-- Gyarados
(59, 14, 148, '2024-03-02'),-- Dragonair
(60, 14, 142, '2024-03-03'),-- Aerodactyl
(61, 14, 149, '2024-03-04'),-- Dragonite
(62, 14, 6, '2024-03-05'),  -- Charizard

-- Ash Ketchum
(63, 15, 25, '2024-03-01'), -- Pikachu
(64, 15, 12, '2024-03-02'), -- Butterfree
(65, 15, 17, '2024-03-03'), -- Pidgeotto
(66, 15, 7, '2024-03-04'),  -- Squirtle
(67, 15, 5, '2024-03-05'),  -- Charmeleon

-- Gary Oak
(68, 16, 133, '2024-03-01'),-- Eevee
(69, 16, 59, '2024-03-02'), -- Arcanine
(70, 16, 103, '2024-03-03'),-- Exeggutor
(71, 16, 68, '2024-03-04'), -- Machamp
(72, 16, 130, '2024-03-05'),-- Gyarados

-- Leaf
(73, 17, 3, '2024-03-01'),  -- Venusaur
(74, 17, 18, '2024-03-02'), -- Pidgeot
(75, 17, 40, '2024-03-03'), -- Wigglytuff
(76, 17, 134, '2024-03-04'),-- Vaporeon
(77, 17, 45, '2024-03-05'), -- Vileplume

-- Jessie
(78, 18, 24, '2024-03-01'), -- Arbok
(79, 18, 110, '2024-03-02'),-- Weezing
(80, 18, 52, '2024-03-03'), -- Meowth

-- James
(81, 19, 69, '2024-03-01'), -- Bellsprout
(82, 19, 109, '2024-03-02'),-- Koffing
(83, 19, 70, '2024-03-03'), -- Weepinbell

-- Green
(84, 20, 9, '2024-03-01'),  -- Blastoise
(85, 20, 31, '2024-03-02'), -- Nidoqueen
(86, 20, 38, '2024-03-03'), -- Ninetales
(87, 20, 136, '2024-03-04'),-- Flareon
(88, 20, 73, '2024-03-05'), -- Tentacruel

-- Professor Oak
(89, 21, 1, '2024-03-01'),  -- Bulbasaur
(90, 21, 4, '2024-03-02'),  -- Charmander
(91, 21, 7, '2024-03-03'),  -- Squirtle

-- Daisy Oak
(92, 22, 133, '2024-03-01'),-- Eevee
(93, 22, 35, '2024-03-02'), -- Clefairy

-- Tracey Sketchit
(94, 23, 48, '2024-03-01'), -- Venonat
(95, 23, 83, '2024-03-02'), -- Farfetch'd
(96, 23, 114, '2024-03-03'),-- Tangela

-- Bill
(97, 24, 133, '2024-03-01'),-- Eevee
(98, 24, 137, '2024-03-02'),-- Porygon

-- Mr. Fuji
(99, 25, 104, '2024-03-01'), -- Cubone
(100, 25, 105, '2024-03-02'),-- Marowak
(101, 25, 151, '2024-03-03');-- Mew

-- Agregar columna "Strength" a la tabla Entrenadores, igual a la suma del atributo "Total" de todos los Pokemon de dicho entrenador

ALTER TABLE Entrenadores
ADD Strength INTEGER;

-- Actualizar el valor "Strength"

WITH TrainerStrength AS (
    SELECT 
        ep.Entrenador_id,
        SUM(p.Total) AS TotalStrength
    FROM 
        Entrenador_Pokemon ep
    JOIN 
        Pokemon p ON ep.Pokemon_id = p.id
    GROUP BY 
        ep.Entrenador_id
)
UPDATE e
SET e.Strength = ts.TotalStrength
FROM Entrenadores e
JOIN TrainerStrength ts ON e.id = ts.Entrenador_id;

-- Ver la lista de Entrenadores Pokemon, con los Nombre, Fuerza, Cantidad y Lista

SELECT 
    e.Nombre AS 'Nombre de Entrenador',
	e.Strength AS 'Fuerza',
    COUNT(ep.Pokemon_id) AS 'Cantidad de Pokemon',
    STRING_AGG(p.Nombre, ', ') AS 'Lista de Pokemon'
FROM 
    Entrenadores e
LEFT JOIN 
    Entrenador_Pokemon ep ON e.id = ep.Entrenador_id
LEFT JOIN 
    Pokemon p ON ep.Pokemon_id = p.id
GROUP BY 
    e.id, e.Nombre, e.Strength
ORDER BY 
    'Fuerza' DESC, e.Nombre;

------------------------------------------------------------------------------------
-- Creacion de la tabla BattleResults
------------------------------------------------------------------------------------

-- 1 - Creacion de la tabla

CREATE TABLE BattleResults (
    id INT IDENTITY(1,1) PRIMARY KEY,
    Entrenador_1_id INT,
    Entrenador_2_id INT,
    Winner_id INT,
    Entrenador_1_ELO_Change INT,
    Entrenador_2_ELO_Change INT
);

-- 2 - Agregar valor ELO a la tabla Entrenador

ALTER TABLE Entrenadores ADD ELO INT;

UPDATE Entrenadores SET ELO = 1000;

ALTER TABLE Entrenadores 
ADD CONSTRAINT DF_Entrenadores_ELO DEFAULT 1000 FOR ELO;

-- 3 - Creacion de todas las batallas y Simulacion de resultados

WITH BattlePairs AS (
    SELECT 
        e1.id AS Entrenador_1_id, 
        e2.id AS Entrenador_2_id,
        e1.Strength AS Strength_1,
        e2.Strength AS Strength_2,
        e1.ELO AS ELO_1,
        e2.ELO AS ELO_2
    FROM Entrenadores e1
    CROSS JOIN Entrenadores e2
    WHERE e1.id < e2.id
)
-- Explicación:

--    La cláusula WITH define una Expresión Común de Tabla (CTE) llamada BattlePairs.
--    Genera todos los pares posibles de entrenadores (e1 y e2) de la tabla Entrenadores donde e1.id < e2.id. Esto asegura que cada par se considere una vez para evitar duplicados.
--   Para cada par:
--        Entrenador_1_id y Entrenador_2_id son los IDs de los entrenadores.
--        Strength_1 y Strength_2 son las fortalezas respectivas de los entrenadores.
--        ELO_1 y ELO_2 son las calificaciones ELO iniciales de los entrenadores.
INSERT INTO BattleResults (Entrenador_1_id, Entrenador_2_id, Winner_id, Entrenador_1_ELO_Change, Entrenador_2_ELO_Change)
-- La declaración INSERT INTO BattleResults inserta los resultados simulados de las batallas en la tabla BattleResults.
SELECT 
    Entrenador_1_id,
    Entrenador_2_id,
-- Para cada par de entrenadores de BattlePairs:
-- Winner_id se determina utilizando un generador de números aleatorios (RAND()) combinado con CHECKSUM(NEWID()) para garantizar la aleatoriedad.
-- La probabilidad de que cada entrenador gane se calcula utilizando la diferencia de calificación Elo entre las fortalezas de los entrenadores. La fórmula utilizada es:
    CASE 
        WHEN RAND(CHECKSUM(NEWID())) < 1.0 / (1.0 + POWER(10, (Strength_2 - Strength_1) / 400.0))
        THEN Entrenador_1_id
        ELSE Entrenador_2_id
    END AS Winner_id,
-- Aquí, (Strength_2 - Strength_1) representa la diferencia de fortaleza entre el entrenador 2 y el entrenador 1. La diferencia en la calificación Elo afecta la probabilidad de ganar, con entrenadores más fuertes teniendo una probabilidad más alta.

--Las columnas Entrenador_1_ELO_Change y Entrenador_2_ELO_Change determinan el cambio en la calificación Elo para cada entrenador según si ganaron o perdieron la batalla:
    CASE 
        WHEN RAND(CHECKSUM(NEWID())) < 1.0 / (1.0 + POWER(10, (Strength_2 - Strength_1) / 400.0))
        THEN 25
        ELSE -25
    END AS Entrenador_1_ELO_Change,
-- Entrenador_1_ELO_Change es +25 si Entrenador_1_id gana y -25 si pierde.
    CASE 
        WHEN RAND(CHECKSUM(NEWID())) < 1.0 / (1.0 + POWER(10, (Strength_2 - Strength_1) / 400.0))
        THEN -25
        ELSE 25
    END AS Entrenador_2_ELO_Change
-- Entrenador_2_ELO_Change es -25 si Entrenador_1_id gana y +25 si pierde.
FROM BattlePairs;

-- Ejemplo:

-- Supongamos que tenemos dos entrenadores:

-- - Entrenador 1 (`Strength_1 = 1500`, `ELO_1 = 1000`)
-- - Entrenador 2 (`Strength_2 = 1600`, `ELO_2 = 1000`)

-- La probabilidad de que el Entrenador 2 gane se puede calcular como:

1.0 / (1.0 + POWER(10, (1500 - 1600) / 400.0)) 
-- Calcula 10 elevado a la potencia de la diferencia de fortaleza entre dos entrenadores dividida por 400.0
-- Esto equivale aproximadamente a 0.3595


-- Por lo tanto, la probabilidad de que el Entrenador 1 gane es `1 - 0.3595 = 0.6405`.

-- Cuando se simula la batalla:
-- - Supongamos que el generador de números aleatorios genera `0.6`.
-- - Como `0.6 > 0.6405`, el Entrenador 2 (`Entrenador_2_id`) gana la batalla.

-- Por lo tanto, el `Winner_id` sería `Entrenador_2_id`, y `Entrenador_1_ELO_Change` sería `-25`, mientras que `Entrenador_2_ELO_Change` sería `+25`.

-- Este proceso se repite para cada par de entrenadores, simulando las batallas e insertando los resultados en la tabla `BattleResults` según corresponda.

------------------------------------------------------------------------------------

-- Muestra de todos los resultados

SELECT
    t1.Nombre AS Trainer1_Name,
    t1.Strength AS Trainer1_Strength,
    t2.Nombre AS Trainer2_Name,
    t2.Strength AS Trainer2_Strength,
    CASE
        WHEN br.Winner_id = t1.id THEN t1.Nombre
        ELSE t2.Nombre
    END AS Winner_Name,
    br.Entrenador_1_ELO_Change AS Trainer1_ELO_Change,
    br.Entrenador_2_ELO_Change AS Trainer2_ELO_Change
FROM
    BattleResults br
    INNER JOIN Entrenadores t1 ON br.Entrenador_1_id = t1.id
    INNER JOIN Entrenadores t2 ON br.Entrenador_2_id = t2.id
ORDER BY
   br.id;

-- Muestra de solo los resultados donde el ganador tiene menos Fuerza que su oponente

SELECT
    t1.Nombre AS Trainer1_Name,
    t1.Strength AS Trainer1_Strength,
    t2.Nombre AS Trainer2_Name,
    t2.Strength AS Trainer2_Strength,
    CASE
        WHEN br.Winner_id = t1.id THEN t1.Nombre
        ELSE t2.Nombre
    END AS Winner_Name,
    ABS(t1.Strength - t2.Strength) AS Strength_Difference,
    br.Entrenador_1_ELO_Change AS Trainer1_ELO_Change,
    br.Entrenador_2_ELO_Change AS Trainer2_ELO_Change
FROM
    BattleResults br
    INNER JOIN Entrenadores t1 ON br.Entrenador_1_id = t1.id
    INNER JOIN Entrenadores t2 ON br.Entrenador_2_id = t2.id
WHERE
    (br.Winner_id = t1.id AND t1.Strength < t2.Strength) OR
    (br.Winner_id = t2.id AND t2.Strength < t1.Strength)
ORDER BY
    Strength_Difference DESC, Trainer1_Name, Trainer2_Name;

-- Actualizar el ELO de cada Entrenador

UPDATE e
SET e.ELO = e.ELO + 
    (SELECT SUM(CASE 
                    WHEN br.Entrenador_1_id = e.id THEN br.Entrenador_1_ELO_Change
                    WHEN br.Entrenador_2_id = e.id THEN br.Entrenador_2_ELO_Change
                    ELSE 0
                END)
     FROM BattleResults br
     WHERE br.Entrenador_1_id = e.id OR br.Entrenador_2_id = e.id)
FROM Entrenadores e;

-- Mostrar tabla de Entrenador con su fuerza, ELO, victorias y derrotas

SELECT 
    e.Nombre AS Trainer_Name,
    e.Strength AS Original_Strength,
    e.ELO AS New_ELO,
    (SELECT COUNT(*) FROM BattleResults WHERE Winner_id = e.id) AS Wins,
    (SELECT COUNT(*) FROM BattleResults WHERE (Entrenador_1_id = e.id OR Entrenador_2_id = e.id) AND Winner_id != e.id) AS Losses
FROM Entrenadores e
ORDER BY e.ELO DESC;
