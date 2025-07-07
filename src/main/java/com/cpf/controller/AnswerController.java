package com.cpf.controller;

import com.cpf.entity.Answer;
import com.cpf.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AnswerController {

    @Autowired
    private AnswerService answerService;

    @GetMapping("/admin/activity/registrations/{activityId}")
    public String showSignupDetails(@PathVariable("activityId") String activityId,
                                    HttpServletRequest request, HttpServletResponse response) {
        // 根据活动ID获取相关信息，并传递到前端页面
        // 这里假设您已经有一个方法可以根据活动ID查询相关信息并返回给前端
        System.out.println(activityId);
        try {
            List<Answer> answerList = answerService.findAnswersInOneActivity(activityId);
            System.out.println(answerList);
            int participants = answerService.findParticipantsInOneActivity(activityId); // 记录有多少个报名参加
            int rows = answerList.size() / participants; // 由此得到每个人需要处理多少条数据
            Map detailMap = new HashMap<>(); // 这个map是用来存放信息的，一个学号对应一个map
            // 接下来通过map处理list中的信息
            for (int i = 0; i < participants; i++){
                //新建Map处理信息
                Map temp = new HashMap<>();
                String submitterId = "";
                for(int j = i * rows; j < (i + 1) * rows; j++){
                    temp.put(answerList.get(j).getQusname(),answerList.get(j).getResult());
                    submitterId = answerList.get(j).getSubmitterid();
                }
                // System.out.println(temp);
                detailMap.put(submitterId,temp);
            }
            System.out.println(detailMap);
            request.setAttribute("detail", detailMap);
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "admin_showentrydetails"; // 返回视图名称
    }
}
