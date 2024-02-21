/*
	Sales and Inventory Management
	File Name: Sales & Inventory Management.sql
	
*/


/*Count the Number of employees that work in the same city in descending order.*/
select count(employeeNumber) as Number_of_Employee, city as City
from employees
join offices on employees.officeCode = offices.officeCode
group by offices.city
order by Number_of_Employee desc;

-- Results:

/*

Number_of_Employee|City    		  |
------------------+---------------+
2   			  |  Boston		  |
2   			  |  NYC  		  |
2   			  |  Tokyo		  |
2   			  |  London		  |
4   			  |  Sydney		  |
5   			  |  Paris 		  |
6   			  |  San Francisco|
 
 */

/*Find the average credit limit of customer.*/
select avg(creditLimit) from customers;

-- Results:

/*

Average Credit Limit|
--------------------+
 67659.016393       |
 
 */

/*List the customer name that have credit limit more than average credit limit.*/
select customerName, creditLimit 
from customers
where creditLimit > (select avg(creditLimit) from customers);

-- Results:

/*

customerName					|creditLimit|
------------------------------------------------+-----------+
Signal Gift Stores				|71800.00 	|
Australian Collectors, Co.			|117300.00	|
La Rochelle Gifts				|118200.00	|
Baane Mini Imports				|81700.00 	|
Mini Gifts Distributors Ltd.			|210500.00	|
Land of Toys Inc.				|114900.00	|
Euro+ Shopping Channel				|227600.00	|
Danish Wholesale Imports			|83400.00 	|
Saveley & Henriot, Co.				|123900.00	|
Dragon Souveniers, Ltd.				|103800.00	|
Muscle Machine Inc				|138500.00	|
Diecast Classics Inc.				|100600.00	|
Technics Stores Inc.				|84600.00 	|
Handji Gifts& Co				|97900.00	|
Herkku Gifts					|96800.00 	|
Daedalus Designs Imports			|82900.00 	|
La Corne D'abondance, Co.			|84300.00 	|
Gift Depot Inc.					|84300.00 	|
Osaka Souveniers Co.				|81200.00	|
 
 *Execute the code for the full results*
 */

/*List of customer name served by the sales representative*/
select cust.customerName as Customer_Name, cust.phone as Contact,
emp.firstName as Salesperson_name , emp.jobTitle as Position
from customers as cust
join employees as emp on cust.salesRepEmployeeNumber = emp.employeeNumber;

-- Results:

/*
Customer_Name			|Contact    |Salesperson_name    |Position |
--------------------------------+-----------+--------------------+----------
Mini Gifts Distributors Ltd.	|4155551450|Leslie		 |Sales Rep|
Mini Wheels Co.			|6505555787|Leslie		 |Sales Rep|
Technics Stores Inc.		|6505556809|Leslie		 |Sales Rep|
Corporate Gift Ideas Co.	|6505551386|Leslie		 |Sales Rep|
The Sharp Gifts Warehouse	|4085553659|Leslie		 |Sales Rep|
Signal Collectibles Ltd.	|4155554312|Leslie		 |Sales Rep|
Signal Gift Stores		|7025551838|Leslie		 |Sales Rep|
Toys4GrownUps.com		|6265557265|Leslie		 |Sales Rep|
Boards & Toys Co.		|3105552373|Leslie		 |Sales Rep|
Collectable Mini Designs Co.	|7605558146|Leslie		 |Sales Rep|
Men 'R' US Retailers, Ltd.	|2155554369|Leslie		 |Sales Rep|
West Coast Collectables Co.	|3105553722|Leslie		 |Sales Rep|
Cambridge Collectables Co.	|6175555555|Julie 		 |Sales Rep|
Online Mini Collectables	|6175557555|Julie 		 |Sales Rep|
Mini Creations Ltd.		|5085559555|Julie 		 |Sales Rep|
Classic Gift Ideas, Inc		|2155554695|Julie 		 |Sales Rep|
Collectables For Less Inc.	|6175558555|Julie 		 |Sales Rep|
Diecast Collectables		|6175552555|Julie 		 |Sales Rep|
Diecast Classics Inc.		|2155551555|Steve 		 |Sales Rep|
Auto-Moto Classics Inc.		|6175558428|Steve 		 |Sales Rep|
Marta's Replicas Co.		|6175558555|Steve 		 |Sales Rep|
Gifts4AllAges.com		|6175559555|Steve 		 |Sales Rep|
Online Diecast Creations Co.	|6035558647|Steve 		 |Sales Rep|
FunGiftIdeas.com		|5085552555|Steve 		 |Sales Rep|

 *Execute the code for the full results*
*/

/*Count the number of customers served by each the sales representative in the company*/
select count(cust.customerNumber) as Number_of_Customer, 
emp.firstName as Salesperson_name
from customers as cust
join employees as emp on cust.salesRepEmployeeNumber = emp.employeeNumber
group by Salesperson_name;

-- Results:

/*
Number_of_Customers|Salesperson_name|
-------------------+----------------+
12				   |Leslie			|
6				   |Julie			|
6				   |Steve      			|
7				   |Foon Yue			|
8				   |George         	        |
6				   |Loui			|
7				   |Gerard			|
10				   |Pamela			|
8				   |Larry			|
9				   |Barry			|
5				   |Andy			|
5				   |Peter			|
5				   |Mami			|
6				   |Martin			|
*/


/*List the sales person that serve more than 10 customers.*/
select emp.firstName as Salesperson_name,
count(cust.customerNumber) as Number_of_Customer
from customers as cust
join employees as emp on cust.salesRepEmployeeNumber = emp.employeeNumber
group by Salesperson_name
having count(cust.customerNumber)> 10;

-- Results:

/*
Salesperson_name|Number_of_Customer|
----------------+------------------+
Leslie			|		12		   |

*/

/*Find the payment made by customer named Atelier graphique and output is as follows*/
select cust.customerName as 'Customer name',
pay.checkNumber as 'Cheque Number', 
pay.paymentDate as Date,
amount as Amount 
from payments as pay 
join customers as cust on pay.customerNumber = cust.customerNumber
where cust.customerName = 'Atelier graphique';

-- Results:

/*
Customer name    |Cheque Number|Date	  |Amount  |
-----------------+-------------+----------+--------+
Atelier graphique|HQ336336     |2004-10-19|6066.78 |
Atelier graphique|JM555205     |2003-06-05|14571.44|
Atelier graphique|OM314933     |2004-12-18|1676.14 |

*/

/*Assuming attribute MSRP in products table is the sales price of each product. List the product that have profit >50*/
select productName, (MSRP-buyPrice) as Profit
from products
having Profit > 50;

-- Results:

/*
productName               | Profit |
--------------------------+--------+
1952 Alpine Renault 1300  | 115.72 |
2003 Harley-Davidson Eagle| 102.64 |
1972 Alfa Romeo GTA       |  50.32 |
1968 Ford Mustang         |  99.23 |
2001 Ferrari Enzo         | 112.21 |
1958 Setra Bus            |  58.77 |
2002 Suzuki XREO          |  84.35 |
1969 Corvair Monza        |  61.94 |
1969 Ford Falcon          |  89.97 |
1957 Chevy Pickup         |  62.80 |
1969 Dodge Charger        |  56.43 |
1940 Ford Pickup Truck    |  58.34 |
1993 Mazda RX-7           |  58.03 |
1965 Aston Martin DB5     |  58.48 |
1980s Black Hawk Helicopte|  80.42 |
1917 Grand Touring Sedan  |  83.30 |
1998 Chrysler Plymouth Pro|  62.22 |
1932 Model A Ford J-Coupe |  68.65 |
1928 Mercedes-Benz SSK    |  96.19 |
1999 Indy 500 Monte Carlo |  75.24 |
1903 Ford Model A         |  68.29 |
1992 Ferrari 360 Spider re|  91.44 |
1985 Toyota Supra         |  50.56 |
1976 Ford Gran Torino     |  73.50 |
1948 Porsche Type 356 Road|  79.12 |
1970 Triumph Spitfire     |  51.70 |
1957 Corvette Convertible |  78.87 |
1997 BMW R 1100 S         |  51.84 |
1962 Volkswagen Microbus  |  66.45 |
HMS Bounty                |  50.69 |
1982 Camaro Z28           |  54.62 |
ATA: B757-300             |  59.32 |

*/

/*The management want to send the invoice with total amount (calculate based quantiy order * price) for each order to customer as follows*/
select cust.customerName as 'Customer Name', det.orderNumber as 'Order Number', 
SUM(det.quantityOrdered*det.priceEach) as 'Total Amount'
from orderdetails as det 
join orders as ord on det.orderNumber = ord.orderNumber
join customers as cust on ord.customerNumber = cust.customerNumber
group by cust.customerName, det.orderNumber;

-- Results:

/*
Customer Name                | Order Number  |TotalAmount|
-----------------------------+---------------+-----------+
Atelier graphique            | 10123         | 14571.44  |
Atelier graphique            | 10298         | 6066.78   |
Atelier graphique            | 10345         | 1676.14   |
Signal Gift Stores           | 10124         | 32641.98  |
Signal Gift Stores           | 10278         | 33347.88  |
Signal Gift Stores           | 10346         | 14191.12  |
Australian Collectors, Co.   | 10120         | 45864.03  |
Australian Collectors, Co.   | 10125         | 7565.08   |
Australian Collectors, Co.   | 10223         | 44894.74  |
Australian Collectors, Co.   | 10342         | 40265.60  |
Australian Collectors, Co.   | 10347         | 41995.62  |
La Rochelle Gifts            | 10275         | 47924.19  |
La Rochelle Gifts            | 10315         | 19501.82  |
La Rochelle Gifts            | 10375         | 49523.67  |
La Rochelle Gifts            | 10425         | 41623.44  |
Baane Mini Imports           | 10103         | 50218.95  |
Baane Mini Imports           | 10158         | 1491.38   |
Baane Mini Imports           | 10309         | 17876.32  |
Baane Mini Imports           | 10325         | 34638.14  |
Mini Gifts Distributors Ltd. | 10113         | 11044.30  |
Mini Gifts Distributors Ltd. | 10135         | 55601.84  |
Mini Gifts Distributors Ltd. | 10142         | 56052.56  |
Mini Gifts Distributors Ltd. | 10182         | 45084.38  |
Mini Gifts Distributors Ltd. | 10229         | 43369.30  |
Mini Gifts Distributors Ltd. | 10271         | 37430.89  |
Mini Gifts Distributors Ltd. | 10282         | 47979.98  |
Mini Gifts Distributors Ltd. | 10312         | 55639.66  |
Mini Gifts Distributors Ltd. | 10335         | 6466.44   |
Mini Gifts Distributors Ltd. | 10357         | 40676.26  |
Mini Gifts Distributors Ltd. | 10368         | 13874.75  |
Mini Gifts Distributors Ltd. | 10371         | 35137.54  |
Mini Gifts Distributors Ltd. | 10382         | 47765.59  |
Mini Gifts Distributors Ltd. | 10385         | 4466.71   |
Mini Gifts Distributors Ltd. | 10390         | 55902.50  |
Mini Gifts Distributors Ltd. | 10396         | 27695.54  |
Mini Gifts Distributors Ltd. | 10421         | 7639.10   |
Blauer See Auto, Co.         | 10101         | 10549.01  |
Blauer See Auto, Co.         | 10230         | 33820.62  |
Blauer See Auto, Co.         | 10300         | 24101.81  |
Blauer See Auto, Co.         | 10323         | 7466.32   |
Mini Wheels Co.              | 10111         | 16537.85  |
Mini Wheels Co.              | 10201         | 23923.93  |
Mini Wheels Co.              | 10333         | 26248.78  |
Land of Toys Inc.            | 10107         | 22292.62  |
Land of Toys Inc.            | 10248         | 41445.21  |
Land of Toys Inc.            | 10292         | 35321.97  |
Land of Toys Inc.            | 10329         | 50025.35  |
Euro+ Shopping Channel       | 10104         | 40206.20  |
Euro+ Shopping Channel       | 10128         | 13884.99  |
Euro+ Shopping Channel       | 10133         | 22366.04  |
Euro+ Shopping Channel       | 10153         | 44939.85  |
Euro+ Shopping Channel       | 10156         | 4599.52   |
Euro+ Shopping Channel       | 10190         | 10721.86  |
Euro+ Shopping Channel       | 10203         | 40062.53  |
Euro+ Shopping Channel       | 10205         | 13059.16  |
Euro+ Shopping Channel       | 10212         | 59830.55  |
Euro+ Shopping Channel       | 10244         | 26155.91  |
Euro+ Shopping Channel       | 10246         | 35420.74  |
Euro+ Shopping Channel       | 10262         | 47065.36  |
Euro+ Shopping Channel       | 10279         | 20009.53  |
Euro+ Shopping Channel       | 10311         | 36140.38  |
Euro+ Shopping Channel       | 10350         | 46493.16  |
Euro+ Shopping Channel       | 10355         | 25529.78  |
Euro+ Shopping Channel       | 10358         | 44185.46  |
Euro+ Shopping Channel       | 10378         | 32289.12  |
Euro+ Shopping Channel       | 10379         | 16621.27  |
Euro+ Shopping Channel       | 10380         | 34404.21  |
Euro+ Shopping Channel       | 10383         | 36851.98  |
Euro+ Shopping Channel       | 10386         | 46968.52  |
Euro+ Shopping Channel       | 10394         | 18102.74  |
Euro+ Shopping Channel       | 10412         | 46895.48  |
Euro+ Shopping Channel       | 10417         | 28574.90  |
Euro+ Shopping Channel       | 10424         | 29310.30  |
Volvo Model Replicas, Co    | 10112         | 7674.94   |
Volvo Model Replicas, Co    | 10320         | 16799.03  |
Volvo Model Replicas, Co    | 10326         | 19206.68  |
Volvo Model Replicas, Co    | 10334         | 23014.17  |
Danish Wholesale Imports    | 10105         | 53959.21  |
Danish Wholesale Imports    | 10238         | 28211.70  |
Danish Wholesale Imports    | 10256         | 4710.73   |
Danish Wholesale Imports    | 10327         | 20564.86  |
Danish Wholesale Imports    | 10406         | 21638.62  |
Saveley & Henriot, Co.      | 10194         | 39712.10  |
Saveley & Henriot, Co.      | 10208         | 49614.72  |
Saveley & Henriot, Co.      | 10227         | 40978.53  |
Dragon Souveniers, Ltd.     | 10117         | 44380.15  |
Dragon Souveniers, Ltd.     | 10150         | 38350.15  |
Dragon Souveniers, Ltd.     | 10165         | 67392.85  |
Dragon Souveniers, Ltd.     | 10277         | 2611.84   |
Dragon Souveniers, Ltd.     | 10387         | 3516.04   |
Muscle Machine Inc          | 10127         | 58841.35  |
Muscle Machine Inc          | 10204         | 58793.53  |
Muscle Machine Inc          | 10267         | 20314.44  |
Muscle Machine Inc          | 10349         | 39964.63  |
Diecast Classics Inc.       | 10272         | 23715.70  |
Diecast Classics Inc.       | 10281         | 39641.43  |
Diecast Classics Inc.       | 10318         | 35152.12  |
Diecast Classics Inc.       | 10422         | 5849.44   |
Technics Stores Inc.        | 10140         | 38675.13  |

*Execute the code for the full results*
*/


/*Find the subtotal of quantity in stock for each product line according to product vendor*/
select productLine as Line, productVendor as Vendor, SUM(quantityInStock) as Stock
from products
group by productLine, productVendor
order by productLine;

-- Results:

/*
Line           | Vendor                   | Stock |
---------------+--------------------------+-------+
Classic Cars   | Autoart Studio Design    | 68    |
Classic Cars   | Carousel DieCast Legends | 17673 |
Classic Cars   | Classic Metal Creations  | 34415 |
Classic Cars   | Exoto Designs            | 12729 |
Classic Cars   | Gearbox Collectibles     | 41113 |
Classic Cars   | Highway 66 Mini Classics | 15782 |
Classic Cars   | Min Lin Diecast          | 17234 |
Classic Cars   | Motor City Art Classics  | 3252  |
Classic Cars   | Red Start Diecast        | 8164  |
Classic Cars   | Second Gear Diecast      | 19182 |
Classic Cars   | Studio M Art Models      | 8872  |
Classic Cars   | Unimax Art Galleries     | 9352  |
Classic Cars   | Welly Diecast Productions| 31347 |
Motorcycles    | Autoart Studio Design    | 7603  |
Motorcycles    | Exoto Designs            | 178   |
Motorcycles    | Gearbox Collectibles     | 9241  |
Motorcycles    | Highway 66 Mini Classics | 13480 |
Motorcycles    | Min Lin Diecast          | 7933  |
Motorcycles    | Red Start Diecast        | 5582  |
Motorcycles    | Second Gear Diecast      | 3341  |
Motorcycles    | Studio M Art Models      | 7689  |
Motorcycles    | Unimax Art Galleries     | 9997  |
Motorcycles    | Welly Diecast Productions| 4357  |
Planes         | Autoart Studio Design    | 5942  |
Planes         | Classic Metal Creations  | 3627  |
Planes         | Gearbox Collectibles     | 992   |
Planes         | Highway 66 Mini Classics | 7106  |
Planes         | Min Lin Diecast          | 5841  |
Planes         | Motor City Art Classics  | 15061 |
Planes         | Red Start Diecast        | 5330  |
Planes         | Second Gear Diecast      | 15632 |
Planes         | Unimax Art Galleries     | 2756  |
Ships          | Autoart Studio Design    | 1897  |
Ships          | Carousel DieCast Legends | 3854  |
Ships          | Min Lin Diecast          | 4259  |
Ships          | Red Start Diecast        | 7083  |
Ships          | Studio M Art Models      | 737   |
Ships          | Unimax Art Galleries     | 3915  |
Ships          | Welly Diecast Productions| 5088  |
Trains         | Carousel DieCast Legends | 6450  |
Trains         | Classic Metal Creations  | 1645  |
Trains         | Gearbox Collectibles     | 8601  |
Trucks and Buses| Autoart Studio Design   | 2327  |
Trucks and Buses| Carousel DieCast Legends| 2018  |
Trucks and Buses| Classic Metal Creations | 2874  |
Trucks and Buses| Exoto Designs           | 6125  |
Trucks and Buses| Highway 66 Mini Classics| 1016  |
Trucks and Buses| Motor City Art Classics | 8227  |
Trucks and Buses| Red Start Diecast       | 814   |
Trucks and Buses| Studio M Art Models     | 2613  |
Trucks and Buses| Unimax Art Galleries    | 8258  |
Trucks and Buses| Welly Diecast Productions| 1579 |
Vintage Cars   | Autoart Studio Design    | 12256 |
Vintage Cars   | Carousel DieCast Legends | 10810 |
Vintage Cars   | Classic Metal Creations  | 2847  |
Vintage Cars   | Exoto Designs            | 25134 |
Vintage Cars   | Gearbox Collectibles     | 548   |
Vintage Cars   | Highway 66 Mini Classics | 136   |
Vintage Cars   | Min Lin Diecast          | 14822 |
Vintage Cars   | Motor City Art Classics  | 16565 |
Vintage Cars   | Red Start Diecast        | 8073  |
Vintage Cars   | Second Gear Diecast      | 4710  |
Vintage Cars   | Studio M Art Models      | 22342 |
Vintage Cars   | Unimax Art Galleries     | 3913  |
Vintage Cars   | Welly Diecast Productions| 2724  |
*/


/*Rank the Product buyPrice according to the vendor*/
 select productVendor, buyPrice, 
 rank() over (partition by productVendor order by buyPrice) as Price_Rank
 from products
 order by productVendor, Price_Rank;
 
 -- Results:
 
 /*
 productVendor          | buyPrice | Price_Rank |
-----------------------+----------+------------+
Autoart Studio Design  | 26.30    | 1          |
Autoart Studio Design  | 34.00    | 2          |
Autoart Studio Design  | 34.17    | 3          |
Autoart Studio Design  | 34.25    | 4          |
Autoart Studio Design  | 58.48    | 5          |
Autoart Studio Design  | 60.86    | 6          |
Autoart Studio Design  | 61.34    | 7          |
Autoart Studio Design  | 95.34    | 8          |
Carousel DieCast Legends | 15.91 | 1          |
Carousel DieCast Legends | 24.92 | 2          |
Carousel DieCast Legends | 29.18 | 3          |
Carousel DieCast Legends | 46.53 | 4          |
Carousel DieCast Legends | 48.64 | 5          |
Carousel DieCast Legends | 51.09 | 6          |
Carousel DieCast Legends | 60.78 | 7          |
Carousel DieCast Legends | 67.56 | 8          |
Carousel DieCast Legends | 82.34 | 9          |
Classic Metal Creations | 20.61  | 1          |
Classic Metal Creations | 25.98  | 2          |
Classic Metal Creations | 32.33  | 3          |
Classic Metal Creations | 37.49  | 4          |
Classic Metal Creations | 47.25  | 5          |
Classic Metal Creations | 65.96  | 6          |
Classic Metal Creations | 66.74  | 7          |
Classic Metal Creations | 69.93  | 8          |
Classic Metal Creations | 98.30  | 9          |
Classic Metal Creations | 98.58  | 10         |
Exoto Designs          | 43.26  | 1          |
Exoto Designs          | 50.51  | 2          |
Exoto Designs          | 52.66  | 3          |
Exoto Designs          | 55.70  | 4          |
Exoto Designs          | 57.54  | 5          |
Exoto Designs          | 64.58  | 6          |
Exoto Designs          | 66.92  | 7          |
Exoto Designs          | 69.78  | 8          |
Exoto Designs          | 72.82  | 9          |
Gearbox Collectibles   | 24.14  | 1          |
Gearbox Collectibles   | 26.72  | 2          |
Gearbox Collectibles   | 49.00  | 3          |
Gearbox Collectibles   | 53.90  | 4          |
Gearbox Collectibles   | 62.11  | 5          |
Gearbox Collectibles   | 62.16  | 6          |
Gearbox Collectibles   | 72.56  | 7          |
Gearbox Collectibles   | 73.49  | 8          |
Gearbox Collectibles   | 101.51 | 9          |
Highway 66 Mini Classics | 32.37 | 1          |
Highway 66 Mini Classics | 33.02 | 2          |
Highway 66 Mini Classics | 37.32 | 3          |
Highway 66 Mini Classics | 47.10 | 4          |
Highway 66 Mini Classics | 57.01 | 5          |
Highway 66 Mini Classics | 59.33 | 6          |
Highway 66 Mini Classics | 68.29 | 7          |
Highway 66 Mini Classics | 68.99 | 8          |
Highway 66 Mini Classics | 83.51 | 9          |
Min Lin Diecast        | 34.35  | 1          |
Min Lin Diecast        | 46.91  | 2          |
Min Lin Diecast        | 48.81  | 3          |
Min Lin Diecast        | 49.05  | 4          |
Min Lin Diecast        | 51.15  | 5          |
Min Lin Diecast        | 51.61  | 6          |
Min Lin Diecast        | 91.92  | 7          |
Min Lin Diecast        | 93.89  | 8          |
Motor City Art Classics | 22.57 | 1          |
Motor City Art Classics | 32.77 | 2          |
Motor City Art Classics | 33.30 | 3          |
Motor City Art Classics | 53.93 | 4          |
Motor City Art Classics | 54.40 | 5          |
Motor City Art Classics | 60.62 | 6          |
Motor City Art Classics | 68.80 | 7          |
Motor City Art Classics | 84.76 | 8          |
Motor City Art Classics | 85.68 | 9          |
Red Start Diecast      | 21.75  | 1          |
Red Start Diecast      | 33.61  | 2          |
Red Start Diecast      | 33.97  | 3          |
Red Start Diecast      | 56.76  | 4          |
Red Start Diecast      | 60.74  | 5          |
Red Start Diecast      | 77.27  | 6          |
Red Start Diecast      | 91.02  | 7          |
Second Gear Diecast   | 16.24  | 1          |
Second Gear Diecast   | 29.34  | 2          |
Second Gear Diecast   | 36.27  | 3          |
Second Gear Diecast   | 56.13  | 4          |
Second Gear Diecast   | 57.46  | 5          |
Second Gear Diecast   | 83.05  | 6          |
Second Gear Diecast   | 95.59  | 7          |
Second Gear Diecast   | 103.42 | 8          |
Studio M Art Models   | 23.14  | 1          |
Studio M Art Models   | 24.26  | 2          |
Studio M Art Models   | 27.06  | 3          |
Studio M Art Models   | 31.92  | 4          |
Studio M Art Models   | 32.95  | 5          |
Studio M Art Models   | 34.21  | 6          |
Studio M Art Models   | 43.30  | 7          |
Studio M Art Models   | 58.33  | 8          |
Unimax Art Galleries  | 33.30  | 1          |
Unimax Art Galleries  | 36.23  | 2          |
Unimax Art Galleries  | 39.83  | 3          |
Unimax Art Galleries  | 49.24  | 4          |

 
 /*
 productVendor          | buyPrice | Price_Rank |
-----------------------+----------+------------+
Autoart Studio Design  | 26.30    | 1          |
Autoart Studio Design  | 34.00    | 2          |
Autoart Studio Design  | 34.17    | 3          |
Autoart Studio Design  | 34.25    | 4          |
Autoart Studio Design  | 58.48    | 5          |
Autoart Studio Design  | 60.86    | 6          |
Autoart Studio Design  | 61.34    | 7          |
Autoart Studio Design  | 95.34    | 8          |
Carousel DieCast Legends | 15.91 | 1          |
Carousel DieCast Legends | 24.92 | 2          |
Carousel DieCast Legends | 29.18 | 3          |
Carousel DieCast Legends | 46.53 | 4          |
Carousel DieCast Legends | 48.64 | 5          |
Carousel DieCast Legends | 51.09 | 6          |
Carousel DieCast Legends | 60.78 | 7          |
Carousel DieCast Legends | 67.56 | 8          |
Carousel DieCast Legends | 82.34 | 9          |
Classic Metal Creations | 20.61  | 1          |
Classic Metal Creations | 25.98  | 2          |
Classic Metal Creations | 32.33  | 3          |
Classic Metal Creations | 37.49  | 4          |
Classic Metal Creations | 47.25  | 5          |
Classic Metal Creations | 65.96  | 6          |
Classic Metal Creations | 66.74  | 7          |
Classic Metal Creations | 69.93  | 8          |
Classic Metal Creations | 98.30  | 9          |
Classic Metal Creations | 98.58  | 10         |
Exoto Designs          | 43.26  | 1          |
Exoto Designs          | 50.51  | 2          |
Exoto Designs          | 52.66  | 3          |
Exoto Designs          | 55.70  | 4          |
Exoto Designs          | 57.54  | 5          |
Exoto Designs          | 64.58  | 6          |
Exoto Designs          | 66.92  | 7          |
Exoto Designs          | 69.78  | 8          |
Exoto Designs          | 72.82  | 9          |
Gearbox Collectibles   | 24.14  | 1          |
Gearbox Collectibles   | 26.72  | 2          |
Gearbox Collectibles   | 49.00  | 3          |
Gearbox Collectibles   | 53.90  | 4          |
Gearbox Collectibles   | 62.11  | 5          |
Gearbox Collectibles   | 62.16  | 6          |
Gearbox Collectibles   | 72.56  | 7          |
Gearbox Collectibles   | 73.49  | 8          |
Gearbox Collectibles   | 101.51 | 9          |
Highway 66 Mini Classics | 32.37 | 1          |
Highway 66 Mini Classics | 33.02 | 2          |
Highway 66 Mini Classics | 37.32 | 3          |
Highway 66 Mini Classics | 47.10 | 4          |
Highway 66 Mini Classics | 57.01 | 5          |
Highway 66 Mini Classics | 59.33 | 6          |
Highway 66 Mini Classics | 68.29 | 7          |
Highway 66 Mini Classics | 68.99 | 8          |
Highway 66 Mini Classics | 83.51 | 9          |
Min Lin Diecast        | 34.35  | 1          |
Min Lin Diecast        | 46.91  | 2          |
Min Lin Diecast        | 48.81  | 3          |
Min Lin Diecast        | 49.05  | 4          |
Min Lin Diecast        | 51.15  | 5          |
Min Lin Diecast        | 51.61  | 6          |
Min Lin Diecast        | 91.92  | 7          |
Min Lin Diecast        | 93.89  | 8          |
Motor City Art Classics | 22.57 | 1          |
Motor City Art Classics | 32.77 | 2          |
Motor City Art Classics | 33.30 | 3          |
Motor City Art Classics | 53.93 | 4          |
Motor City Art Classics | 54.40 | 5          |
Motor City Art Classics | 60.62 | 6          |
Motor City Art Classics | 68.80 | 7          |
Motor City Art Classics | 84.76 | 8          |
Motor City Art Classics | 85.68 | 9          |
Red Start Diecast      | 21.75  | 1          |
Red Start Diecast      | 33.61  | 2          |
Red Start Diecast      | 33.97  | 3          |
Red Start Diecast      | 56.76  | 4          |
Red Start Diecast      | 60.74  | 5          |
Red Start Diecast      | 77.27  | 6          |
Red Start Diecast      | 91.02  | 7          |
Second Gear Diecast   | 16.24  | 1          |
Second Gear Diecast   | 29.34  | 2          |
Second Gear Diecast   | 36.27  | 3          |
Second Gear Diecast   | 56.13  | 4          |
Second Gear Diecast   | 57.46  | 5          |
Second Gear Diecast   | 83.05  | 6          |
Second Gear Diecast   | 95.59  | 7          |
Second Gear Diecast   | 103.42 | 8          |
Studio M Art Models   | 23.14  | 1          |
Studio M Art Models   | 24.26  | 2          |
Studio M Art Models   | 27.06  | 3          |
Studio M Art Models   | 31.92  | 4          |
Studio M Art Models   | 32.95  | 5          |
Studio M Art Models   | 34.21  | 6          |
Studio M Art Models   | 43.30  | 7          |
Studio M Art Models   | 58.33  | 8          |
Unimax Art Galleries  | 33.30  | 1          |
Unimax Art Galleries  | 36.23  | 2          |
Unimax Art Galleries  | 39.83  | 3          |
Unimax Art Galleries  | 49.24  | 4          |

*Execute the code for the full results*
