package com.cpf.controller;


import com.cpf.entity.Admin;
import com.cpf.entity.User;
import com.cpf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController{


    @Autowired // 自动注入
    private UserService userService;

    //测试
    @GetMapping("/create")
    public void create(){
        System.out.println("用户新增");
        User user = new User();
        user.setSusername("testusername");
        user.setSpwd("test");
        user.setSname("系统测试员");
        user.setSid("20218888");
        user.setScollege("大数据与软件学院");
        user.setSmajor("软件工程");
        user.setStel("17788889999");
        user.setSmail("20218888@qq.com");
        userService.create(user);

    }

/*
    TODO 添加了Controller注解就不要再继承HttpServlet了
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("前端发送数据---");
        // 先接收前端发过来的数据，包括姓名和参数
        String uname = request.getParameter("username");
        String upwd = request.getParameter("password");
        System.out.println(uname);
        System.out.println(upwd);
    }
*/

    //登录功能
//    @RequestMapping( "/login")
//    public Map login(@RequestParam("username") String username, @RequestParam("password")String password,
//                     @RequestParam("identity") String identity, Model model){
//        System.out.println("1111");
//
//        System.out.println(username);
//        System.out.println(password);
//        System.out.println(identity);
//        if(identity.equals("user"))
//        {
//            Map resMap = userService.login(username, password);
//            return resMap;
//        }
//        return null;
//
//    }


    //注册信息
    @RequestMapping("/register")
    public void register(@RequestParam("username") String username, @RequestParam("password") String password,
        @RequestParam("name") String name, @RequestParam("idcode") String idcode,
        @RequestParam("college") String college, @RequestParam("major") String major,
        @RequestParam("tel") String tel, @RequestParam("mail") String mail, HttpServletResponse response  )
            throws Exception {

        User user = new User();
        user.setSusername(username);
        user.setSpwd(password);
        user.setSname(name);
        user.setSid(idcode);
        user.setScollege(college);
        user.setSmajor(major);
        user.setStel(tel);
        user.setSmail(mail);
        System.out.println(user);
        String error="";
        if(userService.register(user)){
            response.sendRedirect("/ams/login.jsp");

        }
    }
}
