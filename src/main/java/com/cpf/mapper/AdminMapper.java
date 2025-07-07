package com.cpf.mapper;

import com.cpf.entity.Admin;

import java.util.List;

public interface AdminMapper {
    public void add(Admin admin);
    public void delete();

    public List<Admin> findAll();

    //通过用户名查找
    public Admin findAdminByUsername(String username);
}
