<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.lostfound.model.Item" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Items</title>
    <style>
        body { font-family: Arial; background-color: #f0f9f0; text-align: center; }
        table { margin: auto; border-collapse: collapse; width: 80%; background: white; }
        th, td { border: 1px solid #ccc; padding: 10px; }
        th { background-color: #4CAF50; color: white; }
        a { text-decoration: none; color: #007BFF; }
        a:hover { text-decoration: underline; }
        .btn { background-color: #4CAF50; color: white; padding: 6px 10px; border-radius: 5px; }
        .btn-del { background-color: #e74c3c; }
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
                <a class="btn" href="UpdateDeleteController?action=edit&id=<%= item.getId() %>">Edit</a> |
                <a class="btn btn-del" href="UpdateDeleteController?action=delete&id=<%= item.getId() %>">Delete</a>
            </td>
        </tr>
        <% } } %>
    </table>
    <br>
    <a href="index.jsp">Back to Home</a>
</body>
</html>