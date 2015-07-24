package com.excareers.action;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.excareers.data.SysUsers;
import com.excareers.service.auth.UserService;
import com.excareers.util.ResUtils;
import com.google.common.base.Joiner;

@Controller
public class UserAction {
	@Resource
	private UserService userService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("/user/home");
		return mav;
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profile() {
		ModelAndView mav = new ModelAndView("/user/profile");
		return mav;
	}

	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public ModelAndView setting() {
		ModelAndView mav = new ModelAndView("/user/setting");
		return mav;
	}

	/**
	 * @param username
	 * @return 用户名是否存在
	 */
	@RequestMapping(value = "/user/avaliable", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkAvaliableByName(String username) {
		Map<String, String> map = ResUtils.getMap();
		SysUsers user = userService.findByUsername(username);
		if (user == null) {
			map.put("status", "success");
		} else {
			map.put("msg", "Username exists");
		}
		return map;
	}

	/**
	 * @param user
	 * @return 注册用户
	 */
	// TODO change to ajax
	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public ModelAndView join(SysUsers user) {
		ModelAndView mav = new ModelAndView("/user/success");
		int cnt = userService.createUser(user);
		if (cnt > 0) {
			mav.addObject("username", user.getUsername());
		}
		return mav;
	}

	/**
	 * @param file
	 * @return 上传图片到S3服务器
	 */
	//TODO 安全验证
	@RequestMapping(value = "/upload/avatar", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> upload(MultipartFile file) {
		Map<String, String> map = ResUtils.getMap();
		if (file.isEmpty()) {
			map.put("msg", "File is empty");
			return map;
		}
		String bucketName = "excareers";
		String folder = "avatar";
		SysUsers currentUser = userService.getCurrentUser();
		String key = Joiner.on("/").join(folder, currentUser.getUsername(),
				UUID.randomUUID().toString());
		try {
			AmazonS3Client s3 = new AmazonS3Client();
			InputStream in = file.getInputStream();
			PutObjectRequest por = new PutObjectRequest(bucketName, key, in,
					new ObjectMetadata());
			por.setCannedAcl(CannedAccessControlList.PublicRead);
			s3.putObject(por);
			in.close();
			map.put("status", "success");
			map.put("img", s3.getUrl(bucketName, key).toString());
			return map;
		} catch (IOException e) {
			map.put("msg", "IO Exception");
		} catch (AmazonServiceException e) {
			map.put("msg", "AmazonServiceException");
		} catch (AmazonClientException e) {
			map.put("msg", "AmazonClientException");
		}
		return map;
	}

	/**
	 * @param user
	 * @return 更改个人信息
	 */
	//TODO 安全验证
	@RequestMapping(value = "/modify_profile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> modifyProfile(SysUsers user) {
		Map<String, String> map = ResUtils.getMap();
		int cnt = userService.updateProfile(user);
		if (cnt > 0) {
			SysUsers curUser = userService.findByUsername(user.getUsername());
			SecurityUtils.getSubject().getSession().setAttribute("current_user", curUser);
			map.put("status", "success");
		} else {
			map.put("msg", "Server error");
		}
		return map;
	}
}
