-- Active: 1732943201127@@127.0.0.1@3306@gym

DROP TABLE IF EXISTS `users2`;

CREATE TABLE `users2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`id`	VARCHAR(100)	NOT NULL,
	`password`	VARCHAR(100)	NOT NULL,
	`name`	VARCHAR(100)	NOT NULL,
	`phone`	VARCHAR(20)	NOT NULL,
	`email`	VARCHAR(100)	NOT NULL,
	`birth`	VARCHAR(50)	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`question`	VARCHAR(100)	NOT NULL,
	`answer`	VARCHAR(100)	NOT NULL
);

DROP TABLE IF EXISTS `user_auth2`;

CREATE TABLE `user_auth2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`user_no`	INT	NOT NULL,
	`auth`	VARCHAR(100)	NOT NULL
);

DROP TABLE IF EXISTS `attendance2`;

CREATE TABLE `attendance2` (
	`qr_id`	VARCHAR(100)	NOT NULL PRIMARY KEY,
	`user_no`	INT	NOT NULL,
	`check_time`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `ticket2`;

CREATE TABLE `ticket2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name`	VARCHAR(100)	NOT NULL,
	`price`	INT	NOT NULL,
	`info`	VARCHAR(100)	NOT NULL,
	`type`	VARCHAR(100)	NOT NULL
);

DROP TABLE IF EXISTS `buy_list2`;

CREATE TABLE `buy_list2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`trainer_no`	INT	NOT NULL,
	`user_no`	INT	NOT NULL,
	`buy_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`p_no`	INT	NOT NULL
);

DROP TABLE IF EXISTS `trainer_profile2`;

CREATE TABLE `trainer_profile2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`trainer_no`	INT	NOT NULL,
	`name`	VARCHAR(100)	NOT NULL,
	`info`	VARCHAR(100)	NOT NULL
);

DROP TABLE IF EXISTS `reservation2`;

CREATE TABLE `reservation2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`rv_date`	TIMESTAMP	NOT NULL,
	`user_no`	INT	NOT NULL,
	`tranier_no`	INT	NOT NULL,
	`created_at` TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`canceled_at` TIMESTAMP NULL,
	`enabled` INT NOT NULL DEFAULT 1
);


DROP TABLE IF EXISTS `file2`;

CREATE TABLE `file2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`profile_id`	INT	NOT NULL,
	`type`	VARCHAR(100)	NOT NULL,
	`name`	VARCHAR(100)	NOT NULL,
	`path`	VARCHAR(100)	NOT NULL,
	`size`	VARCHAR(100)	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `comment2`;

CREATE TABLE `comment2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`plan_no`	int	NOT NULL,
	`trainer_no`	INT	NOT NULL,
	`c_content`	VARCHAR(500)	NOT NULL,
	`f_content`	VARCHAR(500)	NOT NULL
);

DROP TABLE IF EXISTS `plan2`;

CREATE TABLE `plan2` (
	`no`	int	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`user_no`	INT	NOT NULL,
	`rv_no`	INT	NULL,
	`plan_name`	VARCHAR(100)	NOT NULL,
	`plan_time`	VARCHAR(100)	NOT NULL
);

DROP TABLE IF EXISTS `board2`;

CREATE TABLE `board2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`user_no`	INT	NOT NULL,
	`title`	VARCHAR(100)	NOT NULL,
	`content`	VARCHAR(500)	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `persistent_logins2`;

CREATE TABLE `persistent_logins2` (
	`username`	VARCHAR(100)	NOT NULL PRIMARY KEY,
	`series`	VARCHAR(100)	NOT NULL,
	`token`	VARCHAR(100)	NOT NULL,
	`last_used`	VARCHAR(100)	NOT NULL
);

DROP TABLE IF EXISTS `answer2`;

CREATE TABLE `answer2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`board_no`	INT	NOT NULL,
	`user_no`	INT	NOT NULL,
	`content`	VARCHAR(500)	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `qr_code2`;

CREATE TABLE `qr_code2` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`user_no`	INT	NOT NULL,
	`uuid`	VARCHAR(100)	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `user_auth2` ADD CONSTRAINT `FK_users_TO_user_auth2_1` FOREIGN KEY (
	`user_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `attendance2` ADD CONSTRAINT `FK_users_TO_attendance2_1` FOREIGN KEY (
	`user_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `buy_list2` ADD CONSTRAINT `FK_users_TO_buy_list2_1` FOREIGN KEY (
	`trainer_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `buy_list2` ADD CONSTRAINT `FK_users_TO_buy_list2_2` FOREIGN KEY (
	`user_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `buy_list2` ADD CONSTRAINT `FK_ticket_TO_buy_list2_1` FOREIGN KEY (
	`p_no`
)
REFERENCES `ticket2` (
	`no`
);

ALTER TABLE `trainer_profile2` ADD CONSTRAINT `FK_users_TO_trainer_profile2_1` FOREIGN KEY (
	`trainer_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `reservation2` ADD CONSTRAINT `FK_users_TO_reservation2_1` FOREIGN KEY (
	`user_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `reservation2` ADD CONSTRAINT `FK_users_TO_reservation2_2` FOREIGN KEY (
	`tranier_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `file2` ADD CONSTRAINT `FK_trainer_profile_TO_file2_1` FOREIGN KEY (
	`profile_id`
)
REFERENCES `trainer_profile2` (
	`no`
);

ALTER TABLE `comment2` ADD CONSTRAINT `FK_plan_TO_comment2_1` FOREIGN KEY (
	`plan_no`
)
REFERENCES `plan2` (
	`no`
);

ALTER TABLE `comment2` ADD CONSTRAINT `FK_users_TO_comment2_1` FOREIGN KEY (
	`trainer_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `plan2` ADD CONSTRAINT `FK_users_TO_plan2_1` FOREIGN KEY (
	`user_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `plan2` ADD CONSTRAINT `FK_reservation_TO_plan2_1` FOREIGN KEY (
	`rv_no`
)
REFERENCES `reservation2` (
	`no`
);

ALTER TABLE `board2` ADD CONSTRAINT `FK_users_TO_board2_1` FOREIGN KEY (
	`user_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `answer2` ADD CONSTRAINT `FK_board_TO_answer2_1` FOREIGN KEY (
	`board_no`
)
REFERENCES `board2` (
	`no`
);

ALTER TABLE `answer2` ADD CONSTRAINT `FK_users_TO_answer2_1` FOREIGN KEY (
	`user_no`
)
REFERENCES `users2` (
	`no`
);

ALTER TABLE `qr_code2` ADD CONSTRAINT `FK_users_TO_qr_code2_1` FOREIGN KEY (
	`user_no`
)
REFERENCES `users2` (
	`no`
);

