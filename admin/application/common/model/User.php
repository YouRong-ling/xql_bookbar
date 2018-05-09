<?php
//------------------------
// 类型模型
//-------------------------

namespace app\common\model;

use think\Model;

class User extends Model
{

    public function ktypeArr($value){
        $type = [
            0 => '',
            1 => 'username',
            2 => 'realname',
            3 => 'mobile'
        ];
        return $type[$value];
    }
}