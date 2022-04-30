package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ContractDao;
import com.mycompany.webapp.dto.Contract;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ContractService {

	@Resource
	private ContractDao contractDao;

	public List<Contract> showContractsView(String hdln, String haddress) {
		List<Contract> contractList = contractDao.selectByHAddressAndHDln(hdln, haddress);
		return contractList;
	}
	
	public List<Contract> getContracts(){
		
		return contractDao.selectSales();
	}
	
	public void insertContract(Contract contract){
		
	   contractDao.insertContract(contract);
	}


}
