CREATE TABLE dbo.businessentity_details (
    BusinessEntityID INT,
    AccountNumber VARCHAR(15) NOT NULL UNIQUE,
    Address VARCHAR(250) NOT NULL,
    Contact VARCHAR(100) NOT NULL,
    Email VARCHAR(250) NOT NULL,
    Comment VARCHAR(MAX),
    FOREIGN KEY (BusinessEntityID) REFERENCES dbo.BusinessEntities (ID)
);

ALTER TABLE dbo.businessentity_details
ADD CONSTRAINT UC_AccountNumber UNIQUE (AccountNumber);

ALTER TABLE dbo.businessentity_details
ADD CONSTRAINT CHK_Email CHECK (Email LIKE '%@%.%');

ALTER TABLE dbo.businessentity_details
ADD CONSTRAINT CHK_Contact CHECK (LEFT(Contact, 2) = '07');

UPDATE dbo.businessentity_details
SET Comment = 'Nema zabaleshka za smetka na all columns'
WHERE 1=1; -- This condition updates all rows in the table

CREATE FUNCTION dbo.CalculateTotalOrdersPerProduct
(
    @ProductId INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalOrders DECIMAL(10,2);
    
    SELECT @TotalOrders = SUM(Quantity)
    FROM dbo.OrderDetails
    WHERE ProductId = @ProductId;
    
    RETURN @TotalOrders;
END;

CREATE VIEW dbo.GranolaView AS
SELECT TOP 100 PERCENT
    be.Name AS 'Company Name',
    be.Region AS 'Postal - Region Name',
    bed.AccountNumber,
    REPLACE(bed.Address, 'XXXX', 'Street number') AS 'Address',
    p.Name AS 'Product Name',
    CONCAT(dbo.CalculateTotalOrdersPerProduct(p.Id), ' MKD') AS 'Total Amount per Product'
FROM dbo.businessentity_details bed
JOIN dbo.BusinessEntities be ON be.Id = bed.BusinessEntityID
JOIN dbo.Orders o ON o.BusinessEntityId = be.Id
JOIN dbo.OrderDetails od ON od.OrderId = o.Id
JOIN dbo.Products p ON p.Id = od.ProductId
WHERE p.Name = 'Granola'
ORDER BY be.Name;

insert into dbo.businessentity_details
(BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(1,'210500222333','Partizanski Odredi 15','070555666','aaa@vitalia.com','Nema zabeleshka')
go
insert into dbo.businessentity_details
(BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(2,'210500222334','XXXX 15','070779523','bbb@vitalia.com',NULL)
go
insert into dbo.businessentity_details
(BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(3,'210500222335','XXXX 16','070779523','ccc@vitalia.com','TEST 1')
go
insert into dbo.businessentity_details
(BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(4,'210500222339','XXXX 17','070779523','eee@vitalia.com',NULL)
go
insert into dbo.businessentity_details
(BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(5,'210500222336','XXXX 18','070779544','vvv@vitalia.com','Nema plateno faktura')
go
insert into dbo.businessentity_details
(BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(6,'210500222337','XXXX 19','070779555','ddd@vitalia.com',NULL)
go
insert into dbo.businessentity_details
(BusinessentityID,AccountNumber,[Address],Contact,email,comment)
values(7,'210500222338','XXXX 20','070779566','aa@vitalia.com','Nevaliden kontakt')
go
