<?php
    use yii\helpers\Html;
    use yii\helpers\HtmlPurifier;
?>
<h1><?=Html::encode($hello)?></h1>
<h2><?=$string[0]?></h2>
<h3><?=Html::encode($xss)?></h3>
<h3>123<?=HtmlPurifier::process($xss)?></h3>