CREATE TABLE `users` (
`id` INT NOT NULL AUTO_INCREMENT,
`user_id` VARCHAR(20) NOT NULL,
`user_pw` VARCHAR(20) NOT NULL,
`user_name` VARCHAR(20) NOT NULL,
`profile_link` VARCHAR(200) NOT NULL,
`profile_msg` VARCHAR(100) NOT NULL,
`quit` TINYINT(1) DEFAULT 0 NOT NULL,
`create_date` INT NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
`id` INT NOT NULL AUTO_INCREMENT,
`channel_name` VARCHAR(20) NOT NULL,
`channel_owner` INT NOT NULL,
`channel_link` VARCHAR(200) NOT NULL,
`max_viewer` INT NOT NULL,
`quit` TINYINT(1) DEFAULT 0 NOT NULL,
`create_date` INT NOT NULL,
FOREIGN KEY (`channel_owner`)
REFERENCES `users`(`id`) ON DELETE CASCADE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
`id` INT NOT NULL AUTO_INCREMENT,
`chat_content` VARCHAR(400) NOT NULL,
`chat_user` INT NOT NULL,
`chat_channel` INT NOT NULL,
`create_date` INT NOT NULL,
FOREIGN KEY (`chat_user`)
REFERENCES `users`(`id`) ON DELETE CASCADE,
FOREIGN KEY (`chat_channel`)
REFERENCES `channels`(`id`) ON DELETE CASCADE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
`id` INT NOT NULL AUTO_INCREMENT,
`followers` INT NOT NULL,
`followees` INT NOT NULL,
`follow_date` INT NOT NULL,
FOREIGN KEY (`followers`)
REFERENCES `users`(`id`) ON DELETE CASCADE,
FOREIGN KEY (`followees`)
REFERENCES `users`(`id`) ON DELETE CASCADE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
`id` INT NOT NULL AUTO_INCREMENT,
`block_user` INT NOT NULL,
`blocked_user` INT NOT NULL,
`follow_date` INT NOT NULL,
FOREIGN KEY (`block_user`)
REFERENCES `users`(`id`) ON DELETE CASCADE,
FOREIGN KEY (`blocked_user`)
REFERENCES `users`(`id`) ON DELETE CASCADE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;