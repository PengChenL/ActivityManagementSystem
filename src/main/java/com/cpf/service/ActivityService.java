package com.cpf.service;

import com.cpf.entity.Activity;

import java.util.List;

public interface ActivityService {
    //管理员查看自己组织下的活动
    public List<Activity> findActOrganizedByMe(String org);

    //新增一个活动
    int addNewActivity(Activity activity);

    // 用户 查看所有的活动
    public List<Activity> findAllActivity();
}
