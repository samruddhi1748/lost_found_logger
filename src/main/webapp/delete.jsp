<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Item</title>
    <style>
        body { font-family: Arial; text-align: center; margin-top: 100px; background-color: #f5f5f5; }
        div { display: inline-block; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 8px gray; }
        button, a { margin: 10px; padding: 10px 20px; text-decoration: none; border: none; border-radius: 5px; cursor: pointer; }
        .yes { background-color: #dc3545; color: white; }
        .no { background-color: #28a745; color: white; }
    </style>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
%>

<div>
    <h2>Are you sure you want to delete this item?</h2>
    <a href="ItemController?action=delete&id=<%= id %>" class="yes">Yes, Delete</a>
    <a href="ItemController?action=list" class="no">Cancel</a>
</div>

</body>
</html>