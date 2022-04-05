<?php
$server = "localhost";
$user = "root";
$password = "";
$database = "tourism";
$koneksi = mysqli_connect($server, $user, $password, $database);
if (!$koneksi) {
	die("Gagal terhubung dengan database: " . mysqli_connect_error());
}
// if (!isset($_POST['action'])) $_POST['action'] = "read";

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
	$sql = "SELECT * FROM `tourism_list`";
	$query = mysqli_query($koneksi, $sql);
	$rowcount = mysqli_num_rows($query);
	header('Content-Type: application/json');
	header("Access-Control-Allow-Origin: *");
	echo '{"status":"ok","totalResults":' . $rowcount . ',"tourismPlaceList":';
	while ($data = mysqli_fetch_assoc($query)) {
		if ($data['id']) {
			$query2 = mysqli_query($koneksi, "SELECT `image` FROM `detail_image` WHERE `detail_image`.`id_tourism_list` = " . $data["id"]);
			while ($data2 = mysqli_fetch_assoc($query2)) {
				$result[] = $data2['image'];
			}
			$data['detail_images'] = $result;
			unset($result);
		}
		$rows[] = $data;
	}
	print str_replace("\\\\n", "\\n", json_encode($rows));
	echo '}';
} else if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_POST['id']) {
	if (!isset($_POST['id'])) {
		echo "ID Required!";
	} else {
		$sql = "SELECT * FROM `tourismlistplace` WHERE `tourismlistplace`.`id` = " . $_POST['id'];
		$query = mysqli_query($koneksi, $sql);
		if ($query) {
			if ($user = mysqli_fetch_array($query)) {
				$data = ['title', 'description', 'openDay', 'openTime', 'price', 'location', 'img', 'img1', 'img2', 'img3'];
				for ($a = 0; $a < 10; $a++) {
					if (isset($_POST[$data[$a]])) {
						$sql = "UPDATE `tourismlistplace` SET `" . $data[$a] . "` = '" . str_replace("'", "\'", $_POST[$data[$a]]) . "' WHERE `tourismlistplace`.`id` = " . $_POST['id'];
						$query = mysqli_query($koneksi, $sql);
						if ($query) echo 'Edit ' . $data[$a] . ' Successfully<br>';
						else echo 'Edit ' . $data[$a] . ' Failed!<br>';
					}
				}
			} else echo 'ID Not Found!';
		} else echo "ID Required!";
	}
} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	if (
		!isset($_POST['title']) ||
		!isset($_POST['description']) ||
		!isset($_POST['openDay']) ||
		!isset($_POST['openTime']) ||
		!isset($_POST['price']) ||
		!isset($_POST['location']) ||
		!isset($_POST['img1'])
	) {
		echo "Data tidak lengkap!";
	} else {
		$sql = "INSERT INTO `tourismlistplace` (`id`, `title`, `description`, `openDay`, `openTime`, `price`, `location`, `img`, `img1`, `img2`, `img3`) 
                    VALUES (NULL, '" . $_POST['title'] . "', '" . str_replace("'", "\'", $_POST['description']) . "', '" . $_POST['openDay'] . "', '" . $_POST['openTime'] . "', '" .
			$_POST['price'] . "', '" . $_POST['location'] . "', '" . $_POST['img'] . "', '" . $_POST['img1'] . "', '" . $_POST['img2'] . "', '" . $_POST['img3'] . "');";
		echo $sql . '<br><br>';
		$query = mysqli_query($koneksi, $sql);
		if ($query) echo 'Create Successfully';
		else echo 'Create Failed!';
	}
} else if ($_SERVER['REQUEST_METHOD'] === 'DELETE' && $_GET['id'] !== NULL) {
	$sql = "SELECT * FROM `tourism_list` WHERE `tourism_list`.`id` = " . $_GET['id'];
	$sql2 = "SELECT * FROM `detail_image` WHERE `detail_image`.`id_tourism_list` = " . $_GET['id'];
	$query = mysqli_query($koneksi, $sql);
	$query2 = mysqli_query($koneksi, $sql2);
	if (mysqli_fetch_array($query) && mysqli_fetch_array($query2)) {
		$sql = "DELETE FROM `tourism_list` WHERE `tourism_list`.`id` = " . $_GET['id'];
		$sql2 = "DELETE * FROM `detail_image` WHERE `detail_image`.`id_tourism_list` = " . $_GET['id'];
		$query = mysqli_query($koneksi, $sql);
		$query2 = mysqli_query($koneksi, $sql2);
		if ($query && $query2) echo 'Delete Successfully';
		else echo 'Delete Failed!';
	} else echo 'Data Not Found!';
} else {
	echo "Need and valid request!";
}

// print_r($_GET['id']);
