<?php

require_once('./../config.php');
require_once(PATH . CLASSES . 'alkaline.php');
require_once(PATH . CLASSES . 'user.php');

$alkaline = new Alkaline;
$user = new User;

if($user->deauth()){
	$alkaline->addNotification('You have successfully logged out.', 'success');
}

header('Location: http://' . DOMAIN . 'admin/login/');
exit();

?>