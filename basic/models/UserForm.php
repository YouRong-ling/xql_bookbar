<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class UserForm extends Model
{
    public $username;
    public $password;
    public $realname;
    public $email;
    public $mobile;
    public $sex;
    public $verifyCode;
    public $rememberMe = true;

    private $_user = false;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password','mobile','email','verifyCode'], 'required','message'=>'{attribute}不能为空！'],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
//            ['password', 'validatePassword'],
            ['username', 'string', 'max' => 50,'tooLong'=>'{attribute}长度必需在100以内'],
            ['password', 'string', 'max' => 32,'tooLong'=>'{attribute}长度必需在32以内'],
            ['mobile', 'string', 'max' => 11,'tooLong'=>'{attribute}长度必需在11位'],
            ['password','validatePassword','message'=>'账号或密码不正确！'],
        ];
    }

    /**
     * @
     */
    public function attributeLabels()
    {
        return [
            'username' => '账号',
            'password' => '密码',
            'verifyCode'=>'验证',
        ];
    }


    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();

            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, '账号或密码不正确.');
            }
        }
    }

    /**
     * @根据用户名密码查询用户
     * Finds user by [[username]]
     *
     * @return User|null
     */
    public function getUser()
    {
        if ($this->_user === false) {
//            $this->_user= User::find()->where(['username'=>$this->user,'password'=>md5($this->password)])->one();
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }
}
