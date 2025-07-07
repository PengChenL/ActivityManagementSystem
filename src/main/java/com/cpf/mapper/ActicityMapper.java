package com.cpf.mapper;

import com.cpf.entity.Activity;

import java.util.List;

public interface ActicityMapper {

    //通过组织名称查找活动详情
    public List<Activity> findActByOrg(String org);

    // 管理员发布一个活动
    int addNewActivity(Activity activity);

    // 查询所有活动
    public List<Activity> findAllActivity();
}
