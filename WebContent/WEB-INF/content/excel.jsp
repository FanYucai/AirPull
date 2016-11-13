<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">    
<head>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />    
<title>表格数据抽取结果</title>    
<style type="text/css">    
<!--    
body,div,p,ul,li,font,span,td,th{    
font-size:10pt;    
line-height:155%;    
}    
table{    
border-top-width: 1px;    
border-right-width: 1px;    
border-bottom-width: 0px;    
border-left-width: 1px;    
border-top-style: solid;    
border-right-style: solid;    
border-bottom-style: none;    
border-left-style: solid;    
border-top-color: #CCCCCC;    
border-right-color: #CCCCCC;    
border-bottom-color: #CCCCCC;    
border-left-color: #CCCCCC;    
}    
td{    
border-bottom-width: 1px;    
border-bottom-style: solid;    
border-bottom-color: #CCCCCC;    
}    
.EditCell_TextBox {    
width: 90%;    
border:1px solid #0099CC;    
}    
.EditCell_DropDownList {    
width: 90%;    
}    
-->    
</style>    
<script>  
    /**   
* JS实现可编辑的表格     
* 用法:EditTables(tb1,tb2,tb2,......);   
* Create by Senty at 2008-04-12   
**/    
    
//设置多个表格可编辑    
function EditTables(){    
for(var i=0;i<arguments.length;i++){    
   SetTableCanEdit(arguments[i]);    
}    
}    
    
//设置表格是可编辑的    
function SetTableCanEdit(table){    
for(var i=1; i<table.rows.length;i++){    
   SetRowCanEdit(table.rows[i]);    
}    
}    
    
function SetRowCanEdit(row){    
for(var j=0;j<row.cells.length; j++){    
    
   //如果当前单元格指定了编辑类型，则表示允许编辑    
   var editType = row.cells[j].getAttribute("EditType");    
   if(!editType){    
    //如果当前单元格没有指定，则查看当前列是否指定    
    editType = row.parentNode.rows[0].cells[j].getAttribute("EditType");    
   }    
   if(editType){    
    row.cells[j].onclick = function (){    
     EditCell(this);    
    }    
   }    
}    
    
}    
    
//设置指定单元格可编辑    
function EditCell(element, editType){    
    
var editType = element.getAttribute("EditType");    
if(!editType){    
   //如果当前单元格没有指定，则查看当前列是否指定    
   editType = element.parentNode.parentNode.rows[0].cells[element.cellIndex].getAttribute("EditType");    
}    
    
switch(editType){    
   case "TextBox":    
    CreateTextBox(element, element.innerHTML);    
    break;    
   case "DropDownList":    
    CreateDropDownList(element);    
    break;    
   default:    
    break;    
}    
}    
    
//为单元格创建可编辑输入框    
function CreateTextBox(element, value){    
//检查编辑状态，如果已经是编辑状态，跳过    
var editState = element.getAttribute("EditState");    
if(editState != "true"){    
   //创建文本框    
   var textBox = document.createElement("INPUT");    
   textBox.type = "text";    
   textBox.className="EditCell_TextBox";    
      
      
   //设置文本框当前值    
   if(!value){    
    value = element.getAttribute("Value");    
   }      
   textBox.value = value;    
      
   //设置文本框的失去焦点事件    
   textBox.onblur = function (){    
    CancelEditCell(this.parentNode, this.value);    
   }    
   //向当前单元格添加文本框    
   ClearChild(element);    
   element.appendChild(textBox);    
   textBox.focus();    
   textBox.select();    
      
   //改变状态变量    
   element.setAttribute("EditState", "true");    
   element.parentNode.parentNode.setAttribute("CurrentRow", element.parentNode.rowIndex);    
}    
    
}    
    
    
//为单元格创建选择框    
function CreateDropDownList(element, value){    
//检查编辑状态，如果已经是编辑状态，跳过    
var editState = element.getAttribute("EditState");    
if(editState != "true"){    
   //创建下接框    
   var downList = document.createElement("Select");    
   downList.className="EditCell_DropDownList";    
      
   //添加列表项    
   var items = element.getAttribute("DataItems");    
   if(!items){    
    items = element.parentNode.parentNode.rows[0].cells[element.cellIndex].getAttribute("DataItems");    
   }    
      
   if(items){    
    items = eval("[" + items + "]");    
    for(var i=0; i<items.length; i++){    
     var oOption = document.createElement("OPTION");    
     oOption.text = items[i].text;    
     oOption.value = items[i].value;    
     downList.options.add(oOption);    
    }    
   }    
      
   //设置列表当前值    
   if(!value){    
    value = element.getAttribute("Value");    
   }    
   downList.value = value;    
    
   //设置创建下接框的失去焦点事件    
   downList.onblur = function (){    
    CancelEditCell(this.parentNode, this.value, this.options[this.selectedIndex].text);    
   }    
      
   //向当前单元格添加创建下接框    
   ClearChild(element);    
   element.appendChild(downList);    
   downList.focus();    
      
   //记录状态的改变    
   element.setAttribute("EditState", "true");    
   element.parentNode.parentNode.setAttribute("LastEditRow", element.parentNode.rowIndex);    
}    
    
}    
    
    
//取消单元格编辑状态    
function CancelEditCell(element, value, text){    
element.setAttribute("Value", value);    
if(text){    
   element.innerHTML = text;    
}else{    
   element.innerHTML = value;    
}    
element.setAttribute("EditState", "false");    
    
//检查是否有公式计算    
CheckExpression(element.parentNode);    
}    
    
//清空指定对象的所有字节点    
function ClearChild(element){    
element.innerHTML = "";    
}    
    
//添加行    
function AddRow(table, index){    
var lastRow = table.rows[table.rows.length-1];    
var newRow = lastRow.cloneNode(true);    
//计算新增加行的序号，需要引入jquery 的jar包  
var startIndex = $.inArray(lastRow,table.rows);  
var endIndex = table.rows;   
nbsp;table.tBodies[0].appendChild(newRow);    
newRow.cells[0].innerHTML=endIndex-startIndex;  
SetRowCanEdit(newRow);    
return newRow;    
    
}    
    
    
//删除行    
function DeleteRow(table, index){    
for(var i=table.rows.length - 1; i>=0;i--){    
   var chkOrder = table.rows[i].cells[0].firstChild;    
   if(chkOrder){    
    if(chkOrder.type = "CHECKBOX"){    
     if(chkOrder.checked){    
      //执行删除    
      table.deleteRow(i);    
     }    
    }    
   }    
}    
for (var k = table.rows.item(0).cells.length - 1; k>= 0; k --)
{
	var tmp = table.rows[0].cells[k].firstChild;
	if (tmp){
		if (tmp.type = "CHECKBOX"){
			if (tmp.checked){
				for (var i= table.rows.length-1;i>=0;i --){
					table.rows[i].deleteCell(k);
				}
			}
		}
	}

}
}

//提取表格的值,JSON格式    
function GetTableData(table){  
alert(table)
var tableData = new Array();    
alert("行数：" + table.rows.length);    
for(var i=1; i<table.rows.length;i++){    
   tableData.push(GetRowData(tabProduct.rows[i]));    
}    
    
return tableData;    
    
}    
//提取指定行的数据，JSON格式    
function GetRowData(row){    
var rowData = {};    
for(var j=0;j<row.cells.length; j++){    
   name = row.parentNode.rows[0].cells[j].getAttribute("Name");    
   if(name){    
    var value = row.cells[j].getAttribute("Value");    
    if(!value){    
     value = row.cells[j].innerHTML;    
    }    
       
    rowData[name] = value;    
   }    
}    
//alert("ProductName:" + rowData.ProductName);    
//或者这样：alert("ProductName:" + rowData["ProductName"]);    
return rowData;    
    
}    
    
//检查当前数据行中需要运行的字段    
function CheckExpression(row){    
for(var j=0;j<row.cells.length; j++){    
   expn = row.parentNode.rows[0].cells[j].getAttribute("Expression");    
   //如指定了公式则要求计算    
   if(expn){    
    var result = Expression(row,expn);    
    var format = row.parentNode.rows[0].cells[j].getAttribute("Format");    
    if(format){    
     //如指定了格式，进行字值格式化    
     row.cells[j].innerHTML = formatNumber(Expression(row,expn), format);    
    }else{    
     row.cells[j].innerHTML = Expression(row,expn);    
    }    
   }    
      
}    
}    
    
//计算需要运算的字段    
function Expression(row, expn){    
var rowData = GetRowData(row);    
//循环代值计算    
for(var j=0;j<row.cells.length; j++){    
   name = row.parentNode.rows[0].cells[j].getAttribute("Name");    
   if(name){    
    var reg = new RegExp(name, "i");    
    expn = expn.replace(reg, rowData[name].replace(/\,/g, ""));    
   }    
}    
return eval(expn);    
}    


///////////////////////////////////////////////////////////////////////////////////    
/**   
* 格式化数字显示方式     
* 用法   
* formatNumber(12345.999,'#,##0.00');   
* formatNumber(12345.999,'#,##0.##');   
* formatNumber(123,'000000');   
* @param num   
* @param pattern   
*/    
/* 以下是范例   
formatNumber('','')=0   
formatNumber(123456789012.129,null)=123456789012   
formatNumber(null,null)=0   
formatNumber(123456789012.129,'#,##0.00')=123,456,789,012.12   
formatNumber(123456789012.129,'#,##0.##')=123,456,789,012.12   
formatNumber(123456789012.129,'#0.00')=123,456,789,012.12   
formatNumber(123456789012.129,'#0.##')=123,456,789,012.12   
formatNumber(12.129,'0.00')=12.12   
formatNumber(12.129,'0.##')=12.12   
formatNumber(12,'00000')=00012   
formatNumber(12,'#.##')=12   
formatNumber(12,'#.00')=12.00   
formatNumber(0,'#.##')=0   
*/    
function formatNumber(num,pattern){      
var strarr = num?num.toString().split('.'):['0'];      
var fmtarr = pattern?pattern.split('.'):[''];      
var retstr='';      
      
// 整数部分      
var str = strarr[0];      
var fmt = fmtarr[0];      
var i = str.length-1;        
var comma = false;      
for(var f=fmt.length-1;f>=0;f--){      
    switch(fmt.substr(f,1)){      
      case '#':      
        if(i>=0 ) retstr = str.substr(i--,1) + retstr;      
        break;      
      case '0':      
        if(i>=0) retstr = str.substr(i--,1) + retstr;      
        else retstr = '0' + retstr;      
        break;      
      case ',':      
        comma = true;      
        retstr=','+retstr;      
        break;      
    }      
}      
if(i>=0){      
    if(comma){      
      var l = str.length;      
      for(;i>=0;i--){      
        retstr = str.substr(i,1) + retstr;      
        if(i>0 && ((l-i)%3)==0) retstr = ',' + retstr;       
      }      
    }      
    else retstr = str.substr(0,i+1) + retstr;      
}      
      
retstr = retstr+'.';      
// 处理小数部分      
str=strarr.length>1?strarr[1]:'';      
fmt=fmtarr.length>1?fmtarr[1]:'';      
i=0;      
for(var f=0;f<fmt.length;f++){      
    switch(fmt.substr(f,1)){      
      case '#':      
        if(i<str.length) retstr+=str.substr(i++,1);      
        break;      
      case '0':      
        if(i<str.length) retstr+= str.substr(i++,1);      
        else retstr+='0';      
        break;      
    }      
}      
return retstr.replace(/^,+/,'').replace(/\.$/,'');      
}    
</script>  
</head>    
    
<body>    
<form id="form1" name="form1" method="post" action="">    
<h3>表格数据获取结果</h3>    

    
<br />    
<input type="button" name="Submit2" value="删除" onclick="DeleteRow(document.getElementById('tabProduct'),1)" />   
<input type="button" name="Submit22" value="重置" onclick="window.location.reload()" />

<script language="javascript">    
/* var cols=5;    //5列
var rows=4; //4行
var htmlstr="<table border='1px'>";
for(i=1;i<=rows;i++){
 htmlstr+="<tr>";
 for(j=1;j<=cols;j++){
  htmlstr+="<td >" + i +"行"+j+"列" +"</td>"; 
 }
 htmlstr+="</tr>";
}
htmlstr+="</table>"; */
var tempstr='<s:property value="fileUploadTools.feifeiContent"/>';
var index =new Array();
index.push(-1);
var cnt= 0; 
for (i=0;i<tempstr.length;i++)
	if (tempstr[i]=='@') 
	{
		index.push(i);
		cnt++;	
	}
var htmlstr='<table border="0" cellpadding="0" cellspacing="0" id="tabProduct">';
htmlstr+='<tr><td></td>';
for (i=0;i<8;i++)
	htmlstr+='<td  bgcolor="#FFFFFF"><input type="checkbox" value="checkbox" /></td>';
htmlstr+='</tr><tr>'
htmlstr+='<td width="32" align="center" bgcolor="#EFEFEF"><input type="checkbox" value="checkbox"/></td>';
htmlstr+='<td width="100" bgcolor="#EFEFEF" EditType="TextBox">订单号</td>';
htmlstr+='<td width="100" bgcolor="#EFEFEF" EditType="TextBox">下单时间</td>';
htmlstr+='<td width="100" bgcolor="#EFEFEF" EditType="TextBox">商铺名称</td>';
htmlstr+='<td width="100" bgcolor="#EFEFEF" EditType="TextBox">商品名</td>';
htmlstr+='<td width="100" bgcolor="#EFEFEF" EditType="TextBox">数量</td>';
htmlstr+='<td width="100" bgcolor="#EFEFEF" EditType="TextBox">单价</td>';
htmlstr+='<td width="100" bgcolor="#EFEFEF" EditType="TextBox">实付款</td>';
htmlstr+='<td width="100" bgcolor="#EFEFEF" EditType="TextBox">交易状态</td></tr>';
for (i=1;i<=cnt/8;i++){
	htmlstr+='<tr>';
	htmlstr+='<td align="center" bgcolor="#FFFFFF"><input type="checkbox" value="checkbox" /></td>';
	for (j=1;j<=8;j++){
		var w=8*(i-1)+j;
		htmlstr+='<td bgcolor="#FFFFFF">'+ tempstr.substring(index[w-1]+1,index[w])+'</td>';
	}
	htmlstr+='</tr>';
}
htmlstr+='</table>';
document.write(htmlstr);
</script>    
</form>    
    
<script language="javascript" src="GridEdit.js"></script>    
<script language="javascript">    
// 设置表格可编辑    
// 可一次设置多个，例如：EditTables(tb1,tb2,tb2,......)    

var tabProduct = document.getElementById("tabProduct");    
EditTables(tabProduct);    
    
    
</script>    
</body>    
</html>    