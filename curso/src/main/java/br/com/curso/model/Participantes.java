package br.com.curso.model;

public class Participantes {
    private String idParticipante;
    private String idUserFk ;
    private String idCursoFk;

    public Participantes(String idParticipante, String idUserFk, String idCursoFk) {
        this.idParticipante = idParticipante;
        this.idUserFk = idUserFk;
        this.idCursoFk = idCursoFk;
    }

    public Participantes(String  idUserFK , String idCursoFk) {
        this.idUserFk = idUserFK;
        this.idCursoFk = idCursoFk;
    }

    public String getIdParticipante(){
        return idParticipante;
    }

    public void setIdParticipante(String idParticipante) {
        this.idParticipante = idParticipante;
    }

    public String getIdUserFk() {
        return idUserFk;
    }

    public void setIdUserFk(String idUserFk) {
        this.idUserFk = idUserFk;
    }

    public String getIdCursoFk() {
        return idCursoFk;
    }

    public void setIdCursoFk(String idCursoFk) {
        this.idCursoFk = idCursoFk;
    }
}
