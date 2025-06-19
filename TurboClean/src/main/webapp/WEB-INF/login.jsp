<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - TurboClean</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<style>
.brand-hover span.turbo:hover {
	color: orange;
}

.custom-login-btn {
	background-color: #cccdcd !important;
	color: black !important;
	border: none !important;
}
/* Hero section background */
.hero-section {
	background-color: #C7EEFF !important;
}

/* Hover effect for all major headers */
h2:hover, h3:hover , a:hover{
	color: orange !important;
	cursor: pointer;
}

.custom-login-btn:hover {
	background-color: orange !important;
	color: white !important;
}
</style>
<body class="bg-light" >

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light"
	style="background-color: #303841; margin-bottom: 0; box-shadow: 0 6px 10px -2px rgba(0,0,0,0.4);">
	<div class="container">
		<a class="navbar-brand d-flex align-items-center" href="/">
			<img src="https://i.imgur.com/KSZMAPl.png" alt="Logo" width="40" height="40"
				class="d-inline-block align-text-top rounded-circle me-2">
			<span class="fw-bold brand-hover" style="font-size: 28px; color: white;">
				<span class="turbo">Turbo</span><span class="text-primary">Clean</span>
			</span>
		</a>

		<div class="d-flex align-items-center gap-2">
			<a href="/login">
				<button class="btn btn-sm custom-login-btn">Login</button>
			</a>
			<a href="/register" class="btn btn-primary btn-sm">Register</a>
		</div>
	</div>
</nav>


<!-- Main Content -->
<main class="d-flex justify-content-center align-items-center"
      style="min-height: 80vh; background-color: #cad1d1;">
    <div class="container-fluid px-5">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-xxl-8">
                <div class="card shadow border-0 rounded-4 overflow-hidden">
                    <div class="row g-0">
                        <!-- Image section -->
                        <div class="col-md-6 d-none d-md-block">
                            <img src="https://i.imgur.com/bdg6PIF.jpeg" alt="Login Image" class="img-fluid h-100 w-100" style="object-fit: cover;">
                        </div>

                        <!-- Form section -->
                        <div class="col-md-6 p-5" style=" background-color: #5f7081; color:white">
                            <h3 class="mb-4 text-center fw-bold">User Login</h3>
                            <form:form action="/customerlogin" method="post" modelAttribute="newCustomer">
                                <!-- Email -->
                                <div class="mb-4">
                                    <form:label path="email" cssClass="form-label fs-5">Email</form:label>
                                    <form:input path="email" cssClass="form-control form-control-lg" placeholder="Enter your email"/>
                                    <form:errors path="email" cssClass="text-danger small" />
                                </div>

                                <!-- Password -->
                                <div class="mb-4">
                                    <form:label path="password" cssClass="form-label fs-5">Password</form:label>
                                    <form:input path="password" type="password" cssClass="form-control form-control-lg" placeholder="Enter your password"/>
                                    <form:errors path="password" cssClass="text-danger small" />
                                </div>

                                <!-- Submit Button -->
                                <div class="d-grid">
                                    <input type="submit" class="btn btn-primary btn-lg" value="Login" />
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
