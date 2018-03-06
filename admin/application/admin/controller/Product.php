<?php
//------------------------
// 商品列表
//-------------------------

namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Product extends Controller
{
    use \app\admin\traits\controller\Controller;

//    protected static $blacklist = ['recyclebin', 'delete', 'recycle', 'deleteforever', 'clear'];

    protected function filter(&$map)
    {
        if ($this->request->param('name')) {
            $map['name'] = ["like", "%" . $this->request->param('name') . "%"];
        }
    }

}
