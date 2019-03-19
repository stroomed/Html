
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
<!-- Materialize -->
        <link type="text/css" rel="stylesheet" href="utilidades/css/parallax.min.css"  media="screen,projection"/>
<!-- CSS -->
        <link type="text/css" rel="stylesheet" href="utilidades/css/style.css" media="screen,projection">
<!-- Optimizado para moviles -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
<!-- Charset -->        
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Titulo --> 
        <title> Ingreso a plataforma </title>
    </head>
    
    <body>
        <nav class="green" role="navigation">
            <div class="nav-wrapper container">
                <a href="#" class="brand-logo"> Ingreso al sistema </a>
            </div>
        </nav> 
        <br>
        <div id="index-banner" class="container">
            <div class="section no-pad-bot">
                <div class="container">
                    <br>
                    <br>
                    <form name="ingreso" action="validarusuario.do" method="POST">
<!-- Ingreso de personal -->
                        <h2 class="header center teal-text text-lighten-2">Ingreso de Personal</h2>
                        <div class="row center">
<!-- Ingreso de Nick -->
                            <h5 class="header col s12 blue-grey-text darken-4">Ingrese su Nick</h5>   
                        </div>
                        <div class="row center">
                            <input type="text" name="txtrut" id="txtrut" value="" size="40" maxlength="20"/>
                        </div>
                        <div class="row center">
<!-- Ingreso de clave -->
                            <h5 class="header col s12 blue-grey-text darken-4">Ingrese su Clave</h5>  
                        </div>
                        <div class="row center">
                            <input type="password" name="txtpass" id="txtpass" value="" size="40" maxlength="20"/>
                        </div>
                        <div class="row center">
<!-- Bonton de ingreso -->         
                            <input type="submit" value="Ingresar" class="btn-large waves-effect waves-light deep-orange darken-4"/>
                        </div>
                    </form>
                    <br>
                    <br>
                </div>
            </div>
        </div>
        <div class="container">
            <footer class="page-footer teal lighten-2">
                <div class="container">
                    <div class="row">
                        <div class="col 16 s12">
                            <h5 class="black-text">¿Quiénes somos?</h5>
                            <p class="grey-text text-darken-4">Estudiantes del ramo "Programación de componentes web" que buscan realizar un buen proyecto final.</p>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright">
                    <div class="container">
                        <a class="brown-text lighten-2">Hecho gracias a </a><a class="grey-text text-darken-4" href="http://materializecss.com">Materialize</a>
                    </div>
                </div>
            </footer>
        </div>               
        <script type="text/javascript" src="js/parallax.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="utilidades/js/paralax.js"></script>
        <script src="utilidades/js/init.parallax.js"></script>        
    </body>    
</html>
