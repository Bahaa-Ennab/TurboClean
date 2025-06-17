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
    </div>

    <form action="" method="post" style="margin: 0;">
        <button type="submit" class="logout-button">Logout</button>
    </form>
</div>
</header>

<article>

<div class="details-container">
    <h2>User Details</h2>

    <p><strong>Username:</strong> <span id="v_username"><c:out value="${user.username}" /></span></p>
    <p><strong>Email:</strong> <span id="v_email"><c:out value="${user.email}" /></span></p>
    <p><strong>Phone:</strong> <span id="v_phone"><c:out value="${user.phoneNumber}" /></span></p>
    <p><strong>Location:</strong> <span id="v_location"><c:out value="${user.location}" /></span></p>
    <p><strong>Role:</strong> <span id="v_role"><c:out value="${user.role}" /></span></p>

    <button class="edit-button" onclick="openModal()">Edit</button>
</div>

<!-- Modal -->
<div class="modal" id="editModal">
    <div class="modal-content">
        <span class="modal-close" onclick="closeModal()">&times;</span>

        <form id="editForm">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="${user.username}" />

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${user.email}" />

            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" />

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="${user.password}" />

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" value="${user.location}" />

            <label for="role">Role:</label>
            <input type="text" id="role" name="role" value="${user.role}" />

            <input type="submit" value="Save" style="margin-top: 15px;" />
            <div id="form-success"></div>
        </form>
    </div>
</div>
<script>
    function openModal() {
        document.getElementById("editModal").style.display = "flex";
        document.getElementById("form-success").innerText = '';
    }

    function closeModal() {
        document.getElementById("editModal").style.display = "none";
    }

    // AJAX form submission
    document.getElementById("editForm").addEventListener("submit", function(e) {
        e.preventDefault();

        const form = e.target;
        const formData = new FormData(form);

        fetch("/updateUser", {
            method: "POST",
            body: new URLSearchParams(formData)
        })
        .then(res => res.json()) // assumes server returns JSON
        .then(data => {
            if (data.status === "success") {
                // update fields on page
                document.getElementById("v_username").innerText = data.user.username;
                document.getElementById("v_email").innerText = data.user.email;
                document.getElementById("v_phone").innerText = data.user.phoneNumber;
                document.getElementById("v_location").innerText = data.user.location;
                document.getElementById("v_role").innerText = data.user.role;

                document.getElementById("form-success").innerText = "Updated successfully!";
                setTimeout(closeModal, 1000);
            } else {
                alert("Error: " + data.message);
            }
        })
        .catch(err => {
            console.error(err);
            alert("Server error");
        });
    });
</script>

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