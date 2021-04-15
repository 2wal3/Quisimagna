import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet("/Servlet6")
public class SpesaCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpesaCliente() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = request.getRequestDispatcher("html/../tot_cli.html");
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
		
			
			String codfisc=request.getParameter("codfisc");
			PreparedStatement pstmt=conn.prepareStatement("select cliente, costo_totale from prenotazione where cliente=?;");
			
			// QUI POTREMMO IMPOSTARE VARI PARAMETRI ALLA QUERY
			// pstmt.setString(posizioneDelParametro, valoreDelParametro)
			
			pstmt.setString(1, codfisc);
			
			
			// ResultSet result= pstmt.executeQuery();
			ResultSet result=pstmt.executeQuery();
			
			
			
			
			response.setContentType("text/html");	
			PrintWriter out= response.getWriter();
			out.println("<HTML>");
			out.println("<BODY>");
			out.println("<div> <a href='index.html'> <img style='max-height: 50px' 'max-width: 50px' src='https://icon-icons.com/icons2/370/PNG/512/Home3_37171.png'> </a></div>");
			out.println("<H1 style= color:red> SPESA TOTALE DI UN CLIENTE: </H1>");
			out.println("<table border=\"2\">");
			out.println("<tr>");
			out.println("<th>CLIENTE</th>");
			out.println("<th>COSTO TOTALE</th>");
			out.println("</tr>");
			while (result.next()) 
			{
				out.println("<tr>");
			
				out.println("<td>"); 
				String cliente=result.getString("cliente");
				out.println(cliente);
				out.println("</td>"); 
				
				out.println("<td>"); 
				String costo_totale=result.getString("costo_totale");
				out.println(costo_totale);
				out.println("</td>"); 

				out.println("</tr>");
				// QUI POSSIAMO LEGGERE I RISULTATI DA result E STAMPARLI NELLA PAGINA HTML
			}
			out.println("</table>");
			out.println("</BODY>");
			out.println("</HTML>");
			
			
			result.close();
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
