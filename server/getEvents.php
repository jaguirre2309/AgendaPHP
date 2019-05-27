<?php
  require('conector.php');

  session_start();

  if (isset($_SESSION['user'])) {

    $con = new ConectorBD('localhost', 'root', '');
    if ($con->initConexion('agenda')=='OK') {
    

      $resEvent = $con->ejecutarQuery('
        SELECT
            tp.id,titulo,fecha_inicio,hora_inicio,fecha_finalizacion,hora_finalizacion,dia_comp,fk_usuario
        FROM
            eventos tp
            LEFT JOIN usuarios t1
            ON tp.fk_usuario = t1.id
        WHERE
            t1.correo = "'.$_SESSION['user'].'"
      ');

      $i=0;
      while ($efila = $resEvent->fetch_assoc()) {
        $response['eventos'][$i]['title']=$efila['titulo'];
        $response['eventos'][$i]['start']=$efila['fecha_inicio'];
        $response['eventos'][$i]['end']=$efila['fecha_finalizacion'];
        $response['eventos'][$i]['id']=$efila['id']; 
        $i++;
      }
      $response['msg'] = "OK";

    }else {
      $response['msg'] = "No se pudo conectar a la Base de Datos";
    }
  }else {
    $response['msg'] = "No se ha iniciado una sesión";
  }
  

  echo json_encode($response);



 ?>