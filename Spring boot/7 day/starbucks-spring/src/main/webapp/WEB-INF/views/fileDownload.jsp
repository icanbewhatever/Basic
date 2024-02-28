<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*, java.io.*, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
//한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String fileName = request.getParameter("filename");
	String fileNameEncoding = URLEncoder.encode(fileName, "utf-8");	// encode 한글처리
	
	String savePath = "C:\\SpringBoot\\starbucks-spring\\src\\main\\resources\\static\\upload-files";
	File file = new File(savePath + "\\" + fileName);

	// File 다운로드 처리 Header설정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment;filename=" + fileNameEncoding + ";");

	
	// out객체 초기화
	out.clear();
	pageContext.pushBody();
	
	BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
	
	int read = 0;
	byte b[] = new byte[1024 * 4];
	while ((read = fin.read(b)) != -1) {
		outs.write(b, 0, read);
	}
	outs.flush();
	outs.close();
	fin.close();
%>