package UserDao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.print.attribute.standard.RequestingUserName;

import Bean.Student;
import Util.Util;

public class StudentDo {
	public ArrayList<Student>  getAllstu()
	{
		ArrayList<Student> list = new ArrayList<>();
		Util util = new Util();
		Connection cn= null;
		PreparedStatement ps=null;
		ResultSet rs= null;
		cn= util.getConnection();
		String sql = "select * from stu";
		try {
			ps=cn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Student s = new Student();
				s.setId(rs.getString(1));
				s.setName(new String(rs.getString(2).getBytes("ISO-8859-1"),"utf-8"));
				s.setAge(rs.getString(3));
				s.setSex(rs.getString(4));
				s.setGrad(new String(rs.getString(5).getBytes("ISO-8859-1"),"utf-8"));
				s.setAddress(new String(rs.getString(6).getBytes("ISO-8859-1"),"utf-8"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public int getCount()
	 {
		 StudentDo sd = new StudentDo();
		 int a = sd.getAllstu().size();
		 return a;
	 }
	
	public ArrayList<Student> getPage(int a,int b) {
		
		ArrayList<Student> list = new ArrayList<>();
		Util util = new Util();
		Connection cn= null;
		PreparedStatement ps=null;
		ResultSet rs= null;
		cn= util.getConnection();
		String sql = "select * from stu";
		try {
			
			
			ps=cn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				
				Student s = new Student();
				s.setId(rs.getString(1));
				s.setName(rs.getString(2));
				s.setAge(rs.getString(3));
				s.setSex(rs.getString(4));
				s.setGrad(rs.getString(5));
				s.setAddress(rs.getString(6));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return list;
	}
}


