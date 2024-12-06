package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FashionVO;

public class FashionDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public List<FashionVO> selectList(){
		List<FashionVO> list=sqlSession.selectList("fashion.select_list");
		
		return list;
	}
}
