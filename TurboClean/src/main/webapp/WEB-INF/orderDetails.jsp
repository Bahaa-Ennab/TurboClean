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

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
html, body {
	height: 100%;
	margin: 0;
	display: flex;
	flex-direction: column;
}

body>main, body>.container {
	flex: 1;
}

footer {
	margin-top: auto;
}

.brand-hover span.turbo:hover {
	color: orange;
}

h2:hover, h3:hover, h1:hover, a:hover {
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
/* Search */
.search-form {
	max-width: 700px;
	margin: 40px auto 20px;
	display: flex;
	gap: 10px;
}

.search-form input[type="text"] {
	width: 100%;
	padding: 14px 18px;
	border-radius: 12px;
	border: 1px solid #ccc;
	font-size: 16px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.search-form button {
	padding: 14px 22px;
	background-color: #ff8800;
	color: white;
	border: none;
	border-radius: 10px;
	transition: 0.3s ease;
}

.search-form button:hover {
	background-color: #e67600;
}
/* Table */
table {
	width: 100%;
	border-collapse: collapse;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	background-color: white;
}

thead {
	background-color: #eceff1;
}

th, td {
	padding: 16px;
	text-align: left;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}
</style>
</head>
<body style="background-color: #cad1d1;">

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light shadow-sm"
		style="background-color: #303841;">
		<div class="container">
			<a class="navbar-brand d-flex align-items-center" href="/"> <img
				src="https://i.imgur.com/KSZMAPl.png" alt="Logo" width="40"
				height="40" class="rounded-circle me-2"> <span
				class="fw-bold brand-hover" style="font-size: 28px; color: white;">
					<span class="turbo">Turbo</span><span class="text-primary">Clean</span>
			</span>
			</a>

			<div class="d-flex gap-4 flex-wrap my-2 my-md-0">

				<a href="/admin/dashboard"
					class="nav-link-custom d-flex align-items-center gap-1"> <img
					src="https://img.icons8.com/ios-filled/20/ffffff/add-shopping-cart.png" />
					New Order
				</a> <a href="/admin/customers"
					class="nav-link-custom d-flex align-items-center gap-1"> <img
					src="https://img.icons8.com/ios-filled/20/ffffff/user-group-man-man.png" />
					All Customers
				</a> <a href="/orders/all"
					class="nav-link-custom d-flex align-items-center gap-1"> <img
					src="https://img.icons8.com/ios-filled/20/ffffff/purchase-order.png" />
					All Orders
				</a> <a href="/admin/messages"
					class="nav-link-custom d-flex align-items-center gap-1"> <img
					src="https://img.icons8.com/ios-filled/20/ffffff/sms.png" />
					Messages
				</a>

			</div>

			<a href="/logout">
				<button type="submit" class="btn btn-outline-light btn-sm px-4">Logout</button>
			</a>
		</div>
	</nav>
	<article class="my-5">
		<div class="container" style="max-width: 900px;">
			<div class="card shadow rounded-4 p-4"
				style="background-color: #5f7081; color: white;">

				<!-- Customer & Address -->
				<h2 class="mb-3">
					👤 Customer: <span class="fw-normal"> <c:out
							value="${order.customer.firstName}" /> <c:out
							value=" ${order.customer.lastName}" />
					</span>
				</h2>

				<h4 class="mb-4">
					📍 Address: <span class="fw-normal"> <c:out
							value="${order.address}" />
					</span>
				</h4>

				<!-- Order Table -->
				<div
					style="background-color: white; padding: 30px 40px; border-radius: 20px;">
					<table class="table table-bordered text-center align-middle"
						style="font-size: 18px;">
						<thead class="table-light">
							<tr>
								<th>🧺 Items</th>
								<th>💰 Cost per Item</th>
								<th>🔢 Quantity</th>
								<th>🧾 Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${order.orderItems}">
								<tr>
									<td><c:out value="${item.item.itemName}" /></td>
									<td>$<c:out value="${item.item.cost}" /></td>
									<td><c:out value="${item.quantity}" /></td>
									<td>$<c:out value="${item.item.cost * item.quantity}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- Total Cost -->
				<h3 class="mt-4">
					💵 Total Cost: <span class="fw-normal">$<c:out
							value="${order.total_cost}" /></span>
				</h3>


			</div>
		</div>
	</article>



	<!-- Footer -->
	<footer class="pt-5 pb-4 border-top"
		style="background-color: #303841; color: white;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-4">
					<h3 class="text-uppercase fw-bold">TurboClean</h3>
					<p>Fast · Reliable · Door-to-door dry cleaning service based in
						Ramallah. Book online, and we'll handle the rest.</p>
				</div>
				<div class="col-md-2 mb-4">
					<h3 class="fw-bold mb-3">Quick Links</h3>
					<ul class="list-unstyled">
						<li><a href="#" class="text-decoration-none"
							style="color: white;">Home</a></li>
						<li><a href="#" class="text-decoration-none"
							style="color: white;">Services</a></li>
						<li><a href="#" class="text-decoration-none"
							style="color: white;">About Us</a></li>
						<li><a href="#" class="text-decoration-none"
							style="color: white;">Contact</a></li>
						<li><a href="#" class="text-decoration-none"
							style="color: white;">Policy</a></li>
					</ul>
				</div>
				<div class="col-md-3 mb-4">
					<h3 class="fw-bold mb-3">Contact</h3>
					<p>
						<i class="bi bi-geo-alt-fill me-2"></i> Ramallah, Palestine
					</p>
					<p>
						<i class="bi bi-telephone-fill me-2"></i> +970 595 000 000
					</p>
					<p>
						<i class="bi bi-envelope-fill me-2"></i> info@turboclean.ps
					</p>
				</div>
				<div class="col-md-3 mb-4">
					<h3 class="fw-bold mb-3">Follow Us</h3>
					<a href="#" class="d-block mb-2" style="color: white;"><i
						class="bi bi-facebook me-1"></i> Facebook</a> <a href="#"
						class="d-block mb-2" style="color: white;"><i
						class="bi bi-instagram me-1"></i> Instagram</a> <a href="#"
						class="d-block mb-2" style="color: white;"><i
						class="bi bi-whatsapp me-1"></i> WhatsApp</a>
				</div>
			</div>
			<hr style="border-color: rgba(255, 255, 255, 0.2);">
			<div class="text-center small">© 2025 TurboClean. All rights
				reserved.</div>

		</div>
	</footer>

	<script>
		function openEditPopup(orderId) {
			const url = `/order/edit/${orderId}`;
			window
					.open(url, 'Edit Order',
							'width=800,height=600,left=100,top=100,resizable=yes,scrollbars=yes');
		}
	</script>
</body>
</html>