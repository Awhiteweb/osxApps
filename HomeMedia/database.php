<?php
$serverName = "localhost";
$username = "root";
$password = "";
$dbName = "movie_db";

$finals = array("id", "title", "location", "genre", "group", "episode", "season", "type");

$query = "SELECT `m`.`id` AS `" . $finals[0] . "`, "
								. "`m`.`title` AS `" . $finals[1] . "`, "
								. "`m`.`path` AS `" . $finals[2] . "`, "
								. "`ge`.`genre` AS `" . $finals[3] . "`, "
								. "`gr`.`group` AS `" . $finals[4] . "`, "
								. "`m`.`series_num` AS `" . $finals[5] . "`, "
								. "`m`.`tv_season` AS `" . $finals[6] . "`, "
								. "`t`.`genre` AS `" . $finals[7] . "` "
								. "FROM `main` AS `m` "
								. "LEFT JOIN `video_genres` AS `vge` "
								. "ON `m`.`id` = `vge`.`id` "
								. "LEFT JOIN `genres` AS `ge` "
								. "ON `vge`.`genre` = `ge`.`id` "
								. "LEFT JOIN `video_groups` AS `vgr` " 
								. "ON `m`.`id` = `vgr`.`id` "
								. "LEFT JOIN `groups` AS `gr` "
								. "ON `vgr`.`group` = `gr`.`id` " 
								. "JOIN `type` AS `t` "
								. "ON `m`.`type` = `t`.`id` ";
try {
	$conn = new PDO( "mysql:host=$serverName;dbname=$dbName", $username, $password );
	// set the PDO error mode to exception
	$conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$stmt = $conn->prepare( $query );
	$stmt->execute();
	$result = $stmt->fetchAll( PDO::FETCH_ASSOC );
// 	print_r( $result );
	echo '<?xml version="1.0" encoding="UTF-8"?>'."\n";
	echo "<videos>\n";
	foreach( $result as $r ) {
		echo "\t<video>\n";
		foreach( $r as $k=>$v ) {
			echo "\t\t<". $k . ">" . $v . "</" . $k . ">\n";
		}
		echo "\t</video>\n";
	}
	echo "</videos>\n";
}
catch(PDOException $e)
{
	echo "Connection failed: " . $e->getMessage();
}

?>