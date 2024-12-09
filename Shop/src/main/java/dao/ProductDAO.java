package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class ProductDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public List<ProductVO> select_list(){
		List<ProductVO> list = sqlSession.selectList("p.select_list");
		
		return list;
	}
	
	public List<ProductVO> selectDivision(String division){
		List<ProductVO> list = sqlSession.selectList("p.select_division",division);
		
		return list;
	}
	
	public List<ProductVO> selectCategory(String category){
		List<ProductVO> list = sqlSession.selectList("p.select_category",category);
		
		return list;
	}
	public List<ProductVO> selectMenu(int idx){
		List<ProductVO> list= sqlSession.selectList("p.select_Menu");
		
		return list;
	}
	public ProductVO selectOne(int idx){
		ProductVO vo= sqlSession.selectOne("p.select_one",idx);
	
		return vo;
	}
}
