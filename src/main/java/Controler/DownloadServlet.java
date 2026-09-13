package Controler;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Business.User;
import Business.UserIO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet{
    
    public String RegisterUser(HttpServletRequest request,
                           HttpServletResponse response){
    String email = request.getParameter("email");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    
    User user = new User();
    user.setEmail(email);
    user.setFirstName(firstName);
    user.setLastName(lastName);
    
    ServletContext context = getServletContext();
    String path = context.getRealPath("/Email.txt");
    UserIO.add(user,path);
    
    HttpSession session = request.getSession();
    session.setAttribute("user", user);
    
    Cookie c = new Cookie("emailCookie", email);
    c.setMaxAge(60 * 60 * 24 * 365 * 2);
    response.addCookie(c);
    
    String productCode = (String) 
    session.getAttribute("productCode");
    String url = "/" + productCode + "_download.jsp";
    return url;
    }
    public String checkUser(HttpServletRequest request,
                           HttpServletResponse response) {
        String productCode = request.getParameter("productCode");
        HttpSession session = request.getSession();
        session.setAttribute("productCode", productCode);
        User user = (User) session.getAttribute("user");
        System.out.println("USER = " + user);
        String url = "";
        boolean foundemailCookie = false;
        if( user == null ) {
            Cookie[] cookies = request.getCookies();
            if (cookies == null) { 
                url = "/register.jsp";
            }
            else {
            for (Cookie c : cookies) {
                if( c.getName().equals("emailCookie") ) {
                    foundemailCookie = true;
                    String email = c.getValue();
                    if(email == null || email.equals("")){
                        url = "/register.jsp";
                    }
                    else {
                        ServletContext context = getServletContext();
                        String path = context.getRealPath("/Email.txt");
                        user = UserIO.getUser(email, path);
                        if( user == null) { 
                            url = "/register.jsp";
                        }
                        else {
                            session.setAttribute("user", user);
                            url = "/" + productCode + "_download.jsp";
                            break;
                        }
                    }
                }
               
                
            }
            if(foundemailCookie == false) {
                url = "/register.jsp";
            
            }
            }
        }
        else {
            url = "/" + productCode + "_download.jsp" ;
        }
        return url;        
    }
    
    @Override
    protected void doGet(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String url = "/index.html";
        if(action == null) {
            action = "ViewAlbum";
        }
        if(action.equals("ViewAlbum")){
            url = "/index.html";        
        }
        if( action.equals("checkUser")){
            url = checkUser(request,response);
        }
        
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }    
    
    @Override 
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String url = "/index.html";
        if( action.equals("registerUser")) {
           url = RegisterUser(request,response); 
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
