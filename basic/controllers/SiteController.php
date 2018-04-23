<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\UserForm;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * 首页
     *
     * @return string
     */
    public function actionIndex()
    {
//        $typedata = Yii::$app->db->createCommand('SELECT `id`,`title` FROM book_type')->queryAll();
//        Yii::$app->db->createCommand()->update('user', ['age' => 40], 'name = test')->execute();
//        Yii::$app->db->createCommand()->delete('user', 'age = 30')->execute();
//        var_dump($typedata);exit;

        //焦点图
        $data['focus'] = (new \yii\db\Query())
            ->select('`id`,`ad_name`,ad_img_key,ad_url')
            ->from('book_focus')
            ->where(['status' => 1,'ad_type'=>1,'ad_place'=>1])
            ->orderBy('id desc')
            ->limit(3)
            ->all();
        foreach($data['focus'] as $k=>$v){
            $data['focus'][$k]['img'] = (new \yii\db\Query())
                ->select('`name`')->from('book_file')->where(['id' => $v['ad_img_key']])->column()[0];
        }
//        var_dump($data['focus']);

       $recommend = (new \yii\db\Query())
            ->select('`id`,`title`')
            ->from('book_recommend')
            ->where(['status' => 1])
            ->all();
       $recommend = array_column($recommend,'title','id');

//        var_dump($recommend);

        //模块 -》 商品
        $tmp = (new \yii\db\Query())
            ->select('`id`,`title`,price,sale_price,type,img,soldnum,is_top')
            ->from('book_product')
            ->where(['status' => 1])
//            ->limit(10)
            ->all();
        foreach($tmp as $v){
            $v['img'] = (new \yii\db\Query())
                ->select('`name`')->from('book_file')->where(['id' => $v['img']])->column()[0];
            $data['product'][$recommend[$v['is_top']]][] = $v;
        }
//        var_dump($data['product']);

//        $user=User::find(1)->one();
//        echo $user->user."login";
        return $this->render('index',$data);
    }

    /**
     * 登录
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {

            if ($model->validate()) {
                //验证通过，执行用户登录
                if($model->login()){
                    return $this->goHome();
                }else{
                    return $this->render('login',['model'=>$model]);
                }

            }
//            return $this->goBack();
        }
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * 注册
     *
     * @return Response|string
     */
    public function actionRegister()
    {
        $model = new UserForm();
        if ($model->load(Yii::$app->request->post())) {

            $param = Yii::$app->request->post()["UserForm"];

//            var_dump($param);exit;

            $data['username'] = $param['username'];
            $data['password'] = md5($param['password']);
            $data['realname'] = $param['realname'];
            $data['mobile'] = $param['mobile'];
            $data['email'] = $param['email'];
            $data['reg_ip'] = $_SERVER['SERVER_ADDR'];
            $data['reg_time'] = time();
            $data['login'] = 1;
            $data['last_login_ip'] = $_SERVER['SERVER_ADDR'];
            $data['last_login_time'] = time();
            Yii::$app->db->createCommand()->insert('book_user', $data)->execute();

            return $this->goBack();
        }
        return $this->render('register', [
            'model' => $model,
        ]);
    }

    /**
     * 退出
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * 联系我们
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post())) {
            $param = Yii::$app->request->post()['ContactForm'];

//            var_dump($param);exit;

//            $db->createCommand('INSERT INTO book_feedback (name) VALUES (:name)', [
//                ':name' => 'Qiaoling',])->execute();

            $data['fb_name'] = $param['name'];
            $data['fb_email'] = $param['email'];
            $data['fb_mobile'] = $param['mobile'];
            $data['fb_content'] = $param['content'];
            $data['fb_m_uid'] = $param['name'];
            $data['fb_type'] = 1;
            $data['fb_place'] = 1;
            $data['fb_create_time'] = time();
            Yii::$app->db->createCommand()->insert('book_feedback', $data)->execute();

//            Yii::$app->session->setFlash('contactFormSubmitted');
            return $this->goHome();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * 关于我们
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }


    /**
     * 购物车
     *
     * @return Response|string
     */
    public function actionCart()
    {


        return $this->render('cart');
    }

    /**
     * 订单
     *
     * @return Response|string
     */
    public function actionOrder()
    {


        return $this->render('Order');
    }
}
