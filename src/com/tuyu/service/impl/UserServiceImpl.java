package com.tuyu.service.impl;

import com.tuyu.dao.userDao;
import com.tuyu.model.UserEntity;
import com.tuyu.service.IUserService;

/**
 * 方法用途：
 * Created by Tuyu on 2016/7/11 8:08 .
 */
public class UserServiceImpl implements IUserService {

    @Override
    public boolean adduser(UserEntity userEntity) {
        userDao userDao=new userDao();
        return userDao.addUser(userEntity);

    }
}
