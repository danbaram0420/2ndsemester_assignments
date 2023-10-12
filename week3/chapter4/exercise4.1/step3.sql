CREATE TABLE `students` (
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL,
`admission` INT NOT NULL,
`department_num` INT NOT NULL,
`personal_id` INT NOT NULL,
`phone` VARCHAR(16) NOT NULL,
`address` VARCHAR(80) NOT NULL,
`credits` INT DEFAULT 0 NOT NULL,
`grades` FLOAT DEFAULT 0.0 NOT NULL,
`attendance` TINYINT(1) DEFAULT 1 NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;