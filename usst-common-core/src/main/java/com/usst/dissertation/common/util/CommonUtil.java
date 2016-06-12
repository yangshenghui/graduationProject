package com.usst.dissertation.common.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.UUID;

import com.usst.dissertation.common.constant.Constants;
import com.usst.dissertation.sql.base.BaseObject;

public class CommonUtil {

	/**
	 * 
	 * @return UUID
	 */
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		
		return uuid.replace("-", "");
	}
	
	/**
	 * 
	 * @return Mac地址
	 */
	public static String getLocalMac() throws SocketException, IOException {
		
		InetAddress ia = InetAddress.getLocalHost();
		//获取网卡，获取地址
		byte[] mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
		//System.out.println("mac数组长度："+mac.length);
		StringBuffer sb = new StringBuffer("");
		for(int i=0; i<mac.length; i++) {
			if(i!=0) {
				sb.append("-");
			}
			//字节转换为整数
			int temp = mac[i]&0xff;
			String str = Integer.toHexString(temp);
			System.out.println("每8位:"+str);
			if(str.length()==1) {
				sb.append("0"+str);
			}else {
				sb.append(str);
			}
		}
		//System.out.println("本机MAC地址:"+sb.toString().toUpperCase());
		return sb.toString().toUpperCase();
	}	
	
	/**
	 * set the common field for Mysql
	 * 
	 * @param t
	 * @param userId
	 * @return
	 */
	public static <T extends BaseObject> T setSQLCommonField(T t, String userId) {
		//key id
		t.setId(getUuid());
		//enable
		t.setEnabled(Constants.ENABLED);
		//createOn
		t.setCreateOn(DateTimeUtil.getCurrDate1());
		//createBy
		t.setCreateBy(userId);
		//UpdateOn
		t.setLstUpdateOn(DateTimeUtil.getCurrDate1());
		//updateBy
		t.setLstUpdateBy(userId);
		return t;
	}
	
	/**
	 * set the update common filed value for Mysql
	 * 
	 * @param t
	 * @param userId
	 * @return
	 */
	public static <T extends BaseObject> T setSQLUpdateCommonField(T t, String userId) {
		//UpdateOn
		t.setLstUpdateOn(DateTimeUtil.getCurrDate1());
		//updateBy
		t.setLstUpdateBy(userId);
		return t;
	}	
}
