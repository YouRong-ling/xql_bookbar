<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta http-equiv="cache-control" content="no-cache">
    <meta name="keywords" content="小说传记,青春文学,童书,绘本,成功励志,投资理财,东野圭吾,考研英语,人类简史,小巧玲珑书吧图书,网上购书">
    <meta name="description" content="小巧玲珑书吧-全球最大中文网上书店,专业提供小说传记,青春文学,成功励志,投资理财等各品类图书畅销榜最新报价、促销、评论信息,引领最新网上购书体验!">

    <link rel="shortcut icon" href="http://i1.mobile-dad.com/uploads/201708/512349_1_1501844093qtY7.png"/>
    <link rel="stylesheet" type="text/css" href="/css/theme_1.css">
    <link rel="Stylesheet" type="text/css" href="/css/home.css">
    <link rel="Stylesheet" type="text/css" href="/css/index.css">
    <link rel="Stylesheet" type="text/css" href="/css/header.css">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
<div class="wrap">
    <div id="hd">
        <div id="tools">
            <div class="tools">
                <div class="ddnewhead_operate" dd_name="顶链接">
                    <div>
                        <ul class="ddnewhead_operate_nav">
                            <li><a target="_blank" href="?r=site/about">关于我们</a></li>
                            <li><a target="_blank" href="?r=site/contact">建议箱</a></li>
                        </ul>
                        <div class="new_head_znx" id="znx_content" style="display:none;"></div>
                        <div class="ddnewhead_welcome" display="none;">
                            <span id="nickname">请<a dd_name="登录" href="?r=site/login" target="_self" rel="nofollow" class="login_link">登录</a><a dd_name="成为会员" href="?r=site/Register" target="_self" rel="nofollw">成为书吧的一员</a></span>
                        </div>
                    </div>
                    <div class="welcome">
                        欢迎光临，小巧玲珑书吧
                    </div>
                </div>
            </div>
        </div>

        <div style="position:relative;" class="logo_line_out">
            <div class="logo_line" dd_name="搜索框">
                <div class="logo"><img src="/images/logo2.png" usemap="#logo_link">
                    <map name="logo_link" id="logo_link" dd_name="logo区"><area shape="rect" coords="0,18,200,93" href="/" onfocus="this.blur();">
                        <area shape="rect" coords="200,18,320,93" href="/" title="小巧玲珑书吧" target="_blank" onfocus="this.blur();"></map></div>
                <div class="search">
                    <form action="#" name="searchform" id="form_search_new" onsubmit="return searchsubmit();" method="GET">
                        <label for="key_S" class="label_search" id="label_key" onclick="this.style.color='rgb(255, 255, 255)';" style="visibility: visible; color: rgb(102, 102, 102);"></label>
                        <input type="text" class="text gray" name="key" id="key_S" autocomplete="off">
                        <input type="button" class="button" dd_name="搜索按钮">
                    </form>
                </div>
                <div class="search_bottom">
                    <div class="search_hot">热搜:
                        <a href="?hotword=东野圭吾" name="hotword">东野圭吾</a>
                        <a href="?hotword=阿加莎克里斯蒂" name="hotword">阿加莎克里斯蒂</a>
                        <a href="?hotword=白夜行" name="hotword">白夜行</a>
                    </div>
                    <a href="#" class="search_advs" target="_blank" name="ddnav_adv_s" dd_name="高级搜索">高级搜索</a>
                </div>

                <div class="nav_top" dd_name="一级导航条">
                    <ul>
                        <?php
                       $type = (new \yii\db\Query())
                            ->select('`id`,`title`')
                            ->from('book_type')
                            ->where(['status' => 1])
                            ->orderBy(['sort'=>'desc'])
                            ->limit(10)
                            ->all();
                       foreach ($type as $v){
                           echo '<li><a name="nav1" href="?type='.$v['id'].'" target="_blank">'.$v['title'].'</a></li>';
                       }
                        ?>

<!--                        <li><a name="nav1" href="#" target="_blank">电子书</a></li>-->
<!--                        <li><a name="nav1" href="#" target="_blank">网络文学</a></li>-->
<!--                        <li><a name="nav1" href="#" target="_blank">服装</a></li>-->
<!--                        <li><a name="nav1" href="#" target="_blank">运动户外</a></li>-->
<!--                        <li><a name="nav1" href="#" target="_blank">孕婴童</a></li>-->
<!--                        <li><a name="nav1" href="# " target="_blank">家居</a></li>-->
<!--                        <li><a name="nav1" href="#" target="_blank">创意文具</a></li>-->
<!--                        <li><a name="nav1" href="#" target="_blank">食品</a></li>-->
                    </ul>
                </div>
                <div id="suggest_key" class="suggest_key" style="display:none;"></div>
                <div class="ddnew_cart"><a name="购物车" href="?r=site/cart" dd_name="购物车"><i class="icon_card"></i>购物车<b id="cart_items_count">0</b></a></div>
                <div class="ddnew_order">
                    <a target="_blank" href="?r=site/order" name="我的订单" dd_name="我的订单" rel="nofollow">我的订单<b id="unpaid_num" style="color:#ff2832;font:bold 12px Arial;"></b></a>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left"><?= date('Y-m-d') ?> &copy; “莫笑吾家巷壁小，稜层势欲摩空。相知唯有主人翁，有心雄泰华，无意巧玲珑。” </p>
        <p class="pull-right">Powered by www.xql.com</p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

