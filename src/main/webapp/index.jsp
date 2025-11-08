<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lost & Found Item Logger</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            background-color: #f3f3f3;
        }
        .btn {
            padding: 10px 20px;
            margin: 20px;
            border: none;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Lost & Found Item Logger</h1>
    <a href="addItem.jsp"><button class="btn">Add New Item</button></a>
    <a href="ItemController"><button class="btn">View All Items</button></a>
</body>
</html>