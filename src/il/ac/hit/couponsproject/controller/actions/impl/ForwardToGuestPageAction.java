package il.ac.hit.couponsproject.controller.actions.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import il.ac.hit.couponsproject.configuration.constants.IConstants;
import il.ac.hit.couponsproject.controller.actions.logic.IAction;

/**
 * This action is responsible for forwarding to /WEB-INF/jsp/guestPage.jsp
 * 
 * @author Idan Faibish
 * @author Shimi Karaso
 * @see IAction
 */
public class ForwardToGuestPageAction implements IAction {

	/**
	 * this method returns the name of this action: "forward-to-guest-page-action"
	 */
	@Override
	public String getName() {
		return IConstants.FORWARD_TO_GUEST_PAGE_ACTION;
	}

	/**
	 * this method is actually forwarding to /WEB-INF/jsp/guestPage.jsp
	 * 
	 * @param request
	 *            the HttpServletRequest object from the client
	 * @param response
	 *            response the HttpServletResponse object that will be sent to the client
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	public void perform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(IConstants.GUEST_PAGE_PATH);
		rd.forward(request, response);		
	}

}
