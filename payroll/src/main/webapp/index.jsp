<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tgg.payroll.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payroll System - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        h1 {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
            margin: 20px;
        }
        form {
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #3CB371;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 20px;
        }
        h2 {
        	margin-top: 20px;
            margin: 20px;
        }
        table {
            width: 97%;
            border-collapse: collapse;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px;
            
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #FF8C00;
            color: #000000;
        }
        td a {
            text-decoration: none;
            color: #007bff;
        }
        td a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Welcome to Payroll System</h1>
    <form action="employee.jsp" method="post">
        <label for="employeeName">Employee Name:</label>
        <input type="text" id="employeeName" name="employeeName"><br>
        <label for="employeeId">Employee ID:</label>
        <input type="text" id="employeeId" name="employeeId"><br>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="salary"><br>
        <input type="submit" value="Add Employee">
    </form>
    
    <%
        // Retrieve employee list from session
        List<Employee> employees = (List<Employee>) session.getAttribute("employees");
        if (employees == null) {
            employees = new ArrayList<>();
            session.setAttribute("employees", employees);
        }
    %>
    <br />
    <h2>Employee List</h2>
    <table>
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Salary</th>
            <th>Actions</th>
        </tr>
        <% for (Employee employee : employees) { %>
            <tr>
                <td><%= employee.getEmployeeId() %></td>
                <td><%= employee.getEmployeeName() %></td>
                <td><%= employee.getSalary() %></td>
                <td><a href="delete.jsp?employeeId=<%= employee.getEmployeeId() %>">Delete</a></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
