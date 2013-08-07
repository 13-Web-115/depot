// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
function menus(str){ 
	var obj; 
	// 返回 str 对象和 picId 对象是否存在 
	if (document.getElementById(str)){ 
		var strs = new Array("menu1_2", "menu1_3", "menu1_4", "menu1_5", "menu1_6", "menu1_7", "menu1_8");
		for (var i=0; i<strs.length; i++)
		{
			if (str != strs[i])
			{
				obj=document.getElementById(strs[i]); 
				obj.style.display = "none";
			}
		}
		obj=document.getElementById(str); //obj 为 DIV 对象 
		
		if (obj.style.display == "none"){ //如果DIV对象的 display 样式值为 none 的话 
			obj.style.display = ""; //就将 display 的样式清空 
			//pic.src = "0001.jpg"; //更改图片对象的路径 
		}
		else{ 
			obj.style.display = "none"; 
			//pic.src = "0000.jpg"; 
		} 
	} 
} 


 
function login(id){
	var $ID=function (id){
            var d=document.getElementById(id);
            if(!d){
                alert(id+" control object not exists!") ;
        	return false;
    	}else{
        return d;
    	}
	}
	var $this = $ID("a1");
	$ID("a3").onmousedown=function (e) {
	    var oe=e||window.event;
	    var startX = oe.clientX - $this.offsetLeft;
	    var startY = oe.clientY - $this.offsetTop;
	    document.onmousemove = function (e) {
	        var oe = e || window.event;
	        $this.style.left = oe.clientX - startX + "px";
	        $this.style.top = oe.clientY - startY + "px";
	            };
	            document.onmouseup = function () {
	                document.onmousemove = null;
	                document.onmouseup = null;
	                if ($this.releaseCapture) {
	                    $this.releaseCapture();
	                }
	            };
	            if ($this.setCapture)$this.setCapture();
	            return false;
	}
    if(id==1){
        $ID('a1').style.display='block';
		$ID('a2').style.display='block';
    }else{
    	if( id == 2){
    		$ID('a5').style.display='block';
        	$ID('a6').style.display='block';
    	}
    	else
    	{
    		$ID('a1').style.display='none';
       		$ID('a2').style.display='none';
       		$ID('a5').style.display='none';
       		$ID('a6').style.display='none';
       		$ID('a7').style.display='none';
       		$ID('a8').style.display='none';
    	}
        
    }
}