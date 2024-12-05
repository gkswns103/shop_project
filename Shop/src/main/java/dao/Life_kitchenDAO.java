package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Life_kitchenVO;

public class Life_kitchenDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public List<Life_kitchenVO> selectList(){
		List<Life_kitchenVO> list=sqlSession.selectList("life.select_list");
		
		return list;
	}
}
