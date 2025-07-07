package com.cpf.controller;

import com.cpf.entity.Admin;
import com.cpf.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/add")
//    @ResponseBody
    public void add(){
        System.out.println("add");
        Admin admin = new Admin();
//        admin.setAid(5);
        admin.setAname("系统测试");
        admin.setApwd("1111");
        admin.setAusername("systest");
        admin.setAtel("18888888888");
        admin.setAorg("组织部");
        adminService.add(admin);
        //return "xxx";
    }
    @RequestMapping("/findall")
    @ResponseBody
    public List<Admin> FindAll(){
        List<Admin> all = adminService.findAll();
        return all;

    }


    @GetMapping("/delete")
    public void delete(){
        System.out.println("delete");
        adminService.delete();
    }




}
