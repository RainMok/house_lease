<?php

namespace app\business;

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
        return ['有'];
    }
}