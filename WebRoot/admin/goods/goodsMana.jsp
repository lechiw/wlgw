<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		
		<link rel="stylesheet" href="<%=path %>/css/style.css" />
		
        <script language="javascript">
           function goodsDetailHou(goodsId)
           {
                 var url="<%=path %>/goodsDetailHou.action?goodsId="+goodsId;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
           
           function goodsDel(goodsId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/goodsDel.action?goodsId="+goodsId;
               }
           }
           
           function goodsAdd()
           {
                 var url="<%=path %>/admin/goods/goodsAdd.jsp";
				 window.location.href=url;
           }
           
           function goodsShezhiTejia(goodsId)
           {
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/admin/goods/goodsShezhiTejia.jsp?goodsId="+goodsId);
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
           }
           
           function over(picPath)
	       {
			  if (picPath=="")picPath="/img/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }		
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table cellpadding="0" cellspacing="0" border="0" id="table" class="sortable" style="width: 900px;margin-left: 8px;margin-top: 8px;">
		        <thead>
					<tr>
						<th class="nosort"><h3>序号</h3></th>
						<th class="nosort"><h3>商品名称</h3></th>
						<th class="nosort"><h3>商品描述</h3></th>
						<th class="nosort"><h3>商品图片</h3></th>
						
						<th class="nosort"><h3>市场价格</h3></th>
						<th class="nosort"><h3>特价</h3></th>
						<th class="nosort"><h3>商品库存</h3></th>
						<th class="nosort"><h3>操作</h3></th>
					</tr>
				</thead>
				<tbody>	
				<s:iterator value="#request.goodsList" id="goods" status="ss">
				<tr>
					<td>
					    <s:property value="#ss.index+1"/>
                    </td>
                    <td>
					    <s:property value="#goods.goodsName"/>
                    </td>
                    <td>
					    <a href="#" onclick="goodsDetailHou(<s:property value="#goods.goodsId"/>)" class="pn-loperator">商品描述</a>
                    </td>
                    <td>
					    <div onmouseover = "over('<%=path %>/<s:property value="#goods.goodsPic"/>')" onmouseout = "out()" style="cursor:hand;">
							查看图片
					    </div>
                    </td>
                    
                    <td>
					    <s:property value="#goods.goodsShichangjia"/>
                    </td>
                    <td>
					     <s:if test="#goods.goodsIsnottejia=='no'">无特价&nbsp;&nbsp;&nbsp;
					         <a href="#" style="color: red" onclick="goodsShezhiTejia(<s:property value="#goods.goodsId"/>)">设为特价</a>
					     </s:if>
					     <s:if test="#goods.goodsIsnottejia=='yes'">
					        <s:property value="#goods.goodsTejia"/>
					     </s:if>
                    </td>
                    <td>
					    <s:property value="#goods.goodsKucun"/>
                    </td>
					<td>
						<a href="#" onclick="goodsDel(<s:property value="#goods.goodsId"/>)" class="pn-loperator">删除</a>
					</td>
				</tr>
				</s:iterator>
				</tbody>
			</table>
			
			<table cellpadding="0" cellspacing="0" border="0" style="width: 500px;margin-left: 8px;margin-top: 8px;">
		        <tr>
		           <td align="center">
		            <a href="#" onclick="sorter.move(-1,true)">首页</a>
		            <a href="#" onclick="sorter.move(-1)">上页</a>
		            <a href="#" onclick="sorter.move(1)">下页</a>
		            <a href="#" onclick="sorter.move(1,true)">末页</a>
					
					&nbsp;&nbsp;
					&nbsp;
					当前页数：<span id="currentpage"></span> &nbsp;总页数：<span id="pagelimit"></span>
		           </td>
		        </tr>
		    </table>
			
			<script type="text/javascript" src="<%=path %>/js/script.js"></script>
			
			<script type="text/javascript">
			    var sorter = new TINY.table.sorter("sorter");
				sorter.head = "head";
				sorter.asc = "asc";
				sorter.desc = "desc";
				sorter.even = "evenrow";
				sorter.odd = "oddrow";
				sorter.evensel = "evenselected";
				sorter.oddsel = "oddselected";
				sorter.paginate = true;
				sorter.currentid = "currentpage";
				sorter.limitid = "pagelimit";
				sorter.init("table",0);
		    </script>
		    
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 8px;">
			  <tr>
			    <td>
			        <input type="button" value="添加" style="width: 80px;" onclick="goodsAdd()" />
			    </td>
			  </tr>
		    </table>
		    <div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
			<TABLE id="tipTable" border="0" bgcolor="#ffffee">
				<TR align="center">
					<TD><img id="photo" src="" height="80" width="80"></TD>
				</TR>
			</TABLE>
		</div>
	</body>
</html>
