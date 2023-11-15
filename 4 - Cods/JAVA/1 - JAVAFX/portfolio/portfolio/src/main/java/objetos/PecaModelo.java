/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objetos;

/**
 *
 * @author Jd
 */
public class PecaModelo {

    private int fkPecaId; // Chave estrangeira referente a pecaId na tabela Peca
    private String fkIdGeralPeca; // Chave estrangeira referente a idGeralPeca na tabela Peca
    private int fkModeloId; // Chave estrangeira referente a modeloId na tabela Modelo

    /**
     * @return the fkPecaId
     */
    public int getFkPecaId() {
        return fkPecaId;
    }

    /**
     * @param fkPecaId the fkPecaId to set
     */
    public void setFkPecaId(int fkPecaId) {
        this.fkPecaId = fkPecaId;
    }

    /**
     * @return the fkIdGeralPeca
     */
    public String getFkIdGeralPeca() {
        return fkIdGeralPeca;
    }

    /**
     * @param fkIdGeralPeca the fkIdGeralPeca to set
     */
    public void setFkIdGeralPeca(String fkIdGeralPeca) {
        this.fkIdGeralPeca = fkIdGeralPeca;
    }

    /**
     * @return the fkModeloId
     */
    public int getFkModeloId() {
        return fkModeloId;
    }

    /**
     * @param fkModeloId the fkModeloId to set
     */
    public void setFkModeloId(int fkModeloId) {
        this.fkModeloId = fkModeloId;
    }

}
