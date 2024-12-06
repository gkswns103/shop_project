package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BabyVO;

public class BabyDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public List<BabyVO> selectList(){
		List<BabyVO> list=sqlSession.selectList("baby.select_list");
		
		return list;
	}
}
