package controlador;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidad.Mueble;
import model.MuebleModel;

/**
 * Servlet implementation class MuebleServlet
 */

@WebServlet("/MuebleServlet")

public class MuebleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			// 1 Recibe los parámetros
			// Son los nombres de las caja de textos en el JSP

			String nom = request.getParameter("nombre");
			String mat = request.getParameter("material");
			String desc = request.getParameter("descripcion");
			int stock = Integer.parseInt(request.getParameter("stock"));
			double pre = Double.parseDouble(request.getParameter("precio"));

			// 2 Se crea el objeto Mueble
			Mueble obj = new Mueble();
			obj.setNombre(nom);
			obj.setMaterial(mat);
			obj.setDescrip(desc);
			obj.setStock(stock);
			obj.setPrecio(pre);

			MuebleModel m = new MuebleModel();
			int s = m.insertaMueble(obj);

			if (s > 0) {

				request.getSession().setAttribute("MENSAJE", "registro exitoso");
				request.getSession().setAttribute("MESSAGE", "success");

			} else {

				request.getSession().setAttribute("MENSAJE", "registro erróneo1");
				request.getSession().setAttribute("MESSAGE", "danger");

			}
		} catch (Exception e) {

			e.printStackTrace();
			request.getSession().setAttribute("MENSAJE", "registro erróneo2");
			request.getSession().setAttribute("MESSAGE", "danger");
		} finally {
			response.sendRedirect("registraMueble.jsp");
		}

	}

}
