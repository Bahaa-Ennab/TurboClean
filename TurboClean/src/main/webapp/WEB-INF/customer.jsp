<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Customer Home Page</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
.service-box {
	border: 2px solid #333;
	border-radius: 12px;
	width: 160px;
	height: 180px;
	padding: 10px;
	background-color: white;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	transition: border-color 0.3s ease;
}

.service-box:hover {
	border-color: orange;
	box-shadow: 0 4px 12px rgba(255, 165, 0, 0.3);
	cursor: pointer;
}

.service-box img {
	max-height: 110px;
	width: auto;
	object-fit: cover;
	border-radius: 6px;
}

.service-box h6 {
	margin: 0;
	margin-top: 5px;
	color: #222;
}

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

/* Background color ONLY around the images container */
.d-flex.flex-wrap.justify-content-center.gap-4 {
    background-color: #5F7081;
    border-radius: 12px;
    padding: 15px;
}
</style>
</head>

<body>

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

	<main class="py-5" style="background-color: #cad1d1;">
		<div class="container">
			<div class="row g-4">
				<!-- Gallery Column -->
				<div class="col-md-6">
					<div class="d-flex flex-wrap justify-content-center gap-4"
						style="overflow-n: auto; max-height: 750px;">
						<!-- Image Gallery: Cards arranged in flexible wrapping -->
						<div class="service-box text-center">
							<img src="https://i.imgur.com/RsOelut.jpeg" alt="Coat" />
							<h6 class="fw-bold mt-2">Coat 5$</h6>
						</div>
						<div class="service-box text-center">
							<img src="https://i.imgur.com/2p1JfkJ.jpeg" alt="Shirt" />
							<h6 class="fw-bold mt-2">Shirt 2$</h6>
						</div>
						<div class="service-box text-center">
							<img src="https://i.imgur.com/5uGwD6k.jpeg" alt="Dress" />
							<h6 class="fw-bold mt-2">Dress 10$</h6>
						</div>
						<div class="service-box text-center">
							<img src="https://i.imgur.com/njYMh1c.jpeg" alt="Jacket" />
							<h6 class="fw-bold mt-2">Jacket 4$</h6>
						</div>
						<div class="service-box text-center">
							<img src="https://i.imgur.com/SuBzoAZ.jpeg" alt="Suit" />
							<h6 class="fw-bold mt-2">Suit 8$</h6>
						</div>
						<div class="service-box text-center">
							<img src="https://i.imgur.com/ELsNPQ9.jpeg" alt="T-shirt" />
							<h6 class="fw-bold mt-2">T-shirt 2$</h6>
						</div>
						<div class="service-box text-center">
							<img src="https://i.imgur.com/oWY8mrZ.jpeg" alt="Man Thobe" />
							<h6 class="fw-bold mt-2">Man Thobe 7$</h6>
						</div>
						<div class="service-box text-center">
							<img src="https://i.imgur.com/J2YwZA3.jpeg" alt="Women Thobe" />
							<h6 class="fw-bold mt-2">Women Thobe 10$</h6>
						</div>
						<div class="service-box text-center">
							<img src="https://i.imgur.com/h5qQRiN.jpeg" alt="Trouser" />
							<h6 class="fw-bold mt-2">Trouser 2$</h6>
						</div>
					</div>
				</div>

				<!-- Form Column -->
				<div class="col-md-6">
					<div class="card shadow-lg border-0 rounded-4 p-4"
						style="background-color: #5f7081;">
						<h2 class="fw-bold mb-4 text-white">Welcome,
							${loggedCustomer.firstName}</h2>

						<form:form action="/customer/sendMessage"
							modelAttribute="customerMessage" method="post">
							<h4 class="fw-semibold mb-3 text-white">Your Details</h4>

							<!-- Message Textarea -->
							<div class="mb-3">
								<label class="form-label fw-semibold text-white">Message
									Details:</label>
								<form:textarea path="messageDetails" cssClass="form-control"
									rows="4" />
							</div>

							<!-- Pickup Time -->
							<div class="mb-3">
								<label class="form-label fw-semibold text-white">Pickup
									Time:</label>
								<form:input type="datetime-local" path="pickupTime"
									cssClass="form-control" />
							</div>

							<!-- Submit Button -->
							<div class="text-end">
								<button type="submit" class="btn btn-lg px-4 custom-btn-orange">Submit</button>
							</div>
						</form:form>

						<!-- Success Message -->
						<c:if test="${not empty message}">
							<div class="alert alert-success mt-4" role="alert">${message}</div>
						</c:if>
					</div>
				</div>
			</div>
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

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
