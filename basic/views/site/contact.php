<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title();
?>
<div class="site-contact">
    <h4>建议箱</h4>

    <?php if (Yii::$app->session->hasFlash('contactFormSubmitted')): ?>

        <div class="alert alert-success">
            “小巧玲珑书吧”带给您有什么困扰吗？若有请及时反馈，尽快处理。若有什么好的意见、好的作品，也可以投稿哦！会在网站展出的哦！
        </div>

        <p>
            Note that if you turn on the Yii debugger, you should be able
            to view the mail message on the mail panel of the debugger.
            <?php if (Yii::$app->mailer->useFileTransport): ?>
                Because the application is in development mode, the email is not sent but saved as
                a file under <code><?= Yii::getAlias(Yii::$app->mailer->fileTransportPath) ?></code>.
                Please configure the <code>useFileTransport</code> property of the <code>mail</code>
                application component to be false to enable email sending.
            <?php endif; ?>
        </p>

    <?php else: ?>

        <p>
            “小巧玲珑书吧”带给您有什么困扰吗？若有请及时反馈，尽快处理。若有什么好的意见、好的作品，也可以投稿哦！会在网站展出的哦！
        </p>

        <div class="row">
            <div class="col-lg-5">

                <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>
                    <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>
                    <?= $form->field($model, 'email') ?>
                    <?= $form->field($model, 'mobile') ?>
                    <?= $form->field($model, 'content')->textarea(['rows' => 6]) ?>
                    <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                        'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
                    ]) ?>
                    <div class="form-group">
                        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
                    </div>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
    <?php endif; ?>
</div>
