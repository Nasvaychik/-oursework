# База данных для бара "Кооператив"

Это база данных для управления заказами, сотрудниками и скаладом 

```SQL
-- Получение списка всех доступных напитков в баре
SELECT * FROM Drinks;


-- Добавление нового напитка в меню бара

INSERT INTO drinks ( name, price, type) VALUES ('New Drink', 100.0, 'alcohol');



-- Обновление цены существующего напитка
UPDATE Drinks SET price = 12.0 WHERE name = 'Old Drink'
AND DrinkID > 0;

-- Получение списка наиболее популярных напитков в баре за определенный период
SELECT drinks.name, SUM(orders.quantity) as total_sold, SUM(orders.quantity * drinks.price) as total_revenue
FROM orders
JOIN drinks ON orders.DrinkID = drinks.DrinkID
WHERE orders.OrderDateTime >= NOW() - INTERVAL 1 MONTH
GROUP BY drinks.name
ORDER BY total_revenue DESC
LIMIT 5;



-- Получение списка заказов, которые еще не были выполнены барменом
SELECT e.Name AS EmployeeName, r.RoleName 
FROM Employees e 
JOIN Roles r ON e.Roles_RoleID = r.RoleID;
```
Технические требования:

+ Чтобы все запустить надо открыть MySQL Workbanch
+ Открыть dump.sql в редакторе
+ Нажать на иконку молнии
