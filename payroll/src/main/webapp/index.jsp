<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tgg.payroll.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payroll System - Add Salary</title>
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
            display: flex;
            flex-wrap: wrap;
            max-width: 1000px;
            margin: 40px auto;
            gap: 20px;
        }

        .profile-box {
            flex: 1;
            min-width: 280px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 10px rgba(0, 0, 0, 0.06);
            text-align: center;
        }

        .profile-box img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            background-color: #ccc;
            margin-bottom: 15px;
        }

        .profile-box h3 {
            margin: 10px 0 5px 0;
        }

        .profile-box p {
            color: #555;
        }

        .form-box {
            flex: 2;
            min-width: 300px;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 1px 12px rgba(0, 0, 0, 0.06);
        }

        .form-box label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        .form-box input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-box input[type="submit"]:hover {
            background-color: #218838;
        }

        h2 {
            font-size: 24px;
            margin-top: 40px;
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
            margin-top: 30px;
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

        td a {
            color: #dc3545;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
    <header>
        <h1>Employee Payroll Dashboard</h1>
        <p>View employee profile and add salary details</p>
    </header>

    <div class="container">
        <!-- Left Profile Box -->
        <div class="profile-box">
            <img src="https://via.placeholder.com/120" alt="Employee Photo">
            <h3>Employee Profile</h3>
            <p>This section mimics a profile photo and employee brief. You can integrate real photo later.</p>
        </div>

        <!-- Right Form Box -->
        <div class="form-box">
            <form action="employee.jsp" method="post">
                <label for="employeeName">Employee Name:</label>
                <input type="text" id="employeeName" name="employeeName" placeholder="John Doe">

                <label for="employeeId">Employee ID:</label>
                <input type="text" id="employeeId" name="employeeId" placeholder="EMP123">

                <label for="salary">Salary:</label>
                <input type="text" id="salary" name="salary" placeholder="50000">

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

    <div class="container">
        <h2>All Employee Records</h2>
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
    </div>
</body>
</html>
