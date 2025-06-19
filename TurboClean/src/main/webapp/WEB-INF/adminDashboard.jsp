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
        <a href="">New Order</a>
        <a href="">Customer</a>
        <a href="">All Order</a>
        <a href="">Messages</a>
        
    </div>

    <form action="" method="post" style="margin: 0;">
        <button type="submit" class="logout-button">Logout</button>
    </form>
</div>
</header>
<div class="status-tabs">
    <div class="status-tab ${tab == 'waiting' ? 'active' : ''}" onclick="window.location.href='/admin/orders?status=waiting'">
        Waiting
    </div>
    <div class="status-tab ${tab == 'inprogress' ? 'active' : ''}" onclick="window.location.href='/admin/orders?status=inprogress'">
        InProgress
    </div>
    <div class="status-tab ${tab == 'finished' ? 'active' : ''}" onclick="window.location.href='/admin/orders?status=finished'">
        Finished
    </div>
</div>
<article>
All Item Order
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
</body>
</html>