#TurboCLean
🧼 TurboClean
A modern, responsive web application designed to manage dry cleaning business operations, streamline order processing, and enhance customer and admin experience.

📌 Project Name: TurboClean

🛠️ Technologies Used
Backend: Java, Spring Boot
Frontend: JSP, Bootstrap 5, Thymeleaf, AJAX
Database: MySQL
Other Tools: Hibernate/JPA, Jakarta Bean Validation, Maven

🧱 Project Structure (Packages)

controllers: Handles HTTP requests and routing

models: Entity classes representing database tables

repositories: Interfaces for database access

services: Business logic and operations

🖥️ Pages Overview

Homepage: Overview with navigation links for customers and admins

Login Page: Shared login with role-based redirect

Customer Dashboard: Create orders, view order status, manage profile

Admin Dashboard: Manage orders, items, and inventory; view statistics

Order Form: Dynamic item selection with quantity and cost calculation

🧩 Core Models & Relationships

Customer: User info, contact details

Admin: Admin users managing the system

Order: Linked to customers and items, tracks status and total cost

Item: Dry cleaning items and products available

OrderItem: Join entity for many-to-many between orders and items

🔐 Authentication System

Role-based login (Customer/Admin)

Session management

Secure access control per role

💎 Key Features

Real-time order creation with AJAX item filtering

Dynamic total cost calculation

Separate dashboards tailored to user roles

Inventory management

Responsive and clean UI with Bootstrap

🌍 Why It Matters

Streamlines dry cleaning business workflows

Improves order tracking and customer satisfaction

Organizes inventory and sales in one platform

Reduces manual errors and paperwork

🖋️ Typography

Clean and readable fonts optimized for web UI

🎨 UI/UX Stack

Bootstrap 5: Responsive design

AJAX & JavaScript: Interactive, smooth user experience

JSP/Thymeleaf: Server-side rendering
