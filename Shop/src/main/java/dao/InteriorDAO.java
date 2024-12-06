package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FoodVO;
import vo.InteriorVO;

public class InteriorDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public List<InteriorVO> selectList(){
		List<InteriorVO> list=sqlSession.selectList("interior.select_list");
		
		return list;
	}
}
