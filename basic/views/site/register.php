<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title();
//$this->params['breadcrumbs'][] = "注册";
?>
<div class="site-about">
    <h1>关于我和他的故事</h1>

    <div class="row">
        <div class="col-lg-5">
            <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>
            <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>
            <?= $form->field($model, 'password')->textInput(['autofocus' => true]) ?>
            <?= $form->field($model, 'realname') ?>
            <?= $form->field($model, 'email') ?>
            <?= $form->field($model, 'mobile') ?>
            <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
            ]) ?>
            <div class="form-group">
                <?= Html::submitButton('Submit', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
