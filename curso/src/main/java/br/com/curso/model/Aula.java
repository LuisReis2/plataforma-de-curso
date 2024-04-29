package br.com.curso.model;

public class Aula {
    private String idAula;
    private String FkCurso;
    private String titleAula, contentAula;
    /*
     * bom ainda indeciso com os tipos dos atributos, content seria o conteudo o conteudo provavelmente
     * seria uma url, porém deixar como string ainda continua podendo trasnformar isso em um video
     * alocado no site? ou teria uma conversão futura?
     *
     * */


    public Aula(String titleAula, String contentAula, String fkCurso) {
        FkCurso = fkCurso;
        this.titleAula = titleAula;
        this.contentAula = contentAula;
    }

    public Aula(String idAula, String fkCurso, String titleAula, String contentAula) {
        this.idAula = idAula;
        FkCurso = fkCurso;
        this.titleAula = titleAula;
        this.contentAula = contentAula;
    }

    public String getIdAula() {
        return idAula;
    }

    public void setIdAula(String idAula) {
        this.idAula = idAula;
    }

    public String getFkCurso() {
        return FkCurso;
    }

    public void setFkCurso(String fkCurso) {
        FkCurso = fkCurso;
    }

    public String getTitleAula() {
        return titleAula;
    }

    public void setTitleAula(String titleAula) {
        this.titleAula = titleAula;
    }

    public String getContentAula() {
        return contentAula;
    }

    public void setContentAula(String contentAula) {
        this.contentAula = contentAula;
    }
}
