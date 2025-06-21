<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

body>.container, body>main {
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
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light shadow-sm"
		style="background-color: #303841; margin-bottom: 0;">
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

<!-- Messages Section -->
<main
	style="padding: 50px 40px; width: 80%; margin: auto; background-color: #5f7081; margin-bottom: 120px; margin-top: 75px; border-radius: 20px;">

	<h1 class="text-center fw-bold mb-5"
		style="font-size: 36px; color: white;">💬 Customer Messages</h1>

	<div class="mx-auto"
		style="max-width: 96%; background-color: #ffffff; padding: 30px 40px; border-radius: 20px; box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);">

		<c:if test="${not empty messages}">
			<div class="row g-4">
				<c:forEach var="msg" items="${messages}">
					<div class="col-md-6">
						<div class="p-4 rounded-4 shadow-sm border"
							style="background-color: #f9f9f9; min-height: 180px;">
							
							<!-- Message Text -->
							<p class="fw-semibold mb-3 text-dark">
								📝 <strong>Message:</strong>
								<c:out value="${msg.messageDetails}" />
							</p>

							<!-- Pickup Time -->
							<c:if test="${not empty msg.pickupTime}">
								<p class="mb-2">
									🕒 <strong>Pickup Time:</strong>
									<fmt:formatDate value="${msg.pickupTime}" pattern="yyyy-MM-dd HH:mm" />
								</p>
							</c:if>

							<!-- Submitted At -->
							<p class="text-muted mb-0">
								📅 <small>Submitted: 
								<fmt:formatDate value="${msg.createdAt}" pattern="yyyy-MM-dd HH:mm" /></small>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>

		<c:if test="${empty messages}">
			<p class="text-center text-muted fs-5">No messages to display.</p>
		</c:if>

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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>