package kr.green.shop.utils;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class MessageService
 */

public class SendSMS {
	
	public static void sendSMS(String toNumber, String ranNum) {
	    String api_key = "NCSWYXKFJSRYAFJO";
	    String api_secret = "KVY2K3HIUMBR4KEX8AEGMFOBRHEWB2VA";
	    Message coolsms = new Message(api_key, api_secret);
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", toNumber);
	    params.put("from", "01050442109"); //무조건 자기번호 (인증)
	    params.put("type", "SMS");
	    params.put("text", "[그린풋살] 인증번호 " + ranNum +" 를 입력하세요.");
	    params.put("app_version", "test app 1.2"); // application name and version
	
	    try {
	    	//send() 는 메시지를 보내는 함수  
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}
}
