var common = common || {};
!function(com){
	 com.dataTransfer = {
	    	  getDataTableParams : function(aoData){
	    		  var params = {};
	    	      for(var i=0;i<aoData.length;i++){
	    	          if(aoData[i].name == "iDisplayStart"){
	    	        	  params.offset = aoData[i].value;
	    	          }else if(aoData[i].name == "iDisplayLength"){
	    	        	  params.pagesize = aoData[i].value;
	    	          }
	    	      }
	    	      return params;
	    	  },
	    	  transferResForDatatable : function (data){
	    		  data = common.toList(data);
	    		  var obj=JSON.parse(data); 
	              var tbObj = {};
	              tbObj.iTotalDisplayRecords = tbObj.iTotalRecords = obj.totalNum;
	              tbObj.aaData = obj.list;
	              return tbObj; 
	    	  }
	 };
      com.toList = function(str){
    	  str = str.replace(/(^\s*)|(\s*$)/g, "");
    	  var RexStr = /\<|\>|\'|\&|��| /g;
          str = str.replace(RexStr,
                  function (MatchStr) {
                      switch (MatchStr) {
                          case "<":
                              return "&lt;";
                              break;
                          case ">":
                              return "&gt;";
                              break;
                          case "'":
                              return "&#39;";
                              break;
                          case "&":
                              return "&amp;";
                              break;
                          case " ":
                              return "&ensp;";
                              break;
                          case "��":
                              return "&emsp;";
                              break;
                          default:
                              break;
                      }
          });
          return str;
      };
      com.popup = function(message){
     	 var element = '<div id="popup-dialog" class="dialog modal fade msg-popup"><div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-body text-center"></div></div></div></div>';  
     	 var $e ,inteval = null;
     	 if($('#popup-dialog').length>0){
     		 $e = $('#popup-dialog');
     	 }else{
     		 $e=$(element);
     		 $("body").append($e);
     	 }
     	 $e.find(".modal-body").html(message);
     	 $e.modal({show:!0,backdrop:!1});
   	     clearTimeout(inteval);
   	     inteval=setTimeout(function(){
   		   $e.modal("hide");
   	     },1500); 	 		   		
     };
}(common);