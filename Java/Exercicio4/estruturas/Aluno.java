package estruturas;
import java.util.Date;

public class Aluno extends Pessoa {

    public enum NIVEL {
        INDEFINIDO,
        GRADUAÇÃO,
        ESPECIALIZAÇÃO,
        MESTRADO,
        DOUTORADO
    };

    private String codigo;
    private NIVEL nivel;

    public Aluno() {
        this.setCodigo("00000000");
        this.setNivel(NIVEL.INDEFINIDO);
    }

    public Aluno(String nome, Date dtnascimento, SEXO sexo, String codigo, NIVEL nivel) {
        super(nome, dtnascimento, sexo);
        this.setCodigo(new Aluno().getCodigo());
        this.setCodigo(codigo);
        this.setNivel(nivel);
    }

    public Aluno(Aluno a) {
        this(a.getNome(), a.getDtnascimento(), a.getSexo(), a.getCodigo(), a.getNivel());
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        if (codigo.matches("[0-9]+") && codigo.length() > 1)
        	this.codigo = codigo;
    }

    public NIVEL getNivel() {
        return nivel;
    }

    public void setNivel(NIVEL nivel) {
        this.nivel = nivel;
    }

    @Override
    public String toString() {
        StringBuffer resultado = new StringBuffer();
        
        resultado.append("\nAluno");
        resultado.append(super.toString()+",\n\t");
        resultado.append("\n\t{");
        resultado.append("\n\t\tCodigo: "+this.getCodigo());
        resultado.append("\n\t\tNivel: "+ this.getNivel());
        resultado.append("\n\t}");

        return resultado.toString();
    }
}
