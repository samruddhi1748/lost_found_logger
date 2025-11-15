<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lost & Found Item Logger</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            overflow: hidden;
            text-align: center;
        }

        /* ⭐ FULLSCREEN LOADER ⭐ */
        #loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: black;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 999;
            animation: fadeOut 1s ease forwards;
            animation-delay: 4s;  /* GIF duration */
        }

        /* GIF FULLSCREEN SIZE */
        #loader img {
            width: 100%;
            height: 100%;
        }

        @keyframes fadeOut {
            to { opacity: 0; visibility: hidden; }
        }

        /* DASHBOARD WRAPPER */
        #dashboard {
            opacity: 0;
            pointer-events: none;
            position: relative;
            min-height: 100vh;
            background: linear-gradient(120deg, #89f7fe, #66a6ff, #ff9a9e);
            background-size: 600% 600%;
            overflow: hidden;
            animation: fadeIn 1.2s ease forwards, gradientShift 15s ease infinite;
            animation-delay: 4.2s, 0s; /* fadeIn after loader, gradient always running */
        }

        @keyframes fadeIn {
            to { opacity: 1; pointer-events: all; }
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Subtle moving particles overlay */
        #dashboard::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(rgba(255,255,255,0.08) 1px, transparent 1px);
            background-size: 50px 50px;
            animation: particlesMove 20s linear infinite;
            pointer-events: none;
            z-index: 0;
        }

        @keyframes particlesMove {
            0% { transform: translate(0,0) rotate(0deg); }
            100% { transform: translate(-50px, -50px) rotate(360deg); }
        }

        /* Ensure content is above overlay */
        #dashboard > * {
            position: relative;
            z-index: 1;
        }

        h1 {
            margin-top: 40px;
            font-size: 38px;
            color: #fff;
            text-shadow: 2px 2px 12px rgba(0,0,0,0.3);
            transform: translateY(-20px);
            opacity: 0;
            animation: slideDown 1s ease forwards;
            animation-delay: 4.4s;
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .btn {
            padding: 14px 28px;
            margin: 20px;
            border: none;
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
            border-radius: 10px;
            cursor: pointer;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 1s ease forwards;
            transition: all 0.4s ease;
        }

        #btn1 { animation-delay: 4.7s; }
        #btn2 { animation-delay: 4.9s; }

        @keyframes fadeInUp {
            to { opacity: 1; transform: translateY(0); }
        }

        .btn:hover {
            background-color: #45a049;
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        /* Logout Button */
        #logout-btn {
            background-color: #f44336;
        }

        #logout-btn:hover {
            background-color: #e53935;
        }

        /* Logout Confirmation Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            width: 300px;
        }

        .btn-red {
            background-color: red;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin: 10px;
            border-radius: 5px;
        }

        .btn-green {
            background-color: green;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin: 10px;
            border-radius: 5px;
        }
        
        .btn-red:hover {
            background-color: #e53935;
        }

        .btn-green:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function confirmLogout() {
            // Show the logout confirmation modal
            document.getElementById("logoutModal").style.display = "flex";
        }

        // Handle Yes button click
        function logoutYes() {
            window.location.href = "auth.jsp";
        }

        // Handle Cancel button click
        function logoutCancel() {
            document.getElementById("logoutModal").style.display = "none";
        }
    </script>
</head>

<body>

    <!-- ⭐ FULLSCREEN TREASURE BOX ANIMATION ⭐ -->
    <div id="loader">
        <img src="https://media.lordicon.com/icons/wired/flat/2076-lost-and-found.gif" alt="Treasure Box Opening Animation" width=90%>
    </div>

    <!-- MAIN DASHBOARD -->
    <div id="dashboard">
        <h1>Lost & Found Item Logger</h1>

        <a href="addItem.jsp">
            <button class="btn" id="btn1">Add New Item</button>
        </a>

        <a href="ItemController">
            <button class="btn" id="btn2">View All Items</button>
        </a>

        <!-- Logout Button -->
        <button class="btn" id="logout-btn" onclick="confirmLogout()">Logout</button>
    </div>

    <!-- Logout Confirmation Modal -->
    <div id="logoutModal" class="modal">
        <div class="modal-content">
            <p>Are you sure you want to log out?</p>
            <button class="btn-red" onclick="logoutYes()">Yes</button>
            <button class="btn-green" onclick="logoutCancel()">Cancel</button>
        </div>
    </div>

</body>
</html>
