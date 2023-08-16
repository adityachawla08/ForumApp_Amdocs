-- create database forum_final;
use forum_final;

create table if not exists users(
	user_id int primary key not null auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    creation_date date,
    is_active smallint
);

create table if not exists user_accounts(
	user_id int,
    username varchar(20),
    user_password varchar(20),
    email varchar(50),
    foreign key(user_id) references users(user_id)
);
create table if not exists forum(
	forum_id int primary key not null,
    forum_name varchar(50),
    creation_date date,
    is_active boolean,
    last_message_id int
    -- FOREIGN KEY (last_message_id) REFERENCES new_message(new_msg_id)
);
CREATE TABLE if not exists new_message (
    new_msg_id INT AUTO_INCREMENT PRIMARY KEY,
    msg_subject VARCHAR(20),
    msg_body VARCHAR(100),
    creator_id INT,
    creation_date DATE,
    parent_msg_id INT,
    forum_id INT,
    FOREIGN KEY (creator_id) REFERENCES users(user_id),
    FOREIGN KEY (parent_msg_id) REFERENCES new_message(new_msg_id),
    FOREIGN KEY (forum_id) REFERENCES forum(forum_id)
);

create table if not exists user_forum(
	uf_id int primary key not null,
    user_id int,
    forum_id int,
    creation_date date,
    is_active boolean,
    foreign key(user_id) references users(user_id),
    foreign key(forum_id) references forum(forum_id)
);
create table if not exists msg_recipient(
	mr_id int primary key not null,
    recipient_id int,
    recipient_forum_id int,
    msg_id int,
    is_read boolean,
    foreign key(recipient_id) references users(user_id),
    foreign key(recipient_forum_id) references user_forum(uf_id),
    foreign key(msg_id) references new_message(new_msg_id)
);

-- insert into forum(forum_id,forum_name)
-- values(1,"General"),
-- 	  (2,"Announcement"),
--       (3,"Unofficial");
Select * from user_accounts;
