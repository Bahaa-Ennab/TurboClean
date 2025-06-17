<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>TurboClean</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold" href="#">Turbo<span
				class="text-primary">Clean</span></a>
			<div class="d-flex align-items-center gap-2">

				<a href="/login"><button class="btn btn-outline-secondary btn-sm">Login</button></a>
				<button class="btn btn-primary btn-sm">Register</button>
			</div>
		</div>
	</nav>

	<!-- Hero Section -->
	<section class="text-center py-2 bg-light">
		<div class="container">
			<h2 class="display-5 fw-bold">
				Turbo<span class="text-primary">Clean</span>
			</h2>
			<img src="https://i.imgur.com/P8g4YdS.png" alt="Washer Icon"
				class="mb-3" width="250" height="250">
			<p class="lead mb-4">For An Extraordinary Dry Clean Experience</p>
		</div>
	</section>

	<!-- Services Section -->
	<section class="py-2 mb-15 #f8f9fa pb-5">
		<div class="container">
			<h3 class="text-center mb-5 fw-bold">Our Services</h3>
			<div class="row g-4 text-center">
				<div class="col-md-4">
					<div class="card border-0 shadow-sm h-100">
						<div class="card-body">
							<img src="https://img.icons8.com/ios/100/towel.png"
								alt="Dry Clean" class="mb-3" width="50" height="50">
							<h5 class="card-title">Dry Clean</h5>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card border-0 shadow-sm h-100">
						<div class="card-body">
							<img src="https://img.icons8.com/ios/100/iron.png" alt="Pressing"
								class="mb-3" width="50" height="50">
							<h5 class="card-title">Pressing</h5>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card border-0 shadow-sm h-100">
						<div class="card-body">
							<img src="https://img.icons8.com/ios/100/delivery.png"
								alt="Fast Delivery" class="mb-3" width="50" height="50">
							<h5 class="card-title">Fast Delivery</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- About us Section -->
	<section class="py-5 bg-light">
		<div class="container">
			<h3 class="text-center mb-2 fw-bold">About Us</h3>
			<div class="row g-4 text-center">
				<div>
					<div class="card-body">
						<p>
							<em>Turbo Clean is a modern dry cleaning service redefining
								convenience in Ramallah.</em>
						</p>
						<p>
							<em>With our mobile van service, we collect and deliver your
								clothes directly to your doorstep - all managed through a simple
								online order.</em>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Footer -->
	<footer class=" text-muted pt-5 pb-4 border-top">
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

				<!-- Contact Info -->
				<div class="col-md-3 mb-4">
					<h6 class="fw-bold mb-3">Contact</h6>
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
					<h6 class="fw-bold mb-3">Follow Us</h6>
					<a href="#" class="text-reset d-block mb-2"> <i
						class="bi bi-facebook me-1"></i> Facebook
					</a> <a href="#" class="text-reset d-block mb-2"> <i
						class="bi bi-instagram me-1"></i> Instagram
					</a> <a href="#" class="text-reset d-block mb-2"> <i
						class="bi bi-whatsapp me-1"></i> WhatsApp
					</a>
				</div>

			</div>

			<hr>
			<div class="text-center small">© 2025 TurboClean. All rights
				reserved.</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
