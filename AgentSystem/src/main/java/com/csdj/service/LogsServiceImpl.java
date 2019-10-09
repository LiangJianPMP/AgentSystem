package com.csdj.service;

import java.util.List;


import com.csdj.entity.Logs;
import com.csdj.mapper.LogsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("logsservice")
public class LogsServiceImpl implements LogsService {

	@Autowired
	private LogsMapper mapper;
	

	public List<Logs> getList(Logs logs)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getList(logs);
	}


	public int hladdLogs(Logs logs)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addLogs(logs);
	}


	public int count(Logs logs) throws Exception {
		// TODO Auto-generated method stub
		return mapper.count(logs);
	}

}
