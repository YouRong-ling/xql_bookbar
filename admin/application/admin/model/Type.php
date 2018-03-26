<?php
/**
 * Created by PhpStorm.
 * User: 1013753944@qq.com
 * Date: 2018/03/26
 * Time: 16:45
 */

namespace app\admin\model;
use think\Model;
use think\Db;

class Type extends Model
{
    public function typeInfo($id)
    {
        return Db::name('type')->where('id',$id)->value('title');
    }
}