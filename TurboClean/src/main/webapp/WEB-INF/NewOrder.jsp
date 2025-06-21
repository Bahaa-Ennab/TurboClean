<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Order - TurboClean</title>

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
/* Search */
.search-form {
	max-width: 700px;
	margin: 40px auto 20px;
	display: flex;
	gap: 10px;
}

.search-form input[type="text"] {
	width: 100%;
	padding: 14px 18px;
	border-radius: 12px;
	border: 1px solid #ccc;
	font-size: 16px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.search-form button {
	padding: 14px 22px;
	background-color: #ff8800;
	color: white;
	border: none;
	border-radius: 10px;
	transition: 0.3s ease;
}

.search-form button:hover {
	background-color: #e67600;
}
/* Table */
table {
	width: 100%;
	border-collapse: collapse;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	background-color: white;
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

	<div class="container mt-4">
		<div class="row justify-content-center text-center g-4">

			<!-- Waiting -->
			<div class="col-6 col-md-3">
				<a href="/admin/orders/waiting"
					class="d-block p-4 rounded-4 text-decoration-none fw-bold shadow-sm dashboard-link"
					style="background-color: #5f7081; color: white;"> <i
					class="bi bi-hourglass-split fs-3 d-block mb-2"></i> Waiting
				</a>
			</div>

			<!-- In Progress -->
			<div class="col-6 col-md-3">
				<a href="/admin/orders/inprogress"
					class="d-block p-4 rounded-4 text-decoration-none fw-bold shadow-sm dashboard-link"
					style="background-color: #5f7081; color: white;"> <i
					class="bi bi-gear-wide-connected fs-3 d-block mb-2"></i> In
					Progress
				</a>
			</div>

			<!-- Finished -->
			<div class="col-6 col-md-3">
				<a href="/admin/orders/finished"
					class="d-block p-4 rounded-4 text-decoration-none fw-bold shadow-sm dashboard-link"
					style="background-color: #5f7081; color: white;"> <i
					class="bi bi-check-circle fs-3 d-block mb-2"></i> Finished
				</a>
			</div>

			<!-- Paid -->
			<div class="col-6 col-md-3">
				<a href="/admin/orders/paid"
					class="d-block p-4 rounded-4 text-decoration-none fw-bold shadow-sm dashboard-link"
					style="background-color: #5f7081; color: white;"> <i
					class="bi bi-cash-stack fs-3 d-block mb-2"></i> Paid
				</a>
			</div>
		</div>
	</div>


	<main
		style="padding: 50px 40px; width: 85%; margin: auto; background-color: #5f7081; margin-bottom: 120px; margin-top: 75px; border-radius: 20px;">

		<h2 class="text-center text-white fw-bold mb-5"
			style="font-size: 32px;">📝 Create New Order For
			${customer.firstName} ${customer.lastName}</h2>

		<!-- Customer Info -->
		<div class="mb-4 bg-white p-4 rounded-4 shadow"
			style="max-width: 700px; margin: auto;">

			<div class="mb-3">
				<label for="address" class="form-label fw-bold">Address</label> <input
					type="text" class="form-control" id="address"
					placeholder="Enter address" required>
			</div>
			<input type="hidden" id="customerId" value="${customerId}" />

		</div>
<!-- Parent Flex Container -->
<div style="display: flex; flex-wrap: wrap; gap: 30px; justify-content: space-between;">

    <!-- 🧺 Select Items -->
    <div style="flex: 1; min-width: 280px;">
        <h4 class="text-white fw-bold mb-4">🧺 Select Items</h4>
        <div class="row g-2 mb-4" id="itemGrid">
            <c:forEach items="${items}" var="item">
                <div class="col-6 col-md-6 col-lg-4">
                    <button type="button"
                        class="btn btn-outline-light w-100 item-button p-2 rounded-4 shadow-sm"
                        style="background-color: #cad1d1; border: 2px solid transparent; transition: 0.3s;"
                        onmouseover="this.style.border='2px solid #ffa726'"
                        onmouseout="this.style.border='2px solid transparent'"
                        data-id="${item.id}" data-name="${item.itemName}"
                        data-price="${item.cost}">

                        <img class="item-image mb-2 rounded" alt="${item.itemName}"
                            style="max-width: 100%; height: 90px; object-fit: contain;" />
                        <div class="text-center fw-semibold" style="font-size: 14px;">
                            ${item.itemName}</div>
                    </button>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 📦 Order Summary -->
    <div style="flex: 1; min-width: 400px;">
        <h4 class="text-white fw-bold mb-4">📦 Order Summary</h4>
        <div class="bg-white p-4 rounded-4 shadow" style="overflow-x: auto;">
            <table class="table table-bordered" id="orderTable" style="min-width: 600px;">
                <thead class="table-light">
                    <tr>
                        <th>Item</th>
                        <th>Qty</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody></tbody>
                <tfoot>
                    <tr>
                        <td colspan="3" class="text-end fw-bold">Grand Total</td>
                        <td id="grandTotal" class="fw-bold">0</td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <!-- Submit Button -->
        <div class="text-center mt-5">
            <button class="btn btn-success px-5 py-3 fs-5 rounded-4 shadow"
                id="submitBtn" onclick="submitOrder()">Submit Order</button>
        </div>
    </div>

</div>






	</main>

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
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	  const itemImages = {
			    "Coat": "https://i.imgur.com/RsOelut.jpeg",
			    "Shirt": "https://i.imgur.com/2p1JfkJ.jpeg",
			    "Dress": "https://i.imgur.com/5uGwD6k.jpeg",
			    "Jacket": "https://i.imgur.com/njYMh1c.jpeg",
			    "Suit": "https://i.imgur.com/SuBzoAZ.jpeg",
			    "T-shirt": "https://i.imgur.com/ELsNPQ9.jpeg",
			    "Man Thobe": "https://i.imgur.com/oWY8mrZ.jpeg",
			    "Women Thobe": "https://i.imgur.com/J2YwZA3.jpeg",
			    "Trouser": "https://i.imgur.com/h5qQRiN.jpeg"
			  };

			  document.querySelectorAll('.item-button').forEach(button => {
			    const name = button.getAttribute('data-name');
			    const img = button.querySelector('.item-image');
			    if (itemImages[name]) {
			      img.src = itemImages[name];
			    } else {
			      img.src = 'https://via.placeholder.com/150?text=No+Image';
			    }
			  });
	
	
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
