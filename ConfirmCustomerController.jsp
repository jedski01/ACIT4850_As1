<jsp:useBean id="database" class="database.Database" scope="page"/>
<jsp:useBean id="customer" class="model.Customer" scope="session" />

<%
    String result = database.saveCustomer(customer.getLastName(), customer.getFirstName(), customer.getPhone(),
                            customer.getEmail(), customer.getAddress());

    out.print(result);

    //invalidate the session
    session.invalidate();
%>
