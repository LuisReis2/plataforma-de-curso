package br.com.curso.model;

public class Modulo {
    private String nomeModulo,descModulo;

    public Modulo(String nomeModulo, String descModulo) {
        this.nomeModulo = nomeModulo;
        this.descModulo = descModulo;
    }

    public String getNomeModulo() {
        return nomeModulo;
    }

    public void setNomeModulo(String nomeModulo) {
        this.nomeModulo = nomeModulo;
    }

    public String getDescModulo() {
        return descModulo;
    }

    public void setDescModulo(String descModulo) {
        this.descModulo = descModulo;
    }
}
