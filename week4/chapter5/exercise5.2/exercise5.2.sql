#1번
SELECT `users`.`id`, `users`.`name`, `tickets`.`seat_number` FROM `tickets` 
INNER JOIN `users` ON `tickets`.`user` = `users`.`id` WHERE `tickets`.`train` = 11 ORDER BY `tickets`.`seat_number` ASC;
#2번
SELECT `users`.`id`, `users`.`name`, Count(`tickets`.`user`) AS `trains_count`, SUM(`trains`.`distance`)/10 AS `total_distance`  FROM `tickets` 
INNER JOIN `users` ON `users`.`id` = `tickets`.`user`
INNER JOIN `trains` ON `trains`.`id` = `tickets`.`train`
GROUP BY `tickets`.`user` ORDER BY `total_distance` DESC LIMIT 0, 6;
#3번

#4번
SELECT `types`.`name`, `source_stn`.`name` AS `src_stn`, `destin_stn`.`name` AS `dst_stn`, `trains`.`departure`, `trains`.`arrival`, Round((`types`.`fare_rate`/100) * (`trains`.`distance`/10), -2) AS `fare` FROM `trains`
INNER JOIN `types` ON `types`.`id` = `trains`.`type`
INNER JOIN `stations` AS `source_stn` ON `source_stn`.`id` = `trains`.`source`
INNER JOIN `stations` AS `destin_stn` ON `destin_stn`.`id` = `trains`.`destination`
ORDER BY `trains`.`departure` ASC;
#5번
SELECT `trains`.`id`, `types`.`name` AS `type`, `source_stn`.`name` AS `src_stn`, `destin_stn`.`name` AS `dst_stn`, Count(`tickets`.`train`) AS `occupied`, `types`.`max_seats` AS `maximum` FROM `trains`
INNER JOIN `types` ON `trains`.`type` = `types`.`id`
INNER JOIN `stations` AS `source_stn` ON `source_stn`.`id` = `trains`.`source`
INNER JOIN `stations` AS `destin_stn` ON `destin_stn`.`id` = `trains`.`destination`
INNER JOIN `tickets` ON `tickets`.`train` = `trains`.`id`
GROUP BY `tickets`.`train` ORDER BY `trains`.`id` ASC;
#6번
