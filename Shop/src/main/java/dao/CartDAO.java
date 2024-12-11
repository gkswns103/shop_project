package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;


public class CartDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public List<CartVO> select_list(int user_idx){
		List<CartVO> list=sqlSession.selectList("c.select_list",user_idx);
		
		
		return list;
	}
	
	public int insert_cart(CartVO vo) {
		
		int res=sqlSession.insert("c.insert_cart", vo);
		
		return res;
		
	}
	public int select_idx(CartVO vo) {
		
		int res=sqlSession.selectOne("c.select_idx",vo);
		
		return res;
	}
	
	public boolean check_duplicate(CartVO vo) {
		int count=sqlSession.selectOne("c.check_duplicate",vo);
		
		return count>0;
	}

}
