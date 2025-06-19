<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Order</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>
    html, body {
        height: 100%;
        margin: 0;
        display: flex;
        flex-direction: column;
    }

    body > .container, body > main {
        flex: 1;
    }

    footer {
        margin-top: auto;
    }
.brand-hover span.turbo:hover {
	color: orange;
}

/* Hover effect for all major headers */
h2:hover, h3:hover {
	color: orange !important;
	cursor: pointer;
}

.nav-link-custom {
	color: #ffffff;
	font-weight: bold;
	text-decoration: none;
	font-size: 22px; /* Slightly bigger */
	transition: color 0.3s ease;
}

.nav-link-custom:hover {
	color: #FFA726; /* Light orange */
}

.btn-outline-light:hover {
	background-color: orange !important;
	border-color: orange !important;
	color: white !important;
}
   .form-container {
        max-width: 600px;
        margin: 70px auto; /* top-bottom: 70px, left-right: auto center */
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
<body style="background-color: #cad1d1; ">

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light shadow-sm"
		style="background-color: #303841; margin-bottom: 0;">
		<div class="container">
<a class="navbar-brand d-flex align-items-center" href="/">
  <img src="https://i.imgur.com/KSZMAPl.png" alt="Logo" width="50" height="50"
       class="d-inline-block align-text-top rounded-circle me-2">
  <span class="fw-bold brand-hover" style="font-size: 28px; color: white;">
    <span class="turbo">Turbo</span><span class="text-primary">Clean</span>
  </span>
</a>
<!-- Navigation Links -->
			<nav class="d-flex gap-4 flex-wrap my-2 my-md-0">
				<a href="/customer/home" class="nav-link-custom">Home</a> <a
					href="/customer/orders" class="nav-link-custom">ALL Orders</a> <a
					href="/customer/messages" class="nav-link-custom">Messages</a>
			</nav>
			<!-- Logout Button -->
			<form action="" method="post" class="mb-0">
				<button type="submit" class="btn btn-outline-light btn-sm px-4">Logout</button>
			</form>
		</div>
	</nav>
<main style="padding: 20px; max-width: 1000px; margin: auto;background-color: #5f7081; ">

	<!-- Search Input -->
	<div style="margin-bottom: 20px;">
		<input type="text" id="searchInput" placeholder="Search by ID, Date, or Status"
		       style="width: 100%; padding: 12px 16px; border-radius: 8px; border: 1px solid #ccc; font-size: 16px;">
	</div>

	<h1 style="text-align: center; margin-bottom: 30px;">My Orders</h1>

	<!-- Orders Table -->
	<table style="width: 100%; border-collapse: collapse; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
		<thead style="background-color: #f2f2f2;">
			<tr>
				<th style="padding: 12px;">ID Order</th>
				<th style="padding: 12px;">Date</th>
				<th style="padding: 12px;">Receipt</th>
				<th style="padding: 12px;">Total</th>
				<th style="padding: 12px;">Status</th>
			</tr>
		</thead>
		<tbody id="orderTable">
			<%-- Initial orders loaded here --%>
			<c:forEach var="order" items="${orders}">
				<tr>
					<td style="padding: 12px;"><c:out value="${order.id}" /></td>
					<td style="padding: 12px;"><c:out value="${order.date}" /></td>
					<td style="padding: 12px;"><c:out value="${order.address}" /></td>
					<td style="padding: 12px;"><c:out value="${order.total_cost}" /></td>
					<td style="padding: 12px;"><c:out value="${order.status.condition}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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