package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FoodVO;

public class FoodDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public List<FoodVO> selectList(){
		List<FoodVO> list=sqlSession.selectList("food.select_list");
		
		return list;
	}
}
