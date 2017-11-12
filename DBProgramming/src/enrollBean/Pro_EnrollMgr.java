package enrollBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import enrollBean.*;

public class Pro_EnrollMgr {

   private OracleConnectionPoolDataSource ocpds = null;
   private PooledConnection pool = null;

   public Pro_EnrollMgr() {
     try{
      ocpds = new OracleConnectionPoolDataSource();
      ocpds.setURL("jdbc:oracle:thin:@localhost:1521:orcl");
      ocpds.setUser("db01");
      ocpds.setPassword("ss2");
       pool  = ocpds.getPooledConnection();
       }catch(Exception e){
          System.out.println("Error : 커넥션 얻어오기 실패");
       }
    }
   public Vector getInsertList() {
	      Connection conn = null;
	      PreparedStatement pstmt = null;   
	      CallableStatement cstmt1 = null;
	      CallableStatement cstmt2 = null;
	      ResultSet rs = null;
	      Vector vecList = new Vector();      
	      
	       try {      
	        conn = pool.getConnection();

	        cstmt1 = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
	        cstmt1.registerOutParameter(1, java.sql.Types.INTEGER);
	          cstmt1.execute();
	        int nYear = cstmt1.getInt(1);
	       
	        cstmt2 = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
	        cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
	        cstmt2.execute();
	        int nSemester = cstmt2.getInt(1);
	        

	        String mySQL = "select c.c_id cid, c.c_unit cunit, c.c_name cname, c.m_id mid, c.c_type ctype from course c ";
	        pstmt = conn.prepareStatement(mySQL);
	        rs = pstmt.executeQuery();       

	        while (rs.next()) {
	          Enroll en = new Enroll();
	          en.setCId(rs.getString("cid"));
	          en.setCUnit(rs.getInt("cunit"));
	          en.setCName(rs.getString("cname"));
	          en.setMId(rs.getString("mid"));
	          en.setCType(rs.getString("ctype"));  
	          vecList.add(en);
	        }
		cstmt1.close();
	        cstmt2.close();
	        pstmt.close();
	        conn.close();

	       } catch (Exception ex) {
	          System.out.println("Exception" + ex);
	       } 
	     
	       return vecList;
	    }
 
    public Vector getEnrollList(String p_id) {
      Connection conn = null;
      PreparedStatement pstmt = null;   
      CallableStatement cstmt1 = null;
      CallableStatement cstmt2 = null;
      ResultSet rs = null;
      Vector vecList = new Vector();      
      
       try {      
        conn = pool.getConnection();

        cstmt1 = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
        cstmt1.registerOutParameter(1, java.sql.Types.INTEGER);
          cstmt1.execute();
        int nYear = cstmt1.getInt(1);
       
        cstmt2 = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
        cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
        cstmt2.execute();
        int nSemester = cstmt2.getInt(1);
        

        String mySQL = "select t.c_id cid, t.c_id_no cidno, c.c_name cname, c.c_unit cunit, c.c_type ctype from teach t, course c where t.p_id=? and t.t_year=? and t.t_semester=? and t.c_id=c.c_id and t.c_id_no=t.c_id_no";
        pstmt = conn.prepareStatement(mySQL);
        pstmt.setString(1,p_id);
        pstmt.setInt(2, nYear);
        pstmt.setInt(3, nSemester);
        rs = pstmt.executeQuery();       

        while (rs.next()) {
          Enroll en = new Enroll();
          en.setCId(rs.getString("cid"));
          en.setCIdNo(rs.getInt("cidno"));
          en.setCName(rs.getString("cname"));
          en.setCUnit(rs.getInt("cunit"));   
          en.setCType(rs.getString("ctype"));  
          vecList.add(en);
        }
	cstmt1.close();
        cstmt2.close();
        pstmt.close();
        conn.close();

       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } 
     
       return vecList;
    }


    public Vector getEnrollList(String p_id, int nYear, int nSemester) {
      Connection conn = null;
      PreparedStatement pstmt = null;        
      ResultSet rs = null;
      Vector vecList = new Vector();      
      
       try {   
         conn = pool.getConnection();        

        String   mySQL = "select c.c_id cid, t.c_id_no cidno, c.c_name cname, c.c_unit cunit, t.t_max tmax, t.t_date tdate, t.t_time ttime, t.t_where twhere from teach t, course c where t.p_id=? and t.t_year=? and t.t_semester=? and t.c_id=c.c_id and t.c_id_no=t.c_id_no";
        pstmt = conn.prepareStatement(mySQL);
        pstmt.setString(1,p_id);
        pstmt.setInt(2, nYear);
        pstmt.setInt(3, nSemester);
        rs = pstmt.executeQuery();       

        while (rs.next()) {
          Enroll en = new Enroll();
          en.setCId(rs.getString("cid"));
          en.setCIdNo(rs.getInt("cidno"));
          en.setCName(rs.getString("cname"));
          en.setCUnit(rs.getInt("cunit"));   
          en.setTMax(rs.getInt("tmax"));
          en.setTDate(rs.getString("tdate"));
          en.setTTime(rs.getString("ttime"));
          en.setTWhere(rs.getString("twhere"));
          vecList.add(en);
          }       
        pstmt.close();
        conn.close();
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       }

       return vecList;
    }

   public int getCurrentYear()
   {
       int nYear=0;
        Connection conn = null;     
      CallableStatement cstmt = null;

      try {
          conn = pool.getConnection();

        cstmt = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
        cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
          cstmt.execute();
        nYear = cstmt.getInt(1);

        cstmt.close();
        conn.close();
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       }

      return nYear;
   }

   public int getCurrentSemester()
   {
       int nSemester=0;
        Connection conn = null;     
      CallableStatement cstmt = null;

      try {
          conn = pool.getConnection();

        cstmt = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
        cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
          cstmt.execute();
        nSemester = cstmt.getInt(1);

        cstmt.close();        
        conn.close();
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       }

      return nSemester;
   }
  
   
   public void deleteEnroll(String p_id, String c_id, int c_id_no) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;	   	    
	   
	   try {
	          conn = pool.getConnection();
			  String enrollsql = "delete from enroll where c_id=? and c_id_no=?";
			  pstmt = conn.prepareStatement(enrollsql);
			  pstmt.setString(1, c_id);
			  pstmt.setInt(2, c_id_no);
			  pstmt.executeUpdate();
			  
			  pstmt.close();
			  conn.close();
			  deleteEnroll2(p_id, c_id, c_id_no);
		   } catch (Exception ex) {
	          System.out.println("Exception" + ex);
	       }
		}
	   
   public void deleteEnroll2(String p_id, String c_id, int c_id_no) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;	   	    
	   
	   try {
	          conn = pool.getConnection();
			  String	mySQL = "delete from teach where p_id=? and c_id=? and c_id_no=?";
			  pstmt = conn.prepareStatement(mySQL);
			  pstmt.setString(1,p_id);
			  pstmt.setString(2, c_id);
			  pstmt.setInt(3, c_id_no);
			  pstmt.executeUpdate();
			  
			 

			  pstmt.close();
			  conn.close();
		   } catch (Exception ex) {
	          System.out.println("Exception" + ex);
	       }
}
   
	/*public void deleteCourse(String p_id, String c_id, int c_id_no) {
		   Connection conn = null;
		   PreparedStatement pstmt = null;	   	    
		   
	       try {
	          conn = pool.getConnection();
			  String sql = "delete from course where c_id =? and c_id_no=?";
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, c_id);
			  pstmt.setInt(2, c_id_no);
			  pstmt.executeUpdate();
			  
			  

			  pstmt.close();
			  conn.close();
		
		   } catch (Exception ex) {
	          System.out.println("Exception" + ex);
	       }
		}*/
	
   
   public String getName(String p_id) {
        String name = null;
        Connection conn = null;
        PreparedStatement pstmt = null;    
        ResultSet rs = null;
        
        try {
           conn = pool.getConnection();   
           String mySQL = "select p.p_name pname from professor p where p.p_id=?";
           pstmt = conn.prepareStatement(mySQL);
           pstmt.setString(1,p_id);
             rs = pstmt.executeQuery();  
             if(rs!=null){
                while (rs.next()) {      
                   name = rs.getString("pname");         
                }
             }
        } catch (Exception ex) {
             System.out.println("Exception" + ex);
        }
        
        return name;
    }
   
}