package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BannerVO;

public class BannerDAO {
SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public List<BannerVO> select_banner(){
		List<BannerVO> list = sqlSession.selectList("b.list");
		
		return list;
	}
	
}
