<?php
/**
 * Created by PhpStorm.
 * User: mysipo
 * Date: 2017/09/05
 * Time: 10:21
 */
namespace app\index\model;
use think\Model;
use traits\model\SoftDelete;//软删除

class Index extends Model
{
    #命名 me_user => User.php User
    #   me_user_info => UserInfo.php UserInfo

    //系统支持自动写入创建和更新的时间戳字段，有两种方式配置支持。 只要是时间就更改
    //字段名默认创建时间字段为create_time，更新时间字段为update_time，  int整型
    protected $autoWriteTimestamp = true;

    // 定义时间戳字段名
    protected $createTime = 'create_at';
    protected $updateTime = 'update_at';

    //自动完成
    protected $auto = [
        'time'
    ];

    protected $insert = [
        'time_insert'
    ];

    protected $update = [
        'time_update'
    ];

    //在获取status 状态值时  自动转换  获取器
    public function getStatusAttr($data){
        $status = [-1=>'删除',1=>'正常',0=>'默认'];
        return $status[$data];
    }

    //设置password 加密  => 在添加进入数据库的时候 密码自动加密   修改器
    public function setPasswordAttr($password){

        return md5($password);
    }

    public function setTimeAttr(){
        return time();
    }

    public function setTimeInsertAttr(){
        return time();
    }

    //修改器
    public function setTimeUpdateAttr(){
        return time();
    }

    //要使用软删除功能，需要引入SoftDelete trait
    use SoftDelete;
    protected $deleteTime = 'delete_time';


}