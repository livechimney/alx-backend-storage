-- Create a trigger for stock quantity updates
CREATE TRIGGER update_stock_quantity
AFTER INSERT on orders
FOR EACH ROW
UPDATE items SET quantity = quantity - NEW.number WHERE name = NEW.item_name;
