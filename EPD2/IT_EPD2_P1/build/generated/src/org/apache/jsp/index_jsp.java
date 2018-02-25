package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 int visitas;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/Crisis.jsp");
    _jspx_dependants.add("/Corea.jsp");
    _jspx_dependants.add("/Panther.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Noticias P1 - EPD 2</title>\n");
      out.write("        ");


        
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Noticias P1 - EPD 2</h1>\n");
      out.write("        <form method=\"post\" action=\"#\">\n");
      out.write("                    \n");
      out.write("                    ");
 if (request.getParameter("ocultar1") != null && request.getParameter("ocultar1").equals("ocultar")) {
                    
      out.write("\n");
      out.write("                    <h3>Noticia1</h3>\n");
      out.write("                <br>\n");
      out.write("                    <p>Información no mostrada</p>\n");
      out.write("                    ");
 } else { 
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h3>Vuelven a recortar el infinito</h3>\n");
      out.write("        <p>Economistas del Centro Monetario Internacional y el Banco Central Europeo confirman que como resultado de la crisis hay que volver a recortar el infinito.</p>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                    <br>\n");
      out.write("                    Ocultar noticia: <input name=\"ocultar1\" type=\"radio\" value=\"ocultar\" /> Mostrar noticia: <input name=\"ocultar1\" type=\"radio\" value=\"mostrar\" />\n");
      out.write("                    <br>\n");
      out.write("                    ");
 if (request.getParameter("ocultar2") != null && request.getParameter("ocultar2").equals("ocultar")) {
                    
      out.write("\n");
      out.write("                    <h3>Noticia2</h3>\n");
      out.write("                <br>\n");
      out.write("                    <p>Información no mostrada</p>\n");
      out.write("                    ");
 } else { 
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h3>Corea del norte ataca la UPO</h3>\n");
      out.write("        <p>Corea del norte ataca con misiles la universidad de Pablo de Olavide. Únicamente los alumnos de ingeniería informática sobreviven.</p>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                    <br>\n");
      out.write("                    Ocultar noticia: <input name=\"ocultar2\" type=\"radio\" value=\"ocultar\" /> Mostrar noticia: <input name=\"ocultar2\" type=\"radio\" value=\"mostrar\" />\n");
      out.write("                    <br>\n");
      out.write("                    ");
 if (request.getParameter("ocultar3") != null && request.getParameter("ocultar3").equals("ocultar")) {
                    
      out.write("\n");
      out.write("                    <h3>Noticia3</h3>\n");
      out.write("                <br>\n");
      out.write("                    <p>Información no mostrada</p>\n");
      out.write("                    ");
 } else { 
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h3>Black Panther n&uacute;mero 1 en recaudaci&oacute;n</h3>\n");
      out.write("        <p>La pel&iacute;cula de Black Panther fue n&uacute;mero 1 en recaudaci&oacute;n en su primera semana</p>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                    <br>\n");
      out.write("                    Ocultar noticia: <input name=\"ocultar3\" type=\"radio\" value=\"ocultar\" /> Mostrar noticia: <input name=\"ocultar3\" type=\"radio\" value=\"mostrar\" />\n");
      out.write("                    <br>\n");
      out.write("                    \n");
      out.write("                    <input name=\"btnSub\" type=\"submit\" value=\"Confirmar\" />\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
