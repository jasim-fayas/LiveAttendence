<%-- 
    Document   : Logout
    Created on : 12 Mar, 2024, 10:51:03 PM
    Author     : jasim fayas
--%>


<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Get the current session
    HttpSession se = request.getSession();

    // Invalidate the session
    se.invalidate();
    response.sendRedirect("index.jsp");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 
</head>
<body>
    
    <br>
    <br>
    <br>
   
</html>
