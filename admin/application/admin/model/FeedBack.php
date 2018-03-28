<?php
/**
 * Created by PhpStorm.
 * User: mysipo
 * Date: 2017/12/25
 * Time: 17:02
 */

namespace app\admin\model;
use think\Model;
use think\Db;

class FeedBack extends Model
{

    /**
     * 意见反馈 渠道号
     *
     */
    public function fbType($type = 0,$all=0)
    {
        $arr = [
                0=> '--',
                1=> '小巧玲珑书吧',
            ];

        if($all){
            unset($arr[0]);
            return $arr;
        }

        return $arr[$type];
    }

    /**
     * 位置
     */
    public function fbPlace($place=0)
    {
        $arr = [
            0 => '--',
            1 => '首页',
        ];
        return $arr[$place];
    }

    //查找管理员姓名
    public function adminUsername($id = 0)
    {
        if(empty($id))
            return "--";

       return Db::name('admin_user')->where('id',$id)->value('realname');
    }
}