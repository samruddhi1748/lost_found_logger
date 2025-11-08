<%@ page import="com.lostfound.dao.ItemDAO, com.lostfound.model.Item" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Item</title>
    <style>
        body { font-family: Arial; background-color: #f5f5f5; }
        form { width: 400px; margin: 80px auto; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 0 8px gray; }
        input, select { width: 100%; padding: 8px; margin: 10px 0; }
        button { background-color: #28a745; color: white; padding: 10px; border: none; border-radius: 5px; cursor: pointer; width: 100%; }
        button:hover { background-color: #218838; }
    </style>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    ItemDAO dao = new ItemDAO();
    java.util.List<Item> items = dao.getAllItems();
    Item itemToEdit = null;
    for (Item i : items) {
        if (i.getId() == id) {
            itemToEdit = i;
            break;
        }
    }
%>

<form action="ItemController" method="post">
    <h2>Edit Item</h2>
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= itemToEdit.getId() %>">

    <label>Item Name:</label>
    <input type="text" name="itemName" value="<%= itemToEdit.getItemName() %>" required>

    <label>Description:</label>
    <input type="text" name="description" value="<%= itemToEdit.getDescription() %>" required>

    <label>Status:</label>
    <select name="status" required>
        <option value="Lost" <%= "Lost".equals(itemToEdit.getStatus()) ? "selected" : "" %>>Lost</option>
        <option value="Found" <%= "Found".equals(itemToEdit.getStatus()) ? "selected" : "" %>>Found</option>
    </select>

    <label>Date:</label>
    <input type="date" name="date" value="<%= itemToEdit.getDate() %>" required>

    <button type="submit">Update Item</button>
</form>

</body>
</html>