<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>
    <script type="text/javascript">
    var cols=5;    //5列
    var rows=4; //4行
    var htmlstr="<table border='1px'>";
    for(i=1;i<=rows;i++){
     htmlstr+="<tr>";
     for(j=1;j<=cols;j++){
      htmlstr+="<td >" + i +"行"+j+"列" +"</td>"; 
     }
     htmlstr+="</tr>";
    }
    htmlstr+="</table>";
    document.write(htmlstr);
    </script>
</body>
</html>