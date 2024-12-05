package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FoodVO;

public class FoodDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<FoodVO> select(){
		List<FoodVO> list = sqlSession.selectList("f.select");
		
		return list;
	}
}
