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
                <li><a href="CustomerForm.jsp">
                    <i class="material-icons left">shopping_cart</i>
                    Place an order
                </a></li>
            </ul>
            </div>
        </nav>
        </div>

        <div class="container">
        <div class="section">
                <h4 class="blue-text">Customer Information Summary</h4>

                <h5 class="valign-wrapper"><i class="material-icons">account_circle</i>Name</h5>
                <%= customer.getFirstName()%> <%= customer.getLastName()%>
                <div class="divider"></div>


                <h5 class="valign-wrapper"><i class="material-icons">email</i>Email</h5>
                <%= customer.getEmail()%> 
                <div class="divider"></div>

                <h5 class="valign-wrapper"><i class="material-icons">home</i>Address</h5>
                <%= customer.getAddress()%> 
                <div class="divider"></div>

                <h5 class="valign-wrapper"><i class="material-icons">phone</i>Phone</h5>
                <%= customer.getPhone()%> 
                <div class="divider"></div>

        </div>

       

        <form method="post" action="CustomerOptionController.jsp">
            <button type="submit" name="action" value="confirm" class="waves-effect waves-light light-green btn">
                <i class="material-icons left">check</i>
                Confirm
            </button>
            <button type="submit" name="action" value="cancel" class="waves-effect waves-light red btn">
                <i class="material-icons left">cancel</i>
                Cancel
            </button>
            <button type="submit" name="action" value="back" class="waves-effect waves-light red light-blue btn">
                <i class="material-icons left">arrow_back</i>
                Back
            </button>
        </form>
    </body>
</html>