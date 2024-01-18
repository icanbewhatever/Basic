/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.85
 * Generated at: 2024-01-15 05:38:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import utils.DBConfig;
import java.sql.*;

public final class loginpro2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("utils.DBConfig");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("    \r\n");
      out.write(" <!-- 다른경로의 자바파일호출 -->\r\n");
      out.write("  <!-- 오라클 쿼리를 동작하기 위한 라이브러리 호출 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<h2>사용자 인증 처리</h2>\r\n");
      out.write("	\r\n");
      out.write("	");

		int empid = Integer.parseInt(request.getParameter("employeeId")); //loginform에 작성된 name 값 넣어주기
		String userpw = request.getParameter("userPw");
		
		Connection connection = null; //디비 접속 성공시 접속 정보 저장
		PreparedStatement pstmt = null; //쿼리를 실행하는 객체 정보
		ResultSet resultSet = null;		//select 결과를 저장하는 정보
		
		//오라클 데이터베이스 접속
		try{
			connection = DBConfig.getConnection(); //주의 : 위에 null 이기 때문에 꼭 connection = 을 넣어 접속 성공시 접속 정보 저장 
			out.println("접속성공");
		}catch(Exception se){
			out.println("실패");
		}
		
		//아이디 비번 체크 코드
		
		int dbid;
		String dbpw;
	
		try{
			String sql = "SELECT EMPLOYEE_ID, USER_PW FROM EMPLOYEES WHERE EMPLOYEE_ID =?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, Integer.valueOf(empid));  //문자를 숫자로 바꿔준다 js에서는 parse
			//pstmt.setString(2, userpw);
			resultSet = pstmt.executeQuery(); // executeQuery: select 일 때 executeUpdate: insert, delete, update
			
			dbid = 0;
			dbpw = "";
			while(resultSet.next()){
				dbid = resultSet.getInt("EMPLOYEE_ID");
				dbpw = resultSet.getString("USER_PW");
				out.println("결과 result:" + dbid); //1이면 아이디 비번 존재, 0이면 존재하지 않음
				out.println("결과 result2:" + dbpw); //1이면 아이디 비번 존재, 0이면 존재하지 않음
			}
			if(dbid == empid && dbpw.equals(userpw)){ //로그인 성공시 -> main.jsp 로 이동
				out.println("<script>alert('로그인성공!!')</script>");
				out.println("<script>location.href = 'main.jsp'</script>");
			}else{ //로그인 실패시 -> loginform.jsp 로 이동
				//out.println("<script>location.href = 'loginform.jsp'</script>");
			}
		}catch(SQLException se){
			out.println("에러로그: " + se.getMessage());
		}
			//if(result == 1){ //로그인 성공시 -> main.jsp 로 이동
			//	out.println("<script>location.href = 'main.jsp'</script>");
			//}else{ //로그인 실패시 -> loginform.jsp 로 이동
			//	out.println("<script>location.href = 'loginform.jsp'</script>");
			//}
			
		
		
	
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
