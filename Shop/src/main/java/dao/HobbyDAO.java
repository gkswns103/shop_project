package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.HobbyVO;

public class HobbyDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public List<HobbyVO> selectList(){
		List<HobbyVO> list=sqlSession.selectList("hobby.select_list");
		
		return list;
	}
}
