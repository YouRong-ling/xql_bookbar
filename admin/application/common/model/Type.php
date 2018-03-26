<?php
//------------------------
// 类型模型
//-------------------------

namespace app\common\model;

use think\Model;

class Type extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    //自动完成
    protected $auto = ['uid'=>UID];

    /**
    * 列表
    */
    public function getList($field = 'id,title', $where = 'isdelete=0')
    {
        return $this->field($field)->where($where)->select();
    }
}