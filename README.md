#  Base de Datos - Optics y Pizzería

Este repositorio contiene el diseño de dos bases de datos relacionales: **Optics** y **Pizzería**. Ambas bases de datos están modeladas para cumplir con sus respectivos enunciados, estructurando de forma organizada la información, relaciones y lógica de negocio.

---

##  **Optics - Base de Datos**

La base de datos **Optics** modela un sistema para una óptica donde se gestionan proveedores, marcas, clientes, empleados y ventas de gafas.

### **Estructura de Tablas**
1. **Suppliers**  
   - Información de los proveedores.  
   - Clave primaria: `suppliers_ID`.

2. **Brand**  
   - Marcas asociadas a los proveedores.  
   - Clave primaria: `brand_ID`.  
   - Clave foránea: `suppliers_ID` → `Suppliers`.

3. **Glasses**  
   - Información sobre gafas (graduación, tipo de montura, color, etc.).  
   - Clave primaria: `glasses_ID`.  
   - Clave foránea: `brand_ID` → `Brand`.

4. **Customer**  
   - Datos personales de los clientes.  
   - Clave primaria: `customer_ID`.  
   - Relación autorreferencial para **recomendaciones**.

5. **Employee**  
   - Información básica de los empleados.  
   - Clave primaria: `employee_ID`.

6. **Sale**  
   - Ventas realizadas a clientes, gestionadas por empleados.  
   - Clave primaria: `sale_ID`.  
   - Claves foráneas: `customer_ID` → `Customer`, `employee_ID` → `Employee`.

7. **Sale_has_Glasses**  
   - Relación entre ventas y gafas vendidas.  
   - Clave primaria compuesta: `sale_sale_ID`, `glasses_glasses_ID`.

---

##  **Pizzería - Base de Datos**

La base de datos **Pizzería** modela un sistema para la gestión de pedidos de comida (pizzas, hamburguesas y bebidas), empleados y clientes.

### **Estructura de Tablas**
1. **Province**  
   - Almacena las provincias.  
   - Clave primaria: `province_ID`.

2. **Locality**  
   - Relaciona localidades con provincias.  
   - Clave primaria: `locality_ID`.  
   - Clave foránea: `province_ID` → `Province`.

3. **Customer**  
   - Información de los clientes.  
   - Clave primaria: `customer_ID`.  
   - Clave foránea: `locality_ID` → `Locality`.

4. **Pizza_Branch**  
   - Información de las tiendas físicas.  
   - Clave primaria: `pizza_branch_ID`.  
   - Clave foránea: `locality_ID` → `Locality`.

5. **Employees**  
   - Datos de los empleados (cocineros y repartidores).  
   - Clave primaria: `employee_ID`.  
   - Clave foránea: `pizza_branch_ID` → `Pizza_Branch`.

6. **Categories**  
   - Categorías aplicables solo a pizzas.  
   - Clave primaria: `category_ID`.

7. **Products**  
   - Información de productos (pizzas, hamburguesas, bebidas).  
   - Clave primaria: `products_ID`.  
   - Clave foránea: `category_ID` → `Categories` (para pizzas).  
   - Tipo de producto: `ENUM('pizza', 'burger', 'drink')`.

8. **Orders**  
   - Información principal de los pedidos.  
   - Clave primaria: `order_ID`.  
   - Claves foráneas:  
     - `customer_ID` → `Customer`.  
     - `employee_ID` → `Employees`.  
     - `pizza_branch_ID` → `Pizza_Branch`.

9. **Order_Details**  
   - Detalles de los productos en cada pedido.  
   - Clave primaria compuesta: `order_ID`, `products_ID`.  
   - Claves foráneas:  
     - `order_ID` → `Orders`.  
     - `products_ID` → `Products`.  
   - Fecha/Hora de entrega: `delivery_date`.


