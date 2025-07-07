package com.cpf.service;

import com.cpf.entity.Activity;
import com.cpf.mapper.ActicityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActicityMapper acticityMapper;


    @Override
    public List<Activity> findActOrganizedByMe(String org) {
        List<Activity> actlist = acticityMapper.findActByOrg(org);
        return actlist;
    }

    @Override
    public int addNewActivity(Activity activity) {
        return acticityMapper.addNewActivity(activity);
    }

    @Override
    public List<Activity> findAllActivity() {

        return acticityMapper.findAllActivity();
    }
}
