#1번
SELECT `id`, `c3`, `c5` FROM `crud` WHERE `c1` = 11 AND `c2` = 2;
#2번
SELECT * FROM `crud` WHERE `c1` > 18 OR `c2` < 2;
#3번
INSERT INTO `crud` VALUES (DEFAULT, 7, 4, "col101", DEFAULT, 0);
#4번
INSERT INTO `crud` VALUES (103, 3, 3, "col103", DEFAULT, 1);
#5번
SELECT * FROM `crud` WHERE `id` > 100;
#6번
UPDATE `crud` SET `c3` = "col0", `c5` = 0 WHERE `c1` > 4 AND `c1` < 9 AND `c2` = 1;
#7번
SELECT * FROM `crud` WHERE `c1` > 4 AND `c1` < 9 AND `c2` = 1;
#8번
DELETE FROM `crud` WHERE `c5` = 0;
#9번
SELECT * FROM `crud` WHERE `c5` = 0;