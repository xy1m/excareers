package com.excareers.service.auth;

import java.util.Calendar;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import com.excareers.auth.PasswordHelper;
import com.excareers.dao.SysUsersMapper;
import com.excareers.data.SysUsers;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private SysUsersMapper sysUsersMapper;

	@Override
	public int createUser(SysUsers user) {
		user.setCreateDate(Calendar.getInstance().getTime());
		PasswordHelper.encryptPassword(user);
		return sysUsersMapper.insert(user);
	}

	@Override
	public int changePassword(Long userId, String newPassword) {
		SysUsers user = sysUsersMapper.selectByPrimaryKey(userId);
		user.setPassword(newPassword);
		PasswordHelper.encryptPassword(user);
		return sysUsersMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public SysUsers findByUsername(String username) {
		return sysUsersMapper.selectByUsername(username);
	}

	@Override
	public int updateProfile(SysUsers user) {
		return sysUsersMapper.updateProfile(user);
	}

	@Override
	public SysUsers getCurrentUser() {
		return (SysUsers) SecurityUtils.getSubject().getSession()
				.getAttribute("current_user");
	}

	@Override
	public void correlationRoles(Long userId, Long... roleIds) {
		// TODO Auto-generated method stub

	}

	@Override
	public void uncorrelationRoles(Long userId, Long... roleIds) {
		// TODO Auto-generated method stub

	}

	@Override
	public Set<String> findRoles(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<String> findPermissions(String username) {
		// TODO Auto-generated method stub
		return null;
	}
}
