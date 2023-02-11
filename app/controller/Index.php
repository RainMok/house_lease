<?php
namespace app\controller;


use app\BaseController;
use think\facade\View;
use think\captcha\facade\Captcha;
use app\business\LoginVerify;


use app\model\Manager;

class Index extends BaseController {

    /**
     * 主页
     *
     * @return void
     */
    public function index() {
        echo "主页";

        $res = Manager::find(1);


        dump($res->toArray());
    }


    /**
     * 登录页面
     *
     * @return String 登录页面
     */
    public function login() :String{
        // 获取年份和单位名称
        View::assign([
            'year'      =>      date('Y', time()),
            'org'       =>      '保障办'
        ]);
        return View::fetch('login_view');
    }




    /**
     * 登录页面验证码功能
     */
    public function loginCode() {
        return Captcha::create();
    }



    /**
     * 登录验证
     */
    public function loginAction() {
        if ($this->request->isAjax()) {
            // 处理符合数据类型的登录信息
            $res = LoginVerify::verify($this->request->param());

            return json($res);
            // return json(['data' => $this->request->param()]);
        }
    }
} 
