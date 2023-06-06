# [Your_Database_Name] Database

This repository contains the structure and schema for the [Your_Database_Name] database. The database consists of the following tables:

## dbo.BusinessEntities

- Id
- Name
- Region
- Zipcode
- Size

## dbo.businessentity_details

- BusinessEntityID
- AccountNumber
- Address
- Contact
- Email
- Comment

## dbo.Customers

- Id
- Name
- AccountNumber
- City
- RegionName
- CustomerSize
- PhoneNumber
- IsActive

## dbo.Employees

- Id
- FirstName
- LastName
- DateOfBirth
- Gender (M/F)
- HireDate
- NationalIdNumber

## dbo.OrderDetails

- Id
- OrderId
- ProductId
- Quantity
- Price

## dbo.Orders

- Id
- OrderDate
- Status
- BusinessEntityId
- CustomerId
- EmployeeId
- TotalPrice
- Comment

## dbo.Products

- Id
- Code
- Name
- Description
- Weight
- Price
- Cost

Feel free to explore and utilize this database for your applications or projects.