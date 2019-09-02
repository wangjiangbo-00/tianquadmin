/**
 * Niushop商城系统 - 团队十年电商经验汇集巨献!
 * =========================================================
 * Copy right 2015-2025 山西牛酷信息科技有限公司, 保留所有权利。
 * ---------------------------------------------- 官方网址:
 * http://www.niushop.com.cn 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用。
 * 任何企业和个人不允许对程序代码以任何形式任何目的再发布。
 * =========================================================
 * 
 * @author : 小学生王永杰
 * @date : 2016年12月16日 16:17:13
 * @version : v1.0.0.0 商品发布中的第二步，编辑商品信息
 */
$(function() {
	if(parseInt($("#goodsId").val()) > 0){
		if(parseInt($("#specType").val()) == 0 ){
			//编辑商品时，有些商品没有选择商品类型
			$("#specType").attr("data-flag",1);//标识 0：表示添加商品，1：表示编辑商品，商品分类为0,2：表示编辑商品，商品分类不为0
			getGoodsSpecListNotAttrId();
		}else{
			$("#specType").attr("data-flag",2);//标识 0：表示添加商品，1：表示编辑商品，商品分类为0,2：表示编辑商品，商品分类不为0
			getGoodsSpecListByAttrId($("#specType").val(),function(){
				editSkuData(goods_spec_format,sku_list);
				//加载属性
				$(".js-goods-sku-attribute tr").each(function(){
					var value = $(this).children("td:first").attr("data-value");//商品属性名称
					var value_name = $(this).children("td:last");//具体的属性值
					if(value != undefined && value != ""){
						for(var i=0;i<goods_attribute_list.length;i++){
							var curr = goods_attribute_list[i];
							if(curr['attr_value'] == value){
								switch(value_name.find("input").attr("type")){
									case "text":
										value_name.find("input").val(curr['attr_value_name']);
										break;
									case "radio":
										value_name.find("input").each(function(){
											if($.trim($(this).val()) == $.trim(curr['attr_value_name'])){
												$(this).attr("checked","checked");
												return false;
											}
										})
										break;
									case "checkbox":
										value_name.find("input").each(function(){
											if($.trim($(this).val()) == $.trim(curr['attr_value_name'])){
												$(this).attr("checked","checked");
											}
										})
										break;
								}
								if(value_name.find("input").attr("type") != "checkbox"){
									break;
								}
							}
						}
					}
				});
			});
		}
	}else{
		$("#specType").attr("data-flag",0);//标识 0：表示添加商品，1：表示编辑商品，商品分类为0,2：表示编辑商品，商品分类不为0
		getGoodsSpecListByAttrId($("#specType").val());
	}
	
	
	/**
	 * 根据选择的商品类型，查询规格属性
	 * 2017年6月6日 11:46:45 王永杰
	 */
	$("#specType").change(function(){
		goodsTypeChangeData();
		getGoodsSpecListByAttrId($(this).val());
		if(parseInt($(this).val()) == 0){
//			//如果没有选择商品类型，则清空属性信息
			$(".js-goods-attribute-block").hide();
			$(".js-goods-sku-attribute").html("");
		}
	});
	
	
	/**
	 * 添加商品规格属性
	 * 2017年6月6日 19:39:33 王永杰
	 */
	$(".js-goods-spec-add").live("click",function(){
//		if(parseInt($("#goodsType").val())>0){
			OpenSkuDialog(ADMINMAIN,parseInt($("#specType").val()));
			//回调函数：addGoodsSpecCallBack
//		}
	});
	
	
	/**
	 * 规格值添加，生成规格值输入框，进行添加操作
	 * 2017年6月6日 09:46:46 王永杰
	 */
	$(".js-goods-spec-value-add").live("click",function(){
		if($(this).attr("data-flag") == undefined){
			$(".js-goods-spec-value-add").html("添加规格值").removeAttr("data-flag style");
			
			var spec_id = $(this).attr("data-spec-id");
			var show_type = $(this).attr("data-show-type");//显示方式
			var html = '<input type="text" placeholder="请输入规格值" style="margin-bottom:0px;">';
			var length = $(this).parent().children("article").length;//当前规格的规格值数量，用于设置图片上传的id，不冲突
			switch(parseInt(show_type)){
				case 1:
					//文字
					break;
				case 2:
					//颜色
					html += '<input type="color" style="width: 20px; margin-bottom:0px;" >';
					break;
				case 3:
					//图片
					var time = spec_id+getDate();
					html += '<div class="js-goods-spec-value-img dynamic-goods-sku-item" style="margin:0 5px;">';
					html += '<input type="file" name="file_upload" id="uploadImg'+time+'_add" onchange="imgUpload(this)" style="margin-bottom:0px;">';
					html += '<input id="goods_spec_value'+time+'_add" type="hidden" style="margin-bottom:0px;">';
					html += '<img src="'+ADMINIMG+'/goods/goods_sku_add.png" id="imggoods_spec_value'+time+'_add">';
					html += '</div>';
					break;
			}
			html += '<span class="goods-sku-add" style="margin:0 10px;">确定</span>';
			html += '<span class="goods-sku-cancle">取消</span>';
			$(this).css("background","#DBDBDB");
			$(this).attr("data-flag",1);
			$(this).html(html);
			$(this).children("input[type='text']").focus();
		}
	});
	
	/**
	 * 规格值添加
	 * 2017年6月6日 10:20:31 王永杰
	 */
	$(".js-goods-spec-value-add>input").live("keyup",function(event){
		var curr_obj = $(this).parent();
		var spec_value_name = curr_obj.children("input[type='text']").val();
		if(event.keyCode == 13){
			
			if(spec_value_name.length != 0){
				
				var show_type = curr_obj.attr("data-show-type");
				var spec_value_data = "";//附加值
				switch(parseInt(show_type)){
					case 1:
						//文字
						break;
					case 2:
						//获取颜色
						spec_value_data = curr_obj.children("input[type='color']").val();
						break;
					case 3:
						//获取图片路径
						spec_value_data = curr_obj.children(".js-goods-spec-value-img").children("input[type='hidden']").val();
						break;
				}
				var spec_value = { 
					spec_id : curr_obj.attr("data-spec-id"), //规格id
					spec_name : curr_obj.attr("data-spec-name"),//规格名称
					show_type : show_type,//展示方式
					spec_value_name : spec_value_name, //规格值 
					spec_value_data : spec_value_data  //附加值
				};
				addGoodsSpecValue(spec_value,function(){
					curr_obj.parent().append(getCurrentSpecValueHTML(spec_value));//加载当前添加的规格值、以及最后那个添加按钮
					curr_obj.remove();//删除当前的添加按钮
				});
				
			}else{
				showTip("请输入规格值","warning");
			}
		}
		return false;//防止事件冒泡
	});
	
	/**
	 * 添加规格值：确定操作
	 * 2017年6月6日 11:37:56 王永杰
	 */
	$(".js-goods-spec-value-add>span:first").live("click",function(){
		var curr_obj = $(this).parent();
		var spec_value_name =  curr_obj.children("input[type='text']").val();
		if(spec_value_name.length!=0){
			
			var show_type = curr_obj.attr("data-show-type");
			var spec_value_data = "";//附加值
			switch(parseInt(show_type)){
				case 1:
					//文字
					break;
				case 2:
					//获取颜色
					spec_value_data = curr_obj.children("input[type='color']").val();
					break;
				case 3:
					//获取图片路径
					spec_value_data = curr_obj.children(".js-goods-spec-value-img").children("input[type='hidden']").val();
					break;
			}
			var spec_value = { 
				spec_id : curr_obj.attr("data-spec-id"), //规格id
				spec_name : curr_obj.attr("data-spec-name"),//规格名称
				show_type : show_type,//展示方式
				spec_value_name : spec_value_name, //规格值 
				spec_value_data : spec_value_data  //附加值
			};
			addGoodsSpecValue(spec_value,function(){
				curr_obj.parent().append(getCurrentSpecValueHTML(spec_value));//加载当前添加的规格值、以及最后那个添加按钮
				curr_obj.remove();//删除当前的添加按钮
			});
			
		}else{
			showTip("请输入规格值","warning");
		}
		return false;//防止事件冒泡
	})
	
	/**
	 * 添加规格值：取消操作
	 * 2017年6月6日 11:34:19 王永杰
	 */
	$(".js-goods-spec-value-add>span:last").live("click",function(){
		$(this).parent().removeAttr("style data-flag").html("添加规格值");
		return false;//防止事件冒泡
	})
	
	/**
	 * 修改商品规格信息
	 * 2017年6月6日 11:34:10 王永杰
	 * 
	 */
	$(".goods-sku-item span").live("dblclick",function(){
		var text = $(this).text();
		if(text != ""){
			$(this).empty();//清空当前规格值的文本内容
			var html = '<input type="text" value="'+text+'" data-flag="update_sku_text" data-old-html="'+text+'" />';
			$(html).appendTo($(this));//添加输入框
			$(this).css("padding","7px 10px");//调整样式
			$(this).children("input[type='text']").focus();
		}

		if(timeoutID != null){
			clearTimeout(timeoutID);
		}
	});

	
	/**
	 * 更新规格值
	 * 2017年6月6日 11:34:13 王永杰
	 */
	$("input[data-flag='update_sku_text']").live("keyup",function(event){
		var curr_obj = $(this);
		var spec_value_name = $.trim(curr_obj.val());

		if(event.keyCode == 13 ){
			
			if(spec_value_name.length !=0){
				var spec_value_id = curr_obj.parent().attr("data-spec-value-id");
				//输入框的内容与之间的规格值不一等，进行修改，否则关闭输入框
				if(spec_value_name != curr_obj.attr("data-old-html")){
					

//					showTip("修改成功","success");
					var spec={
							flag : curr_obj.parent().hasClass("selected"),
							spec_id : curr_obj.parent().attr("data-spec-id"),
							spec_name : curr_obj.parent().attr("data-spec-name"),
							spec_value_id : spec_value_id,
							spec_value_name : spec_value_name,
							spec_show_type : curr_obj.parent().attr("data-spec-show-type") 
					};
					curr_obj.parent().html(spec_value_name).css("padding","7px 20px");//给规格值文本赋值
					editSpecValueName(spec);
					
					
//					$.ajax({
//						url : "modifyGoodsSpecValueField",
//						type : "post",
//						data : { "spec_value_id" :spec_value_id, "field_name" : "spec_value_name", "field_value" : spec_value_name },
//						success : function(res){
//							if(res.code>0){
//								showTip(res.message,"success");
//								var spec={
//										flag : curr_obj.parent().hasClass("selected"),
//										spec_id : curr_obj.parent().attr("data-spec-id"),
//										spec_name : curr_obj.parent().attr("data-spec-name"),
//										spec_value_id : spec_value_id,
//										spec_value_name : spec_value_name,
//										spec_show_type : curr_obj.parent().attr("data-spec-show-type") 
//								};
//								editSpecValueName(spec);
//								curr_obj.parent().text(spec_value_name).css("padding","7px 20px");//给规格值文本赋值
//								curr_obj.remove();//删除当前的输入框
//							}else{
//								showTip(res.message,"error");
//							}
//						}
//					});
					
					
				}else{
					curr_obj.parent().html(spec_value_name).css("padding","7px 20px");//给规格值文本赋值
				}
				
			}else{
				showTip("请输入规格值","warning");
			}
		}
		return false;//防止重复提交
	}).live("click",function(){
		return false;//防止重复提交
	}).live("blur",function(){
		var curr_obj = $(this);
		var spec_value_name = $.trim(curr_obj.val());
		var spec_value_id = curr_obj.parent().attr("data-spec-value-id");
		if(spec_value_name != curr_obj.attr("data-old-html")){
			var spec={
					flag : curr_obj.parent().hasClass("selected"),
					spec_id : curr_obj.parent().attr("data-spec-id"),
					spec_name : curr_obj.parent().attr("data-spec-name"),
					spec_value_id : spec_value_id,
					spec_value_name : spec_value_name,
					spec_show_type : curr_obj.parent().attr("data-spec-show-type") 
			};
			curr_obj.parent().html(spec_value_name).css("padding","7px 20px");//给规格值文本赋值
			editSpecValueName(spec);
		}else{
			curr_obj.parent().html(spec_value_name).css("padding","7px 20px");//给规格值文本赋值
		}
	});
	
	/**
	 * 修改颜色对应的修改SKU数据
	 */
	$(".js-goods-sku .goods-sku-item input[type='color']").live("change",function(){
		var span = $(this).parent().parent().children("span");
		var spec = {
			flag : span.hasClass("selected"),
			spec_id : span.attr("data-spec-id"),
			spec_name : span.attr("data-spec-name"),
			spec_value_id : span.attr("data-spec-value-id"),
			spec_value_data : $(this).val()
		};
		editSpecValueData(spec);
	});
	
	
	
	/**
	 * 鼠标浮上图片，显示
	 * 2017年6月6日 19:01:13
	 */
	$(".goods-sku-item div[class='js-goods-spec-value-img']").live("mouseenter",function(){
		var curr = $(this);
		if(curr.children("input[type='hidden']").val() != ""){
			var src = UPLOAD+"/"+curr.children("input[type='hidden']").val();
			var contents = '<img src="'+src+'" style="width: 100%;height: auto;display:block;margin:0 auto;">';
//			if(isResourcesExist(src) && curr.attr("data-img-exist") == 1){
//				curr.attr("data-img-exist",1);
				//鼠标每次浮上图片时，要销毁之前的事件绑定
				curr.popover("destroy");
				
				//重新配置弹出框内容
				curr.popover({ content : contents });
				
				//显示
				curr.popover("show");
//			}
		}
	});
	
	/**
	 * 鼠标离开图片时，隐藏
	 * 2017年6月6日 19:01:16 王永杰
	 */
	$(".goods-sku-item").live("mouseleave",function(){
		var curr = $(this).children("div[class='js-goods-spec-value-img']");
		if(curr.children("input[type='hidden']").val() != ""){
			
			curr.popover("hide");
		}
	});
	
	
	
	//***********************************选择运费方式***********************************
	$("input[name='fare']").change(function() {
		if ($("input[name='fare']:checked").val() == 1) {
			//$("#deliveryDiv").show();
			$("#commodity-weight").show();
			$("#commodity-volume").show();
			$("#valuation-method").show();
		} else {
			//$("#deliveryDiv").show();
			$("#commodity-weight").hide();
			$("#commodity-volume").hide();
			$("#valuation-method").hide();
		}
	});
	//***********************************选择运费方式***********************************
	
	//***********************************选择积分兑换***********************************
	$("input[name='integralSelect']").change(function() {
		if ($("input[name='integralSelect']:checked").val() == 1) {
			$("#integral-exchange").show();
		} else {
			$("#integral-exchange").hide();
		}
	});
	//***********************************选择积分兑换***********************************
	
	
	/**
	 * 循环处理价格 不让价格为空
	 */
	$('input[name="sku_price"],input[name="market_price"],input[name="cost_price"],input[name="stock_num"]').live('keyup',function() {
		var $this = $(this);
		var reg = /^\d+(.{0,1})\d{0,2}$/;
		if($this.val().length>0){
			if(reg.test($this.val())){
				if ($this.val().replace(/(^\s*)|(\s*$)/g, "") == "" || $this.val().replace(/(^\s*)|(\s*$)/g, "") == "0.00") {
					if($this.attr("name") == "stock_num"){
						$this.val("0");
					}else{
						$this.val("0.00");
						
					}
					$this.css("border-color", "#b94a48");
					$this.parent().find(".help-inline").show();
				} else {
					num = parseInt($this.val());
					$this.css("border-color", "");
					$this.parent().find(".help-inline").hide();
				}
				switch($this.attr("name")){
				case "sku_price":
					eachPrice();
					break;
				case "market_price":
					eachMarketPrice();
					break;
				case "cost_price":
					eachCostPrice();
					break;
				case "stock_num":
					break;
					eachInput();
				}
			}else{
				if($this.attr("name") == "stock_num"){
					$this.val("0");
				}else{
					$this.val("0.00");
					
				}
			}
		}else{
			if($this.attr("name") == "stock_num"){
				$this.val("0");
			}else{
				$this.val("0.00");
				
			}
		}

	});
	
	
	/**
	 * 循环 处理库存
	 */
	$('input[name="stock_num"]').live('keyup', function() {
		$stock = $(this);
		if ($stock.val().replace(/(^\s*)|(\s*$)/g, "") == "") {
			$stock.css("border-color", "#b94a48");
			$stock.parent().find(".help-inline").show();
		} else {
			$stock.css("border-color", "");
			$stock.parent().find(".help-inline").hide();
		}
		eachInput();
	});


	
	$(".brick.small").live('mouseover', function() {
		$(this).children().next().show();
	}).live("mouseout", function() {
		$(this).children().next().hide();
	});

	// 批量设置
	var js_batch_type = '';
	var shop_type = $("#shop_type").val();
	$('.js-batch-price').live('click', function() {
		if (shop_type == 2 || (shop_type == 1 && goodsid == 0)) {
			js_batch_type = 'price';
			$('.js-batch-form').show();
			$('.js-batch-type').hide();
			$('.js-batch-txt').attr('placeholder', '请输入价格');
			$('.js-batch-txt').focus();
		}
	});

	$(".js-batch-market_price").live("click", function() {
		if (shop_type == 2 || (shop_type == 1 && goodsid == 0)) {
			js_batch_type = 'market_price';
			$('.js-batch-form').show();
			$('.js-batch-type').hide();
			$('.js-batch-txt').attr('placeholder', '请输入市场价');
			$('.js-batch-txt').focus();
		}
	});

	$(".js-batch-cost_price").live("click", function() {
		if (shop_type == 2 || (shop_type == 1 && goodsid == 0)) {
			js_batch_type = 'cost_price';
			$('.js-batch-form').show();
			$('.js-batch-type').hide();
			$('.js-batch-txt').attr('placeholder', '请输入成本价');
			$('.js-batch-txt').focus();
		}
	});

	$('.js-batch-stock').live('click', function() {
		if (shop_type == 2 || (shop_type == 1 && goodsid == 0)) {
			js_batch_type = 'stock';
			$('.js-batch-form').show();
			$('.js-batch-type').hide();
			$('.js-batch-txt').attr('placeholder', '请输入库存');
			$('.js-batch-txt').focus();
		}
	});
	
	$('.js-batch-save').live('click',function() {
		var batch_txt = $('.js-batch-txt');
		if (batch_txt.val() != null && batch_txt.val() != '') {
			var float_val = parseFloat(batch_txt.val());
			if (js_batch_type == 'price') {
				if (float_val > 9999999.99) {
					showTip('价格最大为 9999999.99','warning');
					batch_txt.focus();
					return false;
				} else if (!/^\d+(\.\d+)?$/.test(batch_txt.val())) {
					showTip('请输入合法的价格',"warning");
					batch_txt.focus();
					return false;
				} else {
					batch_txt.val(float_val.toFixed(2));
				}
				$('.js-goods-stock .js-price').val(batch_txt.val());
				batch_txt.val('');
				// 商品价格
				$("input[name='price']").val(float_val.toFixed(2));
				$.each($temp_Obj,function(c,v){			
					v["sku_price"] =float_val.toFixed(2);
				});
				$("input[name='price']").attr('readonly', true);
				eachPrice();
			} else if (js_batch_type == 'market_price') {// 市场价
				if (float_val > 9999999.99) {
					showTip('价格最大为 9999999.99','warning');
					batch_txt.focus();
					return false;
				} else if (!/^\d+(\.\d+)?$/.test(batch_txt.val())) {
					showTip('请输入合法的价格','warning');
					batch_txt.focus();
					return false;
				} else {
					batch_txt.val(float_val.toFixed(2));
				}
				$('.js-goods-stock .js-market-price').val(batch_txt.val());
				$.each($temp_Obj,function(c,v){			
					v["market_price"] =float_val.toFixed(2);
				});
				batch_txt.val('');
				eachMarketPrice();
			} else if (js_batch_type == 'cost_price') {// 成本价
				if (float_val > 9999999.99) {
					showTip('价格最大为 9999999.99','warning');
					batch_txt.focus();
					return false;
				} else if (!/^\d+(\.\d+)?$/.test(batch_txt.val())) {
					showTip('请输入合法的价格','warning');
					batch_txt.focus();
					return false;
				} else {
					batch_txt.val(float_val.toFixed(2));
				}
				$('.js-goods-stock .js-cost-price').val(batch_txt.val());
				batch_txt.val('');
				// 商品价格
				$("input[name='price']").val(float_val.toFixed(2));
				$("input[name='price']").attr('readonly', true);
				$.each($temp_Obj,function(c,v){			
					v["cost_price"] =float_val.toFixed(2);
				});
				eachCostPrice();
			} else {
				if (!/^\d+$/.test(batch_txt.val())) {
					showTip('请输入合法的数字',"warning");
					batch_txt.focus();
					return false;
				}
				$('.js-goods-stock .js-stock-num').val(batch_txt.val());
				eachInput();
				$.each($temp_Obj,function(c,v){			
					v["stock_num"] =float_val.toFixed(2);
				});
				$('input[name="total_stock"]').val(parseInt(batch_txt.val())* $('.js-stock-num').size());
				batch_txt.val('');
			}
			$('.js-batch-form').hide();
			$('.js-batch-type').show();
		} else {
			showTip(batch_txt.attr("placeholder"),'warning');
			batch_txt.focus();
		}
	});
	
	$('.js-batch-cancel').live('click', function() {
		$('.js-batch-form').hide();
		$('.js-batch-type').show();
	});
	
	//***********************************选择商品分组***********************************
	$("#area-select,#procategory").on("mouseover", function() {
		$("#procategory").show();
	})

	$("#area-select,#procategory").on("mouseout", function() {
		$("#procategory").hide();
	})

	$(".input-checked").each(function(index, element) {
		if ($(this).prop("checked")) {
			$("#productcategory-selected").append("<span class='label'>" + $(this).val() + "<i class='categoryclose'></i></span>");
		}
	});
	$(".input-checked").live("change",function() {
		var $this = $(this);
		if ($this.prop("checked")) {
			$("#productcategory-selected").append("<span class='label' id=" + $(this).attr("id") + ">" + $this.val() + "<i class='categoryclose'></i></span>");
		} else {
			$("#productcategory-selected span").each(function() {
				if ($this.val() == $(this).text()) {
					$(this).remove();
				}
			});
		}
	});
	
	$("#productcategory-selected").delegate(".categoryclose","click",function() {
		var $this = $(this);
		$(this).parentsUntil("#productcategory-selected").remove();
		$("#procategory li").each(function(index, element) {
			if ($this.parent().text() == $(this).find(".input-checked").val()) {
				$(this).find(".input-checked").prop("checked",false);
			}
		});
	});
	//***********************************选择商品分组***********************************
	
	
	/**
	 * 选择类目、扩展类目
	 * 2017年6月30日 15:15:20 王永杰
	 */
	$("#tbcNameCategory,#tbcExtendNameCategory").live("click",function(){
		var goodsid = $(this).attr("data-goods-id");
		var category_id = $(this).attr("cid");
		var flag = $(this).attr("data-flag");
		OpenCategoryDialog(ADMINMAIN,category_id,goodsid,flag);
	});
	
	
	//判断导航栏位置
	var width = (document.body.clientWidth-1200)/2;
	if(width >90){
		$("#fixedNavBar").show();
		$("#fixedNavBar").css("left","57%")
	}else{
		$("#fixedNavBar").show();
		$("#fixedNavBar").css("right","2%")
	}
	
	/**
	 * 页面导航
	 * 2017年6月30日 16:11:50 王永杰
	 */
	$("#fixedNavBar li").click(function(){
		var obj = "."+$(this).attr("data-floor");
		var top = $(obj).offset().top;
		$("html, body").animate({ scrollTop: top }, {duration: 500,easing: "swing"});
	});
	
	

});


/**
 * 添加规格属性，回调函数
 * 2017年6月6日 12:10:37 王永杰
 */
function addGoodsSpecCallBack(spec_id,spec_name,show_type){
	showTip("操作成功","success");
	var spec = {
		spec_id : spec_id,
		spec_name : spec_name,
		show_type : show_type
	}
	var html = '<tr>';
		html += '<td width="10%">'+spec_name+'</td>';
		html += '<td width="85%">';
			html += getAddSpecValueHtml(spec);
		html += '</td>';
	html += '</tr>';
	html += '<tr><td>'+getAddSpecHtml()+'</td></tr>';
	$(".js-goods-sku tbody tr:last").remove();
	$(".js-goods-sku tbody").append(html);
}

/**
 * 返回当前添加完成后，生成的规格值HTML代码
 * 2017年6月7日 14:48:27
 */
function getCurrentSpecValueHTML(spec_value){
	var html = '<article class="goods-sku-item">';
			html += '<span data-spec-name="'+spec_value.spec_name+'"';
			html += 'data-spec-id="'+spec_value.spec_id+'" ';
			if(parseInt(spec_value.show_type) == 2 && spec_value.spec_value_data == ""){
				spec_value.spec_value_data = "#000000";
			}
			html += ' data-spec-value-data="' + spec_value.spec_value_data + '"';
			html += ' data-spec-show-type="' + spec_value.show_type + '"';
			html += 'data-spec-value-id="-1">';
			html += spec_value.spec_value_name+'</span>';
	switch(parseInt(spec_value.show_type)){
		case 1:
			//文字
			break;
		case 2:
			//颜色
			html += '&nbsp;<i></i>&nbsp;';
			html += '<div>';
				html += '<input type="color" value="'+spec_value.spec_value_data+'" >';
			html += '</div>';
			break;
		case 3:
			//图片
			var time = spec_value.spec_id + getDate();
			html += '&nbsp;<i></i>&nbsp;';
			html += '<div class="js-goods-spec-value-img" data-html="true" data-container="body" data-placement="top" data-trigger="manual">';
				html += '<input type="file" name="file_upload" id="uploadImg'+time+'_add" onchange="imgUpload(this)">';
				if(spec_value.spec_value_data != ""){
					html += '<input type="hidden" id="spec_value'+time+'_add" value="'+spec_value.spec_value_data+'" >';
					html += '<img src="'+UPLOAD+"/"+spec_value.spec_value_data+'" id="imgspec_value'+time+'_add">';
				}else{
					html += '<input type="hidden" id="spec_value'+time+'_add" >';
					html += '<img src="'+ADMINIMG+'/goods/goods_sku_add.png" id="imgspec_value'+time+'_add">';
				}
			html += '</div>';
			break;
	}
	html += '</article>';
	html += getAddSpecValueHtml(spec_value);
	return html;
}


/**
 * 返回添加规格值THML代码
 * 2017年6月7日 14:26:31 王永杰
 */
function getAddSpecValueHtml(spec){
	var html = '<a href="javascript:;" data-spec-name="'+spec.spec_name+'" data-spec-id="'+spec.spec_id+'" data-show-type="'+spec.show_type+'" class="js-goods-spec-value-add goods-sku-add-text">添加规格值</a>';
	return html;
}

/**
 * 返回添加规格HTML代码
 * 2017年6月7日 14:25:10 王永杰
 */
function getAddSpecHtml(){
	var html ='<a href="javascript:;" class="js-goods-spec-add goods-sku-add-text" style="padding:0;">添加规格</a>';
	return html;
}

/**
 * 添加商品规格值
 * 2017年6月6日 11:39:16 王永杰
 * @param spec 规格对象
 * @param callBack 回调函数
 */
function addGoodsSpecValue(spec,callBack){
	$.ajax({
		url : "addGoodsSpecValue",
		type : "post",
		data : { "spec_id" : spec.spec_id, "spec_value_name" : spec.spec_value_name, "spec_value_data" : spec.spec_value_data },
		success : function(res){
			if(res.code>0){
				showTip(res.message,"success");
				callBack();//执行回调函数
				$("span[data-spec-value-id='-1']").attr("data-spec-value-id",res.code);
			}else{
				showTip(res.message,"error");
			}
		}
	});
}

/**
 * 获取规格表头提示
 * 2017年6月14日 09:22:46
 * @returns {String}
 */
function getGoodsSpecHeaderHtml(){
	var html = '<tr>';
		html += '<td colspan="2">';
			html += '<div style="text-align:left;;">';
				html += '<h5 style="margin:0;padding:0;font-weight: normal;color: #FF8400;">操作提示</h5>';
				html += '<p style="color:#FF8400;font-size:12px;">1、双击规格值进行编辑操作(回车按钮保存)。</p>';
				html += '<p style="color:#FF8400;font-size:12px;">2、鼠标浮上图片时，可以进行预览。</p>';
			html += '</div>';
		html += '</td>';
	html += '</tr>';
	return html;
}



function getGoodsSpecListNotAttrId(){
	if(goods_spec_format == ""){
		return;
	}

	goods_spec_format = eval(goods_spec_format);
	var html = getGoodsSpecHeaderHtml();
	var spec_length = goods_spec_format.length;
	var spec_list = goods_spec_format;
	for(var i=0;i<spec_length;i++){
		
		var curr_spec = spec_list[i];
		html += '<tr class="js-spec-item">';
			html += '<td width="10%">' + curr_spec.spec_name + "</td>";
			html += '<td width="85%">';
		
			for(var j=0;j<curr_spec.value.length;j++){
				var curr_spec_value = curr_spec.value[j];
				html += '<article class="goods-sku-item">';
				
					html += '<span data-spec-name="'+curr_spec.spec_name+'"';
					html += ' data-spec-id="'+curr_spec.spec_id+'"';
					if(parseInt(curr_spec.show_type) == 2 && curr_spec_value.spec_value_data == ""){
						curr_spec_value.spec_value_data = "#000000";
					}
					html += ' data-spec-value-data="' + curr_spec_value.spec_value_data + '"';
					html += ' data-spec-show-type="' + curr_spec_value.spec_show_type + '"';
					html += ' data-spec-value-id="'+curr_spec_value.spec_value_id+'">';
					html += curr_spec_value.spec_value_name + "</span>";
					
					
					//显示方式
					switch(parseInt(curr_spec.show_type)){
						case 1:
							//文字
							break;
						case 2:
							//颜色
							html += '&nbsp;<i></i>&nbsp;';
							html += '<div>';
							html += '<input type="color" name="goods_spec_value'+(i+j)+'" value="'+curr_spec_value.spec_value_data+'">';
							html += '</div>';
							break;
						case 3:
							//图片
							var index = curr_spec.spec_id + curr_spec_value.spec_value_id;
							html += '&nbsp;<i></i>&nbsp;';
							html += '<div class="js-goods-spec-value-img" data-html="true" data-container="body" data-placement="top" data-trigger="manual">';
							html += '<input type="file" id="uploadImg'+index+'" name="file_upload" onchange="imgUpload(this)"/>';
							html += '<input type="hidden" id="goods_sku'+index+'" value="'+curr_spec_value.spec_value_data+'" >';
							if(curr_spec_value.spec_value_data != ""){
								html += '<img src="'+UPLOAD+'/'+curr_spec_value.spec_value_data+'" id="imggoods_sku'+index+'"/>';
							}else{
								html += '<img src="'+ADMINIMG+'/goods/goods_sku_add.png"  id="imggoods_sku'+index+'"/>';
							}
							html += '</div>';
							break;
					}
				
				html += '</article>';
				
			}
			var spec = {
				spec_id : curr_spec.spec_id,
				spec_name : curr_spec.spec_name,
				show_type : curr_spec.value[0]["spec_show_type"]
			};
			html += getAddSpecValueHtml(spec);//添加规格值按钮
			html += '</td>';
		html += '</tr>';
	}
	
	html += '<tr>';
	if(spec_length == 0){
		html += '<td class="js-spec-add"  style="text-align:left;">'+getAddSpecHtml()+'</td>';//规格添加
	}else{
		html += '<td class="js-spec-add">'+getAddSpecHtml()+'</td>';//规格添加
	}
		html += '<td></td>';
	html += '</tr>';
	
	$(".js-goods-spec-block").show();
	$(".js-goods-sku").html(html);
	editSkuData(goods_spec_format,sku_list);
}


/**
 * 根据商品类型id，查询商品规格信息
 * 2017年6月6日 11:38:47 王永杰
 * @param attr_id 规格属性id
 */ 
function getGoodsSpecListByAttrId(attr_id,callBack){
	if(!isNaN(attr_id) && attr_id > 0){
		$.ajax({
			url : "getGoodsSpecListByAttrId",
			type : "post",
			data : { "attr_id" : parseInt(attr_id)},
			success : function(res){
				if(res !=-1){
					
					var html = getGoodsSpecHeaderHtml();
					var spec_length = res.spec_list.length;
					var attribute_length = res.attribute_list.length;
					//商品规格集合
					if(spec_length>0){
						
						for(var i=0;i<spec_length;i++){
							
							var curr_spec = res.spec_list[i];
							html += '<tr class="js-spec-item">';
								html += '<td width="10%">' + curr_spec.spec_name + "</td>";
								html += '<td width="85%">';
							
								for(var j=0;j<curr_spec.values.length;j++){
									var curr_spec_value = curr_spec.values[j];
									html += '<article class="goods-sku-item">';
									
										html += '<span data-spec-name="'+curr_spec.spec_name+'"';
										html += ' data-spec-id="'+curr_spec.spec_id+'"';
										if(parseInt(curr_spec.show_type) == 2 && curr_spec_value.spec_value_data == ""){
											curr_spec_value.spec_value_data = "#000000";
										}
										html += ' data-spec-value-data="' + curr_spec_value.spec_value_data + '"';
										html += ' data-spec-show-type="' + curr_spec.show_type + '"';
										html += ' data-spec-value-id="'+curr_spec_value.spec_value_id+'">';
										html += curr_spec_value.spec_value_name + "</span>";
										
										//显示方式
										switch(parseInt(curr_spec.show_type)){
											case 1:
												//文字
												break;
											case 2:
												//颜色
												html += '&nbsp;<i></i>&nbsp;';
												html += '<div>';
												html += '<input type="color" name="goods_spec_value'+(i+j)+'" value="'+curr_spec_value.spec_value_data+'">';
												html += '</div>';
												break;
											case 3:
												//图片
												var index = curr_spec.spec_id + curr_spec_value.spec_value_id;
												html += '&nbsp;<i></i>&nbsp;';
												html += '<div class="js-goods-spec-value-img" data-html="true" data-container="body" data-placement="top" data-trigger="manual">';
												html += '<input type="file" id="uploadImg'+index+'" name="file_upload" onchange="imgUpload(this)"/>';
												html += '<input type="hidden" id="goods_sku'+index+'" value="'+curr_spec_value.spec_value_data+'" >';
												if(curr_spec_value.spec_value_data != ""){
													html += '<img src="'+UPLOAD+'/'+curr_spec_value.spec_value_data+'" id="imggoods_sku'+index+'"/>';
												}else{
													html += '<img src="'+ADMINIMG+'/goods/goods_sku_add.png"  id="imggoods_sku'+index+'"/>';
												}
												html += '</div>';
												break;
										}
									
									html += '</article>';
									
								}
								var spec = {
									spec_id : curr_spec.spec_id,
									spec_name : curr_spec.spec_name,
									show_type : curr_spec.show_type
								};
								html += getAddSpecValueHtml(spec);//添加规格值按钮
								html += '</td>';
							html += '</tr>';
						}
						
						html += '<tr>';
							html += '<td class="js-spec-add">'+getAddSpecHtml()+'</td>';//规格添加
							html += '<td></td>';
						html += '</tr>';
						$(".js-goods-sku").html(html);
					}else{
						$(".js-goods-sku tr.js-spec-item").remove();
						$(".js-goods-sku tr .js-spec-add").css("text-align","left");
					}
					//商品属性集合
					if(attribute_length>0){
						var html ="";
						for(var i=0;i<attribute_length;i++){
							var curr = res.attribute_list[i];
							if($.trim(curr.value_items) == "" && parseInt(curr.type) !=1){
								continue;
							}
							if($.trim(curr.attr_value_name) != ""){
								
							
							html += '<tr style="padding-top:15px;padding-bottom:15px;">';
								html += '<td width="10%" style="border:1px solid #E9E9E9;"align="right" class="txt12" data-value="'+curr.attr_value_name+'">'+curr.attr_value_name+'</td>';
								html += '<td width="80%" style="border:1px solid #E9E9E9;">';
									switch(parseInt(curr.type)){
										case 1:
											//输入框
											html += '<input type="text" class="js-attribute-text" id="input-text-'+curr.attr_value_id+'-'+curr.attr_value_id+'"data-attribute-value-id="'+curr.attr_value_id+'" data-attribute-value="'+curr.attr_value_name+'" />';
											break;
										case 2:
											//单选框
											for(var j=0;j<curr.value_items.length;j++){
												var value = curr.value_items[j];
												if($.trim(value) != ""){
													html += '<div class="goods-sku-attribute-item-radio">';
														html += '<input type="radio" value="'+value+'" class="js-attribute-radio" id="radio_value_item'+curr.attr_value_id+'-'+j+'" data-attribute-value-id="'+curr.attr_value_id+'" data-attribute-value="'+curr.attr_value_name+'"  name="radio_value'+i+'" />&nbsp;';
														html += '<label for="radio_value_item'+curr.attr_value_id+'-'+j+'">'+value+'</label>';
													html += '</div>';
												}
											}
											break;
										case 3:
											//复选框
											for(var j=0;j<curr.value_items.length;j++){
												var value = curr.value_items[j];
												if($.trim(value) != ""){
													html += '<div class="goods-sku-attribute-item-checkbox">';
														html += '<input type="checkbox" value="'+value+'" class="js-attribute-checkbox" id="checkbox_value_item'+curr.attr_value_id+'-'+j+'" data-attribute-value-id="'+curr.attr_value_id+'" data-attribute-value="'+curr.attr_value_name+'"  name="checkbox_value_item'+i+'" />&nbsp;';
														html += '<label for="checkbox_value_item'+curr.attr_value_id+'-'+j+'">'+value+'</label>';
													html += '</div>';
												}
											}
											break;
									}
								html += '</td>';
							html += '</tr>';
							}
						}
						$(".js-goods-sku-attribute").html(html);
					}
					if(callBack != undefined){
						callBack();
					}
					$(".js-goods-spec-block").show();
					$(".js-goods-attribute-block").show();

				}
			}
		});
	}else{
		//标识 0：表示添加商品，1：表示编辑商品，商品分类为0,2：表示编辑商品，商品分类不为0
		switch(parseInt($("#specType").attr("data-flag"))){
		case 0:
			var html = getGoodsSpecHeaderHtml();
			html += '<tr>';
			html += '<td class="js-spec-add" style="text-align:left;">'+getAddSpecHtml()+'</td>';//规格添加
			html += '<td></td>';
			html += '</tr>';
			$(".js-goods-sku").html(html);
			$(".js-goods-spec-block").show();
			break;
		case 1:
			//如果当前商品的商品类型为0，则不根据商品类型id加载数据
			getGoodsSpecListNotAttrId();
			break;
		case 2:
			$(".js-goods-sku tr.js-spec-item").remove();
			$(".js-goods-sku tr .js-spec-add").css("text-align","left").next().remove();
			break;
		}
	}
}


//验证
function ValidateUserInput() {

	var isflag = 0;
	if($("#tbcNameCategory").attr("cid") == undefined  || $("#tbcNameCategory").attr("cid")==""){
		$("#tbcNameCategory .help-inline").show();
		$('html,body').animate({scrollTop : 0 }, 200);
		return false;
	}else{
		$("#tbcNameCategory .help-inline").hide();
	}


	// 商品标题
	if (!IsEmpty("#txtProductTitle")) {
		$("#txtProductTitle").next("span").show();
		$("#txtProductTitle").focus();
		return false;
	}else if($("#txtProductTitle").val().length>10){
		//$("#txtProductTitle").next("span").show();
		$("#txtProductTitle").nextAll("span:last").text("商品名字不能大于10个字").css("color","red");
		$("#txtProductTitle").nextAll("span:last").show();
		$("#txtProductTitle").focus();
		return false;
	} else {
		$("#txtProductTitle").next("span").hide();
	}
	
	// 副标题

    if (!IsEmpty("#txtIntroduction")) {
        $("#txtIntroduction").next("span").show();
        $("#txtIntroduction").focus();
        return false;
    }
	if($("#txtIntroduction").val().length>30 || $("#txtIntroduction").val().length<10){
		$("#txtIntroduction").focus();
		$("#txtIntroduction").next("span").show();
		return false;
	} else{
		$("#txtIntroduction").next("span").hide();
	}


    if (!IsEmpty("#txtshortdesp")) {
        $("#txtshortdesp").next("span").show();
        $("#txtshortdesp").focus();
        return false;
    }
    if($("#txtshortdesp").val().length>60 || $("#txtshortdesp").val().length<10){
        $("#txtshortdesp").focus();
        $("#txtshortdesp").next("span").show();
        return false;
    } else{
        $("#txtshortdesp").next("span").hide();
    }

	if($("#txtProductCodeA").val().length>0 && $("#txtProductCodeA").val().length>40){
		$("#txtProductCodeA").focus();
		$("#txtProductCodeA").next("span").show();
		return false;
	}else{
		$("#txtProductCodeA").next("span").hide();
	}
	/*
	if($("#specType").val()>0){
		//验证SKU输入是否正确 isflag: 0：成功，1：失败
		//var isflag = 0;
		//sku价格
		$.each($('input[name="sku_price"]'), function(i, item) {
			var $this = $(item);
			if (parseFloat($this.val()) < 0.01 || $.trim($this.val()) == "") {
				$this.css("border-color", "#b94a48");
				$this.parent().find(".help-inline").text("价格最小为 0.01");
				$this.parent().find(".help-inline").show();
				isflag = 1;
			} else {
				num = parseInt($this.val());
				$this.css("border-color", "");
				$this.parent().find(".help-inline").hide();
			}
		});
	
		$.each($('input[name="market_price"]'), function(i, item) {
			var $this = $(item);
			if (parseFloat($this.val()) < 0.01 || $.trim($this.val()) == "") {
				$this.val("0.00");
//				$this.css("border-color", "#b94a48");
//				$this.parent().find(".help-inline").text("价格不能为0");
//				$this.parent().find(".help-inline").show();
//				isflag = 1;
			} else {
				num = parseInt($this.val());
				$this.css("border-color", "");
				$this.parent().find(".help-inline").hide();
			}
		});
	
		$.each($('input[name="cost_price"]'), function(i, item) {
			var $this = $(item);
			if (parseFloat($this.val()) < 0.01 || $.trim($this.val()) == "") {
				$this.val("0.00");
//				$this.css("border-color", "#b94a48");
//				$this.parent().find(".help-inline").text("价格不能为0");
//				$this.parent().find(".help-inline").show();
//				isflag = 1;
			} else {
				num = parseInt($this.val());
				$this.css("border-color", "");
				$this.parent().find(".help-inline").hide();
			}
		});
		
		// 库存
		$.each($('input[name="stock_num"]'), function(i, item) {
			var $this = $(item);
			if ($.trim($this.val()) == "" || $.trim($this.val()) < 0) {
				$this.css("border-color", "#b94a48");
				$this.parent().find(".help-inline").text("总库存不能为0");
				$this.parent().find(".help-inline").show();
				isflag = 1;
			} else {
				num = parseInt($this.val());
				$this.css("border-color", "");
				$this.parent().find(".help-inline").hide();
			}
		});
		//验证SKU输入是否正确 isflag: 0：成功，1：失败
		if (isflag == 1) {
			$("body").scrollTop($("#txtProductCount").offset().top+100);
			//$("body").scrollTop($("#txtProductCount").offset().top-300);
			return false;
		}
		

	
	}
	*/
	if(isflag == 0){
		// 商品原价
		if (!IsNum("#txtProductSalePrice") || parseFloat($("#txtProductSalePrice").val()) < 0.01) {
			$("#txtProductSalePrice").nextAll("span:last").text("商品销售价不能为空，且大于0").css("color","red");
			$("#txtProductSalePrice").nextAll("span:last").show();
			$("#txtProductSalePrice").focus();
			return false;
		} else {
			var price_s = $("#txtProductSalePrice").val();
			var c_price = parseFloat(price_s);
			$("#txtProductSalePrice").nextAll("span:last").hide();
		}


        if (!IsNum("#txtProductGroupPrice") || parseFloat($("#txtProductGroupPrice").val()) < 0.01) {
            $("#txtProductGroupPrice").nextAll("span:last").text("商品团购价不能为空，且大于0").css("color","red");
            $("#txtProductGroupPrice").nextAll("span:last").show();
            $("#txtProductGroupPrice").focus();
            return false;
        } else {
            var price_s = $("#txtProductGroupPrice").val();
            var c_price = parseFloat(price_s);
            $("#txtProductGroupPrice").nextAll("span:last").hide();
        }
		// 总库存
		if (!IsPositiveNum("#txtProductCount")) {
			$("#txtProductCount").nextAll("span:last").show();
			$("#txtProductCount").focus();
			return false;
		} else {
			$("#txtProductCount").nextAll("span:last").hide();
		}
		if (parseInt($("#txtProductCount").val()) < 0) {
			$("#txtProductCount").nextAll("span:last").show();
			$("#txtProductCount").focus();
			return false;
		} else {
			$("#txtProductCount").nextAll("span:last").hide();
		}


        if (!IsPositiveNum("#txtProductGroupNum")) {
            $("#txtProductGroupNum").nextAll("span:last").show();
            $("#txtProductGroupNum").focus();
            return false;
        } else {
            $("#txtProductGroupNum").nextAll("span:last").hide();
        }
        if (parseInt($("#txtProductGroupNum").val()) < 0) {
            $("#txtProductGroupNum").nextAll("span:last").show();
            $("#txtProductGroupNum").focus();
            return false;
        } else {
            $("#txtProductGroupNum").nextAll("span:last").hide();
        }


        if (parseInt($("#txtelfliftreturn").val()) < 0) {
            $("#txtelfliftreturn").nextAll("span:last").show();
            $("#txtelfliftreturn").focus();
            return false;
        } else {
            $("#txtelfliftreturn").nextAll("span:last").hide();
        }
	}

	var imgflag = false;// 默认：false。
	var imgtop = 0;// 如果没有商品图片，就定位到这个位置
	
	if($(".upload_img_id").length == 0){
		imgtop = $(".ncsc-goods-default-pic").offset().top - 200;
		$("body").scrollTop(imgtop);
		$(".img-error").text("最少需要一张图片作为商品主图").show();
		return false;
	}else{
		$(".img-error").hide();
	}


    var description = UE.getEditor('editor').getContent();

    description = description.replace(/(\n)/g, "");
    description = description.replace(/(\t)/g, "");
    description = description.replace(/(\r)/g, "");
    description = description.replace(/\s*/g, "");
    if (description == "") {
        $("#tareaProductDiscrip").nextAll("span:last").text("商品描述不能为空");
        $("#tareaProductDiscrip").nextAll("span:last").show();
        $("body").scrollTop($("#discripContainer").offset().top-100);
        return false;
    } else if (description.length < 5 || description.length > 25000) {
        $("#tareaProductDiscrip").nextAll("span:last").text("商品描述字符数应在5～25000之间");
        $("#tareaProductDiscrip").nextAll("span:last").show();
        $("body").scrollTop($("#discripContainer").offset().top-100);
        return false;
    } else {
        $("#tareaProductDiscrip").nextAll("span:last").hide();
    }

	return true;
}

var flag = false;//防止重复提交
//保存商品
function SubmitProductInfo(type, ADMIN_MAIN,SHOP_MAIN) {
	
	img_id_arr = "";// 商品主图
	//var leftCss = new Array();
	// 第一个循环对商品图片进行排序
//	for (var j = 0; j < 5; j++) {
//		var left = $("#file_upload_img_" + (j + 1)).parent().css("left")
//				.replace("px", "");// 获取每个图片对应的坐标位置
//		var imgid = $("#file_upload_img_" + (j + 1)).parent().attr("js-img");
//		leftCss.push(left + ":" + imgid);
//	}
//	leftCss.sort();// 对数据进行排序
//	for (var i = 0; i < leftCss.length; i++) {
//		var index = leftCss[i].split(":")[1];
//		if ($("#file_upload_img_" + (index)).attr("data-id") != null
//				&& $("#file_upload_img_" + (index)).attr("data-id") != '') {
//			img_id_arr += $("#file_upload_img_" + (index)).attr("data-id")
//					+ ",";
//		}
//	}
	var img_obj = $(".upload_img_id");
	for( var $i=0; $i<img_obj.length;$i++){
		var $checkObj=$(img_obj[$i]);
		if(img_id_arr == ""){
			img_id_arr = $checkObj.val();
		}else{
			img_id_arr +=","+ $checkObj.val();
		}
	}
	//img_id_arr = img_id_arr.substr(0, img_id_arr.length - 1);
	// 禁用按钮
	var validateResult = ValidateUserInput(); // 验证用户输
	if (validateResult) {
		$("#lastPage,#btnSave,#btnSave2").attr("disabled", "disabled");
		var productViewObj = PackageProductInfo();
		var $qrcode = $("#hidQRcode").val();
		if(flag){
			return;
		}
		flag = true;
//		 var asd = JSON.stringify(productViewObj);
//		return;
		$.ajax({
			url : "GoodsCreateOrUpdate",
			type : "post",
			async : false,
			data : { "product" : productViewObj , "is_qrcode" : $qrcode},
			dateType : "json",
			success : function(res) {
				var url = ADMIN_MAIN + "/goods/goodslist";
				var goodsId = parseInt($("#goodsId").val());
				
				var text = "";
				if (res != null) {
					if (type == 1) {
						var parameter_goodsid = goodsId;
						if(parameter_goodsid==0 || typeof(parameter_goodsid) == 'undefined'){
							parameter_goodsid = res
						}
						url = SHOP_MAIN + "/goods/goodsinfo?goodsid="+parameter_goodsid;// 跳转到前台
						window.open(url);
					}
					showMessage('success', "商品发布成功",ADMIN_MAIN +'/goods/goodslist');
				} else {
					showMessage('error', "商品发布失败",url);
					flag = false;
					$("#lastPage,#btnSave,#btnSave2").removeAttr("disabled")
				}
			}
		});
	}
}

/**
 * 创建时间：2015年6月11日18:07:10 创建人：高伟 功能说明：获取数据已对象方式存储
 */
function PackageProductInfo() {
	// 初始化一个实体 将页面所需的数据存放到对象中
	var shop_type = $("#shop_type").val();
	var productViewObj = new Object();
	productViewObj.goodsId = $("#goodsId").val();// 商品id 11号目前为死值 0
    productViewObj.editid = $("#editid").val();// 编辑id，在待审核状态下
	productViewObj.title = $("#txtProductTitle").val().replace(/^\s*/g, "").replace(/\s*$/g, "");// 商品标题
	productViewObj.introduction = $("#txtIntroduction").val().replace(/^\s*/g, "").replace(/\s*$/g, "");// 商品简介，促销语
    productViewObj.shortdesp = $("#txtshortdesp").val().replace(/^\s*/g, "").replace(/\s*$/g, "");// 商品简介，促销语
    productViewObj.categoryId = $("#tbcNameCategory").attr("cid");// 商品类目
    productViewObj.description = UE.getEditor('editor').getContent();// 商品详情描述

	//productViewObj.market_price = $("#txtProductMarketPrice").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtProductMarketPrice").val().replace(/^\s*/g, "").replace(/\s*$/g, "");// 市场价
	productViewObj.price = $("#txtProductSalePrice").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtProductSalePrice").val().replace(/^\s*/g, "").replace(/\s*$/g, "");// 销售价
	productViewObj.group_price = $("#txtProductGroupPrice").val().replace(/^\s*/g, "").replace(/\s*$/g, "") == "" ? 0 : $("#txtProductGroupPrice").val().replace(/^\s*/g, "").replace(/\s*$/g,"");// 成本价
    //productViewObj.opengroup = $("input[name='opengroup']:checked").val();// 上下架标记
    productViewObj.group_number = $("#txtProductGroupNum").val().replace(/^\s*/g, "").replace(/\s*$/g, "");;// 上下架标记




    productViewObj.openselflift = $("input[name='openselflift']:checked").val();// 上下架标记
    productViewObj.selfliftreturn = $("#txtelfliftreturn").val().replace(/^\s*/g, "").replace(/\s*$/g, "");;// 上下架标记

	productViewObj.code = $("#txtProductCodeA").val();// 商品生成许可证
	productViewObj.is_sale = $("input[name='shelves']:checked").val();// 上下架标记

	productViewObj.stock = $("#txtProductCount").val();// 总库存

    productViewObj.type = $("#goodstype").val();// 商品类型

    productViewObj.banner = $("#banner").val();// 商品类型

	productViewObj.max_buy = 0;// 每人限购
	productViewObj.key_words = "";//商品关键词


    productViewObj.shipping_fee_id = $("#feelistSelect").val();//供货商

	productViewObj.picture = img_id_arr.split(",")[0];
	var imageVals = img_id_arr;// 在页面中获取的
	productViewObj.imageArray = imageVals;// 商品图片分组
    //productViewObj.skuArray = synchroSkuValueData();
	//productViewObj.goods_spec_format = JSON.stringify($specObj);
	//productViewObj.goods_attribute_id= $("#specType").val();
	productViewObj.sort = $("#hidden_sort").val();

	var goods_attribute_arr = new Array();


    //productViewObj.goods_attribute = "";


	//物流信息
	productViewObj.goods_weight = $("#goods_weight").val();

	
	return productViewObj;
}

 //上传图片，可以多图一起，也可以单图  调用
function UploadImage(event, flag) {
	shopImageFlag = flag;//所点击的商品图片标识
	speciFicationsFlag = 0;
	OpenPricureDialog("PopPicure", ADMINMAIN, 5);
}

//处理积分非法输入
function integrationChange(event) {
	$integration_val = $(event).val();
 	if ($integration_val < 0) {
		$(event).val(0);
	}
}

//非空判断
function IsEmpty(obj) {
	var val = $.trim($(obj).val());
	if (val == "") {
		$(obj).focus();
		return false;
	}
	return true;
}

/**
 * 获取当前时间随机数
 * @returns
 */
function getDate(){
	var date = new Date();
	var time = date.getSeconds().toString()+date.getMilliseconds().toString();
	return time;
}



/**
 * 循环价格
 */
function eachPrice() {
	var $price = 0;
	$.each($('input[name="sku_price"]'), function(i, item) {
		var $this = $(item);
		var num = $this.val();
		var numint = parseFloat(num);
		var priceint = parseFloat($price);
		if ($price == 0 || numint < priceint)
			$price = num;
	});
	$("#txtProductSalePrice").val($price);
}
/**
 * 循环市场价 2016年12月2日 11:55:30
 */
function eachMarketPrice() {
	var $price = 0;
	$.each($('input[name="market_price"]'), function(i, item) {
		var $this = $(item);
		var num = $this.val();
		var numint = parseFloat(num);
		var priceint = parseFloat($price);
		if ($price == 0 || numint < priceint)
			$price = num;
	});
	$("#txtProductMarketPrice").val($price);
}
/**
 * 循环成本价 2016年12月2日 12:14:27
 */
function eachCostPrice() {
	var $price = 0;
	$.each($('input[name="cost_price"]'), function(i, item) {
		var $this = $(item);
		var num = $this.val();
		var numint = parseFloat(num);
		var priceint = parseFloat($price);
		if ($price == 0 || numint < priceint)
			$price = num;
	});
	$("#txtProductCostPrice").val($price);
}

/**
 * 循环库存
 */
function eachInput() {
	var $stockTotal = 0;
	$.each($('input[name="stock_num"]'), function(i, item) {
		var $this = $(item);
		var num = 0;
		num = parseInt($this.val());
		$stockTotal = $stockTotal + num;
	});
	$("#txtProductCount").val($stockTotal);
}


//选择商品类目后回到函数
function addGoodsCallBack(goods_category_id ,goods_category_name ,goods_attr_id , goodsid, dialog_flag, box_id){
	switch(dialog_flag){
	case "category":

		$("#tbcNameCategory .category-text").html(goods_category_name);
		$("#tbcNameCategory").attr("cid",goods_category_id);
		$("#tbcNameCategory").attr("data-attr-id",goods_attr_id);
		$("#tbcNameCategory").attr("cname",goods_category_name);
		if(goodsid == 0){
			$("#specType").val(goods_attr_id);
			goodsTypeChangeData();
			getGoodsSpecListByAttrId($("#specType").val());
			if(parseInt($("#specType").val()) == 0){
//				//如果没有选择商品类型，则清空属性信息
				$(".js-goods-attribute-block").hide();
				$(".js-goods-sku-attribute").html("");
			}
		}
		break;
	case "extend_category":
		$("#"+box_id+" .category-text").html($.trim(goods_category_name));
		$("#"+box_id).attr("cid",goods_category_id);
		$("#"+box_id).attr("data-attr-id",goods_attr_id);
		$("#"+box_id).attr("cname",goods_category_name);
		break;
	}
}
/**
 * 添加扩展分类
 */
function addExtentCategoryBox(){
	var html = '<div class="extend-name-category" id="extend_name_category'+extent_sort+'" data-flag="extend_category" data-goods-id="0" cid="" data-attr-id="" cname="">';
	html += '<span class="category-text"onclick="editCategory(this);"></span>';
	html += '&nbsp;&nbsp;<span class="do-style" onclick="editCategory(this);"><i class="fa fa-edit"></i>&nbsp;编辑</span>&nbsp;&nbsp;';
	html += '<span class="do-style" onclick="removeParentBox(this);"><i class="fa fa-trash-o"></i>&nbsp;删除</span>';
	html += '<span class="help-inline" style="vertical-align: top;">已添加的商品扩展分类不能为空</span>';
	$(".extend-name-category-box").append(html);
	extent_sort++;
}
/**
 * 编辑扩展分类
 */
function editCategory(obj){
	var goodsid = $(obj).parent().attr("data-goods-id");
	var category_id = $(obj).parent().attr("cid");
	var flag = $(obj).parent().attr("data-flag");
	var box_id = $(obj).parent().attr("id");
	
	var category_extend_id ="";
	$(".extend-name-category").each(function() {
		if(category_extend_id == ""){
			category_extend_id = $(this).attr("cid");
		}else{
			category_extend_id += "," + $(this).attr("cid");
		}
	})
	OpenCategoryDialog(ADMINMAIN,category_id,goodsid,flag, box_id, category_extend_id);
}
/**
 * 删除本条扩展分类
 * @param obj
 */
function removeParentBox(obj){
	$(obj).parent().remove();
}