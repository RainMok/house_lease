<?php

namespace app\business;
use app\model\Manager;

class LoginVerify {
    /**
     * Undocumented function
     *
     * @param array $inputLoginData
     * @return array
     */
    public static function verify(array $inputLoginData): array {
        if (!in_array('login', $inputLoginData))
        return ['没有login'];
        
        $res = Manager::where('account', $inputLoginData['username'])->find();
        return $res->toArray();
    }
}