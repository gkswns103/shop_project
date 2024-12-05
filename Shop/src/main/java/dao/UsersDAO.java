package dao;

import org.apache.ibatis.session.SqlSession;

public class UsersDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
}
