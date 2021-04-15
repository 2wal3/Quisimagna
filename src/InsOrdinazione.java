
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
@WebServlet("/Servlet2")
public class InsOrdinazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsOrdinazione() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("html/../insOrd.html");
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
		
			String prenotazione=request.getParameter("prenotazione");		
			String piatto=request.getParameter("piatto");
			String quantita=request.getParameter("quantita");
			
			
			PreparedStatement pstmt=conn.prepareStatement("INSERT INTO ordinazione (prenotazione, piatto, quantita) VALUES (?, ?, ?);");
			
			// QUI POTREMMO IMPOSTARE VARI PARAMETRI ALLA QUERY
			// pstmt.setString(posizioneDelParametro, valoreDelParametro)
			
			pstmt.setString(1, prenotazione);
			pstmt.setString(2, piatto);
			pstmt.setString(3, quantita);
			
			PrintWriter writer=response.getWriter();
			// ResultSet result= pstmt.executeQuery();
			pstmt.execute();
			
	/*		
			response.setContentType("text/html");	
		//	PrintWriter writer=response.getWriter();
			writer.println("<div> <a href='index.html'> <img style='max-height: 50px' 'max-width: 50px' src='https://icon-icons.com/icons2/370/PNG/512/Home3_37171.png'> </a></div>");
			writer.println("<h1>Informazione inserita correttamente</h1>");
			writer.println("<h1>Le tue info sono:</h1>");
			writer.println("Numero della prenotazione:");
			writer.println(prenotazione);
			writer.println("<br>Nome del piatto:");
			writer.println(piatto);
			writer.println("<br>Quantita scelta:");
			writer.println(quantita);
		*/	
			response.sendRedirect("insOrd.html");
		//	result.close();
			pstmt.close();
			conn.close();
	    }
	    catch(SQLException e){
            System.out.println("Errore nell'esecuzione della query");
            response.sendRedirect("dati_errati.html");
            System.out.println(e.getMessage());
	     } catch (ClassNotFoundException e) {
			System.out.println("Impossibile caricare il driver");
			System.out.println(e.getMessage());
		}
		//doGet(request, response);
	}

}
