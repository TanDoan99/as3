--1
SELECT a.Name FROM Production.Product a
WHERE  EXISTS(
SELECT b.ProductSubcategoryID FROM Production.ProductSubcategory b
WHERE a.ProductSubcategoryID=b.ProductSubcategoryID AND b.Name='Saddles'
)
--2
SELECT a.Name FROM Production.Product a
WHERE  a.ProductSubcategoryID IN(
SELECT b.ProductSubcategoryID FROM Production.ProductSubcategory b
WHERE a.ProductSubcategoryID=b.ProductSubcategoryID AND b.Name LIKE '%BO%'
)
--3

SELECT a.Name FROM Production.Product a
WHERE  a.ListPrice = (
SELECT  MIN(ListPrice)  FROM Production.Product 
WHERE ProductSubcategoryID=3
)

--4

SELECT c.Name FROM Person.StateProvince a
JOIN(
SELECT b.Name,b.CountryRegionCode FROM Person.CountryRegion b
GROUP BY b.Name,b.CountryRegionCode
) as c ON a.CountryRegionCode=c.CountryRegionCode
GROUP BY c.Name
HAVING COUNT(c.Name)<=10



SELECT a.Name FROM Person.CountryRegion a
JOIN Person.StateProvince b ON a.CountryRegionCode=b.CountryRegionCode
GROUP BY a.Name
HAVING COUNT(a.Name)<=10
--5
SELECT SalesPersonID,AVG(SubTotal) as SalesDiff FROM Sales.SalesOrderHeader
WHERE SalesPersonID  IN (
	SELECT SalesPersonID FROM Sales.SalesOrderHeader
	WHERE SalesPersonID IS NOT NULL
)
GROUP BY SalesPersonID
--6
SELECT AVG(ListPrice) FROM Production.Product
WHERE ProductSubcategoryID BETWEEN 1 AND 3



SELECT Name,ListPrice-(SELECT AVG(ListPrice) FROM Production.Product
WHERE ProductSubcategoryID BETWEEN 1 AND 3) as Diff
FROM Production.Product 
WHERE ProductSubcategoryID BETWEEN 1 AND 3
GROUP BY Name,ProductSubcategoryID,ListPrice


SELECT X.Name,X.Diff FROM (SELECT Name,ListPrice-(SELECT AVG(ListPrice) FROM Production.Product
WHERE ProductSubcategoryID BETWEEN 1 AND 3) as Diff
FROM Production.Product 
WHERE ProductSubcategoryID BETWEEN 1 AND 3
GROUP BY Name,ProductSubcategoryID,ListPrice) as X
WHERE X.Diff BETWEEN -800 AND -400
--7
SELECT P.FirstName + ' ' + P.LastName

FROM Sales.SalesPerson SP

JOIN HumanResources.Employee E

    ON E.BusinessEntityID  = SP.BusinessEntityID

JOIN Person.Person AS P 

    ON E.BusinessEntityID = P.BusinessEntityID

WHERE Bonus > 5000

SELECT P.FirstName + ' ' + P.LastName
FROM  Person.Person AS P
WHERE P.BusinessEntityID IN(
	SELECT E.BusinessEntityID FROM HumanResources.Employee E
	WHERE E.BusinessEntityID=P.BusinessEntityID AND E.BusinessEntityID IN (
		SELECT SP.BusinessEntityID FROM Sales.SalesPerson SP
		WHERE SP.Bonus > 5000 AND	E.BusinessEntityID=SP.BusinessEntityID	
	)
)
--Hai Truy vấn kết quả giống nhau nhưng thứ tự Tên lại thay đổi theo độ dài chuỗi do do sub phải sắp xếp thứ tự nên lâu hơn join và join nhanh hơn
--8
--SELECT * FROM Sales.Store
--SELECT * FROM Sales.SalesPerson

SELECT DISTINCT  a.SalesPersonID FROM Sales.Store a
WHERE EXISTS(
SELECT * FROM Sales.SalesPerson  b
WHERE b.BusinessEntityID!=a.SalesPersonID 
)

SELECT DISTINCT a.SalesPersonID FROM Sales.Store a JOIN Sales.SalesPerson b
ON b.BusinessEntityID!=a.SalesPersonID
--9
SELECT ProductSubcategoryID,COUNT(*) FROM Production.Product
GROUP BY ProductSubcategoryID
go
WITH TempSet(ProdSubID,CountedProds) AS(
	SELECT ProductSubcategoryID AS ProdSubID,COUNT(*) AS CountedProds FROM Production.Product
	GROUP BY ProductSubcategoryID 
)
SELECT * FROM TempSet

SELECT * FROM TempSettestquery