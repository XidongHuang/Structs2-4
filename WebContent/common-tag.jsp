<%@page import="javaweb.struts.PersonComparator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javaweb.struts.Person"%>
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
	<br><br>
	s:proerty: Print attributes in the valueStack: For ObjectStack, print attribute value in it
	<br><br>
	<s:property value="[0].productName"></s:property>
	<br><br>
	For Map Stack, print request, session, attributes in application or some parameter value
	<br><br>
	<s:property value="#session.date"/>
	<br><br>
	<s:property value="#parameters.name[0]"/>
	<br><br>
	
	s:url: Create a URL String:
	<br><br>
	<s:url value="/testUrl" var="url" >
		<!-- Specific url's parameters, 2002 cannot be an attribute name, so Struts2 use 2002 as attribute value -->
		<s:param name="productId" value="2002"></s:param>
	</s:url>
	${url }
	<br><br>
	<s:url value="/testUrl" var="url2" >
		<!-- For value, it will be parsed by OGNL automatically! -->
		<s:param name="productId" value="productId"></s:param>
		<s:param name="date" value="#session.date"></s:param>
	</s:url>
	${url2 }
	<br><br>
	<s:url value="/testUrl" var="url3" >
		<!-- For value, it will be parsed by OGNL automatically!
			 If do not want to use OGNL to parse it, then use ''! -->
		<s:param name="productId" value="'abcdefg'"></s:param>
	</s:url>
	${url3 }
	<br><br>
	<!-- Create a url of requesting action -->
	<s:url action="testAction" namespace="/helloWorld" method="save" var="url4"></s:url>
	${url4 }
	<br><br>
	<s:url value="testUrl" var="url5" includeParams="all"></s:url>
	${url5 }
	
	
	<br><br>
	s:set: add an attribute value into page, request, session, application objects
	<br><br>
	<!-- OGBL parses attribute value automatically -->
	<s:set name="productName" value="productName" scope="page"></s:set>
	productName: ${pageScope.productName }
	<br><br>
	s:push: Push an Object into tag when the tag begins working, eject from stack when the tag is done
	<br><br>
	<%
	
		Person person =  new Person();
		person.setAge(20);
		person.setName("Tom");
		
		request.setAttribute("person", person);
	%>
	
	<s:push value="#request.person">
		${name }
	</s:push>
	---${name }---
	<br><br>
	s:if, s:else, s:elseif:
	<br><br>
	<!-- Directly use attributes in the stack -->
	<s:if test="productPrice > 1000">
		i7
	</s:if>
	<s:elseif test="productPrice > 800">
		i5
	</s:elseif>
	<s:else>
		i3
	</s:else>
	
	<br><br>
	<s:if test="#request.person.age > 10">
	
		older than 10	
	</s:if>
	<s:else>
		younger than or equal 10
	</s:else>
	<br><br>
	s:iterator: check collection. Push and eject every element in and out for valueStack
	
	<%
		List<Person> persons = new ArrayList<Person>();
			persons.add(new Person("AA",10));
			persons.add(new Person("BB",20));
			persons.add(new Person("CC",30));
			persons.add(new Person("DD",40));
			persons.add(new Person("EE",50));

			request.setAttribute("persons", persons);
	%>
	<br><br>
	<s:iterator value="#request.persons" status="status">
		index:${status.index} - count: ${status.count}:${name } - ${age }<br>
	
	</s:iterator>
	<br><br>
	<s:iterator value="persons">
		${name } -- ${age }<br>
	
	</s:iterator>
	
	<br><br>
	s:sort can sort elements in the collection
	
	
	<br><br>
	<%
		PersonComparator pc = new PersonComparator();
		request.setAttribute("pc", pc);
	
	%>
	<s:sort comparator="#request.pc" source="persons" var="persons2"></s:sort>
	<s:iterator value="#attr.persons2">
		${name } - ${age }<br>
	</s:iterator>
	<br><br>
	s:date can compose Date Objects
	
	<br><br>
	<s:date name="#session.date" format="yyyy-MM-dd hh:mm:ss" var="date2"></s:date>
	date: ${date2 }
	
	<br><br>
	<s:iterator value="persons">
	
		<!-- Forcedly parse the attributes in %{} by OGNL  -->
		<s:a href="getPerson.action?name=%{name}">${name }</s:a>
	
	</s:iterator>
	
	
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	
	
</body>
</html>