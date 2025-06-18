<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Order</title>
</head>
<body>
	<header>
		<div class="navbar">
			<div class="logo">Turbo Clean</div>

			<div class="nav-links">
				<a href="/customer/home">Home</a> <a href="/customer/orders">ALL
					Orders</a> <a href="/customer/messages">Messages</a>
			</div>

			<form action="" method="post" style="margin: 0;">
				<button type="submit" class="logout-button">Logout</button>
			</form>
		</div>
	</header>

	<h1>My Orders</h1>
	<table>
		<tr>
			<th>ID Order</th>
			<th>Date</th>
			<th>Receipt</th>
			<th>Status</th>

		</tr>
		<c:forEach var="order" items="${orders}">
			<tr>
				<td><c:out value="${order.id}" /></td>
				<td><c:out value="${order.date}" /></td>
				<td><c:out value="${order.address}" /></td>
				<td><c:out value="${order.total_cost}" /></td>
				<td><c:out value="${order.status.condition}" /></td>

			</tr>
		</c:forEach>
	</table>
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