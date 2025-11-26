select * from 
customer_shopping_behavior;

-- add the new column called age_group--
alter table customer_shopping_behavior
add age_group varchar(20);

-- Update the age_group column based on specified age ranges: 'teenager', 'young adult', 'adult', and 'senior' --
update customer_shopping_behavior
set age_group = case 
    when age between 13 and 19 then 'teenager'
    when age between 20 and 35 then 'young adult'
    when age between 36 and 55 then 'adult'
 
    else 'unknown'
end;
  
  -- group seasonal, winter, summer based on Item_purchased column --
alter table customer_shopping_behavior
add season_group varchar(20);

update customer_shopping_behavior
set season_group = case
    when Item_purchased in ('coat', 'scarf', 'gloves', 'boots') then 'winter'
    when Item_purchased in ('swimsuit', 'sunglasses', 'flip-flops', 'beach towel') then 'summer'
    when Item_purchased in ('pumpkin spice latte', 'holiday decorations', 'fireplace tools') then 'seasonal'
    else 'other'
end;

-- group payment methods digital or cash --
alter table customer_shopping_behavior
add payment_method_group varchar(20);

update customer_shopping_behavior
set payment_method_group = case
    
when payment_method in ('cash', 'check') then 'cash'
    else 'Digital'
end;

-- adding price category grouping  column --
alter table customer_shopping_behavior
add price_category varchar(20); 


-- price category grouping  below 50 is low,medium 50-80, high above 80 --
update customer_shopping_behavior
set price_category = case
    when Purchase_Amount_USD< 50 then 'low'
    when Purchase_Amount_USD between 50 and 80 then 'medium'
    else 'High'
end;
    select * from 
customer_shopping_behavior;




