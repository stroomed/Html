<%@page import="java.util.ArrayList"%>
<%@page import="cl.tienda.model.User"%>
<%@page import="cl.tienda.model.Producto"%>
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
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu</title>
    </head>
    <body>
     <%
            User user=(User) session.getAttribute("user");
            if (user==null){
            request.setAttribute("error","<h5><center>Debe Iniciar session para acceder!!!</center></h5>");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            }
     %>     
        <nav>
            <div class="nav-wrapper teal lighten-1">
                <a href="#" class="brand-logo center">Bienvenido(a) Usuario:
                <%=user.getNombre()+""+user.getApellidos()%>
                </a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="productos.jsp">Productos</a></li>
                    <li><a href="carro.jsp">Mi Carro</a></li>  
                    <li><a href="cerrar.jsp">Cerrar Sesion</a></li>                    
                </ul>
            </div>
        </nav>
    <br/><br/><br/><br/>    
    <div class="row">
        <div class="col s4"></div>
        <div class="col s4">
            <table class="bordered">
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Detalle</th>
                    
                </tr>
                <%
                ArrayList<Producto> listaproductos=(ArrayList<Producto>) getServletContext().getAttribute("listaproductos");
                
                for(Producto p:listaproductos){
                %>  
                <tr>
                <td><%=p.getCodigo()%></td>
                <td><%=p.getNombre()%></td>
                <td><a class="btn-floating waves-effect waves-light red" href="detalles.jsp?codigo=<%=p.getCodigo()%>"><i class="material-icons">add</i></a></td>
                </tr>
                <%
                }
                %>
            </table>
        </div>
    </div>    
        <!-- Contenido-->
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>

    

    </body>
</html>
