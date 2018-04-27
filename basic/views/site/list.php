<?php

/* @var $this yii\web\View
 * @1013753944@qq.com
 */
use yii\helpers\Html;
$this->title();
?>
<div class="site-index">
    <?php foreach($product as $k=>$v){ ?>
    <div class="body-content">
            <?php foreach($v as $vo){ ?>
            <div class="col-lg-2 back-f">
                <p><a href="/?r=site/detail&id=<?=$vo['id']?>"><img src="<?=$vo['img']?>" title="<?=$vo['title']?>" style="width: 160px; height: 160px;"></a></p>
                <div class="h-title"><a href="/?r=site/detail&id=<?=$vo['id']?>"><?=$vo['title']?></a></div>
                <div class="price-t">价格：<?=$vo['price']?>元</div>
                <div class="cart-t"><a href="?r=cart/index/pid=<?=$vo['id']?>&ptype=<?=$vo['type']?>" target="_blank">放入购物车</a></div>
            </div>
            <?php } ?>
    </div>
    <?php } ?>
</div>