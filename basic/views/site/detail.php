<?php

/* @var $this yii\web\View
 * @1013753944@qq.com
 */
use yii\helpers\Html;
$this->title();
?>
<div class="swiper-container">
    <div class="swiper-wrapper">
        <?php foreach($focus as $v){ ?>
            <div class="swiper-slide">
                 <a href="<?=$v['ad_url']?>">
                     <img class="col-lg-12" src="http://admin.lingbook.com<?=$v['img']?>" title="<?=$v['ad_name']?>" alt="<?=$v['ad_name'] ?>">
                </a>
            </div>
        <?php } ?>
    </div>
</div>

<div class="site-index">

    <?php foreach($product as $k=>$v){ ?>
    <div class="border-b">
        <h3><img class="img-re" src="/images/s9_title._CB335300127_.png" /><?=$k ?></h3>
    </div>
    <div class="body-content">
        <div class="row">
            <?php foreach($v as $vo){ ?>
            <div class="col-lg-2 back-f">
                <p><img src="http://admin.lingbook.com<?=$vo['img']?>" title="<?=$vo['title']?>" style="width: 160px; height: 160px;"></p>
                <div class="h-title"><a href="<?=$vo['id']?>" title="<?=$vo['title']?>"><?=$vo['title']?></a></div>
                <div class="price-t">价格：<?=$vo['price']?>元</div>
                <div class="cart-t"><a href="?r=cart/index/pid=<?=$vo['id']?>&ptype=<?=$vo['type']?>" target="_blank">放入购物车</a></div>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
</div>
<script src="/js/swiper-4.2.2.min.js"></script>
<script>
    var mySwiper = new Swiper('.swiper-container', {
        autoplay: true,//可选选项，自动滑动
    })
</script>