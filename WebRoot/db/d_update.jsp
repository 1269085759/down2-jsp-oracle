<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@ 
	page contentType="text/html;charset=UTF-8"%><%@ 
	page import="Xproer.*" %><%@ 
	page import="org.apache.commons.lang.*" %><%@ 
	page import="java.io.*" %><%
/*
	此页面主要用来向数据库添加一条记录。
	一般在 HttpUploader.js HttpUploader_MD5_Complete(obj) 中调用
	更新记录：
		2012-05-24 完善
		2012-06-29 增加创建文件逻辑，
*/
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String fid 		= request.getParameter("idSvr");
String uid 		= request.getParameter("uid");
String per		= request.getParameter("perLoc");
String lenLoc	= request.getParameter("lenLoc");
String cbk 		= request.getParameter("callback");//jsonp

if (StringUtils.isBlank(uid)
	||StringUtils.isBlank(fid)
	||StringUtils.isBlank(cbk)
	||StringUtils.isBlank(lenLoc))
{
	out.write(cbk+"({\"value\":null})");
	return;
}

DnFile db = new DnFile();
db.updateProcess(Integer.parseInt(fid),Integer.parseInt(uid),lenLoc,per);
out.write(cbk + "({\"value\":1})");%>