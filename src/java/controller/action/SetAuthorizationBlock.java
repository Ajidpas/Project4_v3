/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import model.entity.Admin;
import model.entity.Kitchen;
import model.entity.User;

/**
 *
 * @author Sasha
 */
public class SetAuthorizationBlock extends Action {

    /**
     * Show authorization block for user or person
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    public void doExecute() throws ServletException, IOException {
//        User user = (User) session.getAttribute("user");
//        if (user != null) {
//            request.getRequestDispatcher("/view/person/user/authorization.jsp").
//                    include(request, response);
//            return;
//        }
//        Admin admin = (Admin) session.getAttribute("admin");
//        if (admin != null) {
//            request.getRequestDispatcher("/view/person/admin/authorization.jsp").
//                    include(request, response);
//            return;
//        }
//        Kitchen kitchen = (Kitchen) session.getAttribute("kitchen");
//        if (kitchen != null) {
//            request.getRequestDispatcher("/view/kitchen/authorization.jsp").
//                    include(request, response);
//            return;
//        }
//        request.getRequestDispatcher("/view/guest/authorization.jsp").
//                include(request, response);
    }
    
}
