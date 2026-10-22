<?php
$im = imagecreatefrompng("d:/laragon/www/BENEVO/public/images/benevo-logo.png");
echo "Dimensions: " . imagesx($im) . "x" . imagesy($im) . "\n";
$c = imagecolorat($im, 0, 0);
$alpha = ($c >> 24) & 0x7F;
echo "Corner (0,0) alpha: " . $alpha . " (127 = fully transparent)\n";
$mid = imagecolorat($im, imagesx($im)/2, imagesy($im)/2);
$r = ($mid >> 16) & 0xFF;
$g = ($mid >> 8) & 0xFF;
$b = $mid & 0xFF;
echo "Center color: rgb($r, $g, $b)\n";

