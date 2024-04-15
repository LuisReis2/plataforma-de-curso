package br.com.curso.model;

public class Aula {
    private String  titleAula, contentAula;
     /*
    * bom ainda indeciso com os tipos dos atributos, content seria o conteudo o conteudo provavelmente
    * seria uma url, porém deixar como string ainda continua podendo trasnformar isso em um video
    * alocado no site? ou teria uma conversão futura?
    *
    * */

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
