<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Item</title>
    <style>
        body {
            font-family: Arial;
            background-color: #e6f7ff;
            text-align: center;
        }
        form {
            margin-top: 40px;
        }
        input, select, textarea {
            margin: 10px;
            padding: 8px;
            width: 250px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover { background-color: #45a049; }
    </style>
</head>
<body>
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
</body>
</html>