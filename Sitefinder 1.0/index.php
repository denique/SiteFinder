<?php
$servername = "localhost";
$username = "user1";
$password = "resu";
$dbname = "sitefinderRooms";
// Create connection
$conn = mysqli_connect($servername, $username, $password);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";

mysqli_select_db($conn,"sitefinderRooms");
?>

<!DOCTYPE HTML>

<html>
	<head>
		<title>FST SiteFinder</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body onload="imagechange();">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Wrapper -->
					<div id="wrapper">

						<!-- Panel (Banner) -->
							<section class="panel banner right">
								<div class="content color0 span-3-75">
									<h1 class="major">
									SiteFinder</h1>
									<p>Move the mouse to the edges of the screen to scroll<br/>
									
									Click or tap on the arrow to continue</p>
									<br/>
									<ul class="actions">
										<li><a href="#first" class="button special color1 circle icon fa-angle-right">Next</a></li>
									</ul>
								</div>
								<div class="image filtered span-1-75" data-position="25% 25%">
									<img src="images/pic01.jpg" alt="" />
								</div>
							</section>

						<!-- Panel (Spotlight) -->
							<section class="panel spotlight medium right" id="first">
								<div class="content span-7">
									<h1 class="major">Search</h1>
									
									<form action="" method="GET">  
										Search: <input type="text" name="term" /><br />  
										<input type="submit" value="Submit" />  
									
									</form>  
									
									<?php
										$query = empty($_GET['term']) ? '' : $_GET['term'];
					
										$query = str_replace(' ', '', $query);

										$rname = '';
										$rlat = '';
										$rlong = '';
										$seats1 = '';
										$features1 = '';

										$sql = "SELECT Room.*, RoomFeatures.* FROM Room, RoomFeatures WHERE RoomName = '$query' AND RoomFeatures.RoomID = Room.RoomID";
										$result=mysqli_query($conn,$sql);

										if (mysqli_num_rows($result) > 0) {
										    // output data of each row
										    while($row = $result->fetch_assoc()) {
										        $rname = $row["RoomName"];
										       	$rlat = $row["RoomLatitude"];
										       	$rlong = $row["RoomLongitude"];
										       	$imgfloor = $row["RoomFloorImg"];
										       	$imgdoor = $row["RoomDoorImg"];
										       	$seats1 = $row["RoomSeats"];
										       	$features1 = $row["NewFeature1"];
										    }
										} else {
										    echo "0 results";
										    $rname = "Not Found";

										}

										
										?>


								</div>
								<div class="image filtered tinted" data-position="top left">
									<img src="images/pic02.jpg" alt="" />
								</div>
							</section>



						<!-- Panel -->
							<section class="panel color1">
								
									
									
										<div id="map" style="width: 1100px";" ></div>
    <script>
      // Note: requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
     	var la = "<?php echo $rlat ?>";
		var lo = "<?php echo $rlong ?>";
		var name = "<?php echo $rname ?>";
      var map, infoWindow;
      function initMap() {
        latLng1 = new google.maps.LatLng(la, lo);
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 10.26, lng: -60.4},
          zoom: 10,
          mapTypeId: google.maps.MapTypeId.HYBRID
        


											
											

        });

        var marker = new google.maps.Marker({
								          position: latLng1,
								          map: map,
								          visible: true,
								          title : name
								        });
								        marker.setMap(map);

        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            var marker2 = new google.maps.Marker({
								          position: pos,
								          map: map,
								          visible: true,
								          icon: {
            path: google.maps.SymbolPath.CIRCLE,
            strokeColor: 'red',
            scale: 7
          },
								          title : "Your current location"
								        });
								        marker.setMap(map);
            map.setCenter(pos);
           	var bounds = new google.maps.LatLngBounds();
bounds.extend(myPlace);
bounds.extend(marker);
bounds.extend(marker2);
map.fitBounds(bounds);

          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      
      	

      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHWCKW56gqifm6EQLUuBTNZ22gvQ6HpdY&callback=initMap">
    </script>
								
								
							</section>
<script>
	function imagechange(){
var floorsrc = "<?php echo $imgfloor ?>"; 
document.getElementById("imap2").src="images/floor/"+floorsrc+".jpg";

var doorsrc = "<?php echo $imgdoor ?>"; 
document.getElementById("imap3").src="images/door/"+doorsrc+".jpg";
 
document.getElementById("imap1").src="images/entrance/fsts.jpg";
document.getElementById("imap4").src="images/entrance/fstn.jpg";
}
</script>
						<!-- Panel (Spotlight) -->
							<section class="panel spotlight large left">
								
								<div class="content span-5">
									
									<p><img id="imap1" src="images/entrance/sdefault.jpg" alt="south gate"  height="70%"/></p>
									
								</div>

								<div class="content span-5">
									
									<p><img id="imap4" src="images/entrance/ndefault.jpg" alt="north gate"  height="70%"/></p>
									
								</div>

								

								<div class="image filtered tinted" data-position="top right">
									<img src="images/pic02.jpg" alt="" />
								</div>
							</section>

							<section class="panel spotlight large left">
								
								

								<div class="content span-5">
									
									<p><img id="imap2" src="images/floor/fdefault.jpg" alt="floor" height="70%"/></p>

								</div>
								<div class="content span-5">
									
									<p><img id="imap3" src="images/door/ddefault.jpg" alt="door"  height="70%"/></p>

								</div>

								<div class="image filtered tinted" data-position="top right">
									<img src="images/pic02.jpg" alt="" />
								</div>
							</section>

							<section class="panel spotlight large left">
								<div class="content span-5">
									<h2 class="major">Extra Information</h2>
									<table border="1">
									  <caption>Room Information</caption>
									  
									  
									  <tr>
									    <td>Room Name</td>
									    <td><?php echo $rname;
										 ?></td>
									  </tr>

									  

									  <tr>
									    <td>Seats</td>
									    <td><?php echo $seats1;
										 ?></td>
									  </tr>

									  <tr>
									    <td>Features</td>
									    <td><?php echo $features1;
										 ?></td>
									  </tr>
									  
									</table>

								</div>
								<div class="image filtered tinted" data-position="top right">
									<img src="images/pic04.jpg" alt="" />
								</div>
							</section>

						
						<!-- Panel -->
							
							<section class="panel spotlight large left">
								<div class="content span-5">
									<h4 class="major">Request a new room</h4>
									<form action="request.php" method="POST">  
										Room Name: <input type="text" name="newrname" /> 
										
										 
										Room Latitude: <input type="text" name="newrlat" /> 
										Room Longitude: <input type="text" name="newrlong" />
										
										Nummber of seats: <input type="text" name="newrseats" />
										Features: <input type="text" name="newrproj" /> 
										Building Name: <input type="text" name="newrbuildingname" />
										<input type="submit" value="Submit" /> 
									
									</form>  

									

								</div>
								<div class="image filtered tinted" data-position="top right">
									<img src="images/pic05.jpg" alt="" />
								</div>
							</section>

				
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/main.js"></script>


	</body>
</html>