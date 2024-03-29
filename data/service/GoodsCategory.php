<?php
/**
 * GoodsCategory.php
 *
 * Niushop商城系统 - 团队十年电商经验汇集巨献!
 * =========================================================
 * Copy right 2015-2025 山西牛酷信息科技有限公司, 保留所有权利。
 * ----------------------------------------------
 * 官方网址: http://www.niushop.com.cn
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用。
 * 任何企业和个人不允许对程序代码以任何形式任何目的再发布。
 * =========================================================
 * @author : niuteam
 * @date : 2015.1.17
 * @version : v1.0.0.0
 */
namespace data\service;
/**
 * 商品分类服务层
 */
use data\service\BaseService as BaseService;
use data\model\NsGoodsCategoryModel as NsGoodsCategoryModel;
use data\api\IGoodsCategory as IGoodsCategory;
use data\model\NsGoodsModel;
use data\model\NsGoodsBrandModel;

use think\cache\driver\Redis;
class GoodsCategory extends BaseService implements IGoodsCategory 
{
    private $goods_category;
    function __construct(){
        parent:: __construct();
        $this->goods_category = new NsGoodsCategoryModel();
    }
	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getGoodsCategoryList()
     */
    public function getGoodsCategoryList($page_index=1, $page_size=0, $condition = '', $order = '', $field = '*')
    {
        $list = $this->goods_category->pageQuery($page_index, $page_size, $condition, $order, $field);
        return $list;
        // TODO Auto-generated method stub
        
    }

	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getGoodsCategoryListByParentId()
     */
    public function getGoodsCategoryListByParentId($pid)
    {
       $list = $this->getGoodsCategoryList(1, 0, 'pid='.$pid, 'pid,sort');
       if(!empty($list)){
           for($i=0; $i<count($list['data']); $i++){
               $parent_id=$list['data'][$i]["category_id"];
               $child_list = $this->getGoodsCategoryList(1, 1, 'pid='.$parent_id, 'pid,sort');
               if(!empty($child_list) && $child_list['total_count']>0){
                   $list['data'][$i]["is_parent"]=1;
               }else{
                   $list['data'][$i]["is_parent"]=0;
               }
           }
       }
       return $list['data'];
        // TODO Auto-generated method stub
        
    }

	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::addOrEditGoodsCategory()
     */
    public function addOrEditGoodsCategory($category_id, $category_name, $short_name, $pid, $is_visible, $keywords='', $description='', $sort=0, $category_pic, $attr_id=0, $attr_name='')
    {
    	if($pid == 0){
    		$level = 1;
    	}else{
    		$level = $this->getGoodsCategoryDetail($pid)['level'] + 1;
    	}
        $data = array(
            'category_name'   => $category_name,
            'short_name'   => $short_name,
            'pid'             => $pid,
            'level'           => $level,
            'is_visible'      => $is_visible,
            'keywords'        => $keywords,
            'description'     => $description,
            'sort'            => $sort,
            'category_pic'    => $category_pic,
            'attr_id'         => $attr_id,
            'attr_name'       => $attr_name
        );
        if($category_id == 0)
        {  
            $result = $this->goods_category->save($data);
            if($result)
            {
                $res = $this->goods_category->category_id;
            }else{
                $res = $this->goods_category->getError();
            }
            
        }else{
            $res = $this->goods_category->save($data,['category_id'=>$category_id]);
            if($res !== false)
            {
                return $res;
            }else{
                $res = $this->goods_category->getError();
            }
            
        }
        return $res;
        // TODO Auto-generated method stub
        
    }

	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::deleteGoodsCategory()
     */
    public function deleteGoodsCategory($category_id)
    {
    	$sub_list = $this->getGoodsCategoryListByParentId($category_id);
		if (! empty($sub_list)) {
			$res = SYSTEM_DELETE_FAIL;
		}else {
            $res = $this->goods_category->destroy($category_id);
        }
        return $res;
        // TODO Auto-generated method stub
        
    }

	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getTreeCategoryList()
     */
    public function getTreeCategoryList($show_deep, $condition)
    {
        // TODO Auto-generated method stub
        
    }

	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getKeyWords()
     */
    public function getKeyWords($category_id)
    {
        $res = $this->goods_category->getInfo(['category_id'=>$category_id],'keywords');
        return $res;
        // TODO Auto-generated method stub
        
    }
    /**
     * (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getLevel()
     */
    public function getLevel($category_id)
    {
        $res = $this->goods_category->getInfo(['category_id'=>$category_id],'level');
        return $res;
        // TODO Auto-generated method stub
    
    }
    /**
     * (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getName()
     */
    public function getName($category_id)
    {
        $res = $this->goods_category->getInfo(['category_id'=>$category_id],'category_name');
        return $res;
        // TODO Auto-generated method stub
    
    }

	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getGoodsCategoryDetail()
     */
    public function getGoodsCategoryDetail($category_id)
    {
        $res = $this->goods_category->get($category_id);
        return $res;
        // TODO Auto-generated method stub
        
    }

	public function getGoodsCategoryTree($pid){
		//暂时  获取 两级
		$list = array();  
		$one_list = $this->getGoodsCategoryListByParentId($pid);
		foreach($one_list as $k1=>$v1){
			$two_list = array();
			$two_list = $this->getGoodsCategoryListByParentId($v1['category_id']);
			$one_list[$k1]['child_list'] = $two_list;
		}
		$list = $one_list;
		return $list;
	}
	
    /**
     * 修改商品分类  单个字段
     * @param unknown $category_id
     * @param unknown $order
    */
	public function ModifyGoodsCategoryField($category_id, $field_name, $field_value){
        $res = $this->goods_category->ModifyTableField('category_id',$category_id, $field_name, $field_value);

        if($field_name == "is_visible")
        {
            $redis = new Redis();

            $redis->set("apicheck.getcategorys",1);

        }
        return $res;
    }
    /**
     * 获取商品分类下的商品品牌(non-PHPdoc)
     * @see \data\api\IGoodsCategory::getGoodsCategoryBrands()
     */
    public function getGoodsCategoryBrands($category_id)
    {
        $goods_model = new NsGoodsModel();
        $brand_id_array = $goods_model->getQuery(['category_id'=> $category_id], 'brand_id', '');
        $array = array();
        if(!empty($brand_id_array))
        {
            foreach($brand_id_array as $k=> $v)
            {
                $array[] = $v['brand_id'];
            }
        }
        if(!empty($array))
        {
            $brand_str = implode(',', $array);
            $goods_brand = new NsGoodsBrandModel();
            $condition = array(
                'brand_id' => array('in',$brand_str)
            );
            $brand_list = $goods_brand->getQuery($condition, '*', '');
            return $brand_list;
        }else 
        {
            return '';
        }
        
    }
    /**
     * 获取商品分类下的价格区间(non-PHPdoc)
     * @see \data\api\IGoodsCategory::getGoodsCategoryPriceGrades()
     */
    public function getGoodsCategoryPriceGrades($category_id)
    {
        $goods_model = new NsGoodsModel();
        $max_price = $goods_model->where(['category_id'=> $category_id])->max('price');
        $min_price = $goods_model->where(['category_id'=> $category_id])->min('price');
        $price_grade = 1;
        for($i=1; $i<= log10($max_price); $i++)
        {
        $price_grade *= 10;
        }
        //跨度
        $dx = (ceil(log10(($max_price-$min_price)/3))-1)* $price_grade;
        if($dx <= 0)
        {
            $dx = $price_grade;
        }
        $array = array();
        $j = 0;
        while($j <= $max_price)
        {
            $array[] = array($j, $j+$dx-1);
            $j = $j + $dx;
        }
       
        return $array; 
        
        
    }
	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getGoodsCategorySaleNum()
     */
    public function getGoodsCategorySaleNum()
    {
        // TODO Auto-generated method stub
        $goods_goods_category = new NsGoodsCategoryModel();
        $goods_goods_category_all = $goods_goods_category->all();
        foreach($goods_goods_category_all as $k=>$v){
            $sale_num = 0;
            $goods_model = new NsGoodsModel();
            $goods_sale_num = $goods_model->where(array("category_id_1|category_id_2|category_id_3"=>$v["category_id"]))->sum("sales");
            $goods_goods_category_all[$k]["sale_num"] = $goods_sale_num;
        }
        return  $goods_goods_category_all;
    }
    /**
     * 获取商品分类的子项列
     * @param unknown $category_id
     * @return string|unknown
     */
    public function getCategoryTreeList($category_id)
    {
        $goods_goods_category = new NsGoodsCategoryModel();
        $level = $goods_goods_category->getInfo(['category_id' => $category_id], 'level');
        if(!empty($level))
        {
            $category_list = array();
            if($level['level'] == 1)
            {
                $child_list = $goods_goods_category->getQuery(['pid' => $category_id], 'category_id,pid', '');
                $category_list = $child_list;
                if(!empty($child_list))
                {
                    foreach ($child_list as $k => $v)
                    {
                        $grandchild_list = $goods_goods_category->getQuery(['pid' => $v['category_id']], 'category_id', '');
                        if(!empty($grandchild_list))
                        {
                            $category_list = array_merge($category_list, $grandchild_list);
                        }
                    }
                }
            }elseif($level['level'] == 2)
            {
                $child_list = $goods_goods_category->getQuery(['pid' => $category_id], 'category_id,pid', '');
                $category_list = $child_list;
            }
            $array = array();
            if(!empty($category_list))
            {
               
                foreach ($category_list as $k => $v)
                {
                    $array[] = $v['category_id'];
                }
                
            }
            if(!empty($array))
            {
                $id_list = implode(',', $array);
                return $id_list.','.$category_id;
            }else{
                return $category_id;
            }
            
            
        }else{
            return $category_id;
        }
    }
	/* (non-PHPdoc)
     * @see \data\api\IGoodsCategory::getCategoryParentQuery()
     */
    public function getCategoryParentQuery($category_id)
    {
        // TODO Auto-generated method stub
        $parent_category_info = array();
        $grandparent_category_info = array();
        $category_name= "";
        $parent_category_name= "";
        $grandparent_category_name= "";
        $goods_goods_category = new NsGoodsCategoryModel();
        $category_info = $goods_goods_category->getInfo(["category_id"=>$category_id],"*");
        $level = $category_info["level"];
        $nav_name = array();
        if(!empty($category_info))
        {
            $category_name = $category_info["category_name"];
            if($level == 3){
                $parent_category_info = $goods_goods_category->getInfo(["category_id"=>$category_info["pid"]],"*");
                
                if(!empty($parent_category_info)){                   
                    $grandparent_category_info =  $goods_goods_category->getInfo(["category_id"=>$parent_category_info["pid"]],"*");  
                                
                }
                $nav_name = array($grandparent_category_info, $parent_category_info, $category_info);
            }else if($level == 2){
                $parent_category_info = $goods_goods_category->getInfo(["category_id"=>$category_info["pid"]],"*");
                $nav_name = array($parent_category_info, $category_info);          
            }else{
                $nav_name = array($category_info);
            }
            
        }
        return $nav_name;
    }
    /**
     * 得到上级的分类组合
     * @param unknown $category_id
     */
    public function getParentCategory($category_id){
        $category_ids=$category_id;
        $category_names="";
        $pid=0;
        $goods_category = new NsGoodsCategoryModel();
        $category_obj=$goods_category->get($category_id);
        if(!empty($category_obj)){
            $category_names=$category_obj["category_name"];
            $pid=$category_obj["pid"];
            while ($pid!=0) {
                $goods_category = new NsGoodsCategoryModel();
                $category_obj=$goods_category->get($pid);
                if(!empty($category_obj)){
                    $category_ids=$category_ids.",".$pid;
                    $category_name=$category_obj["category_name"];
                    $category_names=$category_names.",".$category_name;
                    $pid=$category_obj["pid"];
                }else{
                    $pid=0;
                }
            }
        }
        $category_id_str=explode(",", $category_ids);
        $category_names_str=explode(",", $category_names);
        $category_result_ids="";
        $category_result_names="";
        for($i=count($category_id_str);$i>=0; $i--){
            if($category_result_ids==""){
                $category_result_ids=$category_id_str[$i];
            }else{
                $category_result_ids=$category_result_ids.",".$category_id_str[$i];
            }
        }
        for($i=count($category_names_str);$i>=0; $i--){
            if($category_result_names==""){
                $category_result_names=$category_names_str[$i];
            }else{
                $category_result_names=$category_result_names.":".$category_names_str[$i];
            }
        }
        $parent_Category=array(
          "category_ids"=>$category_result_ids,
          "category_names"=>$category_result_names  
        );

        return $parent_Category;
    }
}

?>