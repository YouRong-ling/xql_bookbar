<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

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
            ->limit(1)
            ->all();
//        var_dump($data);

        //模块 -》 商品
        $data['product'] = (new \yii\db\Query())
            ->select('`id`,`title`,price,sale_price,type,img,soldnum')
            ->from('book_product')
            ->where(['status' => 1])
            ->all();

        var_dump($data['product']);

        return $this->render('index',$data);
    }

    /**
     * 登录
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
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
//        Yii::$app->db->createCommand()->insert('user', [
//            'name' => 'test',
//            'age' => 30,
//        ])->execute();

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
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
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
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
}
