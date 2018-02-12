<jsp:useBean id="customer" class="model.Customer" scope="session" />
<%
    String result = customer.save();
    customer.setId();
    response.sendRedirect("OrderForm.jsp");
%>

