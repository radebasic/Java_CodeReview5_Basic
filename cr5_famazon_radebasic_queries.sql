
1. how many products were bought from a specific company?

SELECT count(*) FROM products AS pr
inner join suppliers as sup on pr.ID_supplier=sup.ID_supplier
inner join invoice_item as inv on pr.ID_product=inv.ID_product
where pr.ID_supplier=1 


2. who purchased products on this date

SELECT b.* from products as pr
inner join invoice_item as inv on inv.ID_product=pr.ID_product
inner join invoice_header as invhed on inv.ID_invoice_header=invhed.ID_invoice_header
inner join buyers as b on b.ID_buyer=invhed.ID_buyer
where invhed.invoice_date='2020-12-03'




3. what  products were sent between this and that date,

SELECT products.* FROM products
inner join order_item on products.ID_product=order_item.ID_product
inner join orders_header on orders_header.ID_order_header=order_item.ID_order
where orders_header.ID_order_status=1 and orders_header.order_date > '2020-12-01' and orders_header.order_date < '2020-12-05'

4. how many products were sent to a specific city etc. 

SELECT count(*) FROM products as pr
inner join order_item as orr on pr.ID_product=orr.ID_product
inner join orders_header as oh on oh.ID_order_header=orr.ID_order
inner join buyers as b on b.ID_buyer=oh.ID_buyer
where oh.ID_order_status=1 and  b.ID_City=1




5. name and products bought from specific supplier

SELECT * FROM products AS pr
inner join suppliers as sup on pr.ID_supplier=sup.ID_supplier
inner join invoice_item as inv on pr.ID_product=inv.ID_product
where pr.ID_supplier=1
