package enrollBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import enrollBean.*;
public class EnrollMgr {
 
 private OracleConnectionPoolDataSource ocpds = null;
 private PooledConnection pool = null;
 
 	public EnrollMgr() {
 		try{
 			// Create a OracleConnectionPoolDataSource instance
 			ocpds = new OracleConnectionPoolDataSource();
 			// Set connection parameters
 			ocpds.setURL("jdbc:oracle:thin:@localhost:1521:orcl");
 			ocpds.setUser("db01");
 			ocpds.setPassword("ss2");
 			// Create a pooled connection
 			pool  = ocpds.getPooledConnection();
 		}catch(Exception e){
 			System.out.println("Error : 커넥션 얻어오기 실패");
 		}
 	}
 
 
    public Vector getEnrollList(String s_id) {
    	Connection conn = null;
    	PreparedStatement pstmt = null; 
    	CallableStatement cstmt1 = null;
    	CallableStatement cstmt2 = null;
    	ResultSet rs = null;
    	Enroll en = null;
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
   
    String mySQL = "select t.c_id cid, t.c_id_no cidno, c.c_name cname, c.c_unit cunit, t.t_year tyear, t.t_semester tsemester, c.c_type ctype from course c, teach t where c.c_id in (select e.c_id from enroll e where e.s_id=? and e.t_year=? and e.t_semester=?)";
    pstmt = conn.prepareStatement(mySQL);
    pstmt.setString(1,s_id);
    pstmt.setInt(2, nYear);
    pstmt.setInt(3, nSemester);
   
    rs = pstmt.executeQuery();  
    while (rs.next()) {
    	en = new Enroll();
    	en.setCId(rs.getString("cid"));
        en.setCIdNo(rs.getInt("cidno"));
        en.setCName(rs.getString("cname"));
        en.setCUnit(rs.getInt("cunit"));   
        en.setTYear(rs.getInt("tyear")); 
        en.setTSemester(rs.getInt("tsemester")); 
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
    public Vector getEnrollListmajor(String s_id, String c_type) {
    	Connection conn = null;
    	PreparedStatement pstmt = null; 
    	CallableStatement cstmt1 = null;
    	CallableStatement cstmt2 = null;
    	ResultSet rs = null;
    	Enroll en = null;
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
   
    String mySQL = "select t.c_id cid, t.c_id_no cidno, c.c_name cname, c.c_unit cunit, t.t_year tyear, t.t_semester tsemester, c.c_type ctype from course c, teach t where c.c_id in (select e.c_id from enroll e where e.s_id=?)";
    pstmt = conn.prepareStatement(mySQL);
    pstmt.setString(1,s_id);

    
    rs = pstmt.executeQuery();  
    while (rs.next()) {
    	if(rs.getString("ctype").equals(c_type)){
    	en = new Enroll();
    	en.setCId(rs.getString("cid"));
        en.setCIdNo(rs.getInt("cidno"));
        en.setCName(rs.getString("cname"));
        en.setCUnit(rs.getInt("cunit"));   
        en.setTYear(rs.getInt("tyear")); 
        en.setTSemester(rs.getInt("tsemester")); 
        en.setCType(rs.getString("ctype")); 
        vecList.add(en);
    	}
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

  public Vector getEnrollList(String s_id, int nYear, int nSemester) {
    Connection conn = null;
    PreparedStatement pstmt = null;    
    ResultSet rs = null;
    Vector vecList = new Vector();    
    
       try { 
       conn = pool.getConnection();   
    String mySQL = "select c.c_id cid ,t.c_id_no cidno,c.c_name cname,c.c_unit cunit, c.c_type ctype, t.t_date tdate, t.t_time ttime, t.t_where twhere from course c, teach t where c.c_id in (select e.c_id from enroll e where e.s_id=? and e.t_year=? and e.t_semester=?)";
    pstmt = conn.prepareStatement(mySQL);
    pstmt.setString(1,s_id);
    pstmt.setInt(2, nYear);
    pstmt.setInt(3, nSemester);
    rs = pstmt.executeQuery();  
    if(rs!=null){
    	System.out.println("있음");
    	while (rs.next()) {
    	Enroll en = new Enroll();
    	//System.out.println(rs.getString("c.c_id"));
    	en.setCId(rs.getString("cid"));
    	en.setCIdNo(rs.getInt("cidno"));
    	en.setCName(rs.getString("cname"));
    	en.setCUnit(rs.getInt("cunit"));   
    	en.setCType(rs.getString("ctype"));
    	en.setTDate(rs.getString("tdate")); 
        en.setTTime(rs.getString("ttime")); 
        en.setTWhere(rs.getString("twhere"));
    	vecList.add(en);
    	
    	} 
    }
    else{
    	System.out.println("없음");
    }
    if(pstmt!=null){
    	try{
    		pstmt.close();
    	}catch (Exception ex) {
        	System.out.println("Exception" + ex);
        }
    }
    if(conn!=null){
    	try{
    		conn.close();
    	}catch (Exception ex) {
        	System.out.println("Exception" + ex);
        }
    }
    
    } catch (Exception ex) {
    	System.out.println("Exception" + ex);
    }
       return vecList;
  }
  
  public int getGraduateList(String s_id) {
	  
	  Connection conn = null;
	  PreparedStatement pstmt = null;    
	  ResultSet rs = null;
	  
	  int num=0;
	  try {
		  conn = pool.getConnection();   
		  String mySQL = "select m.m_standardcredit standardcredit from major m,student s where s.s_id=? and m.m_id=s.m_id";
		    pstmt = conn.prepareStatement(mySQL);
		    pstmt.setString(1,s_id);
		    rs = pstmt.executeQuery();  
		    if(rs!=null){
		    	while (rs.next()) {   	
		    		num = rs.getInt("standardcredit");      	
		    	}
		    }
	  } catch (Exception ex) {
	    	System.out.println("Exception" + ex);
	  }
	  return num;
  }
  
  public String getName(String s_id) {
	  String name = null;
	  
	  Connection conn = null;
	  PreparedStatement pstmt = null;    
	  ResultSet rs = null;
	  
	  try {
		  conn = pool.getConnection();   
		  String mySQL = "select s.s_name sname from student s where s.s_id=?";
		    pstmt = conn.prepareStatement(mySQL);
		    pstmt.setString(1,s_id);
		    rs = pstmt.executeQuery();  
		    if(rs!=null){
		    	while (rs.next()) {   	
		    		name = rs.getString("sname");      	
		    	}
		    }
	  } catch (Exception ex) {
	    	System.out.println("Exception" + ex);
	  }
	  
	  return name;
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

 public void deleteEnroll(String s_id, String c_id, int c_id_no) {
	 System.out.println(s_id);
	 System.out.println(c_id);
	 System.out.println(c_id_no);
    Connection conn = null;
    PreparedStatement pstmt = null; 
    int n=0;
    //String result ="";
    try {
          conn = pool.getConnection();
          String mySQL = "delete from enroll where s_id=? and c_id=? and c_id_no=?";
          pstmt = conn.prepareStatement(mySQL);
          pstmt.setString(1,s_id);
          pstmt.setString(2, c_id);
          pstmt.setInt(3, c_id_no);
          n= pstmt.executeUpdate();
          System.out.println(n);
    pstmt.close();
    conn.close();
    //result = n;
    
    } catch (Exception ex) {
          System.out.println("Exception" + ex);
    }

 }
 }