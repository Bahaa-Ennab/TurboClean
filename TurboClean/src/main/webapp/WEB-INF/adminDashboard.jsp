
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="navbar">
			<div class="logo">Turbo Clean</div>

			<div class="nav-links">
				<a href="">New Order</a> <a href="/admin/customers">Customer</a> <a href="">All
					Order</a> <a href="">Messages</a>

			</div>

<article>
    <form:form action="" modelAttribute="order" method="post">
        Customer ID: <form:input path="customerId" /><br><br>

        <h4>Items</h4>
        <!-- For now, just static inputs. Later, use JavaScript to add dynamic rows -->
        <table>
            <tr><th>Name</th><th>Number</th><th>Price</th><th>Total Price</th></tr>

            <tr>
                <td><input type="" name="items[1].name" value="T-Shirt"/></td> <!-- Number of item -->
                <td><input type="" name="items[1].quantity" value="2"/></td><!-- Number of Peices -->
                <td><input type="" name="items[1].price" value="6"/></td><!-- Total Price -->
            </tr>
        </table>

        <br>Note: <form:textarea path="note" rows="3" cols="40"/><br><br>

        <input type="submit" value="Submit"/>
    </form:form>

    <c:if test="${not empty message}">
        <p style="color:green;">${message}</p>
    </c:if>
</article>

<footer class="bg-white border-top mt-20 py-4">
			<a href="/logout"><button type="submit"
					class="btn btn-outline-light btn-sm px-4">Logout</button></a>

		</div>
	</header>
	<div class="status-tabs">
		<div class="status-tab ${tab == 'waiting' ? 'active' : ''}"
			onclick="window.location.href='/admin/orders?status=waiting'">
			Waiting</div>
		<div class="status-tab ${tab == 'inprogress' ? 'active' : ''}"
			onclick="window.location.href='/admin/orders?status=inprogress'">
			InProgress</div>
		<div class="status-tab ${tab == 'finished' ? 'active' : ''}"
			onclick="window.location.href='/admin/orders?status=finished'">
			Finished</div>
	</div>
	<article>All Item Order</article>

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
</body>
</html>