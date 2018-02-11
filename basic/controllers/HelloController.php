<?php
/**
 * Created by PhpStorm.
 * User: mysipo
 * Date: 2018/01/05
 * Time: 10:39
 */

namespace app\controllers;
use yii\web\Controller;
use yii\web\Cookie;

class HelloController extends Controller
{

    public function actionIndex()
    {
        echo 'hello world';

        $res = \YII::$app->response;
        //$res->statusCode = '404';
       // $res->headers->add('pragma','no-cache');
        //$res->headers->set('pragma','max-age=5');
//        $res->headers->remove('pragma');

        //重定向 302
        //$res->headers->add('location','http://www.baidu.com');
        //$res->redirect('http://www.baidu.com',302);


        //文件下载
//        $res->headers->add('content-disposition','attachment;filename="a.jpg"');
//        $res->sendFile('./robots.txt');


    }

    public function actionSession()
    {
        $session = \YII::$app->session;

        $session->open();
        //判断session是否开启
        if($session->isActive)
        {
            echo 'session is start<hr/>';
        }

       // $session->set('name','lingling');
        //echo $session->get('name');
         $session->remove('name');

        $session['user'] = 'qiaoling';
//        echo $session['user'];

        unset($session['user']);

    }

    public function actionCookie()
    {
       $cookie =  \YII::$app->response->cookies;
       $cookie_data = [
           'name' => 'ling',
           'value' => '123456',
       ];
       $cookie->add(new Cookie($cookie_data));
    }

    public function actionViews()
    {
        $data['hello'] = '"how do you chinese food? very much,chinese food is awesome."';
        $data['string'] = [1,32];
        $data['xss'] = "<script>alert(1)</script>";
        return $this->renderPartial('views',$data);
        //return $this->render('views',$data); 公共头部和底部会被渲染出来
    }
}
