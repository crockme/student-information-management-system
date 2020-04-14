package UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.User;
import Util.Util;

public class UserDao {
	public ArrayList<User> getUser()
	{
		ArrayList<User> li = new ArrayList<>();
		Util util = new Util();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql ="select * from login";
				cn= util.getConnection();
				try {
					ps=cn.prepareStatement(sql);
					rs=ps.executeQuery();
					
					while(rs.next())
					{
						User user= new User();
						user.setName(rs.getString(2));
						user.setPassword(rs.getString(3));
						li.add(user);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					
				}
				return li;
				
						
	}

}
