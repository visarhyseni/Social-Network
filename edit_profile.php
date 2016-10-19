<?php 
session_start();
include("includes/connection.php");
include("functions/functions.php");

if(!isset($_SESSION['user_email'])){
	
	header("location: index.php"); 
}
else {
?>
<!DOCTYPE html> 
<html>
	<head>
		<title>Welcome User!</title> 
	<link rel="stylesheet" href="styles/home_style.css" media="all"/>
	<style>
	input[type='file']{width:180px;}
	</style>
	</head> 
	
<body>
	<!--Container starts--> 
	<div class="container">
		<!--Header Wrapper Starts-->
		<div id="head_wrap">
			<!--Header Starts-->
			<div id="header">
				<ul id="menu">
					<li><a href="home.php">Kryefaqja</a></li>
					<li><a href="members.php">Anetaret</a></li>
					<strong>Temat:</strong> 
					<?php 
					
					$get_topics = "select * from topics"; 
					$run_topics = mysqli_query($con,$get_topics);
					
					while($row=mysqli_fetch_array($run_topics)){
						
						$topic_id = $row['topic_id'];
						$topic_title = $row['topic_title'];
					
					echo "<li><a href='topic.php?topic=$topic_id'>$topic_title</a></li>";
					}
					
					?>
				</ul>
				<form method="get" action="results.php" id="form1">
					<input type="text" name="user_query" placeholder="Search a topic"/> 
					<input type="submit" name="search" value="Search"/>
				</form>
			</div>
			<!--Header ends-->
		</div>
		<!--Header Wrapper ends-->
			<!--Content area starts-->
			<div class="content">
				<!--user timeline starts-->
				<div id="user_timeline">
					<div id="user_details">
					<?php 
					$user = $_SESSION['user_email'];
					$get_user = "select * from users where user_email='$user'"; 
					$run_user = mysqli_query($con,$get_user);
					$row=mysqli_fetch_array($run_user);
					
					$user_id = $row['user_id']; 
					$user_name = $row['user_name'];
					$user_pass = $row['user_pass'];
					$user_email = $row['user_email'];
					$user_country = $row['user_country'];
					$user_gender = $row['user_gender'];
					$user_image = $row['user_image'];
					$register_date = $row['register_date'];
					$last_login = $row['last_login'];
					
					//getting the number of unread messages 
					$sel_msg = "select * from messages where receiver='$user_id' AND status='unread' ORDER by 1 DESC"; 
					$run_msg = mysqli_query($con,$sel_msg);		
		
					$count_msg = mysqli_num_rows($run_msg);
					
					echo "
						<center>
						<img src='user/user_images/$user_image' width='200' height='200'/>
						</center>
						<div id='user_mention'>
						<p><strong>Emri:</strong> $user_name</p>
						<p><strong>Shteti:</strong> $user_country</p>
						<p><strong>Vizita e fundit:</strong> $last_login</p>
						<p><strong>Member Since:</strong> $register_date</p>
						
						<p><a href='my_messages.php?u_id=$user_id'>Mesazhet ($count_msg)</a></p>
						<p><a href='my_posts.php?u_id=$user_id'>Postimet (3)</a></p>
						<p><a href='edit_profile.php?u_id=$user_id'>Edito llogarine</a></p>
						<p><a href='logout.php'>Logout</a></p>
						</div>
					";
					?>
					</div>
				</div>
				<!--user timeline ends-->
				<!--Content timeline starts-->
				<div id="content_timeline">
					
					
					<form action="" method="post" id="f" class="ff" enctype="multipart/form-data">
					
					<table>
						<tr align="center">
							<td colspan="6"><h2>Edit Your Profile:</h2></td>
						</tr>
						<tr>
							<td align="right">Emri:</td>
							<td>
							<input type="text" name="u_name" required="required" value="<?php echo $user_name;?>"/>
							</td>
						</tr>
						
						<tr>
							<td align="right">Fjal&eumlkalimi:</td>
							<td>
							<input type="password" name="u_pass" required="required" value="<?php echo $user_pass;?>"/>
							</td>
						</tr>
						
						<tr>
							<td align="right">E-mail:</td>
							<td>
							<input type="email" name="u_email" required="required" value="<?php echo $user_email;?>"></td>
						</tr>
						
						<tr>
							<td align="right">Shteti:</td>
							<td>
							<select name="u_country" disabled="disabled">
								<option><?php echo $user_country;?></option>
								<option>Shqiperi</option>
								<option>Kosove</option>
								<option>Maqedoni</option>
								<option>Gjermani</option>
								<option>SH.B.A</option>
							</select>
							</td>
						</tr>
						
						<tr>
							<td align="right" >Gjinia:</td>
							<td>
							<select name="u_gender" disabled="disabled">
								<option><?php echo $user_gender;?></option>
								<option>Mashkull</option>
								<option>Femer</option>
								
							</select>
							</td>
						</tr>
						
						<tr>
							<td align="right">Photo:</td>
							<td>
							<input type="file" name="u_image" required="required"/>
							</td>
						</tr>
						
						<tr align="center">
							<td colspan="6">
							<input type="submit" name="update" value="Ruaj Ndryshimet"/>
							</td>
						</tr>
					</table>
				</form>
<?php 
	if(isset($_POST['update'])){
	
		$u_name = $_POST['u_name']; 
		$u_pass = $_POST['u_pass'];
		$u_email = $_POST['u_email'];
		$u_image = $_FILES['u_image']['name'];
		$image_tmp = $_FILES['u_image']['tmp_name'];
		
		move_uploaded_file($image_tmp,"user/user_images/$u_image");
		
		$update = "update users set user_name='$u_name', user_pass='$u_pass',user_email='$u_email',user_image='$u_image' where user_id='$user_id'";
		
		$run = mysqli_query($con,$update); 
		
		if($run){
		
		echo "<script>alert('Ndryshimet u ruajten!')</script>";
		echo "<script>window.open('home.php','_self')</script>";
		}
	
	}


?>
					
				</div>
				<!--Content timeline ends-->
			</div>
			<!--Content area ends-->
		
	</div>
	<!--Container ends-->

</body>
</html>
<?php } ?>