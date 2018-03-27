<?php
/**
 * tpAdmin [a web admin based ThinkPHP5]
 *
 * @author    yuan1994 <tianpian0805@gmail.com>
 * @link      http://tpadmin.yuan1994.com/
 * @copyright 2016 yuan1994 all rights reserved.
 * @license   http://www.apache.org/licenses/LICENSE-2.0
 */

namespace app\admin\controller;

use app\admin\Controller;
use think\Db;

class Upload extends Controller
{
    /**
     * 首页
     */
    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 文件上传
     */
    public function upload()
    {
        $file = $this->request->file('file');

        $path = ROOT_PATH . 'public/tmp/uploads/';
        $info = $file->move($path);

        if (!$info) {
            return ajax_return_error($file->getError());
        }
        $data =  $this->request->root() .'/tmp/uploads/' . $info->getSaveName();
        $name =  'http://www.tpadmin.com/tmp/uploads/' . $info->getSaveName();
        $insert = [
            'cate'     => 1,
            'name'     => $data,
            'original' => $info->getInfo('name'),
            'domain'   => 'http://www.tpadmin.com',
            'type'     => $info->getInfo('type'),
            'size'     => $info->getInfo('size'),
            'add_time'    => time(),
        ];

        $id = Db::name('File')->insertGetId($insert);

        return ajax_return(['name' => $name,'file_id'=>$id]);
    }

    /**
     * 远程图片抓取
     */
    public function remote()
    {
        $url = $this->request->post('url');
        // validate
        $name = ROOT_PATH . 'public/tmp/uploads/' . get_random();
        $name = \File::downloadImage($url, $name);

        $ret = 'http://www.tpadmin.com/tmp/uploads/' . basename($name);

        return ajax_return(['url' => $ret], '抓取成功');
    }

    /**
     * 图片列表
     */
    public function listImage()
    {
        $page = $this->request->param('p', 1);
        if ($this->request->param('count')) {
            $ret['count'] = Db::name('File')->where('cate=3')->count();
        }
        $ret['list'] = Db::name('File')->where('cate=1')->field('id,name,original')->page($page, 10)->select();

        return ajax_return($ret);
    }
}