package com.example.demo;

import java.util.List;
import java.util.Map;

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
}
