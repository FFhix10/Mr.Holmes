<!--AUTHOR: Lucksi
Copyright © 2021 Lucksi
License: GNU General Public License v3.0-->
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <?php
            require("../Actions/Session_Checker.php");
            require_once("../Actions/Theme_Controller.php");
            $File_Name = "Main.css";
            Body_Theme($File_Name);
        ?>
        <link rel = "icon" href = "../Icon/Base/Logo.png">
        <meta charset ="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.9">
        <meta name="theme-color" content="#000000">
        <script src = "../Script/Language.js"></script>
        <script src = "../Script/Author.js"></script>
        <script src = "../Script/Arrow.js"></script>
    </head>
    <?php
        require_once("../Actions/Language_Controller.php");
        $Modality = "Main";
        Get_Language($Modality);
    ?>
    <div class = "Top-bar">
        <p>MR.HOLMES</p>
        <div class = "Hidden-bar">
            <button id = "Menu" onclick="Active_Mobile()">MENU</button>
            <div class="Options" id ="Options1">
                <a href="Username.php">Username</a>
                <a href="Websites.php">Website</a>
                <a href="Phone.php">Phone</a>
                <a href = "Ports.php">Port</a>
                <a href="../Login/New_User.php">Create User</a>
                <a id = "change1" onclick="English()">Author</a>
                <a onclick="Italian_Main_Mobile()">Italiano</a>
                <a onclick="English_Main_Mobile()">English</a>
                <a onclick="French_Main_Mobile()">Français</a>
            </div>
        </div>
        <div class = "languages">
            <button id = "Current"onclick="Active_Language()">English</button>
            <div class = "Content" id = "Content">
                <a onclick="Italian_Main()">Italiano</a>
                <a onclick="English_Main()">English</a>
                <a onclick="French_Main()">Français</a>
            </div>
        </div>
    </div>
    <div class = "Upper-card">
        <?php require_once("../Actions/Theme_Controller.php");Image()?>
        <p id = "Const">A COMPLETE OSINT TOOL</p>
        <div class = "Cards">
            <div id = "Username">
                <?php require_once("../Actions/Theme_Controller.php");Cards()?>
            </div>
        </div>
        <a href = "#Footer" id = "Arrow" onclick="Active()"></a>
        <div class = "Footer" id = "Footer" name = "Footer">
            <p id = "Const">MY-CONTACTS</p>
            <div class = "Board">
                <a href = "https://instagram.com/lucks_022" target = "blank"><img src = "../Icon/instagram.png" id = "Exc"></a>
                <a href = "mailto:lukege287@gmail.com" target = "blank"><img src = "../Icon/Email.png"></a>
                <a href = "https://github.com/Lucksi" target = "blank"><img src = "../Icon/Git-hub.png"></a>
                <a href = "https://www.linkedin.com/in/luca-garofalo-7261ba21a" target = "blank"><img src = "../Icon/linkedin.png"></a>
            </div>
        </div>
    </body>
</html>
