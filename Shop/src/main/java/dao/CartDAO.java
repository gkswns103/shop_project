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
	
	public List<CartVO> select_list(){
		List<CartVO> list = sqlSession.selectList("c.list");
		return list;
	}
	
	public int insert_cart(CartVO vo) {
	    int res = sqlSession.insert("c.insert_cart", vo);
	    return res;
	}
	
	public int select_idx(CartVO vo) {
		int res=sqlSession.selectOne("c.select_idx",vo);
		return res;
	}
	
	public boolean check_duplicate(CartVO vo) {
	    int count = sqlSession.selectOne("c.check_duplicate", vo);
	    return count > 0;
	}
	
	public boolean check_Active(CartVO vo) {
	    int count = sqlSession.selectOne("c.check_Active", vo);
	    return count > 0;
	}
	
	public int cart_count(int user_idx) {
		int count=sqlSession.selectOne("c.cart_count", user_idx);
		return count;
	}
	
	public int delete(CartVO vo) {
		int res=sqlSession.delete("c.cart_delete", vo);
		return res;
	}
	
	public int cart_update(CartVO vo) {
		int res=sqlSession.update("c.cart_update", vo);
		return res;
	}
	
	public int updateCheck(CartVO vo) {
		int res=sqlSession.update("c.updateCheck" ,vo);
		return res;
	}
	
	public List<CartVO> select_cart_list(int user_idx){
		List<CartVO> list=sqlSession.selectList("c.cart_list",user_idx);
		return list;
	}
	
	public int updateState(CartVO vo) {
		int res=sqlSession.update("c.updateState", vo);
		return res;
	}

	public int delete_cart(int user_idx) {
		int res = sqlSession.delete("c.delete_user", user_idx);
		return res;
	}
	
	public int updateInventory(int user_idx) {
		int res=sqlSession.update("c.updateInventory", user_idx);
		return res;
	} 
	
	public List<CartVO> purchaseList(int user_idx){
		List<CartVO> list=sqlSession.selectList("c.purchaseList",user_idx);
		return list;
	}

	public int updateInventoryOne(CartVO vo) {
		int res=sqlSession.insert("c.updateInventoryOne", vo);
		return res;
	}
	
	public int purchaseOne(CartVO vo) {
		int res=sqlSession.update("c.purchaseOne", vo);
		return res;
	}
	
	public List<CartVO> select_orderList(CartVO vo){
		List< CartVO> list=sqlSession.selectList("c.select_orderList",vo);
		return list;
	}
	
	public int updateQuantity(CartVO vo) {
	    return sqlSession.update("c.updateQuantity", vo);
	}
	
	public boolean check_duplicate(int user_idx, int product_idx) {
	    // `CartVO` 객체를 생성해 필요한 값 설정
	    CartVO vo = new CartVO();
	    vo.setUser_idx(user_idx);
	    vo.setProduct_idx(product_idx);

	    // 중복 확인 쿼리 실행
	    int count = sqlSession.selectOne("c.check_duplicate", vo);

	    // 중복된 항목이 있으면 true 반환
	    return count > 0;
	}




}
