 <%@page import="org.apache.poi.EncryptedDocumentException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.File"%>
<%
 
 //out.print("asdasdasd");
 
 
		String excelFilePath = "C:\\Users\\hvelazquez\\Documents\\NetBeansProjects\\Registros_Lotes_PTC\\web\\JavaBooks.xls";
		
		
		try {
			FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
			Workbook workbook = WorkbookFactory.create(inputStream);

	        Sheet newSheet = workbook.createSheet("Comments");
	        Object[][] bookComments = {
	                {"Head First Java", "Funny and Exciting"},
	                {"Effective Java", "Insightful tips and advices"},
	                {"Clean Code", "Write Readable Code"},
	                {"Thinking in Java", "Classic"},
	        };
	 
	        int rowCount = 0;
	         
	        for (Object[] aBook : bookComments) {
	            Row row = newSheet.createRow(++rowCount);
	             
	            int columnCount = 0;
	             
	            for (Object field : aBook) {
	                Cell cell = row.createCell(++columnCount);
	                if (field instanceof String) {
	                    cell.setCellValue((String) field);
	                } else if (field instanceof Integer) {
	                    cell.setCellValue((Integer) field);
	                }
	            }
	             
	        }        

			FileOutputStream outputStream = new FileOutputStream("JavaBooks.xls");
			workbook.write(outputStream);
			workbook.close();
			outputStream.close();
			
		} catch ( Exception
				  ex) {
			out.println(ex.toString());
		}
	}

}

 
 
 %>