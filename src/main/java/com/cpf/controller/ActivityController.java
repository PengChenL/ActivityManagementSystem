package com.cpf.controller;


import com.cpf.entity.*;
import com.cpf.service.ActivityService;
import com.cpf.service.AnswerService;
import com.cpf.service.EntryQuestionService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.sun.glass.ui.Accessible;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@RequestMapping
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private EntryQuestionService entryQuestionService;

    @Autowired
    private AnswerService answerService;

    // 在用户界面，一定是先查看报名表，再进行报名，用一个list接收一下查看的报名表
    // 方便添加报名数据
    private List<EntryQuestion> entryFormInfo;

    @RequestMapping(value = "/admin/activity", method = {RequestMethod.GET, RequestMethod.POST})
    public String checkMyAct(String org, HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        // 检查请求是否为 AJAX 请求
        // 检查是否是需要查看报名表
        if ("ShowEntryForm".equals(request.getHeader("X-Requested-With"))) {
            System.out.println("执行查看报名表的ajax请求---");
            // 获取前端发送的活动 ID 参数
            String activityId = request.getParameter("activityId");
            System.out.println("你查询的活动id是: " + activityId);
            List<EntryQuestion> entryQuestions = entryQuestionService.findEntryFormByActid(activityId);

            System.out.println(entryQuestions);

            // 将entryQuestions转换为JSON格式
//            Gson gson = new Gson();
//            String entryQuestionsJson = gson.toJson(entryQuestions);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            //考虑到可能有多个json数据传到前端，这里用map做区分
            Map<String, Object> jsonMap = new HashMap<>();
            jsonMap.put("entryform", entryQuestions);
            ObjectMapper objectMapper = new ObjectMapper();

            //转为json格式
            String jsonResponse = objectMapper.writeValueAsString(jsonMap);
            response.getWriter().print(jsonResponse);

            // 发送entryQuestionsJson作为响应到前端
            // response.getWriter().print(entryQuestionsJson);
            return null;
        }

        // 同样是ajax
        // 检查是否是需要发布活动
        if ("Submit".equals(request.getHeader("Submit"))) {
            System.out.println("提交表单啦~~~");
            // System.out.println(request.getParameter("formData"));

            // 获取所有的参数名
            Enumeration<String> parameterNames = request.getParameterNames();
            Map<String, String> formDataMap = new HashMap<>();//这个map存储了前端传回来的所有表单数据


            // 检查请求是否为multipart/form-data类型
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {
                // 创建文件项工厂
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // 构建上传处理器
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    // 解析request，获取所有的表单项
                    List<FileItem> items = upload.parseRequest(request);

                    // 遍历处理表单项
                    for (FileItem item : items) {
                        if (item.isFormField()) {
                            // 处理普通的表单字段
                            String paramName = item.getFieldName();
                            String paramValue = item.getString("UTF-8");
                            formDataMap.put(paramName, paramValue);//表单数据存入map中
                        } else {
                            // 处理文件上传字段
                            String paramName = item.getFieldName();
                            String fileName = item.getName();
                            // 保存文件到服务器等操作可以在这里进行
                        }
                    }
                    System.out.println(formDataMap);

                    // ........................................
                    // 先处理活动添加的数据！
                    Activity newActivity = new Activity();
                    newActivity.setActid(formDataMap.get("actid"));
                    newActivity.setAcname(formDataMap.get("actname"));
                    newActivity.setActime(formDataMap.get("actime"));
                    newActivity.setParticipantnum(0);
                    newActivity.setAcorg(formDataMap.get("acorg"));
                    newActivity.setAcinfo(formDataMap.get("acinfo"));
                    newActivity.setAcstatus(formDataMap.get("acstatus"));
                    newActivity.setAccontact(formDataMap.get("accontact"));

                    System.out.println(newActivity);
                    activityService.addNewActivity(newActivity); // 打开就把数据写入数据库啦


//---------------------------------再处理的是报名表的数据----------------------------
                    Map<Integer, String> newEntryQuestionMap = new HashMap<>();//这个map存储的是报名表中的问题
                    List<EntryQuestion> newEntryQuestionsList = new ArrayList<>();
                    for (Map.Entry<String, String> entry : formDataMap.entrySet()) {
                        String key = entry.getKey();
                        String value = entry.getValue();
                        if (key.startsWith("field")) {//如果传回来的键是以field开头的，则说明是需要的东西
                            int number = Integer.parseInt(key.substring(5));
                            newEntryQuestionMap.put(number, value);
                            EntryQuestion temp = new EntryQuestion();
                            temp.setActy(newActivity.getAcname());
                            temp.setActid(newActivity.getActid());
                            temp.setQusnum(number);
                            temp.setQusname(value);
                            //qusid没有设置，感觉有些多余
                            newEntryQuestionsList.add(temp);
                        }
                    }
//                    System.out.println(newEntryQuestionMap);//感觉map多余了
                    System.out.println(newEntryQuestionsList);
                    entryQuestionService.addEntryForm(newEntryQuestionsList);

                } catch (Exception e) {
                    e.printStackTrace();
                    // 处理上传异常
                }
            }


            return "admin_activitypage";

        }


//        System.out.println("查询活动---");
        //使用会话（Session）来存储数据
        //会话是在客户端和服务器之间保持状态的一种机制，它允许你在多个请求之间共享数据。
//        System.out.println(request.getSession().getAttribute("admin"));
        if (request.getSession().getAttribute("admin") == null) {
            System.out.println("用户没有登录！！！");
            //退出登录
//            后面jsp映射一下
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            Admin logged = (Admin) request.getSession().getAttribute("admin");
            System.out.println("查询：" + logged.getAorg() + "活动");
            String loggedOrg = logged.getAorg();
            List<Activity> activityList = activityService.findActOrganizedByMe(loggedOrg);
            request.setAttribute("activityList", activityList);

            System.out.println(activityList);
        }


        return "admin_activitypage";
    }


    @RequestMapping(value = "/user/activity", method = {RequestMethod.GET, RequestMethod.POST})
    public String checkAllAct(String org, HttpServletRequest request,
                              HttpServletResponse response) throws Exception {
        if ("ShowEntryForm".equals(request.getHeader("X-Requested-With"))) {
            System.out.println("执行查看报名表的ajax请求---");
            // 获取前端发送的活动 ID 参数
            String activityId = request.getParameter("activityId");
            System.out.println("你查询的活动id是: " + activityId);
            List<EntryQuestion> entryQuestions = entryQuestionService.findEntryFormByActid(activityId);
            entryFormInfo = entryQuestionService.findEntryFormByActid(activityId);
            System.out.println(entryQuestions);


            // 将entryQuestions转换为JSON格式
//            Gson gson = new Gson();
//            String entryQuestionsJson = gson.toJson(entryQuestions);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            //考虑到可能有多个json数据传到前端，这里用map做区分
            Map<String, Object> jsonMap = new HashMap<>();
            jsonMap.put("entryform", entryQuestions);
            ObjectMapper objectMapper = new ObjectMapper();

            //转为json格式
            String jsonResponse = objectMapper.writeValueAsString(jsonMap);
            response.getWriter().print(jsonResponse);

            // 发送entryQuestionsJson作为响应到前端
            // response.getWriter().print(entryQuestionsJson);
            return null;
        }


        // 同样是ajax
        // 检查是否是需要提交报名表
        if ("SubmitEntryForm".equals(request.getHeader("SubmitEntryForm"))) {
            System.out.println("提交报名表啦~~~");

            Map<String, String> regformDataMap = new HashMap<>();//这个map存储了前端传回来的所有表单数据

            // 检查请求是否为multipart/form-data类型
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {
                // 创建文件项工厂
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // 构建上传处理器
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    // 解析request，获取所有的表单项
                    List<FileItem> items = upload.parseRequest(request);

                    // 遍历处理表单项
                    for (FileItem item : items) {
                        if (item.isFormField()) {
                            // 处理普通的表单字段
                            String paramName = item.getFieldName();
                            String paramValue = item.getString("UTF-8");
                            regformDataMap.put(paramName, paramValue);//表单数据存入map中
                        } else {
                            // 处理文件上传字段
                            String paramName = item.getFieldName();
                            String fileName = item.getName();
                            // 保存文件到服务器等操作可以在这里进行
                        }
                    }
                    System.out.println(regformDataMap);

                    // 开始处理前端传过来的信息
//                    Map<Integer, String> newEntryQuestionMap = new HashMap<>();//这个map存储的是报名表中的问题
                    List<Answer> newAnswerList = new ArrayList<>();
                    for (Map.Entry<String, String> entry : regformDataMap.entrySet()) {
                        String key = entry.getKey();
                        String value = entry.getValue();
                        if (key.startsWith("input-")) {//如果传回来的键是以field开头的，则说明是需要的东西
                            int number = Integer.parseInt(key.substring(6)); // 这里的int表示的是问题的序号
                            System.out.println(number);
//                            newEntryQuestionMap.put(number,value);
                            Answer temp = new Answer();
//                            System.out.println(entryFormInfo);
                            temp.setActid(entryFormInfo.get(number).getActid());
                            temp.setQusid(entryFormInfo.get(number).getQusid());
                            temp.setQusname(entryFormInfo.get(number).getQusname());
                            temp.setQusnum(entryFormInfo.get(number).getQusnum());
                            User loggeduser = (User) request.getSession().getAttribute("user");
                            temp.setSubmitter(loggeduser.getSname());
                            temp.setSubmitterid(loggeduser.getSid());
                            temp.setResult(value);
                            System.out.println(temp);
                            newAnswerList.add(temp);
                        }
                    }
                    System.out.println(newAnswerList);
                    answerService.addSomeOnesRegInfo(newAnswerList); // 写入数据库

                } catch (Exception e) {
                    e.printStackTrace();
                    // 处理上传异常
                }
            }

            return "admin_activitypage";

        }

        if ("Search".equals(request.getHeader("Search"))) {
            System.out.println("搜索功能···");
            // 解析request，获取所有的表单项
            // 检查请求是否为multipart/form-data类型
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            Map<String, String> searchDataMap = new HashMap<>();


            if (isMultipart) {
                // 创建文件项工厂
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // 构建上传处理器
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    // 解析request，获取所有的表单项
                    List<FileItem> items = upload.parseRequest(request);

                    // 遍历处理表单项
                    for (FileItem item : items) {
                        if (item.isFormField()) {
                            // 处理普通的表单字段
                            String paramName = item.getFieldName();
                            String paramValue = item.getString("UTF-8");
                            searchDataMap.put(paramName, paramValue);//表单数据存入map中
                        } else {
                            // 处理文件上传字段
                            String paramName = item.getFieldName();
                            String fileName = item.getName();
                            // 保存文件到服务器等操作可以在这里进行
                        }
                    }
                    System.out.println(searchDataMap);


                } catch (Exception e) {
                    e.printStackTrace();
                    // 处理上传异常
                }
            }
            List<Activity> activityList = activityService.findActOrganizedByMe(searchDataMap.get("organization"));
            request.setAttribute("activityList", activityList);
            System.out.println(activityList);
            return null;

        }


        // 下面是常规加载的内容
        System.out.println("查询所有的活动");
        List<Activity> activityList = activityService.findAllActivity();
        request.setAttribute("activityList", activityList);


        return "user_activitypage";

    }
}
