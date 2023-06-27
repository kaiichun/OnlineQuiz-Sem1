<?php

    // instruction: redirect to home page if user is not admin
    if ( !isCurrentUserAdmin() ) {
        header( 'Location: /' );
        exit;
    }

    // instruction: call DB class
    $db =new DB();

    // instruction: get all POST data
    $name = $_POST["name"];
    $email = $_POST["email"];
    $role = $_POST["role"];
    $id = $_POST["id"];

    /* 
        instruction: do error checking 
        - make sure all the required fields are not empty
        - make sure the new email is not already taken
    */
    if(empty($name) || empty($email) || empty($role) || empty($id) ){
        $error = 'Mana your info?';
    } else {
        $sql = 'SELECT * FROM users WHERE email = :email AND id != :id';
        $new = $db->fetch($sql,[
            'email' => $email,
            'id' => $id
        ]);
    }

    // instruction: check if the email is already taken
    $user = $db->fetch(
        "SELECT * FROM users WHERE email = :email", 
            [
                'email' => $email
            ]
        );

    // instruction: if user found, set error message
    if ($user) {
        $error = "The eamil have been taken!";
    }

    // instruction: if error found, set error message session & redirect user back to /manage-users-edit page
    if ( isset( $error ) ) {
        $_SESSION['error'] = $error;
        header("Location: /manage-users-edit?id=$id");
        exit;
    }

    // instruction: if no error found, process to account update
    $sql = 'UPDATE users SET name = :name, email = :email, role = :role WHERE id = :id';
    $db->update($sql, 
        [
            'name' => $name,
            'email' => $email,
            'role' => $role,
            'id' => $id
        ]
    );

    // set success message session
    $_SESSION["success"] = "User has been updated successfully";

    // instruction: redirect user back to /manage-users page
    header("Location: /manage-users");
    exit;
    