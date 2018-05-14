CREATE database mydb;
use mydb;

CREATE table themes(
	idTheme INT(10) NOT NULL PRIMARY KEY,
    theme VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE table words(
	idWord INT(10) NOT NULL PRIMARY KEY,
    word VARCHAR(50),
    mean VARCHAR(50),
    idTheme INT(10),
    FOREIGN KEY (idTheme) REFERENCES themes (idTheme) ON DELETE RESTRICT ON
	UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO themes(idTheme, theme) VALUES
(1, "Animals"),
(2, "Occupations"),
(3, "Plants"),
(4, "Clothes"),
(5, "Drinks");

INSERT INTO words(idWord, word, mean, idTheme) VALUES
(1, "chicken", "gà", 1),
(2, "bear", "gấu", 1),
(3, "monkey", "khỉ", 1),
(4, "tiger", "hổ", 1),
(5, "rhinoceros", "tê giác", 1),
(6, "pharmacist ", "dược sĩ", 2),
(7, "mechanic ", "thợ máy", 2),
(8, "barber ", "thợ cắt tóc", 2),
(9, "tailor ", "thợ may", 2),
(10, "teacher", "giáo viên", 2),
(11, "tree", "cây", 3),
(12, "trunk", "thân cây", 3),
(13, "leaf", "lá cây", 3),
(14, "branch", "cành cây", 3),
(15, "spine", "gai", 3),
(16, "jacket", "áo khoác", 4),
(17, "dress", "váy", 4),
(18, "jeans", "quần bò", 4),
(19, "boots", "ủng", 4),
(20, "hat", "mũ", 4),
(21, "beer", "bia" ,5),
(22, "coffee", "cà phê", 5),
(23, "milk" , "sữa", 5),
(24, "tea", "trà", 5),
(25, "soda", "nước ngọt có ga", 5);

