package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FoodVO;
import vo.PetVO;

public class PetDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public List<PetVO> selectList(){
		List<PetVO> list=sqlSession.selectList("pet.select_list");
		
		return list;
	}
}
