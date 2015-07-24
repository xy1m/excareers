package com.excareers.service.auth;

import java.util.Set;

import com.excareers.data.SysUsers;

public interface UserService {

	public int createUser(SysUsers user); // 创建账户

	public int updateProfile(SysUsers user);// 根据用户名修改内容

	public SysUsers getCurrentUser();// 获取当前用户

	public SysUsers findByUsername(String username);// 根据用户名查找用户

	public int changePassword(Long userId, String newPassword);// 修改密码

	public void correlationRoles(Long userId, Long... roleIds); // 添加用户-角色关系

	public void uncorrelationRoles(Long userId, Long... roleIds);// 移除用户-角色关系

	public Set<String> findRoles(String username);// 根据用户名查找其角色

	public Set<String> findPermissions(String username); // 根据用户名查找其权限

}