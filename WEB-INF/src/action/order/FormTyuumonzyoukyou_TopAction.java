package action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class FormTyuumonzyoukyou_TopAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return "/view/order/tyuumonnzyoukyou_top.jsp";
	}

}