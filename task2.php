<?php


$text = "Номер моей карты: 4321321021091098.";


function replaceCardNumberToPan($text) 
{
    return preg_replace('/(\d{6})(\d{6})(\d{4})/ims', '$1******$3', $text);
}

$result = replaceCardNumberToPan($text);

print_r($result);
