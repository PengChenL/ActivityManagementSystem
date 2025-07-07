package com.cpf.service;

import com.cpf.entity.EntryQuestion;

import java.util.List;

public interface EntryQuestionService {
    //查询一张报名表
    //思路：通过活动id查询与这个活动关联的问题
    public List<EntryQuestion> findEntryFormByActid(String actid);

    //添加报名表，前端传过来的数据经过处理后是一个list
    public void addEntryForm(List<EntryQuestion> list);
}
