
drop table bf_inter;
drop table bf_final;

CREATE TABLE bf_inter (
  number INT PRIMARY KEY,
  classification TEXT,
  datetime TEXT
);

CREATE TABLE bf_final (
  number INT PRIMARY KEY,
  classification TEXT,
  datetime TEXT
);

insert into bf_inter
select number, classification from bf_loc
union 
select number, classification from bf_geo
union  
select number, classification from bf_rep
order by number;

select * from bf_inter

insert into bf_final 
select distinct number, classification from bf_merge; 

select * from bf_final