-- Primer ejercicio: utilización del select
SELECT *
FROM city

-- Segundo ejercicio: añadir alias a las columnas
SELECT Name as Nombre, CountryCode as Pais, District as Distrito, Population as Poblacion
FROM city

-- Tercer ejercicio: utilización del DISTINCT
SELECT DISTINCT CountryCode, Name
FROM city

-- Cuarto ejercicio: utilización de WHERE
Select *
FROM city
WHERE population>1000000

-- Quinto ejercicio: utilización del and
Select Name, CountryCode, Population
FROM city
WHERE population<1000000 and CountryCode='ARG'

-- Sexto ejercicio: utilización del or
Select Name, CountryCode, Population
FROM city
WHERE population<1000000 or CountryCode='ARG'

-- Septimo ejercicio: utilizacion del between
Select Name, CountryCode, Population
FROM city
WHERE population between 100000 and 500000

-- Octavo ejercicio utilizacion del like
Select Name, CountryCode, Population
FROM city
WHERE name like 'G%'

-- Noveno ejercicio utilizacion del in
Select Name, CountryCode, Population
FROM city
WHERE CountryCode IN('ARG')

-- Decimo ejercicio utilizacion del ORDER BY y LIMIT
Select Name, CountryCode, Population
FROM city
WHERE population>1000000
ORDER BY population desc LIMIT 10

-- Undecimo ejercicio: funciones de agregacion
SELECT COUNT(*) as 'Total paises' , SUM(SurfaceArea) as 'total area', AVG(LifeExpectancy) as 'media esperanza vida', MIN(LifeExpectancy) as 'min esperanza vida', MAX(LifeExpectancy) as 'max esperanza vida'
From country

-- Duodecimo ejercicio:
SELECT Continent as Continente
FROM country
GROUP BY Continent

-- Decimotercer ejercicio:
SELECT Continent as 'Continente', AVG(LifeExpectancy) As 'esperanza vida' 
FROM country
GROUP BY Continent
HAVING AVG(LifeExpectancy) >60 ORDER BY AVG(LifeExpectancy)

-- Decimocuarto ejercicio: union all
SELECT Name, Continent
FROM country
WHERE Population>1000000
Union all
SELECT Name, Continent
FROM country
WHERE SurfaceArea>9000000

-- Decimocuarto ejercicio: union all
SELECT Name, Continent
FROM country
WHERE Population>2000000
Union 
SELECT Name, Continent
FROM country
WHERE SurfaceArea>5000000

-- Decimoquinto ejercicio: consultas anidadas
SELECT Name
From country
WHERE Code IN ( 
	SELECT CountryCode
    FROM countrylanguage
    WHERE Language= 'Spanish' )
    
-- Decimosexto ejercicio: unión de tablas
SELECT *
FROM country inner join city on Capital=ID
WHERE not IndepYear is Null