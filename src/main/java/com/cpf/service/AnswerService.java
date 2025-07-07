package com.cpf.service;

import com.cpf.entity.Answer;

import java.util.List;

public interface AnswerService {
    // 查找一个活动下的所有回答的答案；
    // 根据活动名称查找
    public List<Answer> findAnswersInOneActivity(String activityId);

    int findParticipantsInOneActivity(String activityId);

    // 添加一个人的报名信息
    void addSomeOnesRegInfo(List<Answer> list);
}
