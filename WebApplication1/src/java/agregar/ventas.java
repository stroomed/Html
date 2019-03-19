
package agregar;

import venta.agregar;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ventas", urlPatterns = {"/venta.do"})
public class ventas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {

                String name = request.getParameter("txtname");
                String codigo = request.getParameter("txtcode");
                String precio = request.getParameter("txtprice");
                int code = Integer.parseInt(request.getParameter("txtcode"));
                double price = Double.parseDouble(request.getParameter("txtprice"));
                
                ArrayList error = new ArrayList();
// Validar nombre                
                if (name.trim().isEmpty()){                    
                    error.add("ERROR, debe ingresar un NOMBRE de producto.");
                }
// Validar codigo 
                if (codigo.trim().isEmpty()){                    
                    error.add("ERROR, debe ingresar un CODIGO de producto.");
                } 
                try {                   
                    if (code < 0) {                        
                        error.add("ERROR, el CODIGO debe ser mayor o igual a 0.");
                    }
                } catch (NumberFormatException e) {    
                    error.add("ERROR, el CODIGO debe ser un número.");
                }                             
// Validar precio                
                if (precio.trim().isEmpty()){                    
                    error.add("ERROR, debe ingresar un PRECIO de producto.");
                }
                try {             
                    if (price < 0) {                        
                        error.add("ERROR, el PRECIO debe ser mayor o igual a 0.");
                    }
                } catch (NumberFormatException e) {                    
                    error.add("ERROR, el PRECIO debe ser un número.");
                }                
// Agregar productos                
                if (error.isEmpty()){ 
                    
                    agregar a = new agregar (code, name, price);
                    ArrayList <agregar> prod = (ArrayList<agregar>)getServletContext().setAttribute("prod");
                    prod.add(a);
                    getServletContext().setAttribute("prod", prod);
                    request.setAttribute("", "Producto agregado");
                    System.out.println("");
                    
                } else {
                    
                    request.setAttribute("", error);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
                }
                
                request.getRequestDispatcher("index.jsp").forward(request, response);
                
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title> Agregar Producto </title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("");
                out.println("</body>");
                out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
