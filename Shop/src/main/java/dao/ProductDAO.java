package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class ProductDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ProductVO> select_list() {
		List<ProductVO> list = sqlSession.selectList("p.select_list");

		return list;
	}

	public List<ProductVO> selectDivision(String division) {
		List<ProductVO> list = sqlSession.selectList("p.select_division", division);

		return list;
	}

	public List<ProductVO> selectCategory(String category) {
		List<ProductVO> list = sqlSession.selectList("p.select_category", category);

		return list;
	}

	public List<ProductVO> selectMenu(int product_idx) {
		List<ProductVO> list = sqlSession.selectList("p.select_Menu");

		return list;
	}

	public ProductVO selectOne(int product_idx) {
		ProductVO vo = sqlSession.selectOne("p.select_one", product_idx);

		return vo;
	}

	// 메인 카테고리 (중복 제거된 division 목록) 가져오기
	public List<String> getDistinctDivisions() {
		return sqlSession.selectList("p.getDistinctDivisions");
	}

	// 서브 카테고리 (중복 제거된 	 목록) 가져오기
	public List<String> getAllDistinctCategories() {
		return sqlSession.selectList("p.getAllDistinctCategories");
	}

	// 제품 신규등록
	public int insertProduct(ProductVO vo) {
		int res = sqlSession.insert("p.insertProduct", vo);

		return res;
	}
	
	// 제품 신규신청
	public int new_Product(ProductVO vo) {
		int res = sqlSession.insert("p.new_Product", vo);
		
		return res;
	}
	
	// 신규신처된 제품 조회
	public List<ProductVO> new_Product_select() {
		List<ProductVO> list = sqlSession.selectList("p.new_Product_select");

		return list;
	}
	
	// 신규신처된 제품 한개 조회
	public ProductVO new_Product_select_one(int product_idx) {
		ProductVO vo = sqlSession.selectOne("p.new_Product_select_one",product_idx);
		
		return vo;
	}

	public int selectAdd(ProductVO vo) {

		int idx = sqlSession.selectOne("p.selectAdd", vo);

		return idx;
	}
	
	
	//수정페이지 수정 삭제를 위한 dao
	
	// 변경
	public int delete_product(int product_idx) {
		int res = sqlSession.delete("p.delete_product",product_idx);
		
		return res;
	}
	
	public int delete_apply_product(int product_idx) {
		int res = sqlSession.delete("p.delete_apply_product",product_idx);
		
		return res;
	}
	public List<ProductVO> product_search(String search){
		List<ProductVO> list = sqlSession.selectList("p.product_search",search);
		
		return list;
	}
	
	public List<ProductVO> getProductList(int user_idx) {
	    return sqlSession.selectList("p.getProductList", user_idx);
	}

	public List<ProductVO> getApplyProductList(int user_idx) {
	    return sqlSession.selectList("p.getApplyProductList", user_idx);
	}
	
	public int updateApplyProduct(ProductVO vo) {
	    int res = sqlSession.update("p.updateApplyProduct", vo);
	    return res;
	}

	 
	 public int updateProduct(ProductVO product) { 
		 return  sqlSession.update("p.updateProduct", product); 
	 }
	
	 public int insertApplyProduct(ProductVO product) {
		    return sqlSession.insert("p.insertApplyProduct", product);
	}
	 public List<ProductVO> getAllApplyProductList() {
		    return sqlSession.selectList("p.getAllApplyProductList");
	}
	 public List<ProductVO> getProductListByStatus(String status) {
		    return sqlSession.selectList("p.getProductListByStatus", status);
	}
	

}
