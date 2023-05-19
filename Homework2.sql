select *
from dbo.Products

alter table dbo.Products
add constraint DF_Products_Price
default (1) for [Price]

alter table dbo.Products
add constraint chk_price_cost_ratio check (Price <= (2 * Cost));

alter table dbo.Products
add constraint uniq_Name unique ([Name]);

update dbo.Products
set [Name] = 'Gluten Free2'
where Id = 13

update dbo.Products
set [Name] = 'Multigrain2'
where Id = 12