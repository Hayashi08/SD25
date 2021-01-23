package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class top_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<html lang=\"ja\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <title>ããããã¼ã¸</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../static/css/bootstrap.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../static/css/common.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container-fluid\">\r\n");
      out.write("            <div class=\"p-3\">\r\n");
      out.write("                <div class=\"col p-4 main\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"offset-1 main_title\">\r\n");
      out.write("                            ã¾ããå \r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"row mt-3 mx-4\">\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"FrontController?class_name=situation.TopAction\">ããããã¼ã¸</a>\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"../view/user/top.html\">ä¼å¡ç®¡ç</a>\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"../view/floor/top.html\">ãã­ã¢ç®¡ç</a>\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"../view/stock/top.html\">å¨åº«ç®¡ç</a>\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"../view/order/top.html\">æ³¨æç®¡ç</a>\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"../view/analyse/top.html\">å£²ä¸åæ</a>\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"../view/employee/top.html\">å¾æ¥­å¡ç®¡ç</a>\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"../view/service/top.html\">ä¼å¡ãµã¼ãã¹</a>\r\n");
      out.write("                        <a class=\"col-1 p-1 menu_title\" href=\"../view/login/logout_confirm.html\">ã­ã°ã¢ã¦ã</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"text-center my-3 col main_title\">\r\n");
      out.write("                    ããããã¼ã¸\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"main col-10 mx-auto\">\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"row mt-3 mx-5\">\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-light\"><h1>101</h1></div>\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-primary\"><h1>102</h1></div>\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-primary\"><h1>103</h1></div>\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-light\"><h1>104</h1></div>\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-primary\"><h1>105</h1></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"row mb-5 mx-5\">\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-light\"><h1>106</h1></div>\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-primary\"><h1>107</h1></div>\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-primary\"><h1>108</h1></div>\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-primary\"><h1>109</h1></div>\r\n");
      out.write("                        <div class=\"col border p-3 text-center bg-light\"><h1>110</h1></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"row mx-5 my-3\">\r\n");
      out.write("                        <a class=\" col p-3 mx-3 btn btn-danger\" href=\"situation/reception_auth.html\" role=\"button\">\r\n");
      out.write("                            <h1 class=\"text-white\">å©ç¨åä»</h1>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a class=\" col p-3 mx-3 btn btn-success\" href=\"situation/liquidation.html\" role=\"button\">\r\n");
      out.write("                            <h1 class=\"text-white\">æ¸ç®</h1>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"row mx-5 my-3\">\r\n");
      out.write("                        <a class=\"col p-3 mx-3 btn btn-warning\" href=\"situation/book_auth.html\" role=\"button\">\r\n");
      out.write("                            <h1 class=\"text-white\">äºç´ç»é²</h1>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a class=\"col p-3 mx-3 btn btn-info\" href=\"situation/reception_list.html\" role=\"button\">\r\n");
      out.write("                            <h1 class=\"text-white\">å©ç¨æå ±ä¸è¦§</h1>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a class=\"col p-3 mx-3 btn btn-info\" href=\"situation/book_list.html\" role=\"button\">\r\n");
      out.write("                            <h1 class=\"text-white\">äºç´æå ±ä¸è¦§</h1>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
