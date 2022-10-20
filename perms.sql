use Sample;

grant insert
on Client
to user1;


select * from Client;
insert into Client
(Client_Id, Name, Address, TP)
values
('C2','Ru', 'Col1', 720094828);