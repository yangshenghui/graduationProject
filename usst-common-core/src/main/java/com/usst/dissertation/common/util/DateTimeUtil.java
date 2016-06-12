package com.usst.dissertation.common.util;

import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

/**
 * 关于日期时间处理的常用工具类
 */
public class DateTimeUtil{
	
	/**
	 * 得到当前的日期时间yyyy/MM/dd HH:mm:ss
	 */
	public static String getCurrDate1() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return formatter.format(date);
	}
	
	/**
	 * 得到当前的日期时间yyyy-MM-dd HH:mm:ss
	 */
	public static String getCurrDate2() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return formatter.format(date);
	}
	
	/**
	 * 得到当前的日期yyyyMMddHHmmss
	 */
	public static String getCurrDate3() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		return formatter.format(date);
	}
	
	/**
	 * 得到当前的日期yyyy/MM/dd
	 */
	public static String getCurrDate4() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy/MM/dd");
		return formatter.format(date);
	}
	

	/**
	 * 将一个时间增加几天
	 * @param date
	 * @param dayNum
	 * @return
	 */
	public static String addDays(Date date,int dayNum) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DAY_OF_MONTH,dayNum);
        Date newDate = c.getTime();
		Format formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return formatter.format(newDate);
	}
	
	/**
	 * 将一个时间减少几天
	 * @param date
	 * @param dayNum
	 * @return
	 */
	public static String subtractDays(Date date,int dayNum) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DAY_OF_MONTH,-dayNum);
        Date newDate = c.getTime();
		Format formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return formatter.format(newDate);
	}
	
	/**
	 * 将两个日期时间进行比较
	 * @param startDate
	 * @param endDate
	 * @return
	 * @throws Exception
	 */
	public static boolean isReasonable(String startDate,String endDate) throws Exception{
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1=formatter.parse(startDate);
		Date date2=formatter.parse(endDate);
		return date2.after(date1);
	}

	/**
	 * 得到yyyy-MM-dd格式的日期
	 * @return
	 */
	public static String getDate1(Date date) {
		if(null==date) date = new Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		return formatter.format(date);
	}
	
	/**
	 * 得到yyyyMMdd格式的日期
	 * @return
	 */
	public static String getDate2(Date date) {
		if(null==date) date = new Date();
		Format formatter = new SimpleDateFormat("yyyyMMdd");
		return formatter.format(date);
	}
	/**
	 * 得到yyyy-MM-dd HH:mm:ss格式的日期
	 */
	public static String getDate3(Date date) {
		if(null==date) date = new Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return formatter.format(date);
	}
	
	/**
	 * 得到yyyy-MM-dd HH:mm:ss格式的日期
	 */
	public static String getDate4(Date date) {
		if(null==date) date = new Date();
		Format formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return formatter.format(date);
	}
	
	/**
	 * 字符串类型转换为日期类型
	 * @param date yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static Date getDates(String date) throws ParseException{
		SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.parse(date);
	}
	
	/**
	 * 字符串类型转换为日期类型
	 * @param date yyyy/MM/dd HH:mm:ss
	 * @return
	 */
	public static Date getDates2(String date) throws ParseException{
		SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return dateFormat.parse(date);
	}
	
	/**
	 * 字符串类型转换为日期类型
	 * @param date yyyyMMdd
	 * @return
	 */
	public static Date getDates3(String date) throws ParseException{
		SimpleDateFormat dateFormat =new SimpleDateFormat("yyyyMMddHHmmss");
		return dateFormat.parse(date);
	}
	
	/**
	 * 
	 * @param dateStr
	 * @return
	 * @throws ParseException
	 */
	public static String getDates3(String dateStrSrc,String formatSrc,
			String formatDic) throws ParseException{
		if(StringUtils.isBlank(dateStrSrc)){
			return "";
		}
		try{
			dateStrSrc = dateStrSrc.substring(0,formatSrc.length());
			SimpleDateFormat dateFormatSrc =new SimpleDateFormat(formatSrc);
			Date dateSrc = dateFormatSrc.parse(dateStrSrc);
			SimpleDateFormat dateFormat =new SimpleDateFormat(formatDic);
			return dateFormat.format(dateSrc);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	public static Date getDate(String date,String formatStr) throws ParseException{
		SimpleDateFormat dateFormat =new SimpleDateFormat(formatStr);
		return dateFormat.parse(date);
	}
	
	public static int getYear(Date date){
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.get(java.util.Calendar.YEAR);
	}
		
	public static int getMonth(Date date){
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.get(java.util.Calendar.MONTH);
	}
	   
	public static int getDay(Date date){
		 java.util.Calendar c = java.util.Calendar.getInstance();
		 c.setTime(date);
		 return c.get(java.util.Calendar.DAY_OF_MONTH);
	}
	
	public static int getHour(Date date){
		 java.util.Calendar c = java.util.Calendar.getInstance();
		 c.setTime(date);
		 return c.get(java.util.Calendar.HOUR_OF_DAY);
	}
	
	public static Date addDate(Date date,int dayNum){
		Calendar calendar = Calendar.getInstance();
    	calendar.setTime(date);
		calendar.add(Calendar.DATE, dayNum);
		return calendar.getTime();
	}
	/*
	 * change date to string as "yyyy-mm-dd HH:mm"
	 */
	public static String DateToYMDHMS(Date date) {
		if (date == null) {
			return "";
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = formatter.format(date);
		return dateStr;
	}
	
	public static String getYear() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy");
		return formatter.format(date);
	}
	
	public static String getYearAndMonth(){
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy-MM");
		return formatter.format(date);
	}
	
	/**
	 * 判断当前日期和startDate大小
	 * @param startDate
	 * @param number
	 * @return
	 * @throws Exception
	 */
	public static int isCompare(String startDate,int numberHour) throws Exception{
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date start = formatter.parse(startDate);
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.HOUR,-numberHour);
		Date endTime = calendar.getTime();
		return endTime.compareTo(start);
	}
	
	public static String compareDate(String startDate,int numberHour,String display){
		String result = "";
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			java.util.Date start = df.parse(startDate);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.HOUR,-numberHour);
			Date endTime = calendar.getTime();
			long timeGap = endTime.getTime() - start.getTime();
			result = formatNumToDate(timeGap,display);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static String compareDate(String startDate,String endDate,String display){
		String result = "";
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			java.util.Date start = df.parse(startDate);
			java.util.Date end = df.parse(endDate);
			long timeGap = end.getTime() - start.getTime();
			result = formatNumToDate(timeGap,display);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static String formatNumToDate(long num,String display){
		String result = "";
		num = Math.abs(num);
		long day=num/(24*60*60*1000);
		long hour=(num/(60*60*1000)-day*24);
		long min=((num/(60*1000))-day*24*60-hour*60);
		long s=(num/1000-day*24*60*60-hour*60*60-min*60);
		if(display.equals("day")){
			if(day>0){
				result += day+"天";
			}
		}else if(display.equals("h")){
			if(day>0){
				result += day+"天";
			}
			if(hour>0){
				result += hour+"小时";
			}
		}else if(display.equals("m")){
			if(day>0){
				result += day+"天";
			}
			if(hour>0){
				result += hour+"小时";
			}
			if(min>0){
				result += min+"分";
			}
		}else {
			if(day>0){
				result += day+"天";
			}
			if(hour>0){
				result += hour+"小时";
			}
			if(min>0){
				result += min+"分";
			}
			if(s>0){
				result += s+"秒";
			}
		}
		return result;
	}
	
	public static String changeDateFormate(String date) throws ParseException{
		SimpleDateFormat dateFormat =new SimpleDateFormat("yyyyMMddHHmmss");
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateFormat.parse(date));
	}
	
	public static String changeDateFormate3(String date) throws ParseException{
		SimpleDateFormat dateFormat =new SimpleDateFormat("yyyyMMdd");
		return new SimpleDateFormat("yyyy/MM/dd 00:00:00").format(dateFormat.parse(date));
	}
	
	public static String changeDateFormate2(String date) throws ParseException{
		SimpleDateFormat dateFormat =new SimpleDateFormat("yyyyMMddHHmmss");
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(dateFormat.parse(date));
	}
	
	/**
	 * 日期返回 今天 月日 年月日
	 * @param respCreateTime
	 * @return
	 */
	public static String getRespCreateTimeName(Date respCreateTime) {
		String timeStr = "";
		if(respCreateTime!=null&&!"".equals(respCreateTime.toString())){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String ds1 = sdf.format(respCreateTime);
			String ds2 = sdf.format(new Date());
			if (ds1.equals(ds2)) {
				SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
				timeStr = "今天 " + sdf1.format(respCreateTime);
			} else {
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
				String ds3 = sdf1.format(respCreateTime);
				String ds4 = sdf1.format(new Date());
				if (ds3.equals(ds4)) {
					SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd HH:mm");
					timeStr = sdf2.format(respCreateTime);
				} else {
					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					timeStr = sdf2.format(respCreateTime);
				}
			}
		}
		return timeStr;
	}
	
	/**
	 * 获取 前一天 开始时间 
	 * @return
	 */
	public static String stateTime(){
		
		Date date = new Date(new Date().getTime()-24*60*60*1000);
		SimpleDateFormat matter1 = new SimpleDateFormat("yyyyMMdd000000");
		String time = matter1.format(date);
		return time;
	}
	
	/**
	 * 获取 前一天  结尾时间 
	 * @return
	 */
	public static String entTime(){
		
		Date date = new Date(new Date().getTime()-24*60*60*1000);
		SimpleDateFormat matter12 = new SimpleDateFormat("yyyyMMdd595959");
		String time = matter12.format(date);
		return time;
	}

}