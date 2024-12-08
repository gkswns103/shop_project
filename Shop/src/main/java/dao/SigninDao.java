package dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SigninDao {

    @Select("SELECT password FROM USERS WHERE id = #{username}")
    String getPasswordByUsername(String username);
}