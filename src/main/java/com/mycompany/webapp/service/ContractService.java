package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ContractDao;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.Design;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.TeamHistory;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ContractService {

	@Resource
	private ContractDao contractDao;

	//user -> 계약기록
	public List<Contract> showContractsView(String hdln, String haddress) {
		List<Contract> contractList = contractDao.selectByHAddressAndHDln(hdln, haddress);
		return contractList;
	}
	
	public List<Contract> getContracts(){
		return contractDao.selectSales();
	}
	//-------------------------------------------------------

	//admin -> hospital/contractHistory : 계약기록 리스트 페이징 
	public int getTotalContractNum() {
		return contractDao.allContractListCount();
	}
	public List<Contract> showContractList(Pager pager) {
		return contractDao.selectAllContractListByPager(pager);
	}
	
	//-------------------------------------------------------
	//hospital/contractHistory : 계약기록 리스트 페이징 -> 검색한 병원만 나오게(searchBar)
	public int getTotalContractNumBySearchBar(String searchBar) {
		return contractDao.contractListCountBySearch(searchBar);
	}

	public List<Contract> showContractListBySearchBar(Pager pager) {
		return contractDao.selectContractListBySearch(pager);
	}
	
	//계약서 보기 버튼이 눌리면 계약서 가져오는
	public Contract getContract(String fileNum) { 
		return contractDao.selectContByContId(fileNum);
	}

	public List<Contract> getTopThreeContract() {
		return contractDao.selectTopContract();
	}
	public List<Contract> getTopDesign(){
		return contractDao.selectTopDesign();
	}
	public List<String> getTopDesignImg(String dtt){
		
		return contractDao.selectTopDesignImg(dtt);
	}
	public void setContract(Contract contract) {
		
		contractDao.insertContract(contract);
	}
	public List<Contract> getThemaDesign(String dtt){
	
		return contractDao.selectThemaDesign(dtt);
	}
	public TeamHistory getToday(){
		
		return contractDao.selecttodayConSales();
	}
	public TeamHistory getYesterday(){
		
		return contractDao.selectyesterdayConSales();
	}
	public List<Contract> getMainDesign(){
		
		return contractDao.selectMainDesign();
	}

	//페이저
	public int getSalesListTotalNum(Pager p) {
		return contractDao.selectSalesListTotalNum(p);
	}
	public List<Contract> getSalesList(Pager pager) {
		return contractDao.selectSalesList(pager);
	}

	//테마 랭킹
	public List<Design> getThemaRank() {
		return contractDao.selectThemaRank();
	}
	
	public 	List<Contract> getDimgDname(String dtt){
		return contractDao.selectDimgDname(dtt);
	}

}
