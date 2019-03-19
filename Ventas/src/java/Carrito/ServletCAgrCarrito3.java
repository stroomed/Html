/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Carrito;

import cl.ventasonline.modelo.Producto;
import cl.ventasonline.modelo.Carrito;
import cl.ventasonline.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
* @author academico */
@SuppressWarnings("UseOfObsoleteCollectionType")
public class ServletCAgrCarrito3 extends HttpServlet {
   
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession sesion=request.getSession();
        Vector<Carrito> carritoCompra = null;
        Vector<Producto> productos=(Vector<Producto>)sesion.getAttribute("productos");
        Usuario usuario=(Usuario)sesion.getAttribute("usuarioInicio");
        //Si se creo la sesion con el atributo de carrito
        if(sesion.getAttribute("carrito")!=null){
            //Si existe una sesion con ese atributo, se obtiene los datos de esa sesion
            carritoCompra =(Vector<Carrito>)sesion.getAttribute("carrito");
        }else{
            //Si no existe esa sesion se crea el carrito de compras
            carritoCompra = new Vector<Carrito>();

        }
        //Obtenemos los valores de la cajas de texto
        int indice=Integer.parseInt(request.getParameter("txtIndice").trim());
        int cantidad=Integer.parseInt(request.getParameter("txtCantidad").trim());
        float subTotal=cantidad * productos.get(indice).getPrecio();
        //Creo el elemento carrito
        Carrito car=new Carrito();
        car.setCodigo(indice);
        car.setProducto(productos.get(indice));
        car.setUsuario(usuario);
        car.setCantidadPedida(cantidad);
        car.setSubTotal(subTotal);
        //Agrego el carrito a mi vector
        carritoCompra.add(car);
        sesion.setAttribute("carrito",carritoCompra);
        PrintWriter out=response.getWriter();
        String name = usuario.getNombre() + " " + usuario.getApellido();
        mostrarPagina(out, carritoCompra,name);
        out.close();
    }


    public void mostrarPagina(PrintWriter out, Vector<Carrito> carritoCompras, String nombre){
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Sistema de ventas online</title>");
        out.println("<meta name='viewport' content='width=device-width'>");
        out.println("<link href='content/css/demo.css' rel='stylesheet' type='text/css'>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"top\"></div>");
	out.println("<div class='subMenu' >");
	 	out.println("<div class='inner'>");
	 	out.println("	<a href='inicio/CConProd.jsp' class='subNavBtn'>Home</a>");
	 	out.println("	<a href='inicio/CConProd.jsp' class='subNavBtn'>Consultar Producto</a> ");
		out.println("	<a href='carrito/carrito.jsp' class='subNavBtn'>Agregar al carrito [+]</a>");
		out.println("	<a href='logout' class='subNavBtn'>Salir</a>");
                out.println("   <b class=\"subNavBtn\">"+ nombre+ "</b>");
	out.println("	</div>");
	out.println("</div>");
	out.println("<div class='section s1'>");
		out.println("<div class='inner'>");
                  out.println("  <div id='centrar'>");  
                  
                  out.println("<table width=\"100%\" border=\"0\">");
                  out.println("<tr bgcolor=\"#FF6600\" style=\"color: #FFFFFF\">");
                  out.println("<td width=\"68%\"><h4>Nombre</h4></td>");
                  out.println("<td width=\"16%\" align=\"right\" valign=\"top\"><h4><span class=\"Estilo3\">Stock</span></h4></td>");
                  out.println("<td width=\"16%\" align=\"right\" valign=\"top\"><h4><span class=\"Estilo3\">Precio</span></h4></td>");
                  out.println("</tr>");

                 //Vamos a mostrar la lista de productos del vector de Productos

                 for(int i=0; i<carritoCompras.size(); i++){

                     if(i%2==0){
                         out.println("<tr bgcolor=\"#184764\">");
                         out.println("<td>" + carritoCompras.get(i).getProducto().getNombre() + "</td>");
                         out.println("<td align=\"right\" valign=\"top\">"+ carritoCompras.get(i).getCantidadPedida() +"</td>");
                         out.println("<td align=\"right\" valign=\"top\">"+ carritoCompras.get(i).getSubTotal() +"</td>");
                         out.println("</tr>");
                     }else{
                         out.println("<tr>");
                         out.println("<td>" + carritoCompras.get(i).getProducto().getNombre() + "</td>");
                         out.println("<td align=\"right\" valign=\"top\">"+ carritoCompras.get(i).getCantidadPedida() +"</td>");
                         out.println("<td align=\"right\" valign=\"top\">"+ carritoCompras.get(i).getSubTotal() +"</td>");
                         out.println("</tr>");
                     }
                 }
                 out.println("<td colspan=\"2\" aling=\"center\"><a href=\"ServletCFinalizarCompra\"><b>FINALIZAR COMPRA</b></a></td>");
                 out.println("</table>");
                  out.println("  </div>");
		out.println("</div>");
	out.println("</div>");
        out.println(" <div class='subMenu'>");
	out.println(" 	<div class='inner'></div>");
	out.println("</div>");
        out.println("</body>");
        out.println("</html>");

        out.close();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
