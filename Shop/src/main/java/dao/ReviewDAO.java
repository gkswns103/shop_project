package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVO;

public class ReviewDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int reviewinsert(ReviewVO vo) {
		int res=sqlSession.insert("r.reviewinsert", vo);
		System.out.println("insertrivew 결과 :" +res);
		return res;
	}
	
	public List<ReviewVO> selectList(int product_idx){
		List<ReviewVO> list=sqlSession.selectList("r.selectList",product_idx);
		
		return list;
	}
	
	public void updateLikeCount() {
	    sqlSession.update("r.updateLikeCount");
	}
	
	public int getLikeCount(int review_idx) {
		int count=sqlSession.selectOne("r.getLikeCount",review_idx);
		return count;
		
	}
}
