


create table Departments(Did int primary key,Name varchar(30),Head varchar(30),Description varchar(70),Strength int default 0);
 
insert into Departments values(1,"HR","Hemanth","Finding, screening, recruiting, and training job applicants.",0);
insert into Departments values(2,"Application","Jeff Bezos","Handling and adding new features to the website and App.",0);
insert into Departments values(3,"AI","Mark Henry","Developing and improving the AI facilites.",0);
insert into Departments values(4,"Marketing","Joey Tribbiani","Marketing of the product.",0);
insert into Departments values(5,"Customer Support","Chandler Bing","To solve the issues of customers and analyse their feedback.",0);
 
create table Employees(Eid int primary key,Name varchar(100),Did int,Gender varchar(10),Address varchar(100),Dob date,Contact varchar(100),Email varchar(100),Salary float,Pid int,FOREIGN KEY (Did) REFERENCES Departments(Did));
 
insert into Employees values(1,"Hemanth",1,"Male","House 8 Bilekahalli,Mangalore","1971-12-22","9567701011","hemanth@gmail.com",280000,null);
insert into Employees values(2,"Joey Tribbiani",4,"Male","Gate 4 Jalahalli,Bangalore","1973-11-19","9787666643","howyoudoin@gmail.com",500000,3);
insert into Employees values(3,"Jeff Bezos",2,"Male","Agni Homes,Pune","1969-10-10","7788993322","iamjeff@gmail.com",990000,null);
insert into Employees values(4,"Chandler Bing",5,"Male","16 Yemen Road, Yemen","1981-1-1","8339447901","ilmonica@geller.com",700000,1);
insert into Employees values(5,"Mark Henry",3,"Male","Mariana meadows,Chennai","1976-2-2","9898776077","mark@henry.com",666000,null);
insert into Employees values(6,"Monica Geller Bing",5,"Female","Central Perk, NY","1983-3-3","7688994455","ilchandler@bing.com",100000,1);
insert into Employees values(7,"Pheobe Buffay",4,"Female","Bhagwan Vilas,New-Delhi","1984-4-4","8787665548","smellycat@gmail.com",77000,2);
insert into Employees values(9,"Bradd hulfman",4,"Male","Bhagwan Vilas,New-Delhi","1986-4-14","8787395548","str1@gmail.com",74560,2);
 
create table Projects(Pid int primary key,Title varchar(100),Budget float,Hid int,Estimated_Time int,Status varchar(10));
 
insert into Projects values(1,"AI Bot",1000000,5,13,"Approved");
insert into Projects values(2,"New UI for app",500000,3,5,"Completed");
insert into Projects values(3,"New website marketing",300000,2,2,"Approved");
 
create table Customers(Cid int primary key,Name varchar(100),Address varchar(100),Contact varchar(100),Email varchar(100));
 
insert into Customers values(1,"Virat","Gate 4 Jalahalli,Bangalore","9900101011","Virat@gmail.com");
insert into Customers values(2,"Rohit","House 8 Bilekahalli,Mangalore","9567701011","Rohit@gmail.com");
insert into Customers values(3,"Ronaldo","Sweet Homes,Hyderabad","9341010211","Ronaldo@gmail.com");
insert into Customers values(4,"Graham","Bhagwan Vilas,New-Delhi","9900105609","Graham@gmail.com");
insert into Customers values(5,"Bradman","Villa 8 Juhu,Mumbai","8900145011","Bradman@gmail.com");
insert into Customers values(6,"Nathan","Bhagwati colony,Mumbai","8900145011","Nathan@gmail.com");
insert into Customers values(7,"Vrinda","Mariana meadows,Chennai","8900145011","Vrinda@gmail.com");
 
create table Sellers(Sid int primary key,Name varchar(100),Address varchar(100),Contact varchar(100));
 
insert into Sellers values(1,"Vyom","Gate 344 Jala,Kanyakumari","9870101011");
insert into Sellers values(2,"Rohini","House 238 Lekahalli,Kashmir","9137701011");
insert into Sellers values(3,"Rakshit","Agni Homes,Pune","9341010257");
insert into Sellers values(4,"Riya","Poorna Vilas,Chandigarh","9380105609");
insert into Sellers values(5,"Akanksha","Villa 238 Juhuni,Guwahati","8975145010");
insert into Sellers values(6,"Nishtha","Bhagwan vilas colony,Udupi","8903215011");
 
create table Products(Gid int primary key,Name varchar(30),Description varchar(100),Price int,Sid int,FOREIGN KEY (Sid) REFERENCES Sellers(Sid));
 
insert into Products values(1,"Iphone 38","A cellphone with 48MP camera and the latest features",20000,6);
insert into Products values(2,"Lenovo s800","Worlds sleekest designed laptop to power your life",90000,3);
insert into Products values(3,"Saffola Blankets","Makes winters warmer with double layered wool",5000,2);
insert into Products values(4,"Earybuds","Earbuds with Hybrid Active Noise Cancellation (up to -35 dB)",20000,1);
insert into Products values(5,"Samsung A7000","4K Ultra HD Certified Android Smart tv ",100000,4);
insert into Products values(6,"Ajanta","27 Carot gold with pure embedded diamond",250000,5);
insert into Products values(7,"Earybuds REALME","Earbuds ",2000,1);
insert into Products values(8,"Samsung m12","4K Ultra HD Certified Android Smart tv 52inches",120000,4);
insert into Products values(9,"Ajanta 224","24 Carot gold with pure embedded diamond",150000,2);
insert into Products values(10,"Earybuds REALME","Earbuds ",2000,2);
insert into Products values(11,"Samsung m12","4K Ultra HD Certified Android Smart tv 52inches",120000,2);
insert into Products values(12,"Ajanta 224","24 Carot gold with pure embedded diamond",150000,3);
 
create table Transaction(Tid int primary key,Gid int,Cid int,FOREIGN KEY (Gid) REFERENCES Products(Gid),FOREIGN KEY (Cid) REFERENCES Customers(Cid));
 
insert into Transaction values(1,1,5);
insert into Transaction values(2,2,3);
insert into Transaction values(3,3,1);
insert into Transaction values(4,4,4);
insert into Transaction values(5,5,6);
insert into Transaction values(6,6,2);
 



-- simple queries

-- 6)
select count(*) as COUNT_OF_CUSTOMERS from customers;


-- 10
update products set price=350000 where Name='Ajanta';

-- 7
select Title,Budget from projects;

-- 9
 select * from Employees as e where e.Salary=(select max(Salary) from Employees;

--  8)
select * from Employees where Did=1;

-- 5)
select * from Employees where Pid is null;

-- 4
 delete from Sellers where Sid=7;

--  3
 update Projects set Status ='Completed' where Pid=1;


--  2

-- 1
select * from Employees where Eid in(select Hid from Projects);



-- Procedures

-- 4
create procedure profit(out netPr decimal(10,4))
begin
declare netProfit decimal(10,4);
select sum(Price) into netProfit from Products where Gid in (select Gid from Transaction);
set netPr=0.01*netProfit;
end //

call profit(@netProfit);

select @netProfit;



-- 5
create procedure tax(out taxes decimal(10,4))
begin
declare tax1 decimal(10,4);
select sum(a.Price) into tax1 from products a,transaction b where b.Gid=a.Gid;
set taxes=0.01*tax1*0.18;
end //

call tax(@nettaxes);
select @nettaxes;




-- 6
create procedure seller_selling_maxItems()
begin
select max(cnt) into @count1 from (select Sid,count(*) as cnt from Products  group by Sid)t;
select Sid into @usid from  (select Sid,count(*) as cnt from Products  group by Sid )t where cnt=@count1;
select * from  Sellers where Sid=@usid;
end //

call seller_selling_maxItems();


-- 7
create procedure most_selling_product()
begin
select max(cnt) into @count1 from (select Gid,count(*) as cnt from transaction  group by Gid)t;
select Gid into @gsid from  (select Gid,count(*) as cnt from transaction  group by Gid )v where cnt=@count1;
select * from  Products where Gid=@gsid;
end //

call most_selling_product();


-- 1

create procedure pendingprojects()
begin
select Budget,Title from Projects where Status="Approved";
end //

call pendingprojects();



-- FUCTIONS

-- 3
DELIMITER $$  
CREATE FUNCTION tax_calcltr(  
   salary1 int 
)   
RETURNS double(10,4) 
DETERMINISTIC  
BEGIN  
    DECLARE tax double(10,4);  
    IF salary1 > 500000 THEN  
        SET tax= 0.18*salary1;  
    ELSEIF (salary1 <= 500000 AND   
            salary1 >= 300000) THEN  
        SET tax= 0.10*salary1; 
    ELSEIF salary1 < 300000 THEN  
        SET tax= 0.05*salary1; 
    END IF;    
    RETURN (tax);  
END$$  
DELIMITER ;  



-- 8
CREATE FUNCTION total_sellers(  
  product varchar(50)
)   
RETURNS int
DETERMINISTIC  
BEGIN  
    select count(*) into @res  from Products where Name=product;
    return @res; 
END$$  
DELIMITER ;  


select total_sellers('Samsung m12');


-- 10
DELIMITER $$
CREATE FUNCTION top__customer(
)   
RETURNS varchar(60)
DETERMINISTIC  
BEGIN 
    declare c varchar(60); 
    select max(cnt) into @val from(select Cid,count(*) as cnt   from transaction group by Cid)t;
    select Cid into @id from(select Cid,count(*) as cnt   from transaction group by Cid)t where cnt=@val;
    select Name into @res1 from Customers where Cid=@id;
    set c=@res1;
    return c ; 
END$$  
DELIMITER ;  


select top__customer();



-- 9


DELIMITER $$
CREATE FUNCTION HOD(
    dept varchar(30)
)   
RETURNS varchar(60)
DETERMINISTIC  
BEGIN 
    declare c varchar(60); 
select Head into @res1 from Departments where Name =dept;
    set c=@res1;
    return c ; 
END$$  
DELIMITER ;  


select HOD('HR');



-- triggers



update departments d set strength=(select cnt from (select Did,COUNT(*)as  cnt from Employees e where d.Did=e.Did group by Did)t);


-- 2)

CREATE TABLE archives (  
id int(11) NOT NULL AUTO_INCREMENT,    
Name varchar(50) NOT NULL,  
Address varchar(50) NOT NULL,
Contact varchar(50) NOT NULL,  
Email varchar(50) NOT NULL,  
changedon datetime DEFAULT NULL,  
action varchar(50) DEFAULT NULL,  
PRIMARY KEY (id)  
); 

DELIMITER // 
CREATE TRIGGER before_employee_update  
BEFORE UPDATE  
ON customers
FOR EACH ROW  
BEGIN  
INSERT INTO archives
SET action = 'update',  
Email = OLD.Email,  
Name = OLD.Name, 
Address=OLD.Address,
Contact=OLD.Contact,  
changedon = NOW();  
END//  
DELIMITER ;  