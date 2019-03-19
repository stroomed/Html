<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
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
        <div class="container">

            <form action="validar.do" method="post">
                <table>    
                    <tr>
                        <td colspan="3">                        
                        <td>
                        <td>        
                            <div class="input-field col s6">
                                <i class="material-icons prefix"></i>
                                <input id="icon_prefix" type="text" value="<%=rut%>" name="txtrut">
                                <label for="icon_prefix">Ingrese Rut</label>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix"></i>
                                <input id="icon_prefix" type="text" name="txtpass">
                                <label for="icon_prefix">Ingrese Clave</label>
                            </div>
                            <br>
                            <br>
                            <button class="btn waves-effect waves-light" type="submit" name=“action">Enviar <i class="material-icons right">send</i>
                            </button>     
                        </td>
                        <td colspan="3">
                        </td>
                    </tr>
                </table>
                <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
                <script type="text/javascript" src="js/materialize.min.js"></script>
            </form>
        </div>    
    </body>
</html>