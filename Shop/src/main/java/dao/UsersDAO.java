package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UsersVO;

public class UsersDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public UsersVO selectone(String id) {
		UsersVO users = sqlSession.selectOne("u.selectOne",id);
		
		return users;

	}
	
	public int insert(UsersVO users) {
		int res = sqlSession.insert("u.insert",users);
		
		return res;
	}

}
