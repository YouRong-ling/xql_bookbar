<?php
/**
 * Created by PhpStorm.
 * User: xuql
 * Date: 2018/3/2
 * Time: 15:55
 */

namespace app\admin\controller;

use app\admin\Controller;

/**
 * Class Base
 * @package app\admin\controller
 * 项目后台公共处理类，集中处理一些特定的数据
 */
class Base extends Controller{

    //公共当前时间
    protected $timedate;
    /**
     * Base constructor.
     * 公共的处理方法
     */
    public function __construct()
    {
        parent::__construct();
        $this->timedate = time();
    }

}