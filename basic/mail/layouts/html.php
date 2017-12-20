<?php
use yii\helpers\Html;

/* @var $this \yii\web\View view component instance */
/* @var $message \yii\mail\MessageInterface the message being composed */
/* @var $content string main view render result */
?>
<?php $this->beginPage() ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=<?= Yii::$app->charset ?>" />
    <meta name="keywords" content="小说传记,青春文学,童书,绘本,成功励志,投资理财,东野圭吾,考研英语,人类简史,当当网图书,网上购书">
    <meta name="description" content="小巧玲珑书吧-全球最大中文网上书店,专业提供小说传记,青春文学,成功励志,投资理财等各品类图书畅销榜最新报价、促销、评论信息,引领最新网上购书体验!">
    <meta name="renderer" content="webkit">
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
    <?php $this->beginBody() ?>
    <?= $content ?>
    <?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
