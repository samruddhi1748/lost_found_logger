<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.lostfound.model.Item" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Items</title>
    <style>
        /* Body */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #ffffff);
            margin: 0;
            padding: 20px;
            text-align: center;
            color: #333;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 32px;
            color: #2c3e50;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.1);
        }

        /* Table container */
        table {
            margin: auto;
            border-collapse: collapse;
            width: 90%;
            max-width: 1000px;
            background: #ffffff;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        table:hover {
            transform: scale(1.01);
        }

        /* Table headers */
        th {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            font-size: 16px;
            letter-spacing: 0.5px;
        }

        /* Table cells */
        td {
            padding: 12px 20px;
            font-size: 14px;
            border-bottom: 1px solid #ddd;
        }

        /* Alternating row colors */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e8f5e9;
            transition: background 0.3s ease;
        }

        /* Action links/buttons */
        a {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 13px;
            transition: all 0.3s ease;
            color: #fff;
            margin: 0 3px;
        }

        a[href*="edit"] {
            background-color: #3498db;
        }

        a[href*="edit"]:hover {
            background-color: #2980b9;
        }

        a[href*="delete"] {
            background-color: #e74c3c;
        }

        a[href*="delete"]:hover {
            background-color: #c0392b;
        }

        /* Back button */
        .back-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 22px;
            background-color: #4CAF50;
            color: white;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background-color: #45a049;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            table, th, td {
                font-size: 12px;
                padding: 10px;
            }
            h2 {
                font-size: 26px;
            }
        }
    </style>
</head>
<body>
    <h2>All Lost & Found Items</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Item Name</th>
            <th>Description</th>
            <th>Status</th>
            <th>Date</th>
            <th>Actions</th>
        </tr>
        <%
            List<Item> list = (List<Item>)request.getAttribute("list");
            if(list != null) {
                for(Item item : list) {
        %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getItemName() %></td>
            <td><%= item.getDescription() %></td>
            <td><%= item.getStatus() %></td>
            <td><%= item.getDate() %></td>
            <td>
                <a href="ItemController?action=edit&id=<%= item.getId() %>">Edit</a>
                <a href="delete.jsp?id=<%= item.getId() %>">Delete</a>
            </td>
        </tr>
        <% } } %>
    </table>

    <a href="index.jsp" class="back-btn">Back to Home</a>
</body>
</html>
