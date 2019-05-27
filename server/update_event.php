<?php
 
	require('./conector.php');

	session_start();

	$id = $_POST['id'];
	$finicio = $_POST['start_date'];
	$ffin = $_POST['end_date'];

  	if (isset($_SESSION['user'])) {
    	$con = new ConectorBD('localhost', 'root', '');
    	if ($con->initConexion('agenda')=='OK') {

        	$insEvent = $con->ejecutarQuery('
	        	UPDATE `eventos` 
	        	SET 
	        		`fecha_inicio` = "'.$finicio.'", 
	        		`fecha_finalizacion` = "'.$ffin.'"
	        	WHERE 
	        		`eventos`.`id` = '.$id.';
        	');
      	$response['msg']= 'OK';
      
    	}else {
      		$response['msg']= 'No se pudo realizar la actualización de los datos';
    	}
  	}else {
    	$response['msg']= 'No se ha iniciado una sesión';
  	}

  	echo json_encode($response);

?>
