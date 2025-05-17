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
            background-color: #f0f2f5;
            color: #333;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 30px 0;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        header h1 {
            margin: 0;
            font-size: 36px;
        }

        header p {
            margin-top: 5px;
            font-size: 16px;
            color: #dfefff;
        }

        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
        }

        form {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        form label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        h2 {
            margin-top: 40px;
            margin-bottom: 15px;
            font-size: 24px;
            border-left: 5px solid #007bff;
            padding-left: 10px;
        }

        table {
            width: 100%;
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
            font-weight: bold;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }

        .icon {
            margin-right: 6px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Payroll Management Dashboard</h1>
        <p>Manage employee details and salary records</p>
    </header>

    <div class="container">
        <form action="employee.jsp" method="post">
            <label for="employeeName">Employee Name:</label>
            <input type="text" id="employeeName" name="employeeName">

            <label for="employeeId">Employee ID:</label>
            <input type="text" id="employeeId" name="employeeId">

            <label for="salary">Salary:</label>
            <input type="text" id="salary" name="salary">

            <input type="submit" value="Add Employee">
        </form>

        <%
            List<Employee> employees = (List<Employee>) session.getAttribute("employees");
            if (employees == null) {
                employees = new ArrayList<>();
                session.setAttribute("employees", employees);
            }
        %>

        <h2>Employee Records</h2>
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
                        <a href="delete.jsp?employeeId=<%= employee.getEmployeeId() %>">
                            🗑 Delete
                        </a>
                    </td>
                </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
