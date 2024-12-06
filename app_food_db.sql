/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `food_id` (`food_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Phở', 'link', 30000, 'Tinh hoa nên ẩm thực Việt', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(2, 'Bánh mì', 'link', 20000, 'Đậm đà hương vị', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(3, 'Gỏi cuốn', 'link', 50000, 'Đặc sắc', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(4, 'Bún bò', 'link', 25000, 'Hương vị độc đáo', 1),
(5, 'Bánh bao', 'link', 12000, 'Ngon tuyệt', 2);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Món nước');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Món khô');


INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(7, 3, '2024-12-09 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(6, 4, '2024-12-09 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(5, 3, '2024-12-09 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-12-09 00:00:00'),
(8, 5, '2024-12-09 00:00:00'),
(9, 6, '2024-12-09 00:00:00'),
(9, 6, '2024-12-09 00:00:00'),
(2, 6, '2024-12-09 00:00:00'),
(7, 2, '2024-12-09 00:00:00'),
(4, 3, '2024-12-09 00:00:00'),
(6, 3, '2024-12-09 00:00:00'),
(11, 4, '2024-12-09 00:00:00'),
(10, 2, '2024-12-09 00:00:00'),
(7, 2, '2024-12-09 00:00:00'),
(2, 2, '2024-12-09 00:00:00'),
(1, 2, '2024-12-09 00:00:00'),
(9, 2, '2024-12-09 00:00:00'),
(5, 2, '2024-12-09 00:00:00'),
(8, 2, '2024-12-09 00:00:00'),
(9, 2, '2024-12-09 00:00:00'),
(9, 2, '2024-12-09 00:00:00'),
(10, 2, '2024-12-09 00:00:00'),
(5, 2, '2024-12-09 00:00:00'),
(4, 2, '2024-12-09 00:00:00'),
(1, 2, '2024-12-09 00:00:00');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 3, 1, '111', '1,2,5');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(5, 5, 1, '111', '1,2,6');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(7, 4, 1, '111', '2,3');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 1, 1, '111', '4'),
(9, 2, 1, '111', '1,6'),
(7, 3, 1, '111', '2'),
(11, 2, 1, '111', '5,6'),
(8, 2, 1, '111', '2,4,5,6'),
(11, 1, 1, '111', '1,2'),
(5, 5, 1, '111', '1,2,5'),
(11, 3, 1, '111', '3'),
(8, 3, 1, '111', '4'),
(11, 4, 1, '111', '3,4,5');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 8, '2024-10-09 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(6, 3, 8, '2024-10-09 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(7, 6, 8, '2024-10-09 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(11, 6, 8, '2024-10-09 00:00:00'),
(2, 6, 8, '2024-10-09 00:00:00'),
(8, 6, 8, '2024-10-09 00:00:00'),
(10, 6, 8, '2024-10-09 00:00:00'),
(4, 2, 8, '2024-10-09 00:00:00'),
(8, 4, 8, '2024-10-09 00:00:00'),
(9, 3, 8, '2024-10-09 00:00:00'),
(4, 4, 8, '2024-10-09 00:00:00'),
(2, 4, 8, '2024-10-09 00:00:00'),
(1, 4, 8, '2024-10-09 00:00:00'),
(9, 4, 8, '2024-10-09 00:00:00'),
(9, 4, 8, '2024-10-09 00:00:00'),
(9, 4, 8, '2024-10-09 00:00:00'),
(6, 3, 8, '2024-10-09 00:00:00'),
(5, 2, 8, '2024-10-09 00:00:00'),
(5, 4, 8, '2024-10-09 00:00:00'),
(4, 4, 8, '2024-10-09 00:00:00'),
(4, 4, 8, '2024-10-09 00:00:00'),
(2, 4, 8, '2024-10-09 00:00:00'),
(2, 4, 8, '2024-10-09 00:00:00'),
(1, 4, 8, '2024-10-09 00:00:00'),
(1, 4, 8, '2024-10-09 00:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'Lotte', 'link', 'Cung cấp những món ăn ngon');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(2, 'KFC', 'link', 'Nhà hàng cung cấp số 1 Việt Nam');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(3, 'Metiz', 'link', 'Đò ăn ở đây khá tuyệt');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(4, 'McDonald', 'link', 'Quá nổi tiếng'),
(5, '7 Eleven', 'link', 'Nhanh gọn'),
(6, 'Texas', 'link', 'Quá tuyệt vời');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Quẩy', 12000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Chả bò', 10000, 4);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Thịt luộc', 20000, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Rau sống', 5000, 1),
(5, 'Rau sống', 5000, 4),
(6, 'Xá xíu', 7000, 2);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyễn Văn Cường', 'cuong@gmail.com', '123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Trần Lê Bình', 'lbinh@gmail.com', '123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Lê Hoàng', 'lh@gmail.com', '123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Lý Văn Thông', 'lythong@gmail.com', '123'),
(5, 'Thạch Sanh', 'ts123@gmail.com', '123'),
(6, 'Nguyễn Thuỳ Trang', 'ntt@gmail.com', '123'),
(7, 'Trần Phương Thuỷ', 'tpt@gmail.com', '123'),
(8, 'Đoàn Văn Dũng', 'ddd@gmail.com', '123'),
(9, 'Trần Thị Lý', 'ttl@gmail.com', '123'),
(10, 'Nguyễn Văn Đức', 'nvd@gmail.com', '123'),
(11, 'Hoàng Văn Nghĩa', 'hvn@gmail.com', '123');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;