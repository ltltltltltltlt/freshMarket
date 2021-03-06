package fresh.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fresh.factory.DAOFactory;
import fresh.vo.AddressInfo;

@WebServlet("/jsp/AddAddressServlet")
public class AddAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub\
		
		request.setCharacterEncoding("utf-8") ; 
		String userId=request.getParameter("userId");
		String path ="FreshInfoServlet?userId="+"\""+userId+"\"";
		String addname=request.getParameter("addname");
		String addr=request.getParameter("addr");
		String phone=request.getParameter("phone");
		
		AddressInfo address=new AddressInfo();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		String addId = sdf.format(new java.sql.Date(new java.util.Date().getTime()))+userId;
		
		address.setAddId(addId);
		address.setUserId(userId);
		address.setAddname(addname);
		address.setAddr(addr);
		address.setPhone(phone);
		
		try {
			if(DAOFactory.getIAddressInfoDAOInstance().doCreate(address)){
				 path ="FreshInfoServlet?userId="+"\""+userId+"\"";
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("addname", address.getAddname());
		request.setAttribute("addr", address.getAddr());
		request.setAttribute("phone", address.getPhone());
		request.getRequestDispatcher(path).forward(request,response) ;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
