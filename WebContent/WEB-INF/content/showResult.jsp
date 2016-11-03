<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <body>
        您上传的文件名列表：
        <br/>
        <!--对Action中对象（fileUploadTools）包含的数组（uploadFileFileName）的遍历-->
        <s:iterator value="fileUploadTools.uploadFileFileName" status="st">
            <s:property value="fileUploadTools.uploadFileFileName[#st.index]"/> 
              
                <br/>
        </s:iterator>
        <s:property value="fileUploadTools.fileContent"/> 
        
        <br />
    </body>
</html>