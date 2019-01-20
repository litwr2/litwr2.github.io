<meta charset=utf-8>
<style>
textarea {
  font-size: 16px;
  line-height:1.4;
  width:100%;
  height: 90%;
}
</style>
<form action=shared-editor-helper.php method=post>
<textarea id=f2 type=text rows=37 name=f2 value=></textarea>
<p><input type=submit value=Save>
</form>
<?php
$fn = "text.txt";
$myfile = fopen($fn, "r") or die("Unable to open file!");
$fc = fread($myfile,filesize($fn));
fclose($myfile);
echo "<script>\n";
echo 'document.getElementById("f2").value = '.json_encode($fc).';';
echo "\n</script>";
?>
