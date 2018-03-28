<?php
namespace app\common\model;

use think\Model;

class Focus extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    protected $dateFormat = 'Y-m-d H:i:s';
    protected $type = [
        'ad_start_time' => 'timestamp',
        'ad_end_time'  =>  'timestamp',
        'create_time' => 'timestamp',
        'update_time' => 'timestamp',
    ];
}