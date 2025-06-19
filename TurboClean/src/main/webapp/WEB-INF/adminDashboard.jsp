<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Order - TurboClean</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="container py-4">

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
					<img src="/img/item.png" class="img-fluid rounded mb-1" />
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

	<button class="btn btn-success" onclick="submitOrder()">Submit
		Order</button>

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
        const customerId = document.getElementById("customerId").value;
        const address = document.getElementById("address").value;
        const itemIds = Object.keys(orderItems).map(id => parseInt(id));

        const data = {
            adminId: 1,
            customerId,
            address,
            itemIds
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
                alert("Failed to save order");
            }
        });
    }
</script>

</body>
</html>
