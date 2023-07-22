package controller.dbconnection;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.xml.crypto.Data;

import model.PasswordEncryptionWithAes;
import model.product_detail;
import model.Customer;
import resources.MyConstants;

public class DbConnection {
	
	public Connection getConnection(){
		try {
			Class.forName(MyConstants.DRIVER_NAME);
			Connection connection = DriverManager.getConnection(
					MyConstants.DB_URL,
					MyConstants.DB_USER_NAME,
					MyConstants.DB_USER_PASSWORD);
			return connection;
		}catch(SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	//	Start region Read operation
	public List<Customer> getAllData(String query) {
        List<Customer> dataList = new ArrayList();
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
	            Statement stmt = dbConnection.createStatement();
	            ResultSet rs = stmt.executeQuery(query);
	            while (rs.next()) {
	            	Customer data = new Customer();
	                data.setname(rs.getString("name"));
	                data.setusername(rs.getString("username"));
	                data.setCotanct_number(rs.getString("contact_number"));
	                data.setPassword(rs.getString("password"));
	                data.setRole(rs.getString("role"));
	        
	                dataList.add(data);
	            }
	            rs.close();
	            stmt.close();
	            dbConnection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
        return dataList;
	}
	
	public ResultSet selectWhereQuery(String query, String id) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, id);
				ResultSet result = statement.executeQuery();
				return result;
			} catch (SQLException e) {
				return null;
			}
		}else {
			return null;
		}
	}

	public Boolean isUserAlreadyRegistered(String username) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(MyConstants.CHECK_LOGIN_INFO);
				statement.setString(1, username);
				ResultSet result = statement.executeQuery();
				if(result.next()) {
					return true;		
				}else return false;
			} catch (SQLException e) { return null; }
		}else { return null; }
						
	}
	
	public Boolean isUserRegistered(String query, String username, String password) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, username);
				ResultSet result = statement.executeQuery();
				if(result.next()) {
					String userDb = result.getString("username");
					String passwordDb  = result.getString("password");
					String decryptedPwd = PasswordEncryptionWithAes.decrypt(passwordDb, username);
					if(decryptedPwd!=null && userDb.equals(username) && decryptedPwd.equals(password)) 
						return true;
					else return false;
				}else return false;
			} catch (SQLException e) { return null; }
		}else { return null; }
	}
		
	public int isAdmin(String username) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(MyConstants.IS_USER);
				statement.setString(1, username);
				statement.setString(2, "admin");

				ResultSet result = statement.executeQuery();
				if(result.next()) {
					return 1;
				}
				else return 0;
			} catch (SQLException e) { return -2; }
		}else { 
			return -3; 
			}
	}
	//	End region Read operation

	//	Start region Create operation
	public int registerUser(String query, Customer userModel) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				if(isUserAlreadyRegistered(userModel.getusername())) 
					return -1;
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, userModel.getname());
				statement.setString(2, userModel.getusername());
				statement.setString(3, userModel.getCotanct_number());
				statement.setString(4, PasswordEncryptionWithAes.encrypt(
						userModel.getusername(), userModel.getPassword()));
				statement.setString(5, userModel.getRole());
				statement.setString(6, userModel.getImageUrlFromPart());

				int result = statement.executeUpdate();
				if(result>=0) 
					return 1;
				else return 0;
			} catch (Exception e) { 
				return -2; }
		}else { 
			return -3; }
	}
	//	End region Create operation
	
	//	Start region Update operation
	public Boolean updateUser(String query, String username) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, username);
				int result = statement.executeUpdate();
				if(result>=0)
					return true;
				else 
					return false;
			} catch (SQLException e) { 
				return null; 
				}
		}else { 
			return null; }
	}
	//	End region Update operation
	
	//	Start region Delete operation
	public Boolean deleteUser(String query, String username) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, username);
				int result = statement.executeUpdate();
				if(result>=0)return true;
				else return false;
			} catch (SQLException e) { return null; }
		}else { return null; }
	}
	
	//	End region Delete operation
	public List<product_detail> getALLPRODUCT(String query) {
        List<product_detail> dataList1 = new ArrayList();
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
	            Statement stmt = dbConnection.createStatement();
	            ResultSet rs = stmt.executeQuery(query);
	            while (rs.next()) {
	            	product_detail data = new product_detail();
	                data.setProduct_name(rs.getString("product_name"));
	                data.setCost(rs.getString("cost"));
	                data.setBrand(rs.getString("brand"));
	                data.setDescription(rs.getString("description"));
	                data.setProduct_category(rs.getString("product_category"));
	                data.setCloth(rs.getString("cloth"));
	                data.setQuantity(rs.getString("quantity"));
	        
	                dataList1.add(data);
	            }
	            rs.close();
	            stmt.close();
	            dbConnection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
        return dataList1;
	}
	
	public int insertProduct(String query, product_detail producta) {
		Connection dbConnection1 = getConnection();
			try {	
				PreparedStatement istatement = dbConnection1.prepareStatement(query);
				istatement.setString(1, producta.getProduct_name());
				istatement.setString(2, producta.getCost());
				istatement.setString(3, producta.getBrand());
				istatement.setString(4, producta.getDescription());
				istatement.setString(5, producta.getProduct_category());
				istatement.setString(6, producta.getCloth());
				istatement.setString(7, producta.getQuantity());
				istatement.setString(8, producta.getImageUrlFromPart());
				int result1 = istatement.executeUpdate();
				if(result1>=0) {
					return 1;
				}
				else {
					return 0;
				}
			} catch (Exception e) { 
				return -2; 
				}
			}
	
	public int updateCus(String query, Customer userModel) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				if(isUserAlreadyRegistered(userModel.getusername())) 
					return -1;
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, userModel.getname());
				statement.setString(2, userModel.getusername());
				statement.setString(3, userModel.getCotanct_number());
				statement.setString(4, PasswordEncryptionWithAes.encrypt(
						userModel.getusername(), userModel.getPassword()));
				statement.setString(5, userModel.getRole());
				statement.setString(6, userModel.getImageUrlFromPart());

				int result = statement.executeUpdate();
				if(result>=0) 
					return 1;
				else return 0;
			} catch (Exception e) { 
				return -2; }
		}else { 
			return -3; }
	}
	
	public Boolean deleteProduct(String query, String product_name) {
		Connection dbConnection = getConnection();
		if(dbConnection != null) {
			try {
				PreparedStatement statement = dbConnection.prepareStatement(query);
				statement.setString(1, product_name);
				int result = statement.executeUpdate();
				System.out.println("puggvgh");
				if(result>=0) {
					return true;
				}
				else {
					return false;
				}
			} catch (SQLException e) { return null; }
		}else { return null; }
	}
		
}
