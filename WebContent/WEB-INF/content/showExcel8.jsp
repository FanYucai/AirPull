<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var content= '${str8}';
</script>
<html lang="en">    
<head>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />    
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
    

function Base64() {  
   
    // private property  
    _keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";  
   
    // public method for encoding  
    this.encode = function (input) {  
        var output = "";  
        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;  
        var i = 0;  
        input = _utf8_encode(input);  
        while (i < input.length) {  
            chr1 = input.charCodeAt(i++);  
            chr2 = input.charCodeAt(i++);  
            chr3 = input.charCodeAt(i++);  
            enc1 = chr1 >> 2;  
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);  
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);  
            enc4 = chr3 & 63;  
            if (isNaN(chr2)) {  
                enc3 = enc4 = 64;  
            } else if (isNaN(chr3)) {  
                enc4 = 64;  
            }  
            output = output +  
            _keyStr.charAt(enc1) + _keyStr.charAt(enc2) +  
            _keyStr.charAt(enc3) + _keyStr.charAt(enc4);  
        }  
        return output;  
    }  
   
    // public method for decoding  
    this.decode = function (input) {  
        var output = "";  
        var chr1, chr2, chr3;  
        var enc1, enc2, enc3, enc4;  
        var i = 0;  
        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");  
        while (i < input.length) {  
            enc1 = _keyStr.indexOf(input.charAt(i++));  
            enc2 = _keyStr.indexOf(input.charAt(i++));  
            enc3 = _keyStr.indexOf(input.charAt(i++));  
            enc4 = _keyStr.indexOf(input.charAt(i++));  
            chr1 = (enc1 << 2) | (enc2 >> 4);  
            chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);  
            chr3 = ((enc3 & 3) << 6) | enc4;  
            output = output + String.fromCharCode(chr1);  
            if (enc3 != 64) {  
                output = output + String.fromCharCode(chr2);  
            }  
            if (enc4 != 64) {  
                output = output + String.fromCharCode(chr3);  
            }  
        }  
        output = _utf8_decode(output);  
        return output;  
    }  
   
    // private method for UTF-8 encoding  
    _utf8_encode = function (string) {  
        string = string.replace(/\r\n/g,"\n");  
        var utftext = "";  
        for (var n = 0; n < string.length; n++) {  
            var c = string.charCodeAt(n);  
            if (c < 128) {  
                utftext += String.fromCharCode(c);  
            } else if((c > 127) && (c < 2048)) {  
                utftext += String.fromCharCode((c >> 6) | 192);  
                utftext += String.fromCharCode((c & 63) | 128);  
            } else {  
                utftext += String.fromCharCode((c >> 12) | 224);  
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);  
                utftext += String.fromCharCode((c & 63) | 128);  
            }  
   
        }  
        return utftext;  
    }  
   
    // private method for UTF-8 decoding  
    _utf8_decode = function (utftext) {  
        var string = "";  
        var i = 0;  
        var c = c1 = c2 = 0;  
        while ( i < utftext.length ) {  
            c = utftext.charCodeAt(i);  
            if (c < 128) {  
                string += String.fromCharCode(c);  
                i++;  
            } else if((c > 191) && (c < 224)) {  
                c2 = utftext.charCodeAt(i+1);  
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));  
                i += 2;  
            } else {  
                c2 = utftext.charCodeAt(i+1);  
                c3 = utftext.charCodeAt(i+2);  
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));  
                i += 3;  
            }  
        }  
        return string;  
    }  
}  
    
    
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
for(var j=1;j<row.cells.length; j++){    
    
   //如果当前单元格指定了编辑类型，则表示允许编辑    
   var editType = row.cells[j].getAttribute("EditType");    
   if(!editType){    
    //如果当前单元格没有指定，则查看当前列是否指定    
    //editType = row.parentNode.rows[0].cells[j].getAttribute("EditType");    
	   row.cells[j].setAttribute("EditType","TextBox");
	   editType = row.cells[j].getAttribute("EditType");
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
   //editType = element.parentNode.parentNode.rows[0].cells[element.cellIndex].getAttribute("EditType");    
   //element.setAttribute("EditType","TextBox");
   editType = element.getAttribute("EditType");
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
function Addrow(table, index){    
var Row = table.rows[1];
var newRow = Row.cloneNode(true);
table.tBodies[0].appendChild(newRow);
var h = table.rows.length;
for (var i=0;i<table.rows[h-1].cells.length;i++){
	table.rows[h-1].cells[i].setAttribute("bgcolor", "#FFFFFF");
	if (i!=0) table.rows[h-1].cells[i].innerHTML='';
}
SetRowCanEdit(newRow);
return newRow;    
    
}

//添加列
function Addcol(table){    
	for (var i=0;i<table.rows.length;i++){
		var l = table.rows[i].cells.length;
		table.rows[i].insertCell(l);
		if (i==0){
			table.rows[i].cells[l].setAttribute("align", "center");
			table.rows[i].cells[l].setAttribute("width", "100");
			table.rows[i].cells[l].setAttribute("bgcolor", "#FFFFFF");
			table.rows[i].cells[l].innerHTML='<input type="checkbox" value="checkbox"/>';
		} else
		if (i==1){
			table.rows[i].cells[l].setAttribute("align", "center");
			table.rows[i].cells[l].setAttribute("width", "100");
			table.rows[i].cells[l].setAttribute("bgcolor", "#EFEFEF");
			table.rows[i].cells[l].setAttribute("EditType", "TextBox");
			table.rows[i].cells[l].innerHTML='';
		} else{
			table.rows[i].cells[l].setAttribute("align", "center");
			table.rows[i].cells[l].setAttribute("width", "100");
			table.rows[i].cells[l].setAttribute("bgcolor", "#FFFFFF");
			table.rows[i].cells[l].setAttribute("EditType", "TextBox");
			table.rows[i].cells[l].innerHTML='';
		}
	}
	 EditTables(table);
}



//删除行    
function DeleteRow(table, index){    
for(var i=table.rows.length - 1; i>=0;i--){    
   var chkOrder = table.rows[i].cells[0].firstChild;    
   if(chkOrder){    
    if(chkOrder.type = "CHECKBOX"){    
     if(chkOrder.checked){    
      //执行删除    
      for (var a=0;a<i;a++){
    	  for (var b=0;b<table.rows[a].cells.length;b++){
        	  var o = parseInt(table.rows[a].cells[b].rowSpan);
        	  var p = parseInt(table.rows[b].cells[b].colSpan);    		  
    		  if (o+a>i) {
    			  o=o-1;
    			  table.rows[a].cells[b].rowSpan=o.toString();
    		  }
    	  }
      }
      var coltmp=0;
      for (var j=0;j<table.rows[i].cells.length;j++){
    	  var o = parseInt(table.rows[i].cells[j].rowSpan);
    	  var p = parseInt(table.rows[i].cells[j].colSpan);
    	  coltmp+=p;
    	  if (o>1){
    		  o=o-1;
    		  var tmp=0;
    		  var pos=0;
    		  for (var k=0;k<table.rows[i+1].cells.length;k++){
    			  tmp+=parseInt(table.rows[i+1].cells[k].colSpan);
    			  pos = k;
    			  if (tmp==coltmp)
    				  break;
    		  }
    		  table.rows[i+1].insertCell(pos);
    		  table.rows[i+1].cells[pos].innerHTML=table.rows[i].cells[j].innerHTML;
    		  table.rows[i+1].cells[pos].setAttribute("align", "center");	  
    		  table.rows[i+1].cells[pos].setAttribute("bgcolor", "#FFFFFF");
    		  table.rows[i+1].cells[pos].setAttribute("width", "100");
    		  table.rows[i+1].cells[pos].setAttribute("EditType", "TextBox");
    		  table.rows[i+1].cells[pos].rowSpan=o.toString();
    		  table.rows[i+1].cells[pos].colSpan=p.toString();
    		  EditTables(table);
    	  }
      }
      
      table.deleteRow(i);    
     }    
    }    
   }    
}    
for (var k = table.rows.item(0).cells.length-1; k>=0; k--)
{
	var tmp = table.rows[0].cells[k].firstChild;
	if (tmp){
		if (tmp.type = "CHECKBOX"){
			if (tmp.checked){
			    var n = table.rows.length;
			    var m = table.rows.item(0).cells.length;
				var flag = [];
				var bj = [];
				for (var i = 0; i<n ; i++){
					flag[i]= [];
					bj[i] = -1;
					for (var j = 0 ;j< m ;j++){
						flag[i][j]=[0,0,0,0];
					}
				}
				for (var i = 0; i < table.rows.length; i++)    
			        for (var j = 0; j < table.rows[i].cells.length; j++) {   
			            var text = table.rows[i].cells[j].innerText;
			            var pos = j;
			            while (flag[i][pos][0]!=0&&flag[i][pos][1]!=0) pos+=1;
			            flag[i][pos]=[i,j,parseInt(table.rows[i].cells[j].rowSpan),parseInt(table.rows[i].cells[j].colSpan)];
			            var tn=parseInt(table.rows[i].cells[j].rowSpan);
			            var tm=parseInt(table.rows[i].cells[j].colSpan);
			            for (var o = 0;o<tn ;o++)
			            	for (var p= 0;p<tm;p++){
			            		if (o+p!=0)
			            			flag[i+o][pos+p]=[i,j,-1,-1];
			            	}
			        }
				for (var i=0; i< table.rows.length;i++)
					if (bj[i]==-1){
						if (flag[i][k][2]==-1&&flag[i][k][3]==-1){
							var aimCell = table.rows[flag[i][k][0]].cells[flag[i][k][1]];
							aimCell.colSpan=(parseInt(aimCell.colSpan)-1).toString();
							var len = aimCell.rowSpan;
							for (tmp = 0;tmp <len ; tmp++)
								bj[i+tmp]=0;
						} else
						if (flag[i][k][3]==1){
							var a = flag[i][k][0];
							var b = flag[i][k][1];
							var aimCell = table.rows[a].cells[b];
							var len = aimCell.rowSpan;
							for (tmp = 0;tmp <len ; tmp++)
								bj[i+tmp]=0;
							table.rows[a].deleteCell(b);
						} else{
							var a = flag[i][k][0];
							var b = flag[i][k][1];
							var tmplen = flag[i][k][3];
							var aimCell = table.rows[a].cells[b];
							var len = aimCell.rowSpan;
							for (tmp = 0;tmp <len ; tmp++)
								bj[i+tmp]=0;
							tmplen = tmplen -1;
							table.rows[a].insertCell(b+1);
							table.rows[a].cells[b+1].innerHTML = table.rows[a].cells[b].innerHTML;
							table.rows[a].cells[b+1].rowSpan = table.rows[a].cells[b].rowSpan;
							table.rows[a].cells[b+1].colSpan = tmplen.toString();
							table.rows[a].cells[b+1].setAttribute("align", "center");
							table.rows[a].cells[b+1].setAttribute("bgcolor", "#FFFFFF");
							table.rows[a].cells[b+1].setAttribute("width", "100");
							table.rows[a].cells[b+1].setAttribute("EditType", "TextBox");
							table.rows[a].deleteCell(b);
							EditTables(table);
						}
					} 
				
/* 				  for (var a=0;a<table.rows.length;a++){
					  var rowtmp=0;
					  for (var b=0;b<k;b++){
			        	  var o = parseInt(table.rows[a].cells[b].rowSpan);
			        	  var p = parseInt(table.rows[b].cells[b].colSpan);
			        	  rowtmp+=p;
			    		  if (rowtmp>i) {
			    			  p=p-1;
			    			  table.rows[a].cells[b].colSpan=p.toString();
			    		  }
			    	  }
			      }
			      var rowtmp=0;
			      for (var j=0;j<table.rows[i].cells.length;j++){
			    	  var o = parseInt(table.rows[i].cells[j].rowSpan);
			    	  var p = parseInt(table.rows[i].cells[j].colSpan);
			    	  coltmp+=p;
			    	  if (o>1){
			    		  o=o-1;
			    		  var tmp=0;
			    		  var pos=0;
			    		  for (var k=0;k<table.rows[i+1].cells.length;k++){
			    			  tmp+=parseInt(table.rows[i+1].cells[k].colSpan);
			    			  pos = k;
			    			  if (tmp==coltmp)
			    				  break;
			    		  }
			    		  table.rows[i+1].insertCell(pos);
			    		  table.rows[i+1].cells[pos].innerHTML=table.rows[i].cells[j].innerHTML;
			    		  table.rows[i+1].cells[pos].setAttribute("align", "center");	  
			    		  table.rows[i+1].cells[pos].setAttribute("bgcolor", "#FFFFFF");
			    		  table.rows[i+1].cells[pos].setAttribute("width", "100");
			    		  table.rows[i+1].cells[pos].setAttribute("EditType", "TextBox");
			    		  table.rows[i+1].cells[pos].rowSpan=o.toString();
			    		  table.rows[i+1].cells[pos].colSpan=p.toString();
			    		  EditTables(table);
			    	  }
			      }
				
				
				
				
				for (var i=0;i<table.rows.length;i++){
					table.rows[i].deleteCell(k);
				} */
			}
		}
	}

}
}


// 导出当表格的内容为一个字符串
function Str(table){
    var tableInfo = "asdf";
 //   alert(table.rows.item(0).cells.length);
    var n = table.rows.length;
    var m = table.rows.item(0).cells.length;
	var flag = [];
	for (var i = 0; i<n ; i++){
		flag[i]= [];
		for (var j = 0 ;j< m ;j++){
			flag[i][j]=["0","0",""];
		}
	}
	for (var i = 0; i < table.rows.length; i++)    
        for (var j = 0; j < table.rows[i].cells.length; j++) {   
            var text = table.rows[i].cells[j].innerText;
            var pos = j;
            while (flag[i][pos][0]!="0"&&flag[i][pos][1]!="0") pos+=1;
            flag[i][pos]=[table.rows[i].cells[j].rowSpan,table.rows[i].cells[j].colSpan,text];
            var tn=parseInt(table.rows[i].cells[j].rowSpan);
            var tm=parseInt(table.rows[i].cells[j].colSpan);
            for (var o = 0;o<tn ;o++)
            	for (var p= 0;p<tm;p++){
            		if (o+p!=0)
            			flag[i+o][pos+p]=["1","1",""];
            	}
        }
	for (var i=0;i<n;i++){
		for (var j=0;j<m-1;j++){
			tableInfo += flag[i][j][2]+"{"+flag[i][j][0]+","+flag[i][j][1]+"}"+"@";
		}
		tableInfo += flag[i][m-1][2]+"{"+flag[i][m-1][0]+","+flag[i][m-1][1]+"}"+"$";
	}
    /* for (var i = 0; i < table.rows.length; i++) {    //遍历Table的所有Row
        for (var j = 0; j < table.rows[i].cells.length-1; j++) {   //遍历Row中的每一列
            tableInfo += table.rows[i].cells[j].innerText;   //获取Table中单元格的内容
            tableInfo += "{"+table.rows[i].cells[j].rowSpan+","+table.rows[i].cells[j].colSpan+"}@";
        }
        tableInfo += table.rows[i].cells[j].innerText; 
        tableInfo += "{"+table.rows[i].cells[j].rowSpan+","+table.rows[i].cells[j].colSpan+"}";
        tableInfo += "$";
    } */
    document.getElementById('fan2dog').value=tableInfo;
    return tableInfo;
}

//保存
function Strsave(table){
    var tableInfo = "";
    for (var i = 1; i < table.rows.length; i++) {    //遍历Table的所有Row
        for (var j = 1; j < table.rows[i].cells.length-1; j++) {   //遍历Row中的每一列
            tableInfo += table.rows[i].cells[j].innerText;   //获取Table中单元格的内容
            tableInfo += "{"+table.rows[i].cells[j].rowSpan+","+table.rows[i].cells[j].colSpan+"}@";
        }
        tableInfo += table.rows[i].cells[j].innerText; 
        tableInfo += "{"+table.rows[i].cells[j].rowSpan+","+table.rows[i].cells[j].colSpan+"}";
        tableInfo += "$";
    }
    output=tableInfo;
    document.getElementById('fan3dog').value=tableInfo;
    return tableInfo;
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
function edit(table){
	EditTables(table);
	alert("成功进入编辑状态～");
}
function caedit(table){
    var n = table.rows.length;
   	for (var i=1;i<n;i++){
   		for (var j=1;j<table.rows[i].cells.length;j++){
  		table.rows[i].cells[j].setAttribute("EditState", "false");
   		table.rows[i].cells[j].removeAttribute("EditType");
   		}
   	}
   	alert("取消编辑状态!");
   	
}
</script>  
</head>    
<body>    

<form id="form1" name="form1" method="post" action="">    
<br />  

<script language="javascript">

var tempstr=content;
if (tempstr[0]=='!'){
	alert(tempstr.substring(1,tempstr.length));
} else{
	var index =new Array();
	var indexD = new Array();//douhao
	var indexK = new Array();//kuohao
	var indexKK = new Array();//kuohui
	index.push(-1);
	var cnt= 0; 
	var col= 0;
	var sum= 0;
	var row= 0;
	for (i=0;i<tempstr.length;i++)
		if (tempstr[i]=='@') 
		{
			index.push(i);
			cnt++;	
		} else
		if (tempstr[i]=='$')
		{
			row++;
			cnt++;
			index.push(i);
		} else
		if (tempstr[i]==',')
		{
			indexD.push(i);
		} else
		if (tempstr[i]=='{')
		{
			indexK.push(i);
		} else
		if (tempstr[i]=='}')
		{
			indexKK.push(i);
		}
		for (i=0;i<cnt;i++)
		{
			sum+=parseInt(tempstr.substring(indexD[i]+1,indexKK[i]));
		}
	col = sum/row;
	var htmlstr='<table border="1" cellpadding="0" cellspacing="0" id="tabProduct">';
	htmlstr+='<tr>'
	var base = new Base64();
	var type= 0;
	for (i=0;i<cnt;i++){
		if (type==0){
			if (tempstr[index[i]]=='$') {
				htmlstr+='<tr>';
			}
			htmlstr+='<td  bgcolor="#EFEFEF" EditType="TextBox" align="center" '+ 'rowspan="'+tempstr.substring(indexK[i]+1,indexD[i])+'" colspan="'+tempstr.substring(indexD[i]+1,indexKK[i])+'">' +base.decode(tempstr.substring(index[i]+1,indexK[i]))+'</td>';
			if (tempstr[index[i+1]]=='$'){
				htmlstr+='</tr>';
				type=1;
			}
			
		} else{
		if (tempstr[index[i]]=='$') {
			htmlstr+='<tr>';
		}
		htmlstr+='<td width="100" bgcolor="#FFFFFF" EditType="TextBox" align="center" '+ 'rowspan="'+tempstr.substring(indexK[i]+1,indexD[i])+'" colspan="'+tempstr.substring(indexD[i]+1,indexKK[i])+'">' +base.decode(tempstr.substring(index[i]+1,indexK[i]))+'</td>';
			
		if (tempstr[index[i+1]]=='$'){
			htmlstr+='</tr>';
		}
		}
	}
	htmlstr+='</table>';
}

if (tempstr.length>0)
	document.write(htmlstr);
else
	{
		document.write("当前分类尚无表格");
	}


</script>    
</form>    
    
<script language="javascript">    
// 设置表格可编辑    
// 可一次设置多个，例如：EditTables(tb1,tb2,tb2,......)    


    
</script>
</body>    
</html>    