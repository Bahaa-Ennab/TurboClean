<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Order</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap & Icons -->
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

body>.container, body>main {
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

/* Search input */
#searchInput {
	width: 100%;
	padding: 12px 16px;
	border-radius: 8px;
	border: 1px solid #ccc;
	font-size: 16px;
}

/* Table styles */
table {
	width: 100%;
	border-collapse: collapse;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	background-color: white;
}

thead {
	background-color: #f2f2f2;
}

th, td {
	padding: 12px;
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
				height="40"
				class="d-inline-block align-text-top rounded-circle me-2"> <span
				class="fw-bold brand-hover" style="font-size: 28px; color: white;">
					<span class="turbo">Turbo</span><span class="text-primary">Clean</span>
			</span>
			</a>

			<!-- Navigation Links -->
			<div class="d-flex gap-4 flex-wrap my-2 my-md-0">

				<a href="/customer/home"
					class="nav-link-custom d-flex align-items-center gap-1"> <img
					src="https://img.icons8.com/ios-filled/20/ffffff/home.png" /> Home
				</a> <a href="/customer/orders"
					class="nav-link-custom d-flex align-items-center gap-1"> <img
					src="https://img.icons8.com/ios-filled/20/ffffff/purchase-order.png" />
					All Orders
				</a> <a href="/customer/messages"
					class="nav-link-custom d-flex align-items-center gap-1"> <img
					src="https://img.icons8.com/ios-filled/20/ffffff/sms.png" />
					Messages
				</a>

			</div>


			<!-- Logout Button -->
			<a href="/logout"><button type="submit"
					class="btn btn-outline-light btn-sm px-4">Logout</button></a>

		</div>
	</nav>

	<!-- Main Section -->
	<main
		style="padding: 50px 40px; width: 80%; margin: auto; background-color: #5f7081; margin-bottom: 120px; margin-top: 75px; border-radius: 20px;">
		<!-- Search Input -->
		<div class="mb-5" style="max-width: 700px; margin: auto;">
			<input type="text" id="searchInput"
				placeholder="🔍 Search orders by ID, date, or status"
				style="width: 100%; padding: 18px 20px; border-radius: 12px; border: 1px solid #ccc; font-size: 18px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);">
		</div>

		<!-- Heading -->
		<h1 class="text-center fw-bold mb-5"
			style="font-size: 36px; color: white;">🧾 My Orders</h1>

		<!-- Orders Table -->
		<div class="mx-auto"
			style="max-width: 96%; background-color: #ffffff; padding: 30px 40px; border-radius: 20px; box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);">
			<table
				style="width: 100%; font-size: 18px; border-collapse: collapse;">
				<thead style="background-color: #eceff1;">
					<tr style="height: 60px; color: #333;">
						<th style="padding: 16px;">Order ID</th>
						<th style="padding: 16px;">Date</th>
						<th style="padding: 16px;">Receipt</th>
						<th style="padding: 16px;">Total</th>
						<th style="padding: 16px;">Status</th>
					</tr>
				</thead>
				<tbody id="orderTable">
					<c:forEach var="order" items="${orders}">
						<tr style="border-bottom: 1px solid #ddd; height: 65px;">
							<td style="padding: 16px;"><strong><c:out
										value="${order.id}" /></strong></td>
							<td style="padding: 16px;"><c:out value="${order.date}" /></td>
							<td style="padding: 16px;"><c:out value="${order.address}" /></td>
							<td style="padding: 16px;">$<c:out
									value="${order.total_cost}" /></td>
							<td style="padding: 16px;"><span
								style="background-color: #ffcc80; color: #333; padding: 6px 14px; border-radius: 20px; font-weight: 500;">
									<c:out value="${order.status.condition}" />
							</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	<!-- Footer -->
	<footer class="pt-5 pb-4 border-top"
		style="background-color: #303841; color: white;">
		<div class="container">
			<div class="row">

				<!-- Company Info -->
				<div class="col-md-4 mb-4">
					<h3 class="text-uppercase fw-bold">TurboClean</h3>
					<p>Fast · Reliable · Door-to-door dry cleaning service based in
						Ramallah. Book online, and we'll handle the rest.</p>
				</div>

				<!-- Quick Links -->
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

				<!-- Contact Info -->
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

				<!-- Social Links -->
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

	<!-- JavaScript -->
	<script>
    document.getElementById("searchInput").addEventListener("input", function () {
        let keyword = this.value;
        fetch('/searchOrders?keyword=' + encodeURIComponent(keyword))
            .then(response => response.text())
            .then(data => {
                document.getElementById("orderTable").innerHTML = data;
            });
    });
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
