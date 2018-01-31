<jsp:useBean id="customer" class="model.Customer" scope="session"/>
<jsp:setProperty name="customer" property="*"/>
<% response.sendRedirect("DisplayCustomer.jsp"); %>
