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
		obj=document.getElementById(str); //obj 为 DIV 对象 
		//pic=document.getElementById(picId); //pic 为 图片对象 
		
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