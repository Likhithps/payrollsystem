<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tgg.payroll.Employee" %>
<%@ page import="org.apache.commons.lang3.math.NumberUtils" %>
<%
    // Retrieve employee list from session
    List<Employee> employees = (List<Employee>) session.getAttribute("employees");
    if (employees == null) {
        employees = new ArrayList<>();
        session.setAttribute("employees", employees);
    }
    
    // Retrieve parameters from form
    String employeeName = request.getParameter("employeeName");
    String employeeId = request.getParameter("employeeId");
  
    double salary = NumberUtils.toDouble(request.getParameter("salary"), 0.0);

    // Add new employee to the list
    if (employeeName != null && employeeId != null) {
        employees.add(new Employee(employeeId, employeeName, salary)); // Set initial salary as 0
    }

    // Redirect back to index.jsp
    response.sendRedirect("index.jsp");
%>