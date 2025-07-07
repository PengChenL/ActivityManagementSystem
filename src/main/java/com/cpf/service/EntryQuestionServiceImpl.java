package com.cpf.service;

import com.cpf.entity.EntryQuestion;
import com.cpf.mapper.EntryQuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EntryQuestionServiceImpl implements EntryQuestionService{


    @Autowired
    private EntryQuestionMapper entryQuestionMapper;

    //查找一张报名表
    @Override
    public List<EntryQuestion> findEntryFormByActid(String actid) {
        List<EntryQuestion> entryForm = entryQuestionMapper.findEntryFormByActid(actid);
        return entryForm;
    }

    @Override
    public void addEntryForm(List<EntryQuestion> list) {
        entryQuestionMapper.addEntryForm(list);
    }

}
