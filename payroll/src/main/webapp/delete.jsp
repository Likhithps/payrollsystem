<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.tgg.payroll.Employee" %>
<%
    // Retrieve employee list from session
    List<Employee> employees = (List<Employee>) session.getAttribute("employees");
    String employeeId = request.getParameter("employeeId");

    // Remove employee with given ID from the list
    if (employees != null && employeeId != null) {
        Iterator<Employee> iterator = employees.iterator();
        while (iterator.hasNext()) {
            Employee employee = iterator.next();
            if (employee.getEmployeeId().equals(employeeId)) {
                iterator.remove();
                break;
            }
        }
    }

    // Redirect back to index.jsp
    response.sendRedirect("index.jsp");
%>