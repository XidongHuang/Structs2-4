<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<s:debug></s:debug>
	
	ProductName:${productName }
	<br><br>
	ProductDesc:<s:property value="[1].productDesc"/>
	<br><br>
	<!--  
	ProductPrice:${productPrice }
	<br><br>
	ProductPrice:<s:property value="[0].productPrice"/>
	<br><br>
	-->
	ProductPrice:<s:property value="productPrice"/>
	<br><br>
	ProductName1: ${sessionScope.product.productName }
	<s:property value="#session.product.productName"/>
	<br><br>
	ProductName2: ${requestScope.test.productName }
	<s:property value="#request.test.productName"/>
	<br><br>
	
	<!-- Use OGNL to invoke static String and static methods in public type of public class -->
	<s:property value="@java.lang.Math@PI"/>
	<br><br>
	<s:property value="@java.lang.Math@cos(0)"/>
	
	<!-- invoke a method in Object Stack to add value into an attribute -->
	<s:property value="setProductName('Dell')"/>
	
	<br><br>
	<s:property value="productName"/>
	
	<!-- Invoke Array object's attribute -->
	<%
		String [] names = new String[]{"aa", "bb", "cc", "dd"};
		request.setAttribute("names", names);
	
	%>
	<br><br>
		
	length: <s:property value="#attr.names.length"/>
	
	<br><br>
	names[2]: <s:property value="#attr.names[2]"/>
		
	<br><br>
	<%
		Map<String, String> letters = new HashMap<String, String>();
		letters.put("AA", "a");
		letters.put("BB", "b");
		letters.put("CC", "c");
	
		request.setAttribute("letters", letters);
	%>
	
	<!-- Use OGNL to check Map -->
	<s:property value="#attr.letters.size"/>
	
	<br><br>
	AA: <s:property value="#attr.letters['AA']"/>
	
</body>
</html>