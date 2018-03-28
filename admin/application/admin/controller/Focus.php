<?php
/**
 * Created by PhpStorm.
 * 公共广告管理
 * User: Stilwell
 * Date: 2017年12月25日11:45:40
 */

namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Loader;
use think\exception\HttpException;
use think\Config;
\think\Loader::import('controller/Controller', \think\Config::get('traits_path'), EXT);

class Focus extends Base
{

    use \app\admin\traits\controller\Controller;

    protected static $blacklist = [];
    //过滤条件规则
    protected function filter(&$map)
    {

    }

    public function __construct()
    {
        parent::__construct();
        $this->view->assign("configChannel", model('Focus')->Channel);
        $this->view->assign("configType", model('Focus')->Type);
        $this->view->assign("configPlace", model('Focus')->Place);
    }

    protected function beforeedit()
    {
       $pkId =  $this->request->param('id');
       $adArr = Db::name('Focus')->find();
       //获取图片相关数据
        $imgArr = Db::name('file')->where(['id'=>$adArr['ad_img_key']])->find();
        $imgArr['fileurl'] = $imgArr['domain'].$imgArr['name'];
        $this->view->assign('imgArr' , $imgArr);
    }
}