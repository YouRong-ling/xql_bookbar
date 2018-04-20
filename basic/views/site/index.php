<?php

/* @var $this yii\web\View
 * @1013753944@qq.com
 */

$this->title();
?>
<div class="site-index">
    <div class="row">
        <?php foreach($focus as $v){ ?>
        <a href="<?php echo $v['ad_url']; ?>">
            <img class="col-lg-12" src="/images/cj.jpg" title="<?=$v['ad_name']?>" alt="<?=$v['ad_name'] ?>">
        </a>
        <?php } ?>
    </div>

    <?php foreach($product as $k=>$v){ ?>
    <div class="body-content border-b">
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
