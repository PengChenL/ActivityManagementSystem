package com.cpf.service;

import com.cpf.entity.Admin;

import java.util.List;
import java.util.Map;

public interface AdminService {

    //测试信息
    public void add(Admin admin);

    public void delete();

    public List<Admin> findAll();

    //管理员登录
    public Map login(String username, String password);






}
