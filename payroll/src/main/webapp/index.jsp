<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tgg.payroll.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payroll System - Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f8;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 25px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 34px;
        }

        .container {
            display: flex;
            max-width: 1000px;
            margin: 30px auto;
            gap: 20px;
        }

        .profile-box {
            width: 35%;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 20px;
            text-align: center;
        }

        .profile-box img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .profile-box h2 {
            margin: 10px 0 5px;
            color: #333;
        }

        .profile-box p {
            font-size: 14px;
            color: #666;
        }

        .form-box {
            flex-grow: 1;
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        form label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        h3 {
            margin-top: 40px;
            font-size: 22px;
            margin-left: 10px;
        }

        table {
            width: 96%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 1px 8px rgba(0,0,0,0.05);
            border-radius: 5px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #f9a825;
            color: #000;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td a {
            color: #dc3545;
            text-decoration: none;
            font-weight: bold;
        }

        td a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Employee Payroll Management system</h1>
    </header>

    <div class="container">
        <!-- Left: Profile Mock -->
        <div class="profile-box">
            <h2>John Doe</h2>
            <p>Software Developer<br>Department: Engineering</p>
        </div>

        <!-- Right: Salary Form -->
        <div class="form-box">
            <form action="employee.jsp" method="post">
                <label for="employeeName">Employee Name:</label>
                <input type="text" id="employeeName" name="employeeName" value="John Doe">

                <label for="employeeId">Employee ID:</label>
                <input type="text" id="employeeId" name="employeeId" value="EMP1234">

                <label for="salary">Salary (INR):</label>
                <input type="text" id="salary" name="salary" value="75000">

                <input type="submit" value="Add Salary">
            </form>
        </div>
    </div>

    <%
        List<Employee> employees = (List<Employee>) session.getAttribute("employees");
        if (employees == null) {
            employees = new ArrayList<>();
            session.setAttribute("employees", employees);
        }
    %>

    <h3>All Employee Records</h3>
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
                <td>
                    <a href="delete.jsp?employeeId=<%= employee.getEmployeeId() %>">🗑 Delete</a>
                </td>
            </tr>
        <% } %>
    </table>
</body>
</html>
