package com.csdj.mapper;

import com.csdj.entity.Logs;
;

import java.util.List;


/**
 * 操作日志
 */
public interface LogsMapper {
	public List<Logs> getLogsInfo();
	/**
	 * getList
	 * @return
	 */
	public List<Logs> getList(Logs logs) throws Exception;
	/**
	 * addLogs
	 * @param logs
	 * @return
	 */
	public int addLogs(Logs logs) throws Exception;
	
	/**
	 * @param logs
	 * @return
	 * @throws Exception
	 */
	public int count(Logs logs) throws Exception;
	
}
