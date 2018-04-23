<?php
/**
 * Created by PhpStorm.
 * User: xuql
 * Date: 2018/3/2
 * Time: 15:55
 */

namespace app\admin\controller;
use think\Db;
use think\Request;

class User extends Base
{


//过滤条件规则
    protected function filter(&$map)
    {
        if ($this->request->param("kword") && $this->request->param("ktype")) {
            $map[model('User')->ktypeArr($this->request->param("ktype"))] = ["like", "%" . $this->request->param("kword") . "%"];
        }
    }

    /**
     * 用户管理列表
     * @return string
     */
    public function index(){

        $model = $this->getmodel('User');

        // 列表过滤器，生成查询Map对象
        $map = $this->search($model, [$this->fieldIsDelete => $this::$isdelete]);

        // 自定义过滤器
        if (method_exists($this, 'filter')) {
            $this->filter($map);
        }

        //dump($map);
        $this->datalist($model, $map,'*','id',1);

        return $this->view->fetch();
    }

    /**
     * 用户详细信息
     *
     */
    public function view()
    {
        $id = Request::instance()->get('id');
        if(empty($id))
            return \think\Response::create(\think\Url::build('/admin/User'), 'redirect');

        //基本信息
        $field = '*';
        $list = Db::name('user')->field($field)
                    ->where(['id'=>$id])
                    ->find();

        $this->view->assign('list',$list);
        return $this->view->fetch();
    }
}