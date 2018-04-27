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

class CartController extends Controller
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
     * 加入购物车
     * //        $typedata = Yii::$app->db->createCommand('SELECT `id`,`title` FROM book_type')->queryAll();
    //        Yii::$app->db->createCommand()->update('user', ['age' => 40], 'name = test')->execute();
    //        Yii::$app->db->createCommand()->delete('user', 'age = 30')->execute();
    //        var_dump($typedata);exit;
     *
     * @return string
     */
    public function actionIndex()
    {
        $param = Yii::$app->request->get();

        //模块 -》 商品
        $tmp = (new \yii\db\Query())
            ->select('`id`,`title`')
            ->from('book_product')
            ->where(['status' => 1])
            ->where(['id'=>$param['id']])
            ->one();

        $session = \Yii::$app->session;
        $session->set('product_'.$param['id'] ,$tmp);

        return $this->render('index');
    }

    /**
     * 结算页面
     */
    public function actionShopping()
    {
        $param = Yii::$app->request->get();

        //模块 -》 商品
//        $tmp = (new \yii\db\Query())
//            ->select('`id`,`title`')
//            ->from('book_product')
//            ->where(['status' => 1])
//            ->where(['id'=>$param['id']])
//            ->all();

        return $this->render('shopping');
    }
}
