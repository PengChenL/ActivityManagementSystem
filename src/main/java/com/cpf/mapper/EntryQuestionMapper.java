package com.cpf.mapper;

import com.cpf.entity.EntryQuestion;

import java.util.List;

public interface EntryQuestionMapper {

    public List<EntryQuestion> findEntryFormByActid(String actid);

    //新增报名表
    public void addEntryForm(List<EntryQuestion> list);

}
