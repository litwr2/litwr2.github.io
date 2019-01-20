<?php
$c = $_POST["f2"];
$f = fopen("text.txt", "w");
while (!flock($f, LOCK_EX)) sleep(1);
fwrite($f, str_replace("\r", "", $c));
flock($f, LOCK_UN);
fclose($f);
header("Location: http://".$_SERVER['SERVER_NAME'].str_replace("-helper","",$_SERVER['PHP_SELF']));
?>
