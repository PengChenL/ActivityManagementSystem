package com.cpf.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//import net.sf.cglib.beans.BeanMap;
import org.springframework.cglib.beans.BeanMap;

public class BeanMapUtils {
    public static <T> Map<String, Object> beanToMap(T bean)
    {
        Map<String, Object> map = new HashMap();
        BeanMap beanMap;
        if (bean != null)
        {
            beanMap = BeanMap.create(bean);
            for (Object key : beanMap.keySet()) {
                map.put(key + "", beanMap.get(key));
            }
        }
        return map;
    }

    public static <T> T mapToBean(Map<String, Object> map, T bean)
    {
        BeanMap beanMap = BeanMap.create(bean);
        beanMap.putAll(map);
        return bean;
    }

    public static <T> List<Map<String, Object>> objectsToMaps(List<T> objList)
    {
        List<Map<String, Object>> list = new ArrayList();
        if ((objList != null) && (objList.size() > 0))
        {
            Map<String, Object> map = null;
            T bean = null;
            int i = 0;
            for (int size = objList.size(); i < size; i++)
            {
                bean = objList.get(i);
                map = beanToMap(bean);
                list.add(map);
            }
        }
        return list;
    }

    public static <T> List<T> mapsToObjects(List<Map<String, Object>> maps, Class<T> clazz)
            throws InstantiationException, IllegalAccessException
    {
        List<T> list = new ArrayList();
        if ((maps != null) && (maps.size() > 0))
        {
            Map<String, Object> map = null;
            T bean = null;
            int i = 0;
            for (int size = maps.size(); i < size; i++)
            {
                map = (Map)maps.get(i);
                bean = clazz.newInstance();
                mapToBean(map, bean);
                list.add(bean);
            }
        }
        return list;
    }
}

