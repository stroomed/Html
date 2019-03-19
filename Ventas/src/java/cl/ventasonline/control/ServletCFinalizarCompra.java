/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cl.ventasonline.control;

import cl.ventasonline.modelo.Producto;
import cl.ventasonline.modelo.Carrito;
import cl.ventasonline.modelo.Usuario;
import cl.ventasonline.modelo.detallesventa;
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
public class ServletCFinalizarCompra extends HttpServlet {
   
   
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request, response);
    } 
    
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession sesion=request.getSession();
        Vector<Carrito> carritoCompra=(Vector<Carrito>)sesion.getAttribute("carrito");
        Vector<Producto> productos=(Vector<Producto>)sesion.getAttribute("productos");
        Usuario usuario=(Usuario)sesion.getAttribute("usuarioInicio");
        Vector<detallesventa> detalles = new Vector<detallesventa>();
        Producto p = new Producto();
        int userCodigo = 0;
        double totalproducto = 0;
        for(int i=0; i<carritoCompra.size(); i++){
            //Obtengo el producto que pedi por medio de mi Vector de Productos
            Producto prodTemp = carritoCompra.get(i).getProducto();
            //Actualizo el stock del producto
            int stockActualizado= (int)prodTemp.getStock() - carritoCompra.get(i).getCantidadPedida();
            prodTemp.setStock(stockActualizado);
            //Obtengo en que indice esta el elemento producto que voy actualizar
            int indiceActualizar= carritoCompra.get(i).getCodigo();
            //Remuevo ese elemento         
            productos.remove(indiceActualizar);
            //Y lo actualizo con la nueva informacion
            
            /* ----- AQUI ESTÁ ACTUALIZAR EL STOCK DE PRODUCTOS*/
            String nombre = prodTemp.getNombre();
            int precio = prodTemp.getPrecio();
            int codigo = prodTemp.getCodigo();
            System.out.println("---------------------------------------------------");
            p.update(nombre,precio,stockActualizado,codigo);
            /*----- AQUÍ ESTA EL INGRESO A LA TABLA VENTAS*/
            System.out.println("---------------------------------------------------");
            userCodigo = carritoCompra.get(i).getUsuario().getCodigo();
            double pro = carritoCompra.get(i).getSubTotal();
            totalproducto += pro;
            /*----- AQUI LOS DETALLES DE VENTAS */
            System.out.println("---------------------------------------------------");
            int prodCodigo = carritoCompra.get(i).getProducto().getCodigo();
            int prodCantidad = carritoCompra.get(i).getCantidadPedida();
            double subtotal = carritoCompra.get(i).getSubTotal();
            detalles.add(new detallesventa(0,i,prodCodigo,prodCantidad,subtotal));
            productos.add(indiceActualizar, prodTemp);
        }
        p.venta(userCodigo, totalproducto);
        int ventCodigo = p.idVenta();
        for(int n = 0; n < detalles.size();n++){
                p.detallesventa(ventCodigo, detalles.get(n).getDetventaItem(),detalles.get(n).getProdCodigo(),detalles.get(n).getDetventaCantidad(),detalles.get(n).getDetventaSubtotal());
            }
        sesion.setAttribute("productos", productos);
        sesion.removeAttribute("carrito");
        String nombre = usuario.getNombre() + " " + usuario.getApellido();
        PrintWriter out=response.getWriter();
        imprimarPagina(out, carritoCompra, nombre);   
        out.close();
    }


    public void imprimarPagina(PrintWriter out,Vector<Carrito> carr ,String nombre){
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
        out.println("<tr><td colspan=\"2\">Se registro su pedido</td></tr>");
        out.println("<tr bgcolor=\"#FF6600\" style=\"color: #FFFFFF\">");
        out.println("<td width=\"68%\"><h4>Nombre</h4></td>");
        out.println("<td width=\"16%\" align=\"right\" valign=\"top\"><h4><span class=\"Estilo3\">Stock</span></h4></td>");
        out.println("<td width=\"16%\" align=\"right\" valign=\"top\"><h4><span class=\"Estilo3\">Precio</span></h4></td>");
        out.println("</tr>");

        //Vamos a mostrar la lista de productos del vector de Productos

        for(int i=0; i<carr.size(); i++){

            if(i%2==0){
                out.println("<tr bgcolor=\"#184764\">");
                out.println("<td>" + carr.get(i).getProducto().getNombre() + "</td>");
                out.println("<td align=\"right\" valign=\"top\">"+ carr.get(i).getCantidadPedida() +"</td>");
                out.println("<td align=\"right\" valign=\"top\">"+ carr.get(i).getSubTotal() +"</td>");
                out.println("</tr>");
            }else{
                out.println("<tr>");
                out.println("<td>" + carr.get(i).getProducto().getNombre() + "</td>");
                out.println("<td align=\"right\" valign=\"top\">"+ carr.get(i).getCantidadPedida() +"</td>");
                out.println("<td align=\"right\" valign=\"top\">"+ carr.get(i).getSubTotal() +"</td>");
                out.println("</tr>");
            }
        }
        Producto p = new Producto();
        out.println("<tr bgcolor=\"#FF6600\">");
        out.println("   <td colspan='2'>TOTAL</td>");
        out.println("   <td align=\"right\" valign=\"top\">"+ p.totalVenta()+"</td>");
        out.println("<tr>");

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
    }

}
