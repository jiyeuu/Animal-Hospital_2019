package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
	
	int userRegProc(UserDTO uDTO) throws Exception;

	UserDTO getLogin(UserDTO uDTO) throws Exception;

}
