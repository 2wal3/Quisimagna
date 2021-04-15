import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ProvaServlet
 */
@WebServlet("/Servlet1")
public class InsPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsPrenotazione() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("html/../insPren.html");
		view.forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String user = "root";
		String pass = "ciao";
		String dbName = "quisimagna";
		String host = "localhost";
		int port = 3306;	// porta di default di mysql
		
		
		String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName;
		System.out.println(url);
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, pass);
		
			String data_evento=request.getParameter("data_evento");		
			String ora_evento=request.getParameter("ora_evento");
			String n_persone=request.getParameter("n_persone");
			String note=request.getParameter("note");
			String cliente=request.getParameter("cliente");
			
			
			PreparedStatement pstmt=conn.prepareStatement("INSERT INTO prenotazione (data_evento, ora_evento, n_persone, note, cliente) VALUES (?, ?, ?, ?, ?)");
			
			// QUI POTREMMO IMPOSTARE VARI PARAMETRI ALLA QUERY
			// pstmt.setString(posizioneDelParametro, valoreDelParametro)
			
			pstmt.setString(1, data_evento);
			pstmt.setString(2, ora_evento);
			pstmt.setString(3, n_persone);
			pstmt.setString(4, note);
			pstmt.setString(5, cliente);
			
			PrintWriter writer=response.getWriter();
			// ResultSet result= pstmt.executeQuery();
			pstmt.execute();
			
			
			response.setContentType("text/html");	
		//	PrintWriter writer=response.getWriter();
			writer.println("<div> <a href='index.html'> <img style='max-height: 50px' 'max-width: 50px' src='https://icon-icons.com/icons2/370/PNG/512/Home3_37171.png'> </a></div>");
			writer.println("<h1>Prenotazione inserita correttamente</h1>");
			writer.println("<h1>Le informazioni inserite sono:</h1>");
			writer.println("Data dell'evento:");
			writer.println(data_evento);
			writer.println("<br>Orario dell'evento:");
			writer.println(ora_evento);
			writer.println("<br>Numero di posti prenotati:");
			writer.println(n_persone);
			writer.println("<br>Note su intolleranze o allergie:");
			writer.println(note);
			writer.println("<br>Codice fiscale del cliente scelto:");
			writer.println(cliente);
			
			
		//	result.close();
			pstmt.close();
			conn.close();
	    }
	    catch(SQLException e){
            System.out.println("Errore nell'esecuzione della query");
            System.out.println(e.getMessage());
	     } catch (ClassNotFoundException e) {
			System.out.println("Impossibile caricare il driver");
			System.out.println(e.getMessage());
		}
		//doGet(request, response);
	}

}
