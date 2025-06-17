<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - TurboClean</title>

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
				<a href="/login" class="btn btn-outline-secondary btn-sm">Login</a>
				<a href="/register" class="btn btn-primary btn-sm">Register</a>
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
								<img
									src="https://static.vecteezy.com/system/resources/thumbnails/007/147/703/small_2x/laundry-and-dry-cleaning-concept-icon-suites-amenities-idea-thin-line-illustration-cruise-ship-services-iron-washing-machine-and-clean-clothes-isolated-outline-drawing-editable-stroke-vector.jpg"
									alt="Login Image" class="img-fluid h-100 w-100"
									style="object-fit: cover;">
							</div>

							<!-- Form section -->
							<div class="col-md-6 p-4 mb-3">
								<h4 class="mb-4 text-center">User Register</h4>
								<form:form action="/register" method="post"
									modelAttribute="newUser">

									<!-- Name (First + Last) -->
									<div class="row g-3 mb-3">
										<div class="col-md-6 form-floating">
											<form:input path="firstName" cssClass="form-control"
												placeholder="First Name" />
											<form:label path="firstName">First Name</form:label>
											<form:errors path="firstName" cssClass="text-danger small" />
										</div>

										<div class="col-md-6 form-floating">
											<form:input path="lastName" cssClass="form-control"
												placeholder="Last Name" />
											<form:label path="lastName">Last Name</form:label>
											<form:errors path="lastName" cssClass="text-danger small" />
										</div>
									</div>

									<!-- Email -->
									<div class="form-floating mb-3">
										<form:input path="email" cssClass="form-control"
											placeholder="Email address" />
										<form:label path="email">Email address</form:label>
										<form:errors path="email" cssClass="text-danger small" />
									</div>

									<!-- Password -->
									<div class="form-floating mb-3">
										<form:input path="password" type="password"
											cssClass="form-control" placeholder="Password" />
										<form:label path="password">Password</form:label>
										<form:errors path="password" cssClass="text-danger small" />
									</div>

									<!-- Confirm Password -->
									<div class="form-floating mb-4">
										<form:input path="confirmPassword" type="password"
											cssClass="form-control" placeholder="Confirm password" />
										<form:label path="confirmPassword">Confirm password</form:label>
										<form:errors path="confirmPassword"
											cssClass="text-danger small" />
									</div>

									<!-- location -->
									<div class="form-floating mb-4">
										<form:input path="location" type="location"
											cssClass="form-control" placeholder="location" />
										<form:label path="location">Location</form:label>
										<form:errors path="location"
											cssClass="text-danger small" />
									</div>


									<!-- Submit -->
									<button type="submit"
										class="btn btn-primary w-100 py-2 fw-semibold">
										Apply!</button>

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
