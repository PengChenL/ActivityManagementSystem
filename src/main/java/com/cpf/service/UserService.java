package com.cpf.service;

import com.cpf.entity.Admin;
import com.cpf.entity.User;

import java.util.Map;

public interface UserService {



    public void create(User user);

    //下面是登录功能的实现
    //根据前端传来的账户和密码
    public Map login(String username, String password);

    //注册信息
    public boolean register(User user);
}
