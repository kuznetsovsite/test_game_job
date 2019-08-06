<?php


$a = ['a', 'b', 'c', 'd', 'e', 'f'];
$k = 1;

function aShift($a, $k) 
{
    $aLenght = count($a);
    if ($k == $aLenght || ($k % $aLenght == 0 && $aLenght < $k)) {
        return $a;
    } elseif ($k > $aLenght) {
        $k = $aLenght % $k;
    }
    
    $result = [];
    foreach ($a as $key => $value) {
        $result[($key + $k) % $aLenght] = $value;
    }
    ksort($result);
    return $result;
}

print_r(aShift($a, $k));

