package br.com.curso.model;

public class Curso {
    private String NomeCurso, DescCurso, IdCurso;


    public Curso(String nomeCurso, String descCurso, String idCurso) {
        NomeCurso = nomeCurso;
        DescCurso = descCurso;
        IdCurso = idCurso;
    }

    public String getNomeCurso() {
        return NomeCurso;
    }

    public void setNomeCurso(String nomeCurso) {
        NomeCurso = nomeCurso;
    }

    public String getDescCurso() {
        return DescCurso;
    }

    public void setDescCurso(String descCurso) {
        DescCurso = descCurso;
    }

    public String getIdCurso() {
        return IdCurso;
    }

    public void setIdCurso(String idCurso) {
        IdCurso = idCurso;
    }
}
