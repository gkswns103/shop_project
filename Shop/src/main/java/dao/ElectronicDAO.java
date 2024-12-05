package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ElectronicVO;


public class ElectronicDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public List<ElectronicVO> selectList(){
		List<ElectronicVO> list=sqlSession.selectList("electronic.select_list");
		
		return list;
	}
}
