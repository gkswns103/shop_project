package dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import vo.FoodVO;

public class FoodDAO {
SqlSession sqlsession;
public void setSqlsession(SqlSession sqlsession) {
	this.sqlsession = sqlsession;
}

public List<FoodVO> selectList(){
	List<FoodVO> list = sqlsession.selectList("f.food_list");
	return list;
}





}
