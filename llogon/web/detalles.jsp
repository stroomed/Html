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
            
            Producto p=null;
            int codigo=Integer.parseInt(request.getParameter("codigo"));
            ArrayList<Producto> listaproductos=(ArrayList<Producto>) getServletContext().getAttribute("listaproductos");
            
            for(Producto pr:listaproductos ){
               if(codigo==pr.getCodigo()){
               p=pr;
               break;
               }
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
            <form action="add.do" method="post">
            <h1>DETALLES</h1>
            Codigo:<input type="text" name="txtcod" placeholder="Codigo" readonly="true" value="<%=p.getCodigo()%>"/>
            Nombre:<input type="text" name="txtnom" placeholder="Nombre" readonly="true" value="<%=p.getNombre()%>"/>
            Precio:<input type="text" name="txtpre" placeholder="Precio" readonly="true" value="<%=p.getPrecio()%>"/>
            <br/>
            
            <div class="input-field col s12">
            Cantidad:<select name="cbcan" requerid>
                <%
                for(int i=0;i<=p.getStock();i++){
                out.println("<option value='"+i+"'>"+i+"</option>");
                }
                %>
            </select>
            <label>Materialize Select</label>
            </div>
            <input type="submit" name="btadd" value="Agregar" class="btn right"/>
        </form>
            
            <br/><br/>
            <a href="productos.jsp" class="right">Volver</a>
         
        </div>
            
    </div>    
            <!-- Contenido-->
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript">
     $(document).ready(function() {
    $('select').material_select();
  });
    
</script>

    </body>
</html>
