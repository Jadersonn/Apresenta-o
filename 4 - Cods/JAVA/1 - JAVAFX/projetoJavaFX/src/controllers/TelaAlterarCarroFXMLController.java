/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXMLController.java to edit this template
 */
package controllers;

import dao.CarroDAO;
import dao.ConexaoDAO;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.MenuButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import objetos.Carro;

/**
 * FXML Controller class
 *
 * @author INFO
 */
public class TelaAlterarCarroFXMLController implements Initializable {

    @FXML
    private Text msgOla;
    @FXML
    private MenuButton opcoes;
    @FXML
    private TextField nomeCarro;
    @FXML
    private TextArea descricaoCarro;

    private Carro carro = new Carro();

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    @FXML
<<<<<<< HEAD
    private void clickCadastrar(ActionEvent event) throws IOException {
        Portfolio.setRoot("telaCadastrarItensFXML");
    }

    @FXML
    private void clickConfig(ActionEvent event) throws IOException {
        Portfolio.setRoot("telaConfigFXML");
    }

    @FXML
    private void clickSair(ActionEvent event) throws IOException {
        Portfolio.setRoot("telaLoginFXML");
=======
    private void clickCadastrar(ActionEvent event) {

    }

    @FXML
    private void clickConfig(ActionEvent event) {
    }

    @FXML
    private void clickSair(ActionEvent event) {
>>>>>>> 690cd04904066c293c2081f25931822e3f5b90d8
    }

    @FXML
    private void salvarCarro(ActionEvent event) throws IOException {
        ConexaoDAO connection = new ConexaoDAO();
        CarroDAO carroDAO = new CarroDAO(connection.conectaBD());
        carro.setNomeCarro(nomeCarro.getText());
        carro.setDescricaoCarro(descricaoCarro.getText());
        carroDAO.atualizarCarro(carro);
        Portfolio.setRoot("telaPesquisaAdminFXML");
    }

    void receberDados(Carro carroSelecionado) {
        carro = carroSelecionado;
        nomeCarro.setText(carro.getNomeCarro());
        descricaoCarro.setText(carro.getDescricaoCarro());
    }

    @FXML
    private void clickVoltar(ActionEvent event) throws IOException {
        Portfolio.setRoot("telaPesquisaAdminFXML");
    }

}
