# База данных для бара "Кооператив"

# Типовые запросы:
Получение всех заказов клиента

```SQL
SELECT o.id, o.order_date, d.title AS drink_title, od.quantity AS drink_quantity, 
       (d.price * od.quantity) AS total_price
FROM Orders o
JOIN Ordered_Drinks od ON o.id = od.orders_id
JOIN Drinks d ON od.drinks_id = d.id
JOIN Customers c ON o.customers_id = c.id
WHERE c.name = 'Иван';  -- Можно заменить на нужного клиента
```
Получение списка всех напитков с их количеством на складе
```SQL
SELECT title, quantity, price
FROM Drinks
WHERE quantity > 0;  -- Показывать только те напитки, которые есть в наличии
```
Получение общей суммы заказа по номеру заказа
```SQL
SELECT o.id, SUM(d.price * od.quantity) AS total_price
FROM Orders o
JOIN Ordered_Drinks od ON o.id = od.orders_id
JOIN Drinks d ON od.drinks_id = d.id
WHERE o.id = 1  -- Замените на нужный id заказа
GROUP BY o.id;
```

Список заказов, выполненных барменом
```SQL
SELECT o.id, o.order_date, c.name AS client_name, SUM(d.price * od.quantity) AS total_price
FROM Orders o
JOIN Ordered_Drinks od ON o.id = od.orders_id
JOIN Drinks d ON od.drinks_id = d.id
JOIN Customers c ON o.customers_id = c.id
WHERE o.staff_id = (SELECT id FROM Staff WHERE login = 'barmen')  -- Заменить на логин бармена
GROUP BY o.id, o.order_date, client_name;
```

Обновление количества напитков на складе после продажи
```SQL
START TRANSACTION;
-- Уменьшение количества напитка на складе
UPDATE Drinks
SET quantity = quantity - 1  -- Например, продан 1 напиток
WHERE id = 1;  -- Замените на id нужного напитка

-- Добавление информации в таблицу заказов
INSERT INTO Ordered_Drinks (orders_id, drinks_id, quantity)
VALUES (1, 1, 2);  -- Замените на актуальные данные

COMMIT;
```

# Роли и пользователи
```SQL
-- Создание роли для админа
CREATE ROLE IF NOT EXISTS `admin`;

-- Разрешение на просмотр, добавление и редактирования работников.
GRANT SELECT, INSERT, UPDATE ON `staff` TO `admin`;

-- Разрешение на просмотр, добавление и удаление заказаных напитков.
GRANT SELECT, INSERT, DELETE ON `ordered_drinks` TO `admin`;

-- Разрешение на просмотр, добавление и удаление вложений для заказов.
GRANT SELECT, INSERT, DELETE ON `orders` TO `admin`;

-- Разрешение на все действия над напитками
GRANT ALL PRIVILEGES  ON `drinks` TO `admin`;

-- Разрешение на просмотр, добавление и удаление клиентов.
GRANT SELECT, INSERT, DELETE ON `customers` TO `admin`;

-- Создание пользователя:
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY '1488';

-- Назначение роли пользователю:
GRANT `admin` TO 'admin'@'localhost';

-- Устанавливается роль admin как роль по умолчанию для пользователя 'admin':
SET DEFAULT ROLE `admin` TO 'admin'@'localhost';

-- Сохранение изменений
FLUSH PRIVILEGES;
```

Технические требования:

+ Чтобы все запустить надо открыть MySQL Workbanch
+ Открыть dump.sql в редакторе
+ Нажать на иконку молнии
