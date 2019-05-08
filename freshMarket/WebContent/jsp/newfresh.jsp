<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="fresh.factory.DAOFactory,fresh.vo.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("utf-8") ; 
%>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>

		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/index.css" />
		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/page.js"></script>
		
	</head>

	<body>

		<header>
			<%@include file="header.jsp"%>
		</header>
		<div class="container">
			
			<div id="table1">
				<ul class="thumbnails lists" id="group_one">
				<%

	String keyWord = request.getParameter("kw") ;
	if(keyWord == null){
		keyWord = "" ;	// 如果没有查询关键字，则查询全部
	}
	
	List<Fresh> all = DAOFactory.getIFreshDAOInstance().findAll(keyWord) ;
	int total=Integer.parseInt(String.valueOf(DAOFactory.getIFreshDAOInstance().getAllCount(keyWord)));
	Iterator<Fresh> iter = all.iterator() ;
while(iter.hasNext()){
		
		Fresh fresh = iter.next() ;
   %>
					<a href="fresh-info.jsp?freshId=<%=fresh.getFreshId()%>">
						<li class="span6">
						<div class="thumbnail">
						
							<img src=<%=fresh.getFreshImg()%> alt="">
							<div class="miaoshu">
								<h4><%=fresh.getFreshName()%></h4>
								<p><%=fresh.getIntroduct()%></p>
								<span class="disabled-price price">￥<%=fresh.getPrice()%></span>
								<span class="price"><strong>￥<%=fresh.getNew_price()%></strong></span>
							</div>

						</div>
					</li>
					</a>
					
					<%
	}
	%>
				</ul>
			</div>
			<ul class="pager">
           <li class="previous">
              <a href="#" onclick="page.prePage();">&larr;上一页</a>
           </li>
           <li class="next">
              <a href="#" onclick="page.nextPage();">下一页 &rarr;</a>
           </li>
           </ul>
		</div>
		<%@include file="login.jsp"%>
		<footer>
			<%@ include file="footer.jsp"%>
			
		</footer>
		
      <script>
		window.onload=function(){
			
             page = new Page(10,'table1','group_one'); 
			var oUl=document.getElementsByClassName('nav')[0];
			var oLi=oUl.getElementsByTagName('li');			
			for(var i=0;i<oLi.length;i++){				
					oLi[i].className='';
					oLi[3].className='dropdown';
					oLi[1].className='active';	   
				}							
	    }
	</script>
	</body>

</html>