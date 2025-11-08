package com.lostfound.controller;

import java.io.IOException;
import java.util.List;

import com.lostfound.dao.ItemDAO;
import com.lostfound.model.Item;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ItemController extends HttpServlet {
    private ItemDAO itemDAO;

    public void init() {
        itemDAO = new ItemDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "insert";
        }

        switch (action) {
            case "insert":
                insertItem(req, resp);
                break;
            case "update":
                updateItem(req, resp);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listItems(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                deleteItem(req, resp);
                break;
        }
    }

    private void insertItem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String itemName = req.getParameter("itemName");
        String description = req.getParameter("description");
        String status = req.getParameter("status");
        String dateStr = req.getParameter("date");

        java.sql.Date sqlDate = java.sql.Date.valueOf(dateStr);

        Item item = new Item();
        item.setItemName(itemName);
        item.setDescription(description);
        item.setStatus(status);
        item.setDate(sqlDate);

        itemDAO.addItem(item);
        resp.sendRedirect("ItemController?action=list");
    }

    private void listItems(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Item> list = itemDAO.getAllItems();
        req.setAttribute("list", list);
        RequestDispatcher rd = req.getRequestDispatcher("viewItems.jsp");
        rd.forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // here we’ll just forward id to edit.jsp
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("id", id);
        RequestDispatcher rd = req.getRequestDispatcher("edit.jsp");
        rd.forward(req, resp);
    }

    private void updateItem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String itemName = req.getParameter("itemName");
        String description = req.getParameter("description");
        String status = req.getParameter("status");
        String dateStr = req.getParameter("date");

        java.sql.Date sqlDate = java.sql.Date.valueOf(dateStr);

        Item item = new Item();
        item.setId(id);
        item.setItemName(itemName);
        item.setDescription(description);
        item.setStatus(status);
        item.setDate(sqlDate);

        itemDAO.updateItem(item);
        resp.sendRedirect("ItemController?action=list");
    }

    private void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        itemDAO.deleteItem(id);
        resp.sendRedirect("ItemController?action=list");
    }
}