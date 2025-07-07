package com.cpf.service;

import com.cpf.entity.Answer;
import com.cpf.mapper.AnswerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerServiceImpl implements AnswerService{

    @Autowired
    private AnswerMapper answerMapper;

    @Override
    public List<Answer> findAnswersInOneActivity(String activityId) {
        List<Answer> answerList = answerMapper.findAnswersInOneActivity(activityId);
        return answerList;
    }

    // 查找某个活动的报名人数
    @Override
    public int findParticipantsInOneActivity(String activityId) {
        return answerMapper.findParticipantsInOneActivity(activityId);
    }

    // 添加一个人的报名信息
    @Override
    public void addSomeOnesRegInfo(List<Answer> list) {
        answerMapper.addSomeOnesRegInfo(list);
    }
}
