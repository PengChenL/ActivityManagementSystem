package com.cpf.mapper;

import com.cpf.entity.Admin;
import com.cpf.entity.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    public int create(User user);//新增

    public int delete(Map<String, Object> paraMap);//删除

    public int update(Map<String, Object> paraMap);//修改

    public List<User> query(Map<String, Object> paraMap);//查询，返回列表

    public int count(Map<String, Object> paraMap);//分页

    public User detail(Map<String, Object> paraMap);//返回明细



    //---------------------------------------------------------------//
    //根据用户名查找是否有此用户
    User findUserByUsername(String username);

    //注册
    public void addNewUser(User user);
}
