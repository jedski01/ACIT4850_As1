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

        <style>
            .highlighted {
                background-color:#00ff80;
            }
        </style>
    </head>
    <body>
        <!-- NAVIGATION BAR -->
        <div class="navbar-fixed">
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container">
            <a href="index.jsp" class="brand-logo">Alex and Jed</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="Products.jsp">
                    <i class="material-icons left">border_all</i>
                    Products
                </a></li>
                <li class="active"><a href="PlaceOrderController.jsp">
                    <i class="material-icons left">shopping_cart</i>
                    Place an order
                </a></li>
            </ul>
            </div>
        </nav>
        </div>

        <div class="container">
        <div class="section">
            <h4 class="blue-text">Order Form</h4>

            <table class="bordered">
                <thead>
                    <tr>
                    <%
                        for(int i = 1 ; i < headers.length ; i++) {
                    %>
                        <th><%= headers[i].toUpperCase()%></th>
                    <%        
                        }
                    %>
                        <th>QUANTITY</th>
                        <th>SUBTOTAL</th>
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
                            <td>
                                <input type="number" style="width:20%" value="0" min="0"
                                    onkeyup="updateSubTotal(this, <%= product.getPrice()%>, sub<%= product.getProductId()%>)"
                                    onmouseup="updateSubTotal(this, <%= product.getPrice()%>, sub<%= product.getProductId()%>)"
                                    onblur="checkReset(this)"
                                />
                            </td>
                            <td id="sub<%= product.getProductId()%>"></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="row  right-align" style="padding-top:20px">
                <button type="submit" class="waves-effect waves-light green btn">Place Order </button>
            </div>
            
        </div>
    </body>
    <script>

        function updateSubTotal(self, price, elem) {
            if(!isNaN(parseInt(self.value)) && parseInt(self.value) !== 0) {
                sub = self.value * price;
                elem.innerHTML = "$ "+sub;
                elem.parentNode.style.backgroundColor="#b3ffd9"
            } else{
                elem.innerHTML = ""
                elem.parentNode.style.backgroundColor="#FFF"
            }
        }

        function checkReset(self) {
            if(self.value=="") {
                self.value = 0
                self.parentNode.parentNode.style.backgroundColor="#FFF";
            }
        }
    </script>


</html>