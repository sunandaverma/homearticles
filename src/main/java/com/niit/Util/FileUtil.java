package com.niit.Util;

import java.io.File;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil
{		
		//private static final String imageDirectory = "ShoppingCartImages";
		//private static String rootPath = System.getProperty("Catalina.home");
		private static String rootPath = "C:\\Users\\Sunanda\\eclipse-workspace\\HomeArticles\\src\\main\\webapp\\resources\\productimages";

		
		public static boolean fileCopyNIO(MultipartFile file, String fileName) 
		{
			//System.out.println(rootPath);
			File dest = new File(rootPath + File.separator + fileName);			
			
			try {
				file.transferTo(dest);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
	}




