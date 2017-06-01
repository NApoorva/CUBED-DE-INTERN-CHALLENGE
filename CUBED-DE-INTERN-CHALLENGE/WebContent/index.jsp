<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <jsp:useBean id="obj" class="com.bean.Bean"/> 
     //<jsp:useBean id="listItems" class="java.util.ArrayList" scope="session"/> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<title>eBay Search Results</title>
<style type="text/css">body { font-family: arial,sans-serif;} </style>
</head>
<body>
<h1>eBay Search Results</h1>
<pre id="results"></pre>

<script>
//Parse the response and build an HTML table to display search results
var keyword=$("#keyword"); 
console.log(keyword+"hello");
for(var i=1;i<=2;i++){


			$.ajax({
				type:"GET",
				url :"http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsAdvanced&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=ApoorvaN-CUBEDDEI-PRD-0090b840d-e4b4b5f9&GLOBAL-ID=EBAY-US&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=computer&paginationInput.entriesPerPage=10&paginationInput.pageNumber="+i+"&outputSelector=SellerInfo&descriptionSearch=true",	
				async: false,
				dataType:"json",
				success: makeListItems,
				error: function(e){
					alert("Error Occured! Please try again"+e);
					x= false;
				}	
			});
}
function makeListItems(data){
	
	var items = data.findItemsAdvancedResponse[0].searchResult[0].item || []; 
	  for (var i = 0; i < items.length; ++i) {
		  
	    var item     = items[i];
	    var title    = item.title;
	    var pic      = item.galleryURL;
	    var viewitem = item.viewItemURL;
	    if(item.sellerInfo!=null){
	    	var sellerInfo=item.sellerInfo[0].sellerUserName;
	    }
	    else
	    	var sellerInfo="Not Available";
	    var itId=		item.itemId;
	    if(item.condition!=null){
	    	var condition =	item.condition[0].conditionDisplayName;
	    }
	    else {
	    	var condition="Not Available";
	    }
	    var price    = item.sellingStatus[0].currentPrice[0]['__value__'];
	    var bids	 = item.sellingStatus[0].bidCount;
	    if(bids==null){
	    	bids="Bids Unavailable";
	    }
	    
	    <c:set target="${obj}" property="productName" value="title" />
	    	<c:set target="${obj}" property="itemId" value="itId" />
		    <c:set target="${obj}" property="link" value="viewitem" />
		    <c:set target="${obj}" property="numberOfBids" value="bids" />
		    <c:set target="${obj}" property="pictureLink" value="pic" />
		    <c:set target="${obj}" property="price" value="price" />
		    <c:set target="${obj}" property="seller" value="sellerInfo" />
		    <c:set target="${obj}" property="condition" value="condition" />
		    	
		    	
	  	  }
	  
	  
}

</script>


<script>
<%request.getSession().setAttribute("List", "listItem"); %>

	$.ajax({
		type:"GET",
		url :"/CUBED-DE-INTERN-CHALLENGE/Controller",
		async: false,
		dataType:"json",
		success: function(response){
			
			},
		error: function(e){
			alert("Error Occured! Please try again"+e);
			x= false;
		}	
	});


</script>

</body>

</html>