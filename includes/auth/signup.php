<?php

    // instruction: call DB class
    $db =new DB();

    // instruction: get all POST data
    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $confirm_password = $_POST["confirm_password"];

    /* 
        instruction: retrieve the user based on the email provided to make sure there is no duplication of email in the users table
    */
    $user = $db->fetch(
        "SELECT * FROM users WHERE email = :email", 
          [
              'email' => $email
          ]
      );

    /* 
        instruction: do error checking 
        - make sure all the fields are not empty
        - make sure password is match
        - make sure password is at least 8 chars.
        -  make sure email provided is not already exists in the users table
    */
    if(empty($name) || empty($email) || empty($password) || empty($confirm_password)){
        $error = 'Mana your info?';
    } else if ($password !== $confirm_password){
        $error = "ps apa boleh salah";
    } else if (strlen($password) < 8){
        $error = 'Not enough password';
    } else if ($user){
        $error = 'Oh nyo, its not the same user';
    } 

    // instruction: if error found, set error into session and redirect user back to signup page
    if(isset($error)){
        $_SESSION['error']=$error;
        header("Location:/signup");
        exit;
    }

    // instruction: if no error found, process to account creation
    $sql = "INSERT INTO users (`name`,`email`,`password`) VALUES (:name, :email, :password)";
    $db->insert($sql,[
        'name' => $name,
        'email' => $email,
        'password' => password_hash($password, PASSWORD_DEFAULT)
    ]);

    // instruction: retrieve the newly signup user data
    $sql = "SELECT * FROM users WHERE email = :email";
    $newuser = $db->fetch($sql,
        [
            'email' => $email
        ]
    );

    // instruction: set the user data into session
    $_SESSION['user'] = $newuser;

    // set success message into session
    $_SESSION["success"] = "Account created successfully. You can now submit your answers";

    // instruction: redirect user to home page
    header('Location: /');
    exit;
