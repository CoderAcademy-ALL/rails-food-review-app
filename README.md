# README

Products
- id:bigint PRIMARY KEY
-  name:string
-  brand:string
-  price:integer
-  description:text

User
- id:bigint PRIMARY KEY
- name
- email

Review
- id:bigint PRIMARY KEY
-  review_rating:integer
-  review:text
-  product_id:bigint FOREIGN KEY
-  user_id:bigint FOREIGN KEY

