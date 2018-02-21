<!-- ������ view -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "guestbook.model.Message" %>
<%@ page import = "guestbook.service.MessageListView" %>
<%@ page import = "guestbook.service.GetMessageListService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String pageNumberStr = request.getParameter("page");
   int pageNumber = 1;
   if(pageNumberStr != null){
      pageNumber = Integer.parseInt(pageNumberStr); }
   GetMessageListService messageListService = GetMessageListService.getInstance();
   MessageListView viewData = messageListService.getMessageList(pageNumber);%>
<c:set var = "viewData" value="<%= viewData %>"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action ="writeMessage.jsp" method="post">
�̸�: <input type="text" name="guestName"><br>
��ȣ: <input type="password" name="password"><br>
�޼���: <textarea name="message" cols="30" rows ="3"></textarea><br>
<input type = "submit" value="�޽��� �����"/></form><hr>
<c:if test="${viewData.isEmpty()}">��ϵ� �޽����� �����ϴ�.</c:if>
<c:if test="${!viewData.isEmpty()}">
<table border="1">
   <c:forEach var = "message" items="${viewData.messageList}">
   <tr><td>�޽��� ��ȣ: ${message.id}<br/>
   �մ��̸�:${message.guestName}<br/>
   �޽���: ${message.message}<br/>
   <a href = "confirmDeletion.jsp?messageId=${message.id}">[�����ϱ�]</a>
   </td>   </tr>   </c:forEach> </table>
<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href = "list.jsp?page=${pageNum}">[${pageNum}]</a>
</c:forEach></c:if></body></html>