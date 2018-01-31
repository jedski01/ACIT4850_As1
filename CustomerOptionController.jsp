
<%
    String action = request.getParameter("action");

    if (action.equals("confirm")){
        response.sendRedirect("ConfirmCustomerController.jsp");
    } else if(action.equals("cancel")) {
        session.invalidate();
        response.sendRedirect("index.jsp");
    } else if(action.equals("back")) {
        response.sendRedirect("CustomerForm.jsp");
    } else {
        out.print("Invalid action encountered");
    }
%>