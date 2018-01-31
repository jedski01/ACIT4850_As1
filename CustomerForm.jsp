<jsp:useBean id="customer" class="model.Customer" scope="session"/>

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
                <li><a href="#">
                    <i class="material-icons left">border_all</i>
                    Products
                </a></li>
                <li class="active"><a href="CustomerForm.jsp">
                    <i class="material-icons left">shopping_cart</i>
                    Place an order
                </a></li>
            </ul>
            </div>
        </nav>
        </div>

        <%
            String firstName = "";
            String lastName = "";
            String phone = "";
            String address = "";
            String email = "";

            if(customer.getFirstName() != null) {
                firstName = customer.getFirstName();
                lastName = customer.getLastName();
                phone = customer.getPhone();
                address = customer.getAddress();
                email = customer.getEmail();
            }
        %>
        <div class="container">
            <div class="section">
                <h4 class="blue-text">Customer Information</h4>
                <div class="row">
                    <form class="col s12" method="post" action="CustomerController.jsp">
                    <div class="row">
                        <div class="input-field col s6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="first_name" name="firstName" type="text" value="<%= firstName %>" class="validate">
                        <label for="first_name">First Name</label>
                        </div>
                        <div class="input-field col s6">
                        <input id="last_name" name="lastName" type="text" class="validate" value="<%= lastName %>" >
                        <label for="last_name">Last Name</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                        <i class="material-icons prefix">email</i>
                        <input id="email" name="email" type="email" value="<%= email %>" class="validate">
                        <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                        <i class="material-icons prefix">home</i>
                        <input id="address" name="address" type="text" value="<%= address %>"  class="validate">
                        <label for="addres">Address</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                        <i class="material-icons prefix">phone</i>
                        <input id="phone" name="phone" type="text" value="<%= phone %>" class="validate">
                        <label for="phone">Phone</label>
                        </div>
                    </div>
                    <div class="row">
                       <button class="btn waves-effect waves-light" type="submit" name="action">Update Information
                            <i class="material-icons right">send</i>
                       </button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        
    </body>
</html>