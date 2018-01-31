<jsp:useBean id="customer" class="model.Customer" scope="session"/>

<%
    //just to check if customer session already exists, redirect if its not
    if (customer.getFirstName() == null) {
        response.sendRedirect("CustomerForm.jsp"); 
    } else {
        out.print("Session exists. This should show the place order page");
    }
%>