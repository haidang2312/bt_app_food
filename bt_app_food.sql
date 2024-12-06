

CREATE TABLE `user` (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255)
)

CREATE TABLE restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	`desc` VARCHAR(255)
)

CREATE TABLE rate_res(
	user_id INT,
	res_id INT,
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
	amount INT,
	date_rate DATETIME
)

CREATE TABLE like_res(
	user_id INT,
	res_id INT,
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
	date_like DATETIME
)



CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	`desc` VARCHAR(255),
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)

CREATE TABLE sub_food(
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)


CREATE TABLE `order`(
	user_id INT,
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES food(food_id),
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255)
)


-- tìm 5 người đã like nhà hàng nhiều nhất
SELECT `user`.user_id, `user`.full_name AS 'Người dùng like nhiều nhất', `user`.email, `user`.`password`, COUNT(like_res.res_id) AS 'Lượt like'
FROM like_res
INNER JOIN `user` ON like_res.user_id = `user`.user_id
GROUP BY like_res.user_id
ORDER BY `Lượt like` DESC
LIMIT 5

-- tìm 2 nhà hàng có lượt like nhiều nhất
SELECT restaurant.res_id, restaurant.res_name AS 'Nhà hàng có lượt like nhiều nhất', COUNT(like_res.res_id) AS 'Số lượt được like'
FROM like_res
INNER JOIN restaurant on like_res.res_id = restaurant.res_id
GROUP BY like_res.res_id
ORDER BY `Số lượt được like` DESC
LIMIT 2


-- tìm người đã đặt hàng nhiều nhất
SELECT `user`.user_id, `user`.full_name AS 'Người dùng đặt hàng nhiều nhất', `user`.email, `user`.`password`, COUNT(`order`.user_id) AS 'Số lượt đặt'
FROM `order`
INNER JOIN `user` ON `order`.user_id = `user`.user_id
GROUP BY `order`.user_id
ORDER BY `Số lượt đặt` DESC
LIMIT 1


-- tìm người dùng không hoạt động

SELECT `user`.user_id, `user`.full_name 'Người dùng không hoạt động', `user`.email
FROM `user`
LEFT JOIN like_res ON like_res.user_id = `user`.user_id
LEFT JOIN rate_res ON rate_res.user_id = `user`.user_id
LEFT JOIN `order` ON `order`.user_id = `user`.user_id
WHERE `order`.user_id IS NULL AND like_res.user_id IS NULL AND rate_res.user_id IS NULL

