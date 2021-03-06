package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.Design;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.TeamHistory;

@Mapper
public interface ContractDao {

	//user/contractsView : user의 계약기록 리스트 페이징
	List<Contract> selectByHAddressAndHDln(String hdln, String haddress);
	public List<Contract> selectSales();
	
	//hospital/contractHistory : 계약기록 리스트 페이징
	List<Contract> selectAllContractListByPager(Pager pager);
	public int allContractListCount();
	
	//hospital/contractHistory : 계약기록 리스트 페이징 -> 검색한 병원만 나오게
	int contractListCountBySearch(String searchBar);
	List<Contract> selectContractListBySearch(Pager pager);
	
	//계약서보기 버튼이 눌리면 계약서를 불러오기
	Contract selectContByContId(String fileNum);
	
	//계약금이 높은 계약 3건 불러오기
	List<Contract> selectTopContract();
	
	List<Contract> selectTopDesign();
	
	List<String> selectTopDesignImg(String dtt);
	
	void insertContract(Contract contract);
	
	List<Contract> selectThemaDesign(String dtt);
	
	TeamHistory  selectyesterdayConSales();
	
	TeamHistory  selecttodayConSales();
	
	List<Contract> selectMainDesign();
	
	//페이저
	List<Contract> selectSalesList(Pager pager);
	int selectSalesListTotalNum(Pager p);
	
	//테마 랭킹
	List<Design> selectThemaRank();
	
	
	List<Contract> selectDimgDname(String dtt);
	
	//디자인 테마별 지난달과 이번달 계약건수
	int selectCountThisMonth(String dtt);
	Integer selectCountLastMonth(String dtt, String date);

	
}
