package com.cpf.controller;


import com.cpf.service.EntryQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class EntryFormController {

    @Autowired
    private EntryQuestionService entryQuestionService;

    @RequestMapping(value = "/admin/activity/{activityId}", method = RequestMethod.GET)
    public String showEntryForm(@PathVariable("activityId") String activityId){
        System.out.println(activityId);

        return "index";
    }
}
