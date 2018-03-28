<?php

namespace app\admin\model;
use think\Model;
use think\Db;
use think\Config;

class Focus extends Model
{

    public $Channel;
    public $Type;
    public $Place;

    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->Channel =  Config('Focus.Channel');
        $this->Type = Config('Focus.Type');
        $this->Place = Config('Focus.Place');
    }

    /**
      渠道
     */
    public function getChannel($type = 1)
    {
        return $this->Channel[$type];
    }

    /**
    区域
     */
    public function getType($type = 1)
    {
        return $this->Type[$type];
    }

    /**
    位置
     */
    public function getPlace($type = 1)
    {
        return $this->Place[$type];
    }
    /**
     *  获取图片
     */
    public function getImgUrlById($id){
        $imgArr = Db::name('file')->where(['id'=>$id])->find();
        return !empty($imgArr) ? $imgArr['domain'].$imgArr['name'] : $id;
    }

}