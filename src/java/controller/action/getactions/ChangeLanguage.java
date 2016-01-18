/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.action.getactions;

import controller.action.Action;
import java.io.IOException;
import javax.servlet.ServletException;

/**
 *
 * @author Sasha
 */
public class ChangeLanguage extends Action {

    @Override
    public void doExecute() throws ServletException, IOException {
        request.getSession().setAttribute("language", request.getParameter("language"));
        response.sendRedirect(request.getHeader("Referer"));
    }
    
}