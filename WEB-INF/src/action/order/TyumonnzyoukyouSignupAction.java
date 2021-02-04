package action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dao.UserDAO;

import sun.security.util.Length;
import tool.Action;

public class TyumonnzyoukyouSignupAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

        // パラメータの取得
        String name = request.getParameter("name");
        String genre = request.getParameter("genre");
        String price = request.getParameter("price");
        String des = request.getParameter("des");
        String allergy[]= request.getParameterValues("allergy");
        String allergy_csv="なし";
        if(allergy != null){

    		allergy_csv=allergy[0];
        	for(int i = 1 ; i < allergy.length;i++){
        		allergy_csv += "," + allergy[i];
        	}
        	
        }

        OrderDAO orderDAO = new OrderDAO();
        boolean flag = orderDAO.insert(name,genre,price,des,allergy_csv);
        // ちゃんと閉じる！
        orderDAO.close();
        
        
		return "/view/order/signup_complete.jsp";
	}

}
