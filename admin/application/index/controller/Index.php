<?php
namespace app\index\controller;

use think\Controller;
use app\index\model\User;
use think\Loader;

use think\Db;

class Index
{
    public function index()
    {
        return \think\Response::create(\think\Url::build('/admin'), 'redirect');
    }

    //控制器中 增删改查
    public function test()
    {
        //打印sql
        Db::name('user')->where('id','>',1)->buildSql();
        Db::name('user')->where('id','between',[1,10])->buildSql();
        Db::name('user')->where('id','between','1,10')->buildSql();//输出sql
        Db::name('user')->where(['id'=>['egt',1]])->buildSql();
        Db::name('user')->where(['id'=>['egt',1]])->whereOr(['name'=>'asdf'])->buildSql();


        $data = [];
        for($i=1;$i<20;$i++){
            $data[] = [
                'user_id' => "{$i}",
                'email' => "123@qq.com",
                'add_time' => time(),
            ];
        }
        Db::name('user')->insertAll();

        Db::name('user')->where("id",">",10)->field("username,id")->order("id desc")->limit(3,5)->select();

        Db::name('user')->where("id",">",10)->field("username,id")->order("id desc")->page(3,5)->select();//(3-1)*5

        Db::name('user')->where("id",">",10)->field("username,id")->order("id desc")->group('u_id')->limit(3,5)->select();

        Db::name('user')->where()->delete();
        Db::name('user')->setInc();
        Db::table('think_user')
            ->where('id', 1)
            ->setDec('score');

        Db::table('think_user')
            ->where('id', 1)
            ->update(['name' => 'thinkphp']);


        //把数据库完成操作 封装成方法 统一调用 model();
    }

    //select 查询
    public function t()
    {
       // $res = User::get(1);//常用

        $u2 = new User();//常用
        $res = $u2::get(3);

        $user = Loader::model('User');
        $res = $user::get(4);

        $u3 = model('User');
        $res = $u2::get(6);
        $res = $res->toArray();
        dump($res);

        User::get(function($query){
            $query->where("username",'eq','ling');
        });

        User::where('id',10)
            ->field('id,username')
            ->find();

        $res = User::all([4,5,6]);//主键ID
        foreach($res as $val){
            dump($val->toArray());
        }

        $res = User::all(function($query){
            //$query->where(['id'=>['eq',1]])
            $query->where("id",'eq',1)
            ->field("is,username");
        });
        foreach($res as $val){
            dump($val->toArray());
        }

        User::where('id',10)
            ->field('id,username')
            ->order('id desc')
            ->limit(1,10)
            ->select();


        User::value('email');
        User::where('id',10)->value('email');

        User::column('email');//所有的email的值
        User::column('email','username');//username的值当KEY， email的值当value


    }

    //添加
    public function create(){
        $res = User::create([
            'username' => 'qww',
            'email' => 'email@qq.com',
            'sex' => 1,
            'add_time' => time()
        ]);
        dump($res->id);

        $res = User::create([
            'username' => 'qww',
            'email' => 'email@qq.com',
            'sex' => 1,
            'add_time' => time()
        ],true);
        dump($res->id);

        $res = User::create([
            'username' => 'qww',
            'email' => 'email@qq.com',
            'sex' => 1,
            'add_time' => time()
        ],['username','email']);
        dump($res->id);

        $userModel = new User();
        $userModel->data(['username'=>111])->save();

        $user = new User($_POST);
        // 过滤post数组中的非数据表字段数据
        $user->allowField(true)->save();

        $user = new User($_POST);
        // post数组中只有name和email字段会写入
        $user->allowField(['name','email'])->save();

        $user = new User;
        $list = [
            ['name'=>'thinkphp','email'=>'thinkphp@qq.com'],
            ['name'=>'onethink','email'=>'onethink@qq.com']
        ];
        $user->saveAll($list);

        $user = new User;
        $list = [
            ['id'=>1, 'name'=>'thinkphp', 'email'=>'thinkphp@qq.com'],
            ['id'=>2, 'name'=>'onethink', 'email'=>'onethink@qq.com'],
        ];
        $user->saveAll($list, false);

    }

    public function update(){
        $user = User::update([//建议使用
            'id' => 1,
            'username' => 'username1'
        ]);

        $user = User::update(['user_name'=>'username<5'],function($query){//建议使用
            $query->where('id','LT',5);
        });

        $user = User::where('id','gt',17)->update(["username"=>'username17']);

        $user = $user::get(1);
        $user->email = 'hjk';
        $user->username = 'linglin';
        $user->save();


        $user = User::save(['email'=>'hcsjue@souhu.com'],function($query){
            $query->where(['id'=>['gt',10]]);
        });

        // lock的使用方式：
        $userModel = new User();
        $userModel->where('id',3)->lock(true)->find();

        //force 方法用于数据集的强制索引操作
        Db::table('think_user')->force('user')->select();

        // 用于查询
        Db::table('think_user')
            ->where('id',':id')
            ->where('name',':name')
            ->bind(['id'=>[10,\PDO::PARAM_INT],'name'=>'thinkphp'])
            ->select();

        // 用于写入
        Db::table('think_user')
            ->bind(['id'=>[10,\PDO::PARAM_INT],'email'=>'thinkphp@qq.com','name'=>'thinkphp'])
            ->where('id',':id')
            ->update(['name'=>':name','email'=>':email']);
    }

    public function delete(){
        User::destroy(function($query){
            $query->where('id','eq',1);
        });

        $user = User::get(7);
        $user->delete();

        User::where('id','=',7)->delete();
    }


    public function m(){
        $data = ['user'=>'dd'];
        // 关闭字段严格检查
        Db::name('user')
            ->strict(false)
            ->insert($data);


        $res = User::get(1);
        dump($res);

    }

    public function time(){
        $user = User::create([
            'name' => 'name/index',
            'password' => md5('password'),
        ]);

        //更新操作 自动 更新时间 model中开启 protected $autoWriteTimestamp = true;
        $user = User::get(1);
        $user->name = 'new name';
        $user->save();

        dump($user);
    }
}
