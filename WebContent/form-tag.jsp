<%@page import="javaweb.struts.City"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		List<City> cities = new ArrayList<City>();
		cities.add(new City(1001, "AA"));
		cities.add(new City(1002, "BB"));
		cities.add(new City(1003, "CC"));
		cities.add(new City(1004, "DD"));

		request.setAttribute("cities", cities);
	%>



	<s:debug></s:debug>

	<!-- 
	
		Form-tag:
		1. Similar with HTML's <form></form>
		2. Struts2's form tag can generate a table and automatically compose it.
		3. Can re-show form's information: From valueStack start to find attribute values,
			and add it to corresponding tags. If the top valueStack does not have the attribute,
			then find in the next one until find them.
	 -->

	<s:form action="save">

		<s:hidden name="userId"></s:hidden>

		<s:textfield name="userName" label="UserName"></s:textfield>
		<s:password name="password" label="Password"></s:password>
		<s:textarea name="desc" label="Desc"></s:textarea>
		<s:checkbox name="married" label="Married"></s:checkbox>

		<s:radio name="gender" list="#{'1':'Male','0':'Female' }"
			label="Gender"></s:radio>


		<!-- 
			In server side, use collection type to make sure re-show can work!
		 -->
		<s:checkboxlist list="#request.cities" listKey="cityId"
			listValue="cityName" label="City" name="city"></s:checkboxlist>

		<s:select list="{11,12,13,14,15,16,17,18,19,20}" headerKey=""
			headerValue="Please select" name="age" label="Age">
			<!-- 
				s:optgroup can be s:select's child tags, for showing more dropdown menu
				notice: Must follow key:value format. Can just let key = value
			
			 -->
			
			<s:optgroup label="21-30" list="#{21:21,22:22}"></s:optgroup>
			<s:optgroup label="31-40" list="#{31:31,32:32}"></s:optgroup>
		</s:select>


		<s:submit></s:submit>
	</s:form>

	<br>
	<br>

	<form action="save" method="post">
		Married:<input type="checkbox" name="married" /> <input type="submit"
			value="Submit" />

	</form>


</body>
</html>