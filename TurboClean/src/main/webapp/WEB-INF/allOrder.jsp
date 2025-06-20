<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
.custom-btn-orange {
	background-color: #f5a623;
	color: white;
	border: none;
	transition: background-color 0.3s ease;
}

.custom-btn-orange:hover {
	background-color: #e07b00;
	color: white;
}

html, body {
	height: 100%;
	margin: 0;
	display: flex;
	flex-direction: column;
}

body>.container, body>main {
	flex: 1;
}

footer {
	margin-top: auto;
}

.brand-hover span.turbo:hover {
	color: orange;
}

h2:hover, h3:hover, a:hover {
	color: orange !important;
	cursor: pointer;
}

.nav-link-custom {
	color: #ffffff;
	font-weight: bold;
	text-decoration: none;
	font-size: 22px;
	transition: color 0.3s ease;
}

.nav-link-custom:hover {
	color: #FFA726;
}

.btn-outline-light:hover {
	background-color: orange !important;
	border-color: orange !important;
	color: white !important;
}

.form-container {
	max-width: 600px;
	margin: 70px auto;
	padding: 30px;
	border-radius: 16px;
	background-color: #f8f9fa;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.form-container h3 {
	margin-bottom: 20px;
	font-weight: bold;
	color: #333;
}

.form-container input[type="submit"] {
	background-color: #ff8800;
	color: white;
	border: none;
	padding: 10px 25px;
	font-weight: 500;
	border-radius: 8px;
	transition: background-color 0.3s ease;
}

.form-container input[type="submit"]:hover {
	background-color: #ff6a00;
}

.success-message {
	margin-top: 15px;
	color: green;
	font-weight: bold;
}
</style>
</head>
<body>
<header>
<div class="navbar">
    <div class="logo">Turbo Clean</div>

    <div class="nav-links">
        <a href="/admin/dashboard">New Order</a> <a href="/admin/customers">Customer</a> <a href="">All
					Order</a> <a href="/admin/messages">Messages</a>
        
    </div>

    <form action="" method="post" style="margin: 0;">
        <button type="submit" class="logout-button">Logout</button>
    </form>
</div>
</header>
<form action="/admin/search" method="get" class="search-form">
    <input type="text" name="keyword" placeholder="Search by name, ID..." required />
    <button type="submit">🔍 Search</button>
</form>
<article>
    <form:form action="" modelAttribute="order" method="post">
	<h1>All Orders</h1>
        <table>
            <tr>
                <th>ID Order</th>
                <th>Name</th>
                <th>Phonenumber</th>
                <th>Email</th>
                <th>Location</th>
                <th>Status</th>
                <th>Total Cost</th>
            </tr>
           <c:forEach var="order" items="${orders}">
                <tr>
                    <td><c:out value="${order.id}"/></td>
                    <td><c:out value="${order.customer.name}"/></td>
                    <td><c:out value="${order.customer.phone}"/></td>
                    <td><c:out value="${order.customer.email}"/></td>
                    <td><c:out value="${order.customer.location}"/></td>
                    <td><c:out value="${order.status}"/></td>
                    <td>$<c:out value="${order.totalCost}"/></td>
                </tr>
            </c:forEach>
        </table>

    </form:form>

</article>
    <strong>Total Price:</strong> <span id="totalPrice">7</span> $
<footer class="bg-white border-top mt-20 py-4">
		<div class="container text-center small text-muted">
			<p class="mb-1">© 2025 TurboClean – Ramallah, Palestine · Fast ·
				Reliable · Door-to-Door Dry Cleaning</p>
			<p
				class="mb-0 d-flex flex-column flex-sm-row justify-content-center align-items-center gap-3">
				<span> <img
					src="https://img.icons8.com/ios-filled/20/phone.png"
					alt="Phone Icon" class="me-1" /> <a href="#"
					class="text-decoration-none">+970595000000</a>
				</span> <span> <img
					src="https://img.icons8.com/ios-filled/20/marker.png"
					alt="Location Icon" class="me-1" /> Ramallah, Palestine
				</span> <span> Follow us: <a href="#"
					class="text-decoration-none ms-1">Facebook</a> <a href="#"
					class="text-decoration-none ms-1">Instagram</a> <a href="#"
					class="text-decoration-none ms-1">WhatsApp</a>
				</span>
			</p>
		</div>
	</footer>
</body>
</html>