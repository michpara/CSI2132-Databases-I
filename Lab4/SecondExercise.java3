import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class SecondExercise{
	
	public static void main(String []args) {
		
		try {
			
			String[] fields = {"AName", "Style"};
			
			Class.forName("org.postgresql.Driver");
			
			Connection db = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/mpara102", "mpara102", "*********"); 
			
			String table = "laboratories.artist"; 
			Statement st = db.createStatement();
			
			String query = "SELECT ";
			
			int i = 0;
			for(;i < fields.length-1; i++) {
				query+=fields[i] + ", ";
			}
			
			query+=fields[i] + " FROM " + table + ";";

			ResultSet rs = st.executeQuery(query);
			ResultSetMetaData rsMetaData = rs.getMetaData(); 
			
			int numberOfColumns = rsMetaData.getColumnCount(); 

			while (rs.next()) { 
				for(int j = 1; j<numberOfColumns+1; j++) {
					System.out.println(rs.getString(j)); 
				}
				System.out.println(" ");
			} 
			
			rs.close(); 
			st.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}
