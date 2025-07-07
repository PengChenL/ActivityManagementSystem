package com.cpf.mapper;

import com.cpf.entity.Answer;

import java.util.List;

public interface AnswerMapper {
    // 根据活动id拿到表中所有与这个活动有关的回答
    List<Answer> findAnswersInOneActivity(String activityId);

    // 查询有多少个人交了报名表 通过活动id查询
    int findParticipantsInOneActivity(String activityId);

    // 当某人提交报名表时，调用此方法
    void addSomeOnesRegInfo(List<Answer> list);


}
