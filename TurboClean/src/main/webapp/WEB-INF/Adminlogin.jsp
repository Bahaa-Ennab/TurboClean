<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login - TurboClean</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold" href="#">Turbo<span
				class="text-primary">Clean</span></a>
			<div class="d-flex gap-2">
				<a href="/admin/login" class="btn btn-outline-secondary btn-sm">Login</a>
				<a href="/register/admin" class="btn btn-primary btn-sm">Register</a>

			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<main class="d-flex justify-content-center align-items-center"
		style="min-height: 65vh;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 col-lg-8">
					<div class="card shadow border-0 rounded-4 overflow-hidden">
						<div class="row g-0">
							<!-- Image section -->
							<div class="col-md-6 d-none d-md-block">
								<img src="https://i.imgur.com/bdg6PIF.jpeg" alt="Login Image"
									class="img-fluid h-100 w-100" style="object-fit: cover;">
							</div>

							<!-- Form section -->
							<div class="col-md-6 p-4">
								<h4 class="mb-4 text-center">Admin Login</h4>
								<form:form action="/admin/login" method="post"

									modelAttribute="newAdmin">
									<!-- Email -->
									<div class="mb-3">
										<form:label path="email" cssClass="form-label">Email</form:label>
										<form:input path="email" cssClass="form-control"
											placeholder="Enter your email" />
										<form:errors path="email" cssClass="text-danger small" />
									</div>

									<!-- Password -->
									<div class="mb-3">
										<form:label path="password" cssClass="form-label">Password</form:label>
										<form:input path="password" type="password"
											cssClass="form-control" placeholder="Enter your password" />
										<form:errors path="password" cssClass="text-danger small" />
									</div>

									<!-- Submit Button -->
									<div class="d-grid">
										<input type="submit" class="btn btn-primary" value="Login" />
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Footer -->
	<footer class="text-muted border-top">
		<div class="container">
			<div class="row">
				<!-- Company Info -->
				<div class="col-md-4 mb-4">
					<h5 class="text-uppercase fw-bold">TurboClean</h5>
					<p>Fast · Reliable · Door-to-door dry cleaning service based in
						Ramallah. Book online, and we'll handle the rest.</p>
				</div>

				<!-- Quick Links -->
				<div class="col-md-2 mb-4">
					<h6 class="fw-bold mb-3">Quick Links</h6>
					<ul class="list-unstyled">
						<li><a href="#" class="text-reset text-decoration-none">Home</a></li>
						<li><a href="#" class="text-reset text-decoration-none">Services</a></li>
						<li><a href="#" class="text-reset text-decoration-none">About
								Us</a></li>
						<li><a href="#" class="text-reset text-decoration-none">Contact</a></li>
						<li><a href="#" class="text-reset text-decoration-none">Policy</a></li>
					</ul>
				</div>

				<!-- Contact Info (No icons) -->
				<div class="col-md-3 mb-4">
					<h6 class="fw-bold mb-3">Contact</h6>
					<p>Ramallah, Palestine</p>
					<p>+970 595 000 000</p>
					<p>info@turboclean.ps</p>
				</div>

				<!-- Social Links (Text only) -->
				<div class="col-md-3 mb-4">
					<h6 class="fw-bold mb-3">Follow Us</h6>
					<p>
						<a href="#" class="text-reset text-decoration-none">Facebook</a>
					</p>
					<p>
						<a href="#" class="text-reset text-decoration-none">Instagram</a>
					</p>
					<p>
						<a href="#" class="text-reset text-decoration-none">WhatsApp</a>
					</p>
				</div>
			</div>
			<hr>
			<div class="text-center small">© 2025 TurboClean. All rights
				reserved.</div>
		</div>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
