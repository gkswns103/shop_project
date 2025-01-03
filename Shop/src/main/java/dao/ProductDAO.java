package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

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

	// 서브 카테고리 (중복 제거된 category 목록) 가져오기
	public List<String> getAllDistinctCategories() {
		return sqlSession.selectList("p.getAllDistinctCategories");
	}

	// 제품 신규등록
	public int insertProduct(ProductVO vo) {
		int res = sqlSession.insert("p.insertProduct", vo);

		System.out.println("Insert Result: " + res);

		return res;
	}

	public int selectAdd(ProductVO vo) {

		int idx = sqlSession.selectOne("p.selectAdd", vo);

		return idx;
	}
	
	public int delete_product(int product_idx) {
		
		int res = sqlSession.delete("p.delete_product",product_idx);
		
		return res;
		
	}
	
	public List<ProductVO> product_search(String search){
		List<ProductVO> list = sqlSession.selectList("p.product_search",search);
		
		return list;
	}
	public List<ProductVO> sale_product(){
		List<ProductVO> list = sqlSession.selectList("p.sale_product");
		return list;
	}
}
