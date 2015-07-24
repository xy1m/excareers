package com.excareers.service.auth;

import com.excareers.data.SysPermissions;

public interface PermissionService {
    public SysPermissions createPermission(SysPermissions permission);
    public void deletePermission(Long permissionId);
}

