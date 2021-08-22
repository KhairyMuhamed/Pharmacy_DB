create table Doctor (DrPhys_ID number(10) not null,Dr_Name varchar(20) ,
Dr_Phonenumber number(11),Speciality varchar(20),
constraint DrPhys_ID primary key (DrPhys_ID));


create table Patient (P_ID number(10) not null, DrPhys_ID number(10) not null,
P_Name varchar(20), N_ID number(14),Phone number(11),
constraint P_ID primary key (P_ID),constraint DrPhys_ID_FK foreign key (DrPhys_ID) references Doctor(DrPhys_ID));
 
 
 
create table Pharmacy (PH_Name varchar(20) not null, PH_ID number(10),
Address varchar2(50),PhoneNumber number (11),
constraint PH_Name primary key (PH_Name));


create table Employee (E_ID number(10) , PH_Name varchar(20),Employee_Name varchar(20), National_ID number(14),
Address varchar2(50), Speciality varchar(50), phonenumber number(11),
constraint E_ID primary key (E_ID),
constraint PH_Name_FK foreign key (PH_Name) references Pharmacy(PH_Name));


create table DrugManufacturar (Manu_Name varchar(50),Address varchar(50),
Manu_phone number(11),constraint Manu_Name primary key (Manu_Name));



create table Drug (Drug_Trade_Name varchar(20),Parcode number(20),
Medecation_No number(20), Type_of_drug varchar(20),Manu_Name varchar(50),
Produce_Date date, Expire_Date date,constraint Drug_Trade_Name primary key (Drug_Trade_Name),
constraint Manu_Name_FK foreign key (Manu_Name) references DrugManufacturar(Manu_Name));


create table Prescription(Serial_No number(10), DrPhys_ID number(10), P_ID number(10),
Drug_Trade_Name varchar(20),P_Date date,Quantity number (10), DrName varchar(20),
constraint Serial_No primary key (Serial_No) , 
constraint DrPhys_ID_FK_P foreign key (DrPhys_ID) references Doctor (DrPhys_ID),
 constraint P_ID_FK foreign key (P_ID) references Patient (P_ID), 
 constraint Drug_Trade_Name_FK_D foreign key (Drug_Trade_Name) references Drug (Drug_Trade_Name));

 
 create table Supplier(Sup_Name varchar(20), phone number(11), Address varchar(50),
 constraint Sup_Name primary key (Sup_Name));

 
 create table Shipment (Sh_No number(10),Sup_Name varchar(20),Manu_Name varchar(50),
 constraint Sh_No primary key (Sh_No),
 constraint Manu_Name_FKS foreign key (Manu_Name) references DrugManufacturar(Manu_Name),
   constraint Sup_Name_FK foreign key (Sup_Name) references Supplier(Sup_Name));
   
   
   create table Sales_Process (D_Parcode number(10),Drug_Trade_Name varchar(20),PH_Name varchar(20),
   Quantity number(10),Type_Of_Sale varchar(20), constraint D_Parcode primary key (D_Parcode),
   constraint Drug_Trade_Name_FK_SP foreign key (Drug_Trade_Name) references Drug (Drug_Trade_Name),
   constraint PH_Name_FK_SP foreign key (PH_Name) references Pharmacy(PH_Name));
  
    
    create table D_Order (Bill_No number(10),PH_Name varchar(20),Sup_Name varchar(20),Quantity number(10),
    constraint Bill_No primary key (Bill_No),
    O_Date date,constraint PH_Name_FK_O foreign key (PH_Name) references Pharmacy(PH_Name),
    constraint Sup_Name_FK_O foreign key (Sup_Name) references Supplier(Sup_Name) )
    
    
    
    insert into Doctor (DrPhys_ID , Dr_Name , Dr_phonenumber, Speciality)
    values (1,'Ahmed','0101111111','Heart_disease');
    
     
    insert into Doctor (DrPhys_ID , Dr_Name , Dr_phonenumber, Speciality)
    values (3,'Mohamed','01211121111','Bones');
    
    
       
    insert into Pharmacy (Ph_Name,Ph_ID,Address,PhoneNumber)
    values('Elsakhawy_Pharmacy',165492,'Alex,Bakows,ElmawaseerSt',5018599);
    
    
    insert into Employee (E_ID, PH_Name, National_ID, Address,Speciality ,PhoneNumber,Employee_Name)
    values(1,'Elsakhawy_Pharmacy',25148975365478,'Alex_Campshizar','Pharaciest',01222569874,'Moustafa');
   
    
    insert into Patient(P_ID,DrPhys_ID,P_Name,N_ID,Phone)
    values(1,1,'Ziad',25698777778895,01255559987);
   
    
       
     insert into Patient(P_ID,DrPhys_ID,P_Name,N_ID,Phone)
    values(2,2,'Eman',262247778895,01166669987);
    
    
    insert into DrugManufacturar(Manu_Name,Address,Manu_Phone)
    values('Elwatanya','Egypt_cairo',5050897);
    
    
    insert into DrugManufacturar(Manu_Name,Address,Manu_Phone)
    values('AmericanDrug','UnitedStates_NewYork',5498460163);
    
    
    
     insert into Drug(Drug_Trade_Name,Parcode,Manu_Name,Type_of_drug,Produce_Date,Expire_Date,Medecation_No)
     values ('Natrilix',0001111110000,'Elwatanya','Tablets','22-feb-21','22-feb-26',11111122222);

     
      insert into Drug(Drug_Trade_Name,Parcode,Manu_Name,Type_of_drug,Produce_Date,Expire_Date,Medecation_No)
     values ('Flamogen',000111111110,'Elwatanya','Tablets','22-jun-18','22-feb-22',1111111222);

     
     insert into Prescription(Serial_No,DrPhys_ID,P_ID,Drug_Trade_Name,P_Date,Quantity,DrName)
     values(111112,1,2,'Natrilix','14-feb-21',5,'Ahmed');

     
     
     insert into Supplier (Sup_Name,Phone,Address)
     values('Elfath',5050459,'Alex_Elraml');

     
     insert into Supplier (Sup_Name,Phone,Address)
     values('Elshefaa',5080559,'Alex_Elmontaza');

     
     insert into Shipment(Sh_No,Sup_Name,Manu_Name)
     values(111222255,'Elshefaa','AmericanDrug');
     

     
     insert into D_Order(Bill_No,Ph_Name,Sup_Name,Quantity,O_Date)
     values(1,'Elsakhawy_Pharmacy','Elfath',100,'22-jan-20');

     
     insert into Sales_Process(D_Parcode,Drug_Trade_Name,Ph_Name,Quantity,Type_Of_Sale)
     values(111111100,'Flamogen','Elsakhawy_Pharmacy',2,'cash') ;
