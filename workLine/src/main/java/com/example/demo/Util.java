package com.example.demo;

import java.util.List;
import java.util.Map;
import java.util.Random;

public class Util {

	public static void printMapList(List<Map<String, Object>> mapList) {
	    System.out.println("[");
	    for (Map<String, Object> map : mapList) {
	        System.out.println("  {");
	        int count = 0;
	        for (Map.Entry<String, Object> entry : map.entrySet()) {
	            System.out.print("    " + entry.getKey() + ": " + entry.getValue());
	            count++;
	            if (count < map.size()) {
	                System.out.println(",");
	            } else {
	                System.out.println();
	            }
	        }
	        System.out.println("  },");
	    }
	    System.out.println("]");
	}
	
	//랜덤 알파벳 생성기
	public static String rCode(int length) {
	    char[] alphabet = "abcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
	    StringBuilder code = new StringBuilder();
	    Random random = new Random();
	    for (int i = 0; i < length; i++) {
	        code.append(alphabet[random.nextInt(alphabet.length)]);
	    }
	    return code.toString();
	}
}
