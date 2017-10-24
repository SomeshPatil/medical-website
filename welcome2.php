<?php
    $server = 'localhost';
    $username = 'root';
    $password = 'root43214';
    $database = 'medicine';


    $db = mysqli_connect($server, $username, $password, $database)
          or die('<b>Error Connecting to MySQL Server or Else DB Not Found!</b>');

    include('session.php');
?>
<html>
   
   <head>
      <title>Welcome </title>
   </head>
   
   <body>
      <h1>Welcome 

      	<?php echo $_SESSION['login_user']."<br />"; 
      		echo $login_session_first."<br />";
      		echo $login_session_last."<br />";
      		echo $_SESSION['login_id'];


      		?>
      						



      					</h1> 
      <h2><a href = "logout.php">Sign Out</a></h2>
   </body>
   
</html>