package com.cpf.controller;

import com.cpf.entity.Admin;
import com.cpf.service.AdminService;
import com.cpf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;

    //登录功能
    @RequestMapping("/login")
    public void login( @RequestParam("username") String username, @RequestParam("password")String password,
                       @RequestParam("identity") String identity, Model model,
                       HttpServletRequest request, HttpServletResponse response)
                       throws Exception {
        System.out.println("1111");

        System.out.println(username);
        System.out.println(password);
        System.out.println(identity);
        if(identity.equals("user"))//user登录
        {
            Map resMap = userService.login(username, password);
            if(resMap != null)
            {
                System.out.println("打印map！");
                System.out.println(resMap.get("data"));
                request.getSession().setAttribute("user",resMap.get("data"));
                response.sendRedirect("/ams/user/my");
//                return resMap;
            }else{
                System.out.println("map为空");
                request.setAttribute("tip","账户密码不匹配！");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
//                return null;
            }

        }else{//管理员登录
            Map resMap = adminService.login(username, password);
            if(resMap != null)
            {
                System.out.println("打印map！");
                System.out.println(resMap.get("data"));
                request.getSession().setAttribute("admin",resMap.get("data"));
                Admin logged = new Admin();
                // logged = resMap.get("data");
                response.sendRedirect("/ams/admin/my");
//                return resMap;
            }else{
                System.out.println("map为空");
                request.setAttribute("tip","账户密码不匹配！");
                /*有个bug：一次登录失败后，页面就会跳转到http://localhost:8080/ams/login/login路径下，无法再次登录了*/
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
//            return resMap;
        }

    }

}
