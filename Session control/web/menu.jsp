<%@page import="cl.modelo.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <%
            user user = (user) session.getAttribute("user");
        %>
        <div class="container">
            <%
                if (user != null){
            %>
            <nav>
                <div class="nav-wrapper orange lighten-2">
                    <a href="#" class="brand-logo">  
                        Bienvenido al sistema, <%= user.getNombre() %> <%= user.getApellido() %>
                    </a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="productos.jsp">Ver productos</a></li>
                    <li><a href="carro.jsp">Mi Carro</a></li>
                    <li><a href="formulario.jsp">Formulario</a></li>
                    <li><a href="cerrar.jsp">Salir</a></li>
                </ul>
                </div>
            </nav>
            <%
                } else { 
            %>
            No tienes la autorización para ingresar <br>
            <a href="login.jsp"> Vovler a Login </a>
            <%
                }
            %>
        </div>     
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('select').material_select();
            });     
        </script>
    </body>
</html>