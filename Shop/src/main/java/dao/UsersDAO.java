package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.UsersVO;

public class UsersDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public List<UsersVO> list(){
		List<UsersVO> list = sqlSession.selectList("u.list");
		
		return list;
	}
	
	public UsersVO selectId(String id) {
		UsersVO users = sqlSession.selectOne("u.selectOne",id);
		
		return users;

	}
	
	public int insert(UsersVO users) {
		int res = sqlSession.insert("u.insert",users);
		
		return res;
	}
	
	public UsersVO selectIdx(int user_idx) {
		UsersVO user = sqlSession.selectOne("u.select_imfo", user_idx);
		
		return user;
	}

	public int update_id(UsersVO user) {
		int res = sqlSession.update("u.update_id", user);
		return res;
	}
	
	public int update_email(UsersVO user) {
		int res = sqlSession.update("u.update_email", user);
		return res;
	}
	
	public int update_addr(UsersVO user) {
		int res = sqlSession.update("u.update_addr", user);
		System.out.println("dao결과 : " + res);
		return res;
	}
	public int update_pwd(UsersVO user) {
		
		int res = sqlSession.update("u.update_pwd",user);
		
		return res;
	}
	public int delete_user(int user_idx) {
		int res = sqlSession.delete("u.delete_user",user_idx);
		return res;
	}
}
