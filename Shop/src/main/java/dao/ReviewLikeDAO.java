package dao;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewLikeVO;


public class ReviewLikeDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int likeup(ReviewLikeVO vo) {
		int res=sqlSession.insert("rl.likeup", vo);
		
		return res;
	}
}
