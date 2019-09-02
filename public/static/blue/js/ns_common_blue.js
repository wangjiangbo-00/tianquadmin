/**
 * 后台新界面
 */

$(function(){
	isShowAsideFooter();
})
window.onresize = function() {

	isShowAsideFooter();
};

// 控制左侧边栏的底部是否显示
function isShowAsideFooter() {
//	console.log( $(window).height())
	if($(".ns-base-aside nav li").length >= 20) {
		$(".ns-base-aside footer").hide();
	}else if($(window).height() <= 530){
		$(".ns-base-aside footer").hide();
	}else if($(".ns-base-aside nav li").length>8 && $(window).height()<770){
		$(".ns-base-aside footer").hide();
	}else {
		$(".ns-base-aside footer").show();
	}
}