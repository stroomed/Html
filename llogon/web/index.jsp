
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
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="container">
            <div class="row">
                <div class="col s4"></div>
                <div class="col s4">
                    <h1>LOGIN</h1>
                    <form action="validar.do" method="post">
                        <input type="text" name="txtrut" placeholder="Usuario"/>
                        <input type="password" name="txtpass" placeholder="Clave"/>
                        <input type="submit" name="btnini" value="Iniciar Session" class="btn right"/>
                    </form>
                    <br/><br/><br/>
                   
                    ${error}
                </div>
            </div>
        </div>
      <!-- Contenido-->
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
