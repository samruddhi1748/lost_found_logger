<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Login/Register</title>
    <style>
        /* Add your CSS here, including sliding forms, background animation, etc. */
        /* Dark background */
body {
  margin: 0;
  height: 100vh;
  overflow: hidden;
  background: #000011; /* very dark blue-black */
  position: relative;
  color: white;
  font-family: Arial, sans-serif;
}

/* Container to hold stars */
#stars, #stars2, #stars3 {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  pointer-events: none; /* so clicks go through */
  z-index: 0;
}

/* Small star styles */
.star {
  position: absolute;
  background: white;
  border-radius: 50%;
  opacity: 0.8;
  animation: blink 2s infinite;
}

/* Different star sizes */
#stars .star {
  width: 1px;
  height: 1px;
  animation-duration: 1.5s;
}

#stars2 .star {
  width: 2px;
  height: 2px;
  animation-duration: 2.5s;
}

#stars3 .star {
  width: 3px;
  height: 3px;
  animation-duration: 3.5s;
  opacity: 0.6;
}

/* Blink animation */
@keyframes blink {
  0%, 100% { opacity: 0.8; }
  50% { opacity: 0.2; }
}
        
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #000;
            overflow: hidden;
            color: #fff;
        }
        .container {
            width: 400px;
            margin: 100px auto;
            position: relative;
            overflow: hidden;
            border-radius: 10px;
            background: rgba(255,255,255,0.1);
            box-shadow: 0 0 20px #0ff;
        }
        #form-slider {
            display: flex;
            width: 800px;
            transition: transform 0.5s ease-in-out;
        }
        form {
            width: 400px;
            padding: 30px;
            box-sizing: border-box;
        }
        input {
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            border: none;
            outline: none;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #0ff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            color: #000;
        }
        .toggle-link {
            text-align: center;
            margin-top: 15px;
            cursor: pointer;
            color: #0ff;
            user-select: none;
        }
        .error-msg {
            color: #f55;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
        /* Add starry background styles here */
        /* ... */
    </style>
</head>
<body>
<div id="stars"></div>
<div id="stars2"></div>
<div id="stars3"></div>


<%
    String error = (String) request.getAttribute("error");
%>

<div class="container">
    <div id="form-slider">

        <!-- LOGIN FORM -->
        <form method="post" action="UserController">
            <h2>Login</h2>
            <input type="hidden" name="action" value="login" />
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit">Login</button>

            <div class="toggle-link" onclick="toggleForm()">Don't have an account? Register</div>

            <div class="error-msg">
                <% if (error != null && error.contains("login")) { out.print(error); } %>
            </div>
        </form>

        <!-- REGISTER FORM -->
        <form method="post" action="UserController">
            <h2>Register</h2>
            <input type="hidden" name="action" value="register" />
            <input type="text" name="username" placeholder="Username" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit">Register</button>

            <div class="toggle-link" onclick="toggleForm()">Already have an account? Login</div>

            <div class="error-msg">
                <% if (error != null && error.contains("register")) { out.print(error); } %>
            </div>
        </form>

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
<script>
  const starContainers = [
    document.getElementById('stars'),
    document.getElementById('stars2'),
    document.getElementById('stars3')
  ];

  const starCounts = [100, 70, 50]; // number of stars per layer
  const maxSpeed = 0.15; // max pixels per frame for movement

  // Create stars for each container
  starContainers.forEach((container, i) => {
    for (let j = 0; j < starCounts[i]; j++) {
      const star = document.createElement('div');
      star.classList.add('star');
      container.appendChild(star);

      // Set initial random position
      star.style.top = Math.random() * 100 + 'vh';
      star.style.left = Math.random() * 100 + 'vw';

      // Store movement speed and direction as data attributes
      star.dataset.speedX = (Math.random() * maxSpeed * 2 - maxSpeed).toFixed(3);
      star.dataset.speedY = (Math.random() * maxSpeed * 2 - maxSpeed).toFixed(3);
    }
  });

  // Animate stars by updating their position
  function animateStars() {
    starContainers.forEach(container => {
      container.querySelectorAll('.star').forEach(star => {
        // Current position in vw and vh
        let top = parseFloat(star.style.top);
        let left = parseFloat(star.style.left);

        // Update position by speed
        top += parseFloat(star.dataset.speedY);
        left += parseFloat(star.dataset.speedX);

        // Wrap around screen edges
        if (top > 100) top = 0;
        else if (top < 0) top = 100;

        if (left > 100) left = 0;
        else if (left < 0) left = 100;

        // Apply updated position
        star.style.top = top + 'vh';
        star.style.left = left + 'vw';
      });
    });

    requestAnimationFrame(animateStars);
  }

  animateStars();
</script>


<!-- You can add animated star background here or in external CSS/JS -->

</body>
</html>
