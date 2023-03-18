use hw1;

-- Создание таблицы
CREATE TABLE Mobiles
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    PhoneName VARCHAR(30) NOT NULL,
    Manufacturer VARCHAR(20) NOT NULL,
    Quantity INT DEFAULT 0,
    Price DECIMAL
);

INSERT INTO Mobiles (PhoneName, Manufacturer, Quantity, Price)
VALUES
('IPhone 12', 'Apple', 5, 76000),
('IPhone 14pro', 'Apple', 1, 98000),
('P20 pro', 'Huawei', 3, 36000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 4, 41000);

-- Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT PhoneName, Manufacturer, Price
FROM mobiles
WHERE Quantity > 2;

-- Выведите весь ассортимент товаров марки “Samsung”

SELECT PhoneName, Quantity, Price
FROM Mobiles
WHERE Manufacturer = 'Samsung'