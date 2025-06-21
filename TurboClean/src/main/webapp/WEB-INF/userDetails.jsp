<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Details</title>

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

/* Table */
table {
	width: 100%;
	border-collapse: collapse;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	background-color: white;
	font-size: 18px;
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

.card {
	border-radius: 20px;
}

.btn-warning {
	background-color: #FFA726;
	border-color: #FFA726;
	color: white;
	transition: background-color 0.3s ease;
}

.btn-warning:hover {
	background-color: #e67600;
	border-color: #e67600;
	color: white;
}

.btn-secondary {
	color: white;
	background-color: #5f7081;
	border-color: #5f7081;
	transition: background-color 0.3s ease;
}

.btn-secondary:hover {
	background-color: #495463;
	border-color: #495463;
	color: white;
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
	<!-- Main Content -->
	<main
		style="padding: 50px 40px; width: 80%; margin: auto; background-color: #5f7081; margin-bottom: 120px; margin-top: 75px; border-radius: 20px;">
		<main class="py-5" style="background-color: #5f7081;">
			<div class="container">
				<div class="row g-4">

					<!-- Customer Details Card -->
					<div class="col-lg-5">
						<div class="card shadow rounded-4 p-4 h-100">
							<h2 class="mb-4 text-center">👤 Customer Details</h2>
							<table style="width: 100%; font-size: 16px;">
								<tbody>
									<tr>
										<th>ID</th>
										<td><c:out value="${customer.id}" /></td>
									</tr>
									<tr>
										<th>First Name</th>
										<td><c:out value="${customer.firstName}" /></td>
									</tr>
									<tr>
										<th>Last Name</th>
										<td><c:out value="${customer.lastName}" /></td>
									</tr>
									<tr>
										<th>Phone Number</th>
										<td><c:out value="${customer.phoneNumber}" /></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><c:out value="${customer.email}" /></td>
									</tr>
									<tr>
										<th>Location</th>
										<td><c:out value="${customer.location}" /></td>
									</tr>
								</tbody>
							</table>

							<div class="text-end mt-4">
								<a href="/admin/customers" class="btn btn-secondary me-2">⬅
									Back</a>
								<button type="button" class="btn btn-warning text-white"
									data-bs-toggle="modal" data-bs-target="#editCustomerModal">
									✏️ Edit</button>
							</div>
						</div>
					</div>

					<!-- Orders Table -->
					<div class="col-lg-7">


						<h1 class="text-center fw-bold mb-4"
							style="font-size: 28px; color: white;">🧾 My Orders</h1>

						<div class="card shadow p-3 rounded-4"
							style="background-color: #ffffff;">
							<table class="table" style="font-size: 16px;">
								<thead class="table-light">
									<tr>
										<th>Order ID</th>
										<th>Date</th>
										<th>Receipt</th>
										<th>Total</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody id="orderTable">
									<c:forEach var="order" items="${orders}">
										<tr>
											<td><strong><c:out value="${order.id}" /></strong></td>
											<td><c:out value="${order.date}" /></td>
											<td><a href="/orders/${order.id}">Details</a></td>
											<td>$<c:out value="${order.total_cost}" /></td>
											<td><span
												style="background-color: #ffcc80; color: #333; padding: 6px 14px; border-radius: 20px;">
													<c:out value="${order.status.statuscondition}" />
											</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</main>

	</main>

	<!-- مودال التعديل -->
	<div class="modal fade" id="editCustomerModal" tabindex="-1"
		aria-labelledby="editCustomerModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content"
				style="border-radius: 20px; box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);">
				<form:form action="/admin/customers/update" method="post"
					modelAttribute="editCustomer">

					<div class="modal-header"
						style="background-color: #5f7081; color: white; border-top-left-radius: 20px; border-top-right-radius: 20px;">
						<h5 class="modal-title" id="editCustomerModalLabel">✏️ Edit
							Customer</h5>
						<button type="button" class="btn-close btn-close-white"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>

					<div class="modal-body"
						style="background-color: white; padding: 30px;">
						<form:input type="hidden" path="id" value="${customer.id}" />

						<div class="row g-3 mb-3">
							<div class="col-md-6 mb-3">
								<form:label path="firstName" cssClass="form-label fw-bold">First Name</form:label>
								<form:input path="firstName" cssClass="form-control rounded-3"
									placeholder="First Name" />
								<form:errors path="firstName" cssClass="text-danger small" />
							</div>

							<div class="col-md-6 mb-3">
								<form:label path="lastName" cssClass="form-label fw-bold">Last Name</form:label>
								<form:input path="lastName" cssClass="form-control rounded-3"
									placeholder="Last Name" />
								<form:errors path="lastName" cssClass="text-danger small" />
							</div>
						</div>

						<div class="mb-3">
							<form:label path="email" cssClass="form-label fw-bold">Email</form:label>
							<form:input path="email" cssClass="form-control rounded-3"
								placeholder="Email address" />
							<form:errors path="email" cssClass="text-danger small" />
						</div>

						<div class="mb-3">
							<form:label path="password" cssClass="form-label fw-bold">Password</form:label>
							<form:input path="password" type="password"
								cssClass="form-control rounded-3" placeholder="Password" />
							<form:errors path="password" cssClass="text-danger small" />
						</div>

						<div class="mb-3">
							<form:label path="confirmPassword" cssClass="form-label fw-bold">Confirm Password</form:label>
							<form:input path="confirmPassword" type="password"
								cssClass="form-control rounded-3" placeholder="Confirm password" />
							<form:errors path="confirmPassword" cssClass="text-danger small" />
						</div>

						<div class="mb-3">
							<form:label path="location" cssClass="form-label fw-bold">Location</form:label>
							<form:input path="location" cssClass="form-control rounded-3"
								placeholder="Location" />
							<form:errors path="location" cssClass="text-danger small" />
						</div>

						<div class="mb-3">
							<form:label path="phoneNumber" cssClass="form-label fw-bold">Phone Number</form:label>
							<form:input path="phoneNumber" cssClass="form-control rounded-3"
								placeholder="Phone Number" />
							<form:errors path="phoneNumber" cssClass="text-danger small" />
						</div>
					</div>

					<div class="modal-footer"
						style="background-color: #5f7081; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px;">
						<button type="button" class="btn btn-secondary rounded-3"
							data-bs-dismiss="modal"
							style="background-color: #ccc; border-color: #ccc; color: #333;">Cancel</button>
						<button type="submit" class="btn btn-warning rounded-3"
							style="background-color: #FFA726; border-color: #FFA726; color: white;">Save
							changes</button>
					</div>

				</form:form>
			</div>
		</div>
	</div>

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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
