package br.com.curso.model;

public class Curso{
    private String NomeCurso,DescCurso;
    /*
    * o FKIDCURSO ainda é uma icognita de como funciona, coloquei ele representando um valor
    * do tipo usuario porque seguindo a logica de fk tenho q representar o mesmo valor com o
    * valor do usuario. porém não sei ainda
    * */

    public Curso(String nomeCurso, String descCurso) {
        NomeCurso = nomeCurso;
        DescCurso = descCurso;
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
}
