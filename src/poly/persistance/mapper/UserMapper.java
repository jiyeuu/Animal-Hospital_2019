package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")//메퍼의 이름이 UserMapper 라고 알려주고 있다
public interface UserMapper {

	int userRegProc(UserDTO uDTO) throws Exception;;

	UserDTO getLogin(UserDTO uDTO) throws Exception;

}
