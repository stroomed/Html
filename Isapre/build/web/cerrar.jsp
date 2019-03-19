
        <%
//response.setHeader("Content-Type","text/html;charset=windows-1252");
//response.setHeader("Pragma", "no-cache");
//response.setHeader("Expires", "Mon,30 Jan 2017 00:00:01 GMT");
//response.setHeader("Cache-Control", "no-store");
//response.setHeader("Cache-Control", "must-revalidate");
//response.setHeader("Cache-Control", "no-cache");

//        HttpSession actual=request.getSession(true);
 //       String id=actual.getId();
//        String nombre=(String)actual.getAttribute("user");
//        
//        if(actual.isNew()){
//          response.sendRedirect("login.jsp");
//          return;
//        }
//        
//        if(actual==null){
//        response.sendRedirect("login.jsp");
//        }else {
//          if(actual.getAttribute("user")==null){
//            response.sendRedirect("login.jsp");
//          }
//        }

//response.setContentType("text/html");
//response.setHeader("Cache-Control", "no-cache");
//response.setHeader("Cache-Control", "no-store");
//response.setHeader("Expires", "0");
//response.setHeader("Pragma", "no-cache");            
                
//        request.getSession().removeAttribute("user");
        session.invalidate();
        response.sendRedirect("login.html");
        %>
        