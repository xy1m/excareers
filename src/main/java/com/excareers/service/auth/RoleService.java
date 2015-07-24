package com.excareers.service.auth;

import com.excareers.data.SysRoles;

public interface RoleService {
	public SysRoles createRole(SysRoles role);

	public void deleteRole(Long roleId);

	// 添加角色-权限之间关系
	public void correlationPermissions(Long roleId, Long... permissionIds);

	// 移除角色-权限之间关系
	public void uncorrelationPermissions(Long roleId, Long... permissionIds);//
}