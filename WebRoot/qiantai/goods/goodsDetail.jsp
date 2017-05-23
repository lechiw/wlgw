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
		
	        function buy1(goodsKucun)
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            <s:else>
	            if(document.buy.quantity.value=="")
	            {
	                alert("请输入购买数量");
	                return false;
	            }
	            if(document.buy.quantity.value>goodsKucun)
	            {
	                alert("库存不足");
	                return false;
	            }
	            
	            document.buy.submit();
	            </s:else>
	        }
	    </script>
	    
 <style type="text/css">
  * {
   margin: 0px;
   padding: 0px;
  
  }
  li {
   list-style: none;
  }
  img {
   border: 0;
  }
  a {
   text-decoration: none;
  }
  #slide {
   width: 200px;
   height: 220px;
   box-shadow: 0px 0px 1px #c1c1c1;
   margin: 20px auto;
   position: relative;
   overflow: hidden;
  }
  #slide ul {
   position: absolute;
   left: 0px;
   top: 0px;
   height: 400px;
   width: 11930px;
  }
  #slide ul li {
   width: 800px;
   height: 400px;
   overflow: hidden;
   float: left;
  }
  #slide .ico {
   width: 800px;
   height: 20px;
   overflow: hidden;
   text-align: center;
   position: absolute;
   left: 0px;
   bottom: 10px;
   z-index: 1;
  }
  #slide .ico a {
   display: inline-block;
   width: 10px;
   height:10px;
   background: url(out.png) no-repeat 0px 0px;
   margin: 0px 5px;
  }
  #slide .ico .active {
   background: url(out1.png) no-repeat 0px 0px;
  }
  #btnLeft {
   width: 60px;
   height: 400px;
   left: 0px;
   top: 0px;
   background: url() no-repeat 0px 0px;
   position: absolute;
   z-index: 2;
  }
  #btnLeft :hover {
   background: url() no-repeat 0px 0px;
  }
  #btnRight {
   width: 60px;
   height: 400px;
   right: 0px;
   top: 0px;
   background: url() no-repeat 0px 0px;
   position: absolute;
   z-index: 2;
  }
  #btnRight :hover {
   background: url() no-repeat 0px 0px;
  }  
  
 </style>
 
 <script type="text/javascript">
  window.onload = function() {
   var oIco = document.getElementById("ico");
   var aBtn = oIco.getElementsByTagName("a");
   var oSlide = document.getElementById("slide");
   var oUl = oSlide.getElementsByTagName("ul");
   var aLi = oUl[0].getElementsByTagName("li");
   var oBtnLeft = document.getElementById("btnLeft");
   var oBtnRight = document.getElementById("btnRight");

   var baseWidth = aLi[0].offsetWidth;
   //alert(baseWidth);
   oUl[0].style.width = baseWidth * aLi.length + "px";
   var iNow = 0;
   for(var i=0;i<aBtn.length;i++) { 
    aBtn[i].index = i;
    aBtn[i].onclick = function() {
     //alert(this.index);
     //alert(oUl[0].style.left);
     move(this.index);
     //aIco[this.index].className = "active";
    }
   }
   oBtnLeft.onclick = function() {
    iNow ++;
    //document.title = iNow;
    move(iNow);
   }
   oBtnRight.onclick = function() {
    iNow --;
    document.title = iNow;
    move(iNow);
   }

   var curIndex = 0;
   var timeInterval = 1000;
   setInterval(change,timeInterval);
   function change() {
    if(curIndex == aBtn.length) {
     curIndex =0;   
    } else {
     move(curIndex);
     curIndex += 1;
    }
 
   }
 
   function move(index) {
    //document.title = index;
    if(index>aLi.length-1) {
     index = 0;
     iNow = index;
    }
    if(index<0) {
     index = aLi.length - 1;
     iNow = index;
    }
    for(var n=0;n<aBtn.length;n++) {
     aBtn[n].className = ""; 
    }
    aBtn[index].className = "active";
    oUl[0].style.left = -index * baseWidth + "px";
    //buffer(oUl[0],{
    // left: -index * baseWidth
    // },8)

   }
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
		  	                <div class="list_bar">&nbsp;商品详情</div>
						  	<form action="<%=path %>/addToCart.action" method="post" name="buy">
                                  <table border="0" cellpadding="6">
                                      <tr><td width="30"></td><td style="font-size: 11px;">书名：</td><td style="font-size: 11px;"><s:property value="#request.goods.goodsName"/></td></tr>
                                      <tr><td width="30"></td><td style="font-size: 11px;">简介：</td><td style="font-size: 11px;"><s:property value="#request.goods.goodsMiaoshu" escape="false"/></td></tr>
                                      <tr><td width="30"></td><td style="font-size: 11px;">价格：</td><td style="font-size: 11px;"><s:property value="#request.goods.goodsTejia"/></td></tr>
                                      <tr><td width="30"></td><td style="font-size: 11px;">库存：</td><td style="font-size: 11px;"><s:property value="#request.goods.goodsKucun"/></td></tr>
                                      <tr><td width="30"></td><td style="font-size: 11px;">购买数量：</td><td style="font-size: 11px;"><input type="text" name="quantity" value="1" size="8" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td></tr>
                                      <tr><td width="30"></td><td style="font-size: 11px;"><input type="hidden" name="goodsId" value="<s:property value="#request.goods.goodsId"/>"/><img onclick="buy1(<s:property value="#request.goods.goodsKucun"/>)" src="<%=path %>/img/icon_buy.gif"/></td><td style="font-size: 11px;"></td></tr>
                                  </table>
                            </form>
		             </div>
		         </div>	
	        </div>
	        
	         <!--此处是我自己加入的图书轮播 -->

<div id="slide">
  <a id="btnLeft" href="javascript:void(0);" ></a>
  <a id="btnRight" href="javascript:void(0);" ></a>
  <!--when change next image:style="left: -(n-1)*800px;"-->
  <ul>
   <li><img src="img/001.jpg" alt="图片展示" /></li>
   <li><img src="img/002.jpg" alt="" /></li>
   <li><img src="img/003.jpg" alt="" /></li>
   <li><img src="img/004.jpg" alt="" /></li>
   <li><img src="img/005.jpg" alt="" /></li>
   <li><img src="img/006.jpg" alt="" /></li>
   <li><img src="img/007.jpg" alt="" /></li>
   <li><img src="img/008.jpg" alt="" /></li>
   <li><img src="img/009.jpg" alt="" /></li>
  </ul>
  <div id="ico" class="ico"> 
   <a class="active" href="javascript:void(0);"></a>
   <a href="javascript:void(0);"></a>
   <a href="javascript:void(0);"></a>
   <a href="javascript:void(0);"></a>
   <a href="javascript:void(0);"></a>
   <a href="javascript:void(0);"></a>
   <a href="javascript:void(0);"></a>
   <a href="javascript:void(0);"></a>
   <a href="javascript:void(0);"></a>
   
  </div>
 </div>
 
 
    
   
	       <!--分界线 -->
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
