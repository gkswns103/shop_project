package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UsersVO;

public class UsersDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
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
	
	
	public int update_no_pass(UsersVO user_up_no_pass) {
		int res = sqlSession.update("u.update_no_pass",user_up_no_pass);
		return res;
	}
	
	public int update(UsersVO user_up, String pwd) {
		 
		int res = sqlSession.update("u.update",user_up);
		
		return res;
	}
	
}
