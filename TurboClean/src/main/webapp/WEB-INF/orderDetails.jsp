<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
</head>
<body>
	<header>
		<div class="navbar">
			<div class="logo">Turbo Clean</div>

			<div class="nav-links">
				<a href="">Home</a> <a href="">ALL Orders</a> <a href="">Messages</a>
			</div>

			<form action="" method="post" style="margin: 0;">
				<button type="submit" class="logout-button">Logout</button>
			</form>
		</div>
	</header>

	<h1> Customer: 
		<c:out value="${order.customer.firstName}" />
		<c:out value=" ${order.customer.lastName}" />
	</h1>
	<h1>
		Address: <c:out value="${order.address}" />
	</h1>
	<table border="1">
		<tr>
			<th>Items</th>
			<th>Cost for one Item</th>
			<th>Number of Items</th>
			<th>Total</th>
		</tr>
			<c:forEach var="item" items="${order.orderItems}">
		<tr>
				<td><c:out value="${item.item.itemName}" /></td>
				<td><c:out value="${item.item.cost}" /></td>
				<td><c:out value="${item.quantity}" /></td>
				<td><c:out value="${item.item.cost * item.quantity}" /></td>
		</tr>
			</c:forEach>
	</table>
		<h1>
		Total Cost: <c:out value="${order.total_cost}" />
	</h1>
<a href="/order/edit_display/${order.id}"><button>Edit Order</button></a>

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