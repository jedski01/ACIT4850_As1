<jsp:useBean id="catalog" class="model.Catalog" scope="session" />
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>


<%
    String[] headers = catalog.getHeaders();
    ArrayList<Product> products = catalog.getProducts();
%>

<html>

     <head>

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    </head>
    <body>
        <!-- NAVIGATION BAR -->
        <div class="navbar-fixed">
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container">
            <a href="index.jsp" class="brand-logo">Alex and Jed</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li class="ative"><a href="#">
                    <i class="material-icons left">border_all</i>
                    Products
                </a></li>
                <li><a href="PlaceOrderController.jsp">
                    <i class="material-icons left">shopping_cart</i>
                    Place an order
                </a></li>
            </ul>
            </div>
        </nav>
        </div>

        <div class="container">
        <div class="section">
            <h4 class="blue-text">Products</h4>

            <table class="striped">
                <thead>
                    <tr>
                    <%
                        for(int i = 1 ; i < headers.length ; i++) {
                    %>
                        <th><%= headers[i].toUpperCase()%></th>
                    <%        
                        }
                    %>
                    <tr>
                </thead>
                <tbody>
                    <%
                        for(Product product : products) {
                    %>
                        <tr>
                            
                            <td><%= product.getType() %></td>
                            <td><%= product.getColor()%></td>
                            <td><%= product.getSize()%></td>
                            <td>$<%= product.getPrice()%></td>
                           
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>


</html>