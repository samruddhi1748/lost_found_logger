<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Login/Register</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", Arial, sans-serif;
            background: linear-gradient(135deg, #ffffff, #e8f1ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .main-wrapper {
            width: 900px;
            height: 500px;
            background: #ffffff;
            display: flex;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
            overflow: hidden;
        }

        .left-panel {
            width: 45%;
            background: linear-gradient(135deg, #ffeb3b, #ffffff);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-right: 2px solid #e3e9f5;
            padding: 20px;
        }

        .project-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .left-panel img {
            width: 80%;
            border-radius: 8px;
        }

        /* Right panel */
        .container {
            width: 45%;
            overflow: hidden;         /* IMPORTANT */
            position: relative;
        }

        /* Slider */
        #form-slider {
            width: 800px;             /* 400 + 400 */
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        form {
            width: 400px;
            padding: 40px;
            box-sizing: border-box;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 6px;
            border: 1px solid #c8d4e7;
        }

        button {
            padding: 12px;
            width: 100%;
            background: #4a9eff;
            color: #fff;
            border: none;
            border-radius: 6px;
            margin-top: 10px;
            cursor: pointer;
        }

        .toggle-link {
            text-align: center;
            margin-top: 15px;
            cursor: pointer;
            color: #4a9eff;
            font-weight: 600;
        }

        .error-msg {
            color: red;
            text-align: center;
        }
    </style>
</head>

<body>

<%
    String error = (String) request.getAttribute("error");
%>

<div class="main-wrapper">

    <div class="left-panel">
        <div class="project-title">Lost and Found Logger</div>
        <img src="https://static.vecteezy.com/system/resources/thumbnails/020/436/895/original/animated-guy-with-search-string-curious-man-with-magnifying-glass-2d-cartoon-flat-character-4k-footage-on-white-with-alpha-channel-transparency-concept-animation-for-web-design-video.jpg">
    </div>

    <div class="container">
        <div id="form-slider">

            <!-- LOGIN -->
            <form method="post" action="UserController">
                <h2>Login</h2>
                <input type="hidden" name="action" value="login">
                <input type="text" name="username" placeholder="Username">
                <input type="password" name="password" placeholder="Password">
                <button type="submit">Login</button>
                <div class="toggle-link" onclick="toggleForm()">Don't have an account? Register</div>
            </form>

            <!-- REGISTER -->
            <form method="post" action="UserController">
                <h2>Register</h2>
                <input type="hidden" name="action" value="register">
                <input type="text" name="username" placeholder="Username">
                <input type="email" name="email" placeholder="Email">
                <input type="password" name="password" placeholder="Password">
                <button type="submit">Register</button>
                <div class="toggle-link" onclick="toggleForm()">Already have an account? Login</div>
            </form>

        </div>
    </div>

</div>

<script>
let slider = document.getElementById('form-slider');
let showingRegister = false;

function toggleForm() {
    if (showingRegister) {
        slider.style.transform = 'translateX(0)';
    } else {
        slider.style.transform = 'translateX(-400px)';
    }
    showingRegister = !showingRegister;
}
</script>

</body>
</html>
