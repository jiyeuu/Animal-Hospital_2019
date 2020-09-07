package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService{
	
	@Resource(name="UserMapper")
	private UserMapper userMapper;

	@Override
	public int userRegProc(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.userRegProc(uDTO);
	}

	@Override
	public UserDTO getLogin(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getLogin(uDTO);
	}

}
