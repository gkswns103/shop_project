package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BeautyVO;
import vo.FoodVO;

public class BeautyDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public List<BeautyVO> selectList(){
		List<BeautyVO> list=sqlSession.selectList("beauty.select_list");
		
		return list;
	}
}
