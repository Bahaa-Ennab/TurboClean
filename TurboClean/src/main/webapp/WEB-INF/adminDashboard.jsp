<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Order - TurboClean</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
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
</style>
</head>
<body class="container py-4">

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
				<!-- تعديل روابط الناف بار -->
<a href="/admin/dashboard" class="nav-link-custom">New Order</a> 
<a href="/admin/customers" class="nav-link-custom">All Customers</a> 
<a href="/all" class="nav-link-custom">All Orders</a> 
<a href="/admin/messages" class="nav-link-custom">Messages</a>
			</div>

			<!-- Logout Button -->
			<a href="/logout"><button type="submit"
					class="btn btn-outline-light btn-sm px-4">Logout</button></a>
		</div>
	</nav>

	<h2 class="mb-4">Create New Order</h2>
	<!-- Customer Info -->
	<div class="mb-3">
		<label for="customerId" class="form-label">Customer ID</label> <input
			type="number" class="form-control" id="customerId" required>
	</div>

	<div class="mb-3">
		<label for="address" class="form-label">Address</label> <input
			type="text" class="form-control" id="address" required>
	</div>

	<!-- Items Grid -->
	<h4>Select Items</h4>
	<div class="row g-3 mb-4" id="itemGrid">
		<c:forEach items="${items}" var="item">
			<div class="col-3">
				<button type="button"
					class="btn btn-outline-primary w-100 item-button"
					data-id="${item.id}" data-name="${item.itemName}"
					data-price="${item.cost}">
				<div class="text-center">${item.itemName}</div>
				</button>
			</div>
		</c:forEach>
	</div>

	<!-- Order Table -->
	<h4>Order Summary</h4>
	<table class="table table-bordered" id="orderTable">
		<thead class="table-light">
  <tr>
    <th>Item</th>
    <th>Qty</th>
    <th>Price</th>
    <th>Total</th>
    <th>Remove</th> <!-- مضافة -->
  </tr>
</thead>

		<tbody></tbody>
		<tfoot>
			<tr>
				<td colspan="3" class="text-end fw-bold">Grand Total</td>
				<td id="grandTotal" class="fw-bold">0</td>
			</tr>
		</tfoot>
	</table>

	<button class="btn btn-success" id="submitBtn" onclick="submitOrder()">Submit Order</button>

		
		
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
	<script>
    let orderItems = {};

    function renderTable() {
        console.log("Rendering table...");
        const tbody = document.querySelector("#orderTable tbody");
        tbody.innerHTML = "";

        let total = 0;

        for (let id in orderItems) {
            const item = orderItems[id];
            const qty = item.qty;
            const price = item.price;
            const itemTotal = qty * price;
            total += itemTotal;

            const row = document.createElement("tr");

            const tdName = document.createElement("td");
            tdName.textContent = item.name;

            const tdQty = document.createElement("td");
            const inputQty = document.createElement("input");
            inputQty.type = "number";
            inputQty.min = "1";
            inputQty.value = qty;
            inputQty.className = "form-control form-control-sm";
            inputQty.onchange = function () {
                updateQty(id, inputQty.value);
            };
            tdQty.appendChild(inputQty);

            const tdPrice = document.createElement("td");
            tdPrice.textContent = price.toFixed(2);

            const tdTotal = document.createElement("td");
            tdTotal.textContent = itemTotal.toFixed(2);

            row.appendChild(tdName);
            row.appendChild(tdQty);
            row.appendChild(tdPrice);
            row.appendChild(tdTotal);

            tbody.appendChild(row);
        }

        document.getElementById("grandTotal").innerText = total.toFixed(2);
    }


    function updateQty(id, qty) {
        const intQty = parseInt(qty);
        if (intQty > 0) {
            orderItems[id].qty = intQty;
            renderTable();
        }
    }

    // مهم جدًا: تأكد أن DOM جاهز
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".item-button").forEach(btn => {
            btn.addEventListener("click", function () {
                const id = this.dataset.id;
                const name = this.dataset.name;
                const price = parseFloat(this.dataset.price);

                console.log("CLICKED:", { id, name, price });

                if (orderItems[id]) {
                    orderItems[id].qty += 1;
                } else {
                    orderItems[id] = {
                        name: name,
                        price: price,
                        qty: 1
                    };
                }

                renderTable();
            });
        });
    });

    function submitOrder() {
        const customerId = document.getElementById("customerId").value.trim();
        const address = document.getElementById("address").value.trim();

        if (!customerId || !address || Object.keys(orderItems).length === 0) {
            alert("يرجى تعبئة كل الحقول واختيار عناصر.");
            return;
        }

        const items = Object.entries(orderItems).map(([id, item]) => ({
            id: parseInt(id),
            qty: item.qty
        }));

        const data = {
            adminId: 1,
            customerId,
            address,
            items
        };

        fetch("/admin/orders", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        }).then(res => {
            if (res.ok) {
                alert("Order saved!");
                location.reload();
            } else {
                res.text().then(err => {
                    console.error("Error response:", err);
                    alert("فشل حفظ الطلب: " + err);
                });
            }
        }).catch(err => {
            console.error("Network error:", err);
            alert("فشل في الاتصال بالخادم.");
        });
    }

</script>

</body>
</html>
