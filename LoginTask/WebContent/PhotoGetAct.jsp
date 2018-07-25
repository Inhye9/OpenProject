<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String imgName = "";
	String dir = "";
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	try{
	if(isMultipart){
		
		//파일 보관 역할
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//업로드 요청 처리 역할
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		//업로드 요청 파싱 
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> iter = items.iterator();
		
		while(iter.hasNext()){
			FileItem item = iter.next();
			
			//파일이 아니라면 이름이겠지요
			if(!item.isFormField()){/* 
				String name = item.getFieldName();
				String value = item.getString("utf-8");
				System.out.println("일반 폼 필드 : " + name + " - " + value);
			
			//파일이라면 
			}else{ */
				String name = item.getFieldName();
				String fileName = item.getName();
				String contentType = item.getContentType();
				
				boolean isInMemory = item.isInMemory();
				long sizeInBytes = item.getSize();
				
				System.out.println("파일 이름 : " + fileName);
				
				//업로드한 파일 저장
				imgName = fileName;
				//웹 서비스에서 사용되는 저장 경로
				String uploadUri ="file/photo";
				//물리적 경로(실제 경로)
				dir = request.getSession().getServletContext().getRealPath(uploadUri);
				/* System.out.println(uploadUri +"의 물리적 경로 : " + dir); */
				
				//데이터 저장 _ File 형태로 들어가야 한다
				item.write(new File(dir, imgName));
				
			}
		}
	}
	}catch(FileNotFoundException e){
		e.printStackTrace();
		out.println("<script>");
		out.println("alert('사진을 등록해주세요.')");
		out.println("location.href='PhotoGetForm.jsp'");
		out.println("</script>");
	}

%>    

<%if(imgName!=null){ %>
<script>
location.href="PhotoGetForm.jsp?imgName=<%=imgName%>";
</script>
<%}else{%>
<script>
alert("사진을 등록해주세요.");
location.href='PhotoGetForm.jsp';
</script>
<%}%>