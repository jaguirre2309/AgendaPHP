<?php

require('./conector.php');

  session_start();

  $id = $_POST['id'];

  if (isset($_SESSION['user'])) {
    $con = new ConectorBD('localhost', 'root', '');
    if ($con->initConexion('agenda')=='OK') {

        $insEvent = $con->ejecutarQuery('
	        DELETE FROM `eventos` WHERE `eventos`.`id` = "'.$id.'";
        ');
      $response['msg']= 'OK';
      
    }else {
      $response['msg']= 'No se pudo realizar la eliminación de los datos';
    }
  }else {
    $response['msg']= 'No se ha iniciado una sesión';
  }

  echo json_encode($response);

 ?>
