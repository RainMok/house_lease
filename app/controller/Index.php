<?php
namespace app\controller;


use app\BaseController;
use think\facade\View;
use think\captcha\facade\Captcha;

class Index extends BaseController {

    /**
     * 主页
     *
     * @return void
     */
    public function index() {
        
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
} 
