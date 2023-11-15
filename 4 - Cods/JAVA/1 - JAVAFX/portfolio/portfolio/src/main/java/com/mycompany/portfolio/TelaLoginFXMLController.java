/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXMLController.java to edit this template
 */
package com.mycompany.portfolio;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;

import javafx.scene.control.PasswordField;
import javafx.scene.control.SplitPane;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;

/**
 * FXML Controller class
 *
 * @author INFO
 */
public class TelaLoginFXMLController implements Initializable {

    @FXML
    private TextField emailLogin;
    @FXML
    private PasswordField senhaLogin;
    @FXML
    private ImageView imgLogo;
    @FXML
    private AnchorPane anchorPane;
    @FXML
    private SplitPane splitPane;

    /**
     * Initializes the controller class.
     *
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            Image logo = new Image("imgs/logo.png");
            imgLogo.setImage(logo);
        } catch (Exception e) {
            System.err.println("Erro ao carregar a imagem: " + e.getMessage());
        }
        
       
    }

    @FXML
    private void clickEsqueciSenha(ActionEvent event) {
    }

    @FXML
    private void clickCriarConta(ActionEvent event) throws IOException {
        Portfolio.setRoot("telaCadastroFXML");
    }

    @FXML
    private void clickContinuar(ActionEvent event) {
    }

}
