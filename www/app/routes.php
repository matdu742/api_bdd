<?php

declare(strict_types=1);

use App\Application\Actions\User\ListUsersAction;
use App\Application\Actions\User\ViewUserAction;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\App;
use Slim\Interfaces\RouteCollectorProxyInterface as Group;

return function (App $app) {
    $app->options('/{routes:.*}', function (Request $request, Response $response) {
        // CORS Pre-Flight OPTIONS Request Handler
        return $response;
    });

    $app->get('/', function (Request $request, Response $response) {
        $response->getBody()->write('Hello world!');
        return $response;
    });

    $app->group('/users', function (Group $group) {
        $group->get('', ListUsersAction::class);
        $group->get('/{id}', ViewUserAction::class);
    });

    $app->get('/getAllUser', function (Request $request, Response $response) {
// $app->get('/API/GestionAbsenceAPI/getAllAbsence', function (Request $request, Response $response) {  //test via localhost
        $db = $this->get(PDO::class);
        $sth = $db->prepare("SELECT * FROM `user`");
        $sth->execute();
        $data = $sth->fetchAll(PDO::FETCH_ASSOC);
        $payload = json_encode($data);
        $response->getBody()->write($payload);
        return $response->withHeader('Content-Type', 'application/json');
    });




    $app->get('/getAllUserByEmail', function (Request $request, Response $response) {
        $input = $request->getParsedBody();
        $Email = $input['Email'];
        $db = $this->get(PDO::class);
        $sth = $db->prepare("SELECT * FROM `user` where `user`.`Email` = :email");
        $sth->bindParam(':email', $Email);
        $sth->execute();
        $data = $sth->fetch(PDO::FETCH_OBJ); // Utilisez "fetch" au lieu de "fetchAll" pour obtenir un seul objet
        $payload = json_encode($data);
        $response->getBody()->write($payload);
        return $response->withHeader('Content-Type', 'application/json');
    });

    $app->delete('/deleteUser/{id}', function($request, $response, $args) {
        $db = $this->get(PDO::class);
        $sth = $db->prepare("DELETE FROM user WHERE id=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $result = $sth->execute();
        $response->getBody()->write(json_encode($result));
        return $response->withHeader('content-type', 'application/json')->withStatus(200);

    });

    $app->post('/AddUser', function (Request $request, Response $response) {
        $input = $request->getParsedBody();
        $Username = $input['Username'];
        $Email = $input['Email'];
        $EncryptedPassword = $input['EncryptedPassword'];

        $db = $this->get(PDO::class);
        $sth = $db->prepare("INSERT INTO `user` (`Username`, `Email`, `EncryptedPassword`, `CreatedPasswd`) VALUES (:name, :email, :password, NOW())");

        $sth->bindParam(':name', $Username);
        $sth->bindParam(':email', $Email );
        $sth->bindParam(':password', $EncryptedPassword );
        $result = $sth->execute();

        if ($result) {
            $response->getBody()->write(json_encode(['message' => 'Utilisateur ajouté avec succès']));
            return $response->withHeader('Content-Type', 'application/json')->withStatus(201);
        } else {
            $response->getBody()->write(json_encode(['message' => 'Erreur lors de l\'ajout de l\'utilisateur']));
            return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
        }
    });

    $app->put('/updateUser', function (Request $request, Response $response,array $args) {

        $input = $request->getParsedBody();
        $ID = $input['Id'];
        $Username = $input['Name'];
        $Email = $input['Email'];
        $EncryptedPassword = $input['Password'];

        $db = $this->get(PDO::class);

        $sth = $db->prepare("UPDATE `user` SET `Username` = :name,`Email`= :email,`EncryptedPassword`= :password,`CreatedPasswd`= NOW() WHERE `user`.`ID` = :idUser");

        try{

            $sth->bindParam(':idUser', $ID);
            $sth->bindParam(':name', $Username);
            $sth->bindParam(':email', $Email );
            $sth->bindParam(':password', $EncryptedPassword );

            $result = $sth->execute();

            $db = null;
            $response->getBody()->write(json_encode($result));
            return $response->withHeader('content-type', 'application/json')->withStatus(200);
        }catch (PDOException $e){
            $error = array( "message" => $e->getMessage() );

            $response->getBody()->write(json_encode($error));
            return $response ->withHeader('content-type', 'application/json')->withStatus(500);
        }
    });

    $app->get('/getCredentialsByUser/{iduser}', function (Request $request, Response $response, $args) {
        $input = $request->getParsedBody();

        $IdUser = $args['iduser'];
// $app->get('/API/GestionAbsenceAPI/getAllAbsence', function (Request $request, Response $response) {  //test via localhost
        $db = $this->get(PDO::class);
        $sth = $db->prepare("SELECT * FROM `credentials` where `IdUser` = :Iduser");
        $sth->bindParam(':Iduser', $IdUser);
        $sth->execute();
        $data = $sth->fetchAll(PDO::FETCH_ASSOC);
        $payload = json_encode($data);
        $response->getBody()->write($payload);
        return $response->withHeader('Content-Type', 'application/json');
    });

    $app->get('/getAllCredentials', function (Request $request, Response $response) {
// $app->get('/API/GestionAbsenceAPI/getAllAbsence', function (Request $request, Response $response) {  //test via localhost
        $db = $this->get(PDO::class);
        $sth = $db->prepare("SELECT * FROM `credentials`");
        $sth->execute();
        $data = $sth->fetchAll(PDO::FETCH_ASSOC);
        $payload = json_encode($data);
        $response->getBody()->write($payload);
        return $response->withHeader('Content-Type', 'application/json');
    });

    

    $app->delete('/deleteCredentials/{id}', function($request, $response, $args) {
        $db = $this->get(PDO::class);
        $sth = $db->prepare("DELETE FROM credentials WHERE id=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $result = $sth->execute();
        $response->getBody()->write(json_encode($result));
        return $response->withHeader('content-type', 'application/json')->withStatus(200);

    });



    $app->post('/addCredentials', function (Request $request, Response $response) {
        $db = $this->get(PDO::class);
   
        // Récupérez les données JSON envoyées dans la requête POST
        $requestData = $request->getParsedBody();

    
        // Récupérez les données depuis la demande
        $encryptedPassword = $requestData['encryptedPassword'];
        $complexity = $requestData['complexity'];
        $username = $requestData['username'];
        $emailAddress = $requestData['emailAddress'];
        $iduser = $requestData['idUser'];
        $url = $requestData['url'];
        $name = $requestData['name'];
        $category = $requestData['category'];
    
        // Préparez la requête SQL d'insertion
        $sth = $db->prepare("INSERT INTO `credentials` (`encryptedPassword`, `complexity`, `idUser`, `username`, `emailAddress`, `url`, `name`, `category`, `dateCreated`) 
                             VALUES (:encryptedPassword, :complexity, :idUser, :username, :emailAddress, :url, :name, :category, NOW())");
    
        // Liez les valeurs aux paramètres de la requête préparée
        $sth->bindParam(":encryptedPassword", $encryptedPassword);
        $sth->bindParam(":complexity", $complexity);
        $sth->bindParam(":username", $username);
        $sth->bindParam(":idUser", $iduser);
        $sth->bindParam(":emailAddress", $emailAddress);
        $sth->bindParam(":url", $url);
        $sth->bindParam(":name", $name);
        $sth->bindParam(":category", $category);
    
        // Exécutez la requête d'insertion
        $result = $sth->execute();


        if ($result) {
            $response->getBody()->write(json_encode(['message' => 'credentials ajouté avec succès']));
            return $response->withHeader('Content-Type', 'application/json')->withStatus(201);
        } else {
            $response->getBody()->write(json_encode(['message' => 'Erreur lors de l\'ajout de l\'credentials']));
            return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
        }

    });



    $app->put('/editCredentials/{id}', function (Request $request, Response $response, $args) {
        $db = $this->get(PDO::class);
        
        // Récupérez l'ID de la credential à éditer depuis les arguments de l'URL
        $credentialId = $args['id'];
    
        // Récupérez les données JSON envoyées dans la requête PUT
        $requestData = $request->getParsedBody();
    
        // Récupérez les données depuis la demande
        $encryptedPassword = $requestData['encryptedPassword'];
        $complexity = $requestData['complexity'];
        $username = $requestData['username'];
        $emailAddress = $requestData['emailAddress'];
        $url = $requestData['url'];
        $name = $requestData['name'];
        $category = $requestData['category'];
    
        // Préparez la requête SQL de mise à jour
        $sth = $db->prepare("UPDATE `credentials` SET 
                             `encryptedPassword` = :encryptedPassword,
                             `complexity` = :complexity,
                             `username` = :username,
                             `emailAddress` = :emailAddress,
                             `url` = :url,
                             `name` = :name,
                             `category` = :category
                             WHERE `id` = :id");
    
        // Liez les valeurs aux paramètres de la requête préparée
        $sth->bindParam(":encryptedPassword", $encryptedPassword);
        $sth->bindParam(":complexity", $complexity);
        $sth->bindParam(":username", $username);
        $sth->bindParam(":emailAddress", $emailAddress);
        $sth->bindParam(":url", $url);
        $sth->bindParam(":name", $name);
        $sth->bindParam(":category", $category);
        $sth->bindParam(":id", $credentialId);
    
        // Exécutez la requête de mise à jour
        $result = $sth->execute();
    
        if ($result) {
            $response->getBody()->write(json_encode(['message' => 'Credential mise à jour avec succès']));
            return $response->withHeader('Content-Type', 'application/json')->withStatus(200);
        } else {
            $response->getBody()->write(json_encode(['message' => 'Erreur lors de la mise à jour de la credential']));
            return $response->withHeader('Content-Type', 'application/json')->withStatus(500);
        }
    });
    
    
    
    
    
    
    
    

    
    
    
    
    
    






};