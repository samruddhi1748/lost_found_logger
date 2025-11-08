package com.lostfound.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
		itemDAO =new ItemDAO();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String itemName=req.getParameter("itemName");
		String description=req.getParameter("description");
		String status=req.getParameter("status");
		String date=req.getParameter("date");
		
		Item item=new Item();
		item.setItemName(itemName);
		item.setDescription(description);
		item.setStatus(status);
		String dateStr = req.getParameter("date");
		java.sql.Date sqlDate = java.sql.Date.valueOf(dateStr);  
		item.setDate(sqlDate);

		itemDAO.addItem(item);
		   PrintWriter out=resp.getWriter();
		
		out.print("<script>prompt(data saved successfully)</script>");
		
		resp.sendRedirect("viewItems.jsp");
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Item>list=itemDAO.getAllItems();
		req.setAttribute("list", list);
		RequestDispatcher rd=req.getRequestDispatcher("viewItems.jsp");
		rd.forward(req, resp);
	}
	
	

}
