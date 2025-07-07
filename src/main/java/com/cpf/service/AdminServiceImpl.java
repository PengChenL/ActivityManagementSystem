package com.cpf.service;

import com.cpf.entity.Admin;
import com.cpf.entity.User;
import com.cpf.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public void add(Admin admin) {
        adminMapper.add(admin);
    }

    @Override
    public void delete() {
        adminMapper.delete();
    }

    @Override
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    //管理员登录
    @Override
    public Map login(String username, String password) {
        Map resMap = new HashMap();
        try {
            //思考：应该处理什么业务逻辑
            // 调用mapper
            Admin admin = adminMapper.findAdminByUsername(username);
            System.out.println(admin);
            //判断是否有该用户，并且判断是否用户名密码匹配
            if(admin != null && admin.getApwd().equals(password) ){
                //登陆成功
                System.out.println("管理员登录成功！");
                resMap.put("data", admin);
            }else{
                resMap = null;
                System.out.println("登陆失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resMap;


    }
}
