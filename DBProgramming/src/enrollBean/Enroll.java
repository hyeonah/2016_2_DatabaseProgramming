package enrollBean;
public class Enroll
{
 public String c_id;
 public String m_id;
 public int c_id_no;
 public String c_name;
 public int c_unit;
 public int t_year;
 public int t_semester;
 public int t_max;
 public String c_type;
 public String t_time;
 public String t_date;
 public String t_where;
 
 public void setCId(String c_id) {
        this.c_id = c_id;
    }
 public void setCIdNo(int c_id_no) {
        this.c_id_no = c_id_no;
    }
 public void setCName(String c_name) {
        this.c_name = c_name;
    }
 public void setCUnit(int c_unit) {
     this.c_unit = c_unit;
 }
 public void setTWhere(String t_where) {
    this.t_where = t_where;
}
 public void setTTime(String t_time) {
    this.t_time = t_time;
}
 public void setTDate(String t_date) {
    this.t_date = t_date;
}
 public void setTYear(int t_year) {
     this.t_year = t_year;
 }
 public void setTSemester(int t_semester) {
     this.t_semester = t_semester;
 }
 public void setCType(String c_type) {
     this.c_type = c_type;
 }
 public void setTMax(int t_max) {
     this.t_max = t_max;
 }
 public void setMId(String m_id) {
     this.m_id = m_id;
 }
 public String getCId() {
    return c_id;
    }  
public int getCIdNo() {
     return c_id_no;
    }  
public String getCName() {
     return c_name;
    }  
public int getCUnit() {
     return c_unit;
    }
public String getCType() {
    return c_type;
   }
public int getTYear() {
    return t_year;
   }
public int getTSemester() {
    return t_semester;
   }
public int getTMax() {
    return t_max;
   }
public String getTWhere() {
   return t_where;
}
public String getTTime() {
   return t_time;
}
public String getTDate() {
   return t_date;
}
public String getMId() {
    return m_id;
    } 

} 