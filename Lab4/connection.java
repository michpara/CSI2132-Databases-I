import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class connection{

	public static void main(String []args) {
		
		try {
			Class.forName("org.postgresql.Driver");
			
			Connection db = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/mpara102", "mpara102", "*********"); 
			
			Statement st = db.createStatement(); 
			ResultSet rs = st.executeQuery("SELECT * FROM laboratories.artist");
				
			while (rs.next()) { 
				System.out.print("Column 1 returned: "); 
				System.out.println(rs.getString(1)); 
			} 
			
			rs.close(); 
			st.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}
