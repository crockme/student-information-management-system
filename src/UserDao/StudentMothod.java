package UserDao;

import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Out;

import Bean.Student;
import Util.Util;

public class StudentMothod {

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

    public boolean add(Student us) throws SQLException
    {
    	Util util = new Util();
    	
    	String sex = us.getSex();
    	conn = util.getConnection();
    	try {
    		 
    		String a=new String(us.getName().getBytes("ISO-8859-1"),"utf-8");
    		String b=new String(us.getGrad().getBytes("ISO-8859-1"),"utf-8");
    		String c=new String(us.getAddress().getBytes("ISO-8859-1"),"utf-8");
			stmt=conn.prepareStatement("insert into stu values(?,?,?,?,?,?)");
			 stmt.setString(1,us.getId());
		        stmt.setString(2,a);
		        stmt.setString(3,us.getAge());
		        stmt.setString(4,sex);
		        stmt.setString(5,b);
		        stmt.setString(6,c);
		        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
    	int re = stmt.executeUpdate();
        if(re != 0)
        {
        	return true;
        }
        else
        {
        	
        	return false;
        }	
    	
       

    }

 public int delete(String id)
 {
	 int re=0;
	 Util util = new Util();
	 conn = util.getConnection();
	 try {
	 stmt=conn.prepareStatement("delete from stu where id = ?");
	    stmt.setString(1,id);
	   
		   re =stmt.executeUpdate();
			System.out.println(re);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 return re;
 }
 
 public boolean update(Student us)
 {
	 int re=0;
	 String sex = us.getSex();
	 System.out.println(sex);
	 Util util = new Util();
	 conn = util.getConnection();
	 String a;
	try {
		a = new String(us.getId().getBytes("ISO-8859-1"),"utf-8");
		String b = new String(us.getName().getBytes("ISO-8859-1"),"utf-8");
		 
		 String c = new String(us.getGrad().getBytes("ISO-8859-1"),"utf-8");
		 String d = new String(us.getAddress().getBytes("ISO-8859-1"),"utf-8");
		 try {
				stmt=conn.prepareStatement("update  stu set name=?,age =?,sex =?,grad =?,address =? where id = ?");
				
				stmt.setString(1,b);
				    stmt.setString(2,us.getAge());
				    stmt.setString(3,sex);
				    stmt.setString(4,c);
				    stmt.setString(5,d);
				    stmt.setString(6,a);
				     re = stmt.executeUpdate();
				    
				    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	} catch (UnsupportedEncodingException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	 
	 
	 
 
	   
		if(re!=0)
		{
			return true;
		}
		else
			return false;
	   
 }
 
  public Student select(String id)
    {
	 Util util = new Util();
	 conn = util.getConnection();
    	Student s= new Student();
    	try {
			stmt=conn.prepareStatement("select * from stu where id = ?");
			
			stmt.setString(1,id);
			

			rs=stmt.executeQuery();
			System.out.println(rs.next());
			s.setId(new String(rs.getString(1).getBytes("ISO-8859-1"),"utf-8"));
	        s.setName(new String(rs.getString(2).getBytes("ISO-8859-1"),"utf-8"));
	        s.setAge(new String(rs.getString(3).getBytes("ISO-8859-1"),"utf-8"));
	        s.setSex(new String(rs.getString(4).getBytes("ISO-8859-1"),"utf-8"));
	        s.setGrad(new String(rs.getString(5).getBytes("ISO-8859-1"),"utf-8"));
	        s.setAddress(new String(rs.getString(6).getBytes("ISO-8859-1"),"utf-8"));
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        	
    	return s;
        
    }

 public ArrayList<Student> selectAll(String name)
 {
	 ArrayList<Student> sList  = new ArrayList<>();
	 Util util = new Util();
	 conn = util.getConnection();
 	try {
			stmt=conn.prepareStatement("select * from stu where name = ?");
			stmt.setString(1,name);
			rs=stmt.executeQuery();			
			while(rs.next()){
			Student s= new Student();
			s.setId(new String(rs.getString(1).getBytes("ISO-8859-1"),"utf-8"));
	        s.setName(new String(rs.getString(2).getBytes("ISO-8859-1"),"utf-8"));
	        s.setAge(new String(rs.getString(3).getBytes("ISO-8859-1"),"utf-8"));
	        s.setSex(new String(rs.getString(4).getBytes("ISO-8859-1"),"utf-8"));
	        s.setGrad(new String(rs.getString(5).getBytes("ISO-8859-1"),"utf-8"));
	        s.setAddress(new String(rs.getString(6).getBytes("ISO-8859-1"),"utf-8"));
	        System.out.print(name);
	        sList.add(s);
		}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 	
     	
 	return sList;
     
 }
 public ArrayList<Student> getSname(String sname){
		ArrayList<Student> stuList = new ArrayList<Student>();
		
		Util util = new Util();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = util.getConnection();
		String sql = "select * from stu where name= ?";
		try {
			
			ps = conn.prepareStatement(sql);			
			ps.setString(1, sname);
			rs = ps.executeQuery();
			while(rs.next()){
				Student stu = new Student();
				stu.setId(rs.getString("id"));
				stu.setName(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setAge(rs.getString("age"));
				stu.setAddress(rs.getString("address"));
				stu.setGrad(rs.getString("grad"));
				stuList.add(stu);				
			}
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		return stuList;		
	}

 
}
