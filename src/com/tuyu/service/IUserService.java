package com.tuyu.service;

import com.tuyu.model.UserEntity;

/**
 * 方法用途：
 * Created by Tuyu on 2016/7/11 8:07 .
 */
public interface IUserService {
    //添加用户
    boolean adduser(UserEntity userEntity);
 /*   //删除用户
    boolean deleteUser(String id);
    //更新用户
    boolean updateUser(UserEntity userEntity);
    //查找用户
    List<UserEntity> queryUser(String account);
*/
}
