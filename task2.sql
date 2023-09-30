select products.name as product_name, categories.name as category_name
from products
         left join  products_categories on products.uuid = products_categories.product_id
         left join  categories  on products_categories.category_id = categories.id;
