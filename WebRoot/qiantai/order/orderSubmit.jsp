<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript">
	        function back1()
	        {
	           window.history.go(-1);
	        }
	    </script>
	    
	    
	    <!-- 下面是我引入的 -->
	    
	    <style type="text/css">
		<!--
			#frm
			{/*border:#aaa 2px solid;padding:20px 80px;*/	
				float:left;
				-ms-border-radius: 8px;
				-moz-border-radius: 8px;
				-webkit-border-radius: 8px;
				-khtml-border-radius: 8px;
				-o-border-radius: 8px; /*Opera*/
				border-radius: 8px;
				border:#aaa 2px solid;
				padding:10px;
			}
			#frm #submit
			{
				background:url(img/button.PNG);
				width:112px;
				height:36px;
				border:none;
				cursor:pointer;
				color:#FFFFFF;
				font-size:18px;
				font-weight:bold;
				float:left;
				clear:left;
				margin:10px;
			}
			#frm .vote .score
			{/*border:#666666 1px solid;*/
				width:30px;	
				margin:0;
				float:left;
			}
			#frm .vote label
			{/*border:#F00 1px solid;*/
				float:left;
				padding:6px 0;
				width:150px;
				
				font-size:14px;
				font-weight:bold;
			}
			#frm .vote 
			{
				float:left;
				clear:left;
			}
		-->
	</style>
	<script type="text/javascript">
		function overhandle(obj)
		{
			var fnode=obj.parentNode;
			var imglist=fnode.getElementsByTagName("img");
			for(var i=0;i<imglist.length;i++)
			{
				imglist[i].src="img/start0.png";
			}/**/
			var node= obj;
			index=0;
			while(node = node.previousSibling) 
			{
				if(node.nodeType == 1) 
				{
					index++;
				}
			}
			node= obj;
			for( ;index>=2;)
			{
				if(node.nodeType == 1) 
				{
					node.src="img/start1.png";
					index--;//alert(node.tagName);
				}
				node = node.previousSibling;
			}/**/
		}
		
		function outhandle(obj)
		{
			var fnode=obj.parentNode;
			var list=fnode.getElementsByTagName("input");
			var imglist=fnode.getElementsByTagName("img");
			for(var i=0;i<imglist.length;i++)
			{
					imglist[i].src="img/start0.png";
			}/**/
			for(var i=0;i<list[0].value;i++)
			{
					imglist[i].src="img/start1.png";
			}/**/
		}
		
		function clickhandle(obj)
		{
			var fnode=obj.parentNode;
			var list=fnode.getElementsByTagName("input");
			
			var node= obj;
			index=0;
			while(node = node.previousSibling) 
			{
				if(node.nodeType == 1) 
				{
					index++;
				}
			}
			list[0].value=index-1;
		}
	</script>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<div class="page_row">
			<!--左边的 -->
			<div class="page_main_msg left">		
		        <div class="left_row">
		            <div class="list pic_news">
		  	                <div class="list_bar">&nbsp;订单确认</div>
						  	<table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
					              <tr>
					                  <td align="center" style="color: red">恭喜您，订单提交成功！</td>
					              </tr>
					              <tr>
					                  <td>订单编号：<s:property value="#request.order.orderBianhao"/></td>
					              </tr>
					              
					              <tr>
					                  <td>总金额：<s:property value="#request.order.orderJine"/></td>
					              </tr>
					              <tr>
					                  <td>下单日期:<s:property value="#request.order.orderDate"/></td>
					              </tr>
					              <tr>
					                  <td>送货地址:<s:property value="#request.order.odderSonghuodizhi"/></td>
					              </tr>
					              <tr>
					                  <td>付款方式:<s:property value="#request.order.odderFukuangfangshi"/></td>
					              </tr>
		        			</table>
		             </div>
		         </div>	
	        </div>
	        
	        
	        <!--自己加入的 -->
	        <form method="post" action="http://www.baidu.com" id="frm">
		<div class="vote" >
			<label>服务满意度</label>
			<input type="hidden" value="0"  name="answ1" />
			<img class="score" src="img/start0.png" value="1" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" value="2" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" value="3" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>
			<img class="score" src="img/start0.png" value="4" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" value="5" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>
		</div>
		<div class="vote">
			<label>书店环境满意度</label>
			<input type="hidden" value="0"  name="answ2" />
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>			
		</div>
		<div class="vote">
			<label>书籍质量满意度</label>
			<input type="hidden" value="0"  name="answ3" />
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>	
			<img class="score" src="img/start0.png" onMouseOver="overhandle(this)" onMouseOut="outhandle(this)" onClick="clickhandle(this)"/>				
		</div>
		<input type="submit"  id="submit" value="提交"/>
	</form>		
	   <!--自己加入的 -->
	   
			<!--左边的 -->
			<!-- 右边的用户登录。留言。投票 -->
			<div class="page_other_msg right">
				<div class="left_row">
					<div class="list">
						<div class="list_bar">
							用户登录
						</div>
						<div class="list_content">
							<div id="div">
								<jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
                <div class="left_row">
				    <div class="list">
				        <div class="list_bar">商品分类</div>
				        <div class="list_content">
				            <div id="div"> 
				                   <div style="overflow:hidden;height:150px;">
							             <div id="roll-orig-1607838439">
										     <s:action name="catelogAll" executeResult="true" flush="true"></s:action>
							             </div>
						                 <div id="roll-copy-1607838439"></div>
				                   </div>
					        </div>
					    </div>
				    </div>
				</div>
				<div class="left_row">
				    <div class="list">
				        <div class="list_bar">网站公告</div>
				        <div class="list_content">
				            <div id="div"> 
				                   <div style="overflow:hidden;height:150px;">
							             <div id="roll-orig-1607838439">
										 <s:action name="gonggaoQian5" executeResult="true" flush="true"></s:action>
							             </div>
						                 <div id="roll-copy-1607838439"></div>
				                   </div>
					        </div>
					    </div>
				    </div>
				</div>
			</div>
			<div style="clear: both"></div>
			<!-- 右边的用户登录。留言。投票 -->
		</div>
		
		<div class="foot">
		   <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	    </div>
	</body>
</html>
