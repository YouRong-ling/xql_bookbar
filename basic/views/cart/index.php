<?php

/* @var $this yii\web\View
 * @1013753944@qq.com
 */
use yii\helpers\Html;
$this->title();
$session = \Yii::$app->session;
$data = $session->get('product_'.Yii::$app->request->get()['id']);
?>
<div class="intermediate_box clearfix intermediate_box_tj" id="add_more">
    <div class="intermediate_left">
        <!-- 参数校验失败时-->
        <!--加品优化后 这里的selectedPromo就是空的了 貌似正常情况下也用不到-->
        <div class="success">
            <h1>商品已成功添加至购物车！</h1>
        </div>
        <div class="vertical_middle">
            <p>
                <a title="<?=$data['title']?>" href="/?r=site/detail&id=<?=$data['id']?>" target="_blank">
                    <?=$data['title']?></a>
                <span class="orgtip">x5</span>
            </p>
        </div>
        <div id="showShopEntry"></div>
        <div id="showWishPriceChange"></div>
    </div>
    <div class="intermediate_right" style="padding-top:35px;">
        <p>
            <a class="org_btnb" href="/?r=cart/shopping">去购物车结算</a>
            <a class="promo_btn" href="/" >继续购物</a>
        </p>
    </div>
</div>