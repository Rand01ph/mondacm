<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');


/**
 * 自定义 md5 加密算法
 *
 */
class Mymd5{

/**
 * 加密方法
 *
 * @param string $str
 * @param string $key
 * @return string
 */
function md5_encrypt($str, $key = '') {
    return base64_encode($this->encrypt($str, $key));
}
// ------------------------------------------------------------------------

	/**
     * 解密方法
     *
     * @param string $str
     * @param string $key
     * @return string
     */
    function md5_decrypt($str, $key = '') {
    return $this->decrypt(base64_decode($str), $key);
}
// ------------------------------------------------------------------------

//--------------------------------------------------------------------------
//                       基于xxtea加密算法实现
//--------------------------------------------------------------------------

    /**
     * 加密方法
     *
     * @param string $str
     * @param string $key
     * @return string
     */
 function encrypt($str, $key) {
    if ($str == ''){
        return '';
    }
    if (!$key || !is_string($key)) {
        return '';
    }
    $v = $this->str2long($str, true);
    $k = $this->str2long($key, false);
    if (count($k) < 4) {
        for ($i = count($k); $i < 4; $i++) {
            $k[$i] = 0;
        }
    }
    $n = count($v) - 1;

    $z = $v[$n];
    $y = $v[0];
    $delta = 0x9E3779B9;
    $q = floor(6 + 52 / ($n + 1));
    $sum = 0;
    while (0 < $q--) {
        $sum = $this->int32($sum + $delta);
        $e = $sum >> 2 & 3;
        for ($p = 0; $p < $n; $p++) {
            $y = $v[$p + 1];
            $mx = $this->int32((($z >> 5 & 0x07ffffff) ^ $y << 2) + (($y >> 3 & 0x1fffffff) ^ $z << 4)) ^ $this->int32(
                    ($sum ^ $y) + ($k[$p & 3 ^ $e] ^ $z));
            $z = $v[$p] = $this->int32($v[$p] + $mx);
        }
        $y = $v[0];
        $mx = $this->int32((($z >> 5 & 0x07ffffff) ^ $y << 2) + (($y >> 3 & 0x1fffffff) ^ $z << 4)) ^ $this->int32(
                ($sum ^ $y) + ($k[$p & 3 ^ $e] ^ $z));
        $z = $v[$n] = $this->int32($v[$n] + $mx);
    }
    return $this->long2str($v, false);
}
// ------------------------------------------------------------------------
    /**
     * 解密方法
     *
     * @param string $str
     * @param string $key
     * @return string
     */
public function decrypt($str, $key) {
    if ($str == ''){
        return '';
    }
    if (!$key || !is_string($key)) {
        return '';
    }
    $v = $this->str2long($str, false);
    $k = $this->str2long($key, false);
    if (count($k) < 4) {
        for ($i = count($k); $i < 4; $i++) {
            $k[$i] = 0;
        }
    }
    $n = count($v) - 1;

    $z = $v[$n];
    $y = $v[0];
    $delta = 0x9E3779B9;
    $q = floor(6 + 52 / ($n + 1));
    $sum = $this->int32($q * $delta);
    while ($sum != 0) {
        $e = $sum >> 2 & 3;
        for ($p = $n; $p > 0; $p--) {
            $z = $v[$p - 1];
            $mx = $this->int32((($z >> 5 & 0x07ffffff) ^ $y << 2) + (($y >> 3 & 0x1fffffff) ^ $z << 4)) ^ $this->int32(
                    ($sum ^ $y) + ($k[$p & 3 ^ $e] ^ $z));
            $y = $v[$p] = $this->int32($v[$p] - $mx);
        }
        $z = $v[$n];
        $mx = $this->int32((($z >> 5 & 0x07ffffff) ^ $y << 2) + (($y >> 3 & 0x1fffffff) ^ $z << 4)) ^ $this->int32(
                ($sum ^ $y) + ($k[$p & 3 ^ $e] ^ $z));
        $y = $v[0] = $this->int32($v[0] - $mx);
        $sum = $this->int32($sum - $delta);
    }
    return $this->long2str($v, true);
}
// ------------------------------------------------------------------------
/**
 * 长整型转换为字符串
 *
 * @param long $v
 * @param boolean $w
 * @return string
 */
private function long2str($v, $w) {
    $len = count($v);
    $s = array();
    for ($i = 0; $i < $len; $i++)
        $s[$i] = pack("V", $v[$i]);
    return $w ? substr(join('', $s), 0, $v[$len - 1]) : join('', $s);
}
// ------------------------------------------------------------------------
/**
 * 字符串转化为长整型
 *
 * @param string $s
 * @param boolean $w
 * @return Ambigous <multitype:, number>
 */
private function str2long($s, $w) {
    $v = unpack("V*", $s . str_repeat("\0", (4 - strlen($s) % 4) & 3));
    $v = array_values($v);
    if ($w) $v[count($v)] = strlen($s);
    return $v;
}
// ------------------------------------------------------------------------
/**
 * @param int $n
 * @return number
 */
private function int32($n) {
    while ($n >= 2147483648)
        $n -= 4294967296;
    while ($n <= -2147483649)
        $n += 4294967296;
    return (int) $n;
}
// ------------------------------------------------------------------------
}
// ------------------------------------------------------------------------

// END Mymd5 Class

/* End of file Mymd5.php */
/* Location: ./app/admin/libraries/Mymd5.php*/
