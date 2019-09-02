/**
 * 省市县级联 2017年2月20日 15:05:46
 */

//加载省
function initProvince(obj){
	$.ajax({
		type : "post",
		url : "getProvince",
		dataType : "json",
		success : function(data) {
			if (data != null && data.length > 0) {
				var str = "";
				for (var i = 0; i < data.length; i++) {
					str += '<option value="'+data[i].province_id+'">'+data[i].province_name+'</option>';
				}
				$(obj).append(str);
			}
		}
	});
}

//选择省份弹出市区
function getProvince(obj,second) {
	var id = $(obj).find("option:selected").val();
	$.ajax({
		type : "post",
		url : "getCity",
		dataType : "json",
		data : {
			"province_id" : id
		},
		success : function(data) {
			if (data != null && data.length > 0) {
				var str = "<option value='-1'>请选择市</option>";
				for (var i = 0; i < data.length; i++) {
					str += '<option value="'+data[i].city_id+'">'+data[i].city_name+'</option>';
				}
				$(second).html(str);
			}
		}
	});
};

//选择市区弹出区域
function getSelCity(obj,second) {
	var id = $(obj).find("option:selected").val();
	$.ajax({
		type : "post",
		url : "getDistrict",
		dataType : "json",
		data : {
			"city_id" : id
		},
		success : function(data) {
			if (data != null && data.length > 0) {
				var str = "<option value='-1'>请选择区</option>";
				for (var i = 0; i < data.length; i++) {
					str += '<option value="'+data[i].district_id+'">'+data[i].district_name+'</option>';
				}
				$(second).html(str);
			}
		}
	});
}
//加载已选择项
function load(province_name, province_id, city_name, city_id, district_name, district_id){
	$.ajax({
		type : "post",
		url : "getProvince",
		dataType : "json",
		success : function(data) {
			if (data != null && data.length > 0) {
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if(province_id == data[i].province_id){
						str += '<option value="'+data[i].province_id+'" selected>'+data[i].province_name+'</option>';
					}else{
						str += '<option value="'+data[i].province_id+'">'+data[i].province_name+'</option>';
					}
				}
				$("select[name='"+province_name+"']").append(str);
			}
		}
	});
	$.ajax({
		type : "post",
		url : "getCity",
		dataType : "json",
		data : {
			"province_id" : province_id
		},
		success : function(data) {
			if (data != null && data.length > 0) {
				var str1 = "<option value='-1'>请选择市</option>";
				for (var i = 0; i < data.length; i++) {
					if(city_id == data[i].city_id){
						str1 += '<option value="'+data[i].city_id+'" selected>'+data[i].city_name+'</option>';
					}else{
						str1 += '<option value="'+data[i].city_id+'">'+data[i].city_name+'</option>';
					}
				}
				$("select[name='"+city_name+"']").html(str1);
			}
		}
	});
	$.ajax({
		type : "post",
		url : "getDistrict",
		dataType : "json",
		data : {
			"city_id" : city_id
		},
		success : function(data) {
			if (data != null && data.length > 0) {
				var str2 = "<option value='-1'>请选择区</option>";
				for (var i = 0; i < data.length; i++) {
					if(district_id == data[i].district_id){
						str2 += '<option value="'+data[i].district_id+'" selected>'+data[i].district_name+'</option>';
					}else{
						str2 += '<option value="'+data[i].district_id+'">'+data[i].district_name+'</option>';
					}
				}
				$("select[name='"+district_name+"']").html(str2);
			}
		}
	});
}