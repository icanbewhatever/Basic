package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
   
   // 필드
   // 생성자
   // 메서드: DB 관리( 1.DB연결 /2. DB 닫기)
   public static Connection getConnection() {
      Connection conn = null;
      try {
//         (1단계) JDBC 드라이버(클래스) 로드
         Class.forName("oracle.jdbc.OracleDriver");      //예외 발생 가능1
      
//         (2단계) 데이터베이스 연결 객체 생성
         // 데이터베이스 연결 정보
          String url = "jdbc:oracle:thin:@localhost:1521:orcl";
          String userid = "user_sam";
          String password = "1234";
          conn = DriverManager.getConnection(url, userid, password); //예외 발생 가능2
      } catch(Exception e) {
    	  e.printStackTrace();

         System.out.println("예외 발생시 처리할 코드 : DB 연결");
      }
      return conn;
   }
   
   // select 문
   public static void close(Connection conn,PreparedStatement pstmt, ResultSet rs ) {
        try {
            if(rs != null) {
               rs.close();
            }
            if(pstmt != null) {
               pstmt.close();
            }
            if(conn != null) {
               conn.close();
            }
         } catch (Exception e) {
           System.out.println();
         }
   }
   
   
   public static void close(Connection conn,PreparedStatement pstmt ) {
        try {
            if(pstmt != null) {
               pstmt.close();
            }
            if(conn != null) {
               conn.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
         
   }


}



