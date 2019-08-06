Является ли следующий код уязвимым? Если да, предложите эксплойт и вариант
устранения уязвимости.
<?php
echo clean($_POST['text']);
function clean($text) {
return str_replace("<script", "", $text);
} ?>



Например
$text = '<SCRIPT>'


echo clean($text);

function clean($text) {
    return str_replace("<script", "", $text);
}
