<?php
/**
 * Created by PhpStorm.
 * User: 1013753944
 * Date: 2018/3/25
 * Time: 15:57
 */

namespace app\admin\controller;
use think\Db;

class FeedBack extends Base
{

    public function index()
    {
        $model = $this->getModel('Feedback');
        $param = input('param.');
        unset($param['p']);
        $param = array_filter($param);
        if(input('param.fb_status') == 2)
        {
            $param['fb_status'] = 0;
        }
//        dump($param);
        $this->datalist($model, $param,'fb_id,fb_name,fb_mobile,fb_content,fb_type,fb_place,fb_create_time,fb_status,fb_status_content,fb_status_time,fb_admin_uid','fb_id',0);

        $this->view->assign('fb_type',model('FeedBack')->fbType(0,1));
        return $this->view->fetch();
    }

    public function status()
    {
        $param = input('param.');
        if(empty($param['fb_id']))  return \think\Response::create(\think\Url::build('/admin/feedback/index'), 'redirect');

        if($this->request->isPost())
        {
//            dump($param);exit;
            $data['fb_status'] = 1;//已处理
            $data['fb_status_content'] = trim($param['fb_status_content']);
            $data['fb_status_time'] = time();
            $data['fb_admin_uid'] = UID;
            Db::name('Feedback')->where('fb_id',$param['fb_id'])->update($data);

            return ajax_return_adv("成功", 'parent','成功');
        }
        return $this->view->fetch();
    }

    public function del()
    {
        $fb_id = input('param.fb_id');
        if(empty($fb_id))
            return ajax_return_error("失败", 'parent','失败');
        //dump($fb_id);
        Db::name('Feedback')->where('fb_id',$fb_id)->delete();
        return ajax_return_adv("成功", 'parent','成功');
    }
}