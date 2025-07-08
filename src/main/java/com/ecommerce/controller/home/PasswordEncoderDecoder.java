package com.ecommerce.controller.home;

import java.util.Arrays;
import java.util.Base64;

public class PasswordEncoderDecoder {

	public static String encoder(String password) {
		
		// Getting encoder 
		Base64.Encoder encoder = Base64.getEncoder();  
        // Encoding string 
        byte byteText[] = password.getBytes();
        System.out.println("byteText[]: " + Arrays.toString(byteText));
        
        String str = encoder.encodeToString(byteText);  
        System.out.println("Encoded string: "+str);  
        
        return str;
	}
	
	public static String decoder(String password) {
		
		// Getting decoder  
        Base64.Decoder decoder = Base64.getDecoder(); 
        
        // Decoding string  
        byte decodeBytes[] =decoder.decode(password);
        System.out.println("decodeBytes[]: " + Arrays.toString(decodeBytes));
        String dStr = new String(decodeBytes);  
        System.out.println("Decoded string: "+dStr);  
        
        return dStr;
	}
	
}
