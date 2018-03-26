<?php
//------------------------
// 类型模型
//-------------------------

namespace app\common\model;

use think\Model;

class Product extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    //自动完成
    protected $auto = ['uid'=>UID];


}