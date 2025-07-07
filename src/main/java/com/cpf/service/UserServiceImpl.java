package com.cpf.service;

import com.cpf.entity.Admin;
import com.cpf.entity.User;
import com.cpf.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;


@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    //测试
    @Override
    public void create(User user) {
        userMapper.create(user);
    }


    //登录
    @Override
    public Map login(String username, String password) {
        Map resMap = new HashMap();
        // resMap = null;
        try {
            //思考：应该处理什么业务逻辑
            // 调用mapper
            User user = userMapper.findUserByUsername(username);
            // System.out.println(user);
            //判断是否有该用户，并且判断是否用户名密码匹配
            if(user != null && user.getSpwd().equals(password) ){
                //登陆成功
                System.out.println("用户登录成功！");
                resMap.put("data", user);
                System.out.println(resMap);
            }else{
                resMap = null;
                System.out.println("登陆失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resMap;
    }

    @Override
    public boolean register(User user) {


        userMapper.addNewUser(user);
        return true;
    }
}
