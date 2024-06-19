CREATE DATABASE  IF NOT EXISTS `bar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bar`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bar
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  ` CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY (` CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Кирилл','89201805526@mail.ru','89201805526'),(2,'Степа','stepan@mail.ru','89040071792'),(3,'Гоша','goshan1488@mail.ru','89001191820');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinks` (
  `DrinkID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `ingredients` text,
  PRIMARY KEY (`DrinkID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
INSERT INTO `drinks` VALUES (1,'коровка','alcohol',190,'6 ст. сахара, 1 ст.л. какао, 100 г сливочного масла, 2 стакана молока, 3 яйца'),(2,'личи банан','alcohol',190,'водка, мякоть ягод личи,  сахар, вода'),(3,'хреновуха','alcohol',190,'корень хрена, мёд, водка, лимонный сок, имбирь'),(4,'лемонграсс ментол','alcohol',150,NULL),(5,'лимончелло','alcohol',190,'лимоны, сахар, водка, спирт, молоко'),(6,'укропная','alcohol',150,'зонтики укропа, водка, чеснок, сахар, свежие листики укропа'),(7,'копченая груша','alcohol',150,'копченая груша, водка, апельсиновая цедра, изюм, сахар'),(8,'кинза цитрус','alcohol',150,NULL),(9,'брусника мята','alcohol',190,'водка, брусника, мята, мёд, сахар'),(10,'васабиха','alcohol',190,'текила, апельсиновый ликер, сок лимона, васаби, соль, лед, лайм'),(11,'New Drink','alcohol',100,NULL),(12,'New Drink','alcohol',100,NULL);
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Roles_RoleID` int NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `fk_Employees_Roles1_idx` (`Roles_RoleID`),
  CONSTRAINT `fk_Employees_Roles1` FOREIGN KEY (`Roles_RoleID`) REFERENCES `mydb`.`roles` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `DrinkID` int NOT NULL,
  `Quantity` int NOT NULL,
  `OrderDateTime` datetime DEFAULT NULL,
  `TotalPrice` int NOT NULL,
  `Customers_ CustomerID` int NOT NULL,
  `Drinks_ DrinkID` int NOT NULL,
  `Employees_EmployeeID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_Customers_idx` (`Customers_ CustomerID`),
  KEY `fk_Orders_Drinks1_idx` (`Drinks_ DrinkID`),
  KEY `fk_Orders_Employees1_idx` (`Employees_EmployeeID`),
  CONSTRAINT `fk_Orders_Customers` FOREIGN KEY (`Customers_ CustomerID`) REFERENCES `mydb`.`customers` (` CustomerID`),
  CONSTRAINT `fk_Orders_Drinks1` FOREIGN KEY (`Drinks_ DrinkID`) REFERENCES `mydb`.`drinks` (` DrinkID`),
  CONSTRAINT `fk_Orders_Employees1` FOREIGN KEY (`Employees_EmployeeID`) REFERENCES `mydb`.`employees` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateDrinkQuantity` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    DECLARE DrinkID INT;
    DECLARE Quantity INT;

    SET DrinkID = NEW.DrinkID;
    SET Quantity = NEW.Quantity;

    UPDATE drinks SET quantity = quantity - quantity WHERE id = drink_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(100) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Бармен'),(2,'Официант'),(3,'Администратор'),(4,'Повар'),(5,'Уборщик');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `topcustomers`
--

DROP TABLE IF EXISTS `topcustomers`;
/*!50001 DROP VIEW IF EXISTS `topcustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `topcustomers` AS SELECT 
 1 AS `name`,
 1 AS `num_orders`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bar'
--

--
-- Dumping routines for database 'bar'
--
/*!50003 DROP FUNCTION IF EXISTS `GetDrinkPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetDrinkPrice`(drink_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE price DECIMAL(10,2);

    SELECT price INTO price FROM drinks WHERE id = drink_id;

    RETURN price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOrderAndUpdateDrinkQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddOrderAndUpdateDrinkQuantity`(
  IN CustomerID INT,
  IN DrinkID INT,
  IN Quantity INT
)
BEGIN
    -- Объявление переменных
    DECLARE drinkPrice DECIMAL(10,2);
    DECLARE availableQuantity INT;
    DECLARE totalPrice DECIMAL(10,2);

    SELECT price INTO drinkPrice FROM drinks WHERE id = drinkId;
    SELECT available_quantity INTO availableQuantity FROM drinks WHERE id = drinkId;

    -- Начало транзакции
    START TRANSACTION;

    -- Проверка доступности напитка
    IF availableQuantity >= quantity THEN
        -- Добавление заказа
        INSERT INTO orders (customer_id, drink_id, quantity, order_datetime, total_price)
        VALUES (customerId, drinkId, quantity, NOW(), quantity * drinkPrice);

        -- Обновление количества доступных напитков
        UPDATE drinks SET available_quantity = available_quantity - quantity WHERE id = drinkId;

        -- Фиксирование транзакции
        COMMIT;

        SELECT 'Заказ успешно добавлен и количество доступных напитков обновлено';
    ELSE
        -- Отмена транзакции
        ROLLBACK;

        SELECT 'Недостаточно доступного количества напитка для выполнения заказа';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMostPopularDrinks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMostPopularDrinks`()
BEGIN
    DECLARE drink_name VARCHAR(255);
    DECLARE num_orders INT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT drink_name, COUNT(*) AS num_orders FROM orders GROUP BY drink_name ORDER BY num_orders DESC LIMIT 5;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO drink_name, num_orders;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT drink_name, num_orders;
    END LOOP;
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MyBarProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MyBarProcedure`()
BEGIN
    DECLARE mostPopularDrink VARCHAR(255);
    DECLARE totalRevenue DECIMAL(10,2);
    DECLARE numOrders INT;

    -- Получение самого популярного напитка в баре
    SELECT drink_name INTO mostPopularDrink
    FROM (
        SELECT drink_name, COUNT(*) as num_orders
        FROM orders
        GROUP BY drink_name
        ORDER BY num_orders DESC
        LIMIT 1
    ) tmp;

    -- Получение общей выручки от продаж напитков в баре
    SELECT SUM(price) INTO totalRevenue
    FROM orders;

    -- Получение количества заказов в баре
    SELECT COUNT(*) INTO numOrders
    FROM orders;

    -- Вывод результатов
    SELECT mostPopularDrink, totalRevenue, numOrders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PlaceOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PlaceOrder`(IN order_id INT, IN customer_id INT, IN drink_id INT, IN quantity INT)
BEGIN
    DECLARE drink_price DECIMAL(10,2);
    DECLARE total_cost DECIMAL(10,2);
    DECLARE drink_quantity INT;

    SELECT price INTO drink_price FROM drinks WHERE id = drink_id;
    SELECT quantity INTO drink_quantity FROM drinks WHERE id = drink_id;

    IF quantity > drink_quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough drink quantity in stock';
    ELSE
        SET total_cost = drink_price * quantity;

        INSERT INTO orders(id, customer_id, drink_id, quantity, total_cost)
        VALUES(order_id, customer_id, drink_id, quantity, total_cost);

        UPDATE drinks SET quantity = quantity - quantity WHERE id = drink_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `topcustomers`
--

/*!50001 DROP VIEW IF EXISTS `topcustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topcustomers` AS select `customers`.`Name` AS `name`,count(`orders`.`OrderID`) AS `num_orders` from (`customers` join `orders` on((`orders`.`CustomerID` = `orders`.`CustomerID`))) group by `customers`.`Name` order by `num_orders` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19  7:48:21
