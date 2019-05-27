<?php
  require('./conector.php');

  session_start();
  $diacomp = 0;

  if (isset($_SESSION['user'])) {
    $con = new ConectorBD('localhost', 'root', '');
    if ($con->initConexion('agenda')=='OK') {

	    if ($_POST['allDay'] == true)
	    {
	    	$diacomp == 1;
	    }

	    $resEvent = $con->ejecutarQuery('
	        SELECT
	            *
	        FROM
	            usuarios
	        WHERE
	            correo = "'.$_SESSION['user'].'"
	    ');
	    while ($efila = $resEvent->fetch_assoc()) {
	        $response['id']=$efila['id'];
	        $id = $efila['id'];
    	}
    

        $insEvent = $con->ejecutarQuery('
	        INSERT INTO `eventos`(
			    `id`,
			    `titulo`,
			    `fecha_inicio`,
			    `hora_inicio`,
			    `fecha_finalizacion`,
			    `hora_finalizacion`,
			    `dia_comp`,
			    `fk_usuario`
			)
			VALUES(
			    NULL,
			    "'.$_POST['titulo'].'",
			    "'.$_POST['start_date'].'",
			    "'.$_POST['start_hour'].'",
			    "'.$_POST['end_date'].'",
			    "'.$_POST['end_hour'].'",
			    "'.$diacomp.'",
			    "'.$id.'"
			)
        ');
      $response['msg']= 'OK';
      $response['diacomp']= $diacomp;
      
    }else {
      $response['msg']= 'No se pudo realizar la inserción de los datos';
    }
  }else {
    $response['msg']= 'No se ha iniciado una sesión';
  }

  echo json_encode($response);

?>
