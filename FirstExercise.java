import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class FirstExercise{
	
	public static void main(String []args) {
		
		try {
			Class.forName("org.postgresql.Driver");
			
			Connection db = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/mpara102", "mpara102", "*********"); 
			
			String field = "aname, dateOfBirth"; 
			String table = "laboratories.artist";
			
			Statement st = db.createStatement(); 
			ResultSet rs = st.executeQuery("SELECT " + field + " FROM " + table + ";");
			
			while (rs.next()) { 
				System.out.println(rs.getString(1) + "   " + rs.getString(2)); 
			} 
			
			rs.close(); 
			st.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
