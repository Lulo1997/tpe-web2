<?php

require_once 'app/View/bandasView.php';
require_once 'app/Model/bandasModel.php';
require_once 'app/Model/generoModel.php';
require_once 'helpers/userHelper.php';



class bandasController{
    private $view;
    private $model;
    private $genreModel;
    private $helper;

    function __construct(){
        $this->view = new bandasView();
        $this->model= new bandasModel();
        $this->genreModel= new generoModel();
        $this->helper = new userHelper();
    }



    function showHome(){
        
        $bandas = $this->model->getAll();
        
        $this->view->showBandas($bandas);
    }

    function viewDetails($id){
        $banda = $this->model->getOne($id);
        $this->view->showDetails($banda);
    }

    function deleteBand($id){
        
        $this->helper->checkLoggedIn();

        $this->model->deleteBandFromDb($id);
       
        $this->view->showHomeLocation();    
    }


    function showForm($action){

         $this->helper->checkLoggedIn();
        $genres = $this->genreModel->showGenreFromdDb();
        
        $this->view->showFormBand($action,$genres);
        
    }


  function createBand(){
    $this->helper->checkLoggedIn();

        $banda = $_POST['banda'];
        $discos = $_POST['discos'];
        $origen = $_POST['origen'];
        $genero = $_POST['genero'];

        $this->model->insertBandFromDb($banda,$discos,$origen,$genero);

        $this->view->showHomeLocation();

    } 

    function updateForm($id){
        $this->helper->checkLoggedIn();
        $band = $this->model->getOne($id);
        //$genre = $this->genreModel->getGenre($band->id_genero_fk);

        $genres = $this->genreModel->showGenreFromdDb();
        $this->view->showFormUpdate($band,$genres,"update");
        
    }

    function finishUpdate($id){
        $this->helper->checkLoggedIn();
        $banda = $_POST['banda'];
        $discos = $_POST['discos'];
        $origen = $_POST['origen'];
        $genero = $_POST['genero'];
        
      
        $this->model->editBandFromDb($banda,$discos,$origen,$genero,$id);
        $this->view->showHomeLocation();

    }    


    
}
