<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Item</title>
    <style>
        /* Base Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #ff6f61, #ff9f6f);
        }

        h2 {
            font-size: 28px;
            color: #fff;
            text-align: center;
            margin-bottom: 40px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }

        /* Form Styling */
        form {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease;
        }

        form:hover {
            transform: scale(1.05);
        }

        /* Input Styles */
        input, select, textarea {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 2px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.5);
        }

        textarea {
            height: 100px;
            resize: none;
        }

        /* Status Select */
        select {
            cursor: pointer;
        }

        /* Button Styling */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
            transform: translateY(-3px);
        }

        button:active {
            transform: translateY(1px);
        }

        /* Back Link */
        a {
            color: #4CAF50;
            font-size: 16px;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #45a049;
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            form {
                padding: 20px;
                width: 90%;
            }

            h2 {
                font-size: 24px;
            }

            button {
                font-size: 16px;
                padding: 10px 18px;
            }
        }
    </style>
</head>
<body>
    <div>
        <h2>Add Lost or Found Item</h2>
        <form action="ItemController" method="post">
            <input type="text" name="itemName" placeholder="Item Name" required><br>
            <textarea name="description" placeholder="Description" required></textarea><br>
            <select name="status" required>
                <option value="">-- Select Status --</option>
                <option value="Lost">Lost</option>
                <option value="Found">Found</option>
            </select><br>
            <input type="date" name="date" required><br>
            <button type="submit">Save Item</button>
        </form>
        <br>
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
