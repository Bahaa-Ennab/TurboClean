<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header>
		<div class="navbar">
			<div class="logo">Turbo Clean</div>

			<div class="nav-links">
				<a href="/customer/home">Home</a> <a href="/customer/orders">ALL Orders</a> <a href="/customer/messages">Messages</a>
			</div>

			<form action="" method="post" style="margin: 0;">
				<button type="submit" class="logout-button">Logout</button>
			</form>
		</div>
	</header>
	
<article>



</article>

<article>

<form:form action="/customer/sendMessage" modelAttribute="customerMessage" method="post">

        <h3>Your Details:</h3>
	

        <br><form:textarea path="messageDetails" rows="3" cols="40"/><br><br>
			<form:input type="datetime-local" path="pickupTime"/><br><br>
        <input type="submit" value="Submit"/>
    </form:form>

    <c:if test="${not empty message}">
        <p style="color:green;">${message}</p>
    </c:if>

</article>
		
	
<footer class="bg-white border-top mt-20 py-4">
		<div class="container text-center small text-muted">
			<p class="mb-1">© 2025 TurboClean – Ramallah, Palestine · Fast ·
				Reliable · Door-to-Door Dry Cleaning</p>
			<p
				class="mb-0 d-flex flex-column flex-sm-row justify-content-center align-items-center gap-3">
				<span> <img
					src="https://img.icons8.com/ios-filled/20/phone.png"
					alt="Phone Icon" class="me-1" /> <a href="#"
					class="text-decoration-none">+970595000000</a>
				</span> <span> <img
					src="https://img.icons8.com/ios-filled/20/marker.png"
					alt="Location Icon" class="me-1" /> Ramallah, Palestine
				</span> <span> Follow us: <a href="#"
					class="text-decoration-none ms-1">Facebook</a> <a href="#"
					class="text-decoration-none ms-1">Instagram</a> <a href="#"
					class="text-decoration-none ms-1">WhatsApp</a>
				</span>
			</p>
		</div>
	</footer>	
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>