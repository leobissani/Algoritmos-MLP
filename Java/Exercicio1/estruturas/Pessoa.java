package estruturas;
import java.util.Date;

public class implements Comparable<Pessoa> {

    public enum SEXO {
        INDEFINIDO,
        MASCULINO,
        FEMININO
    };

    private String nome;
    private Date dtnascimento;
    private SEXO sexo;

    public Pessoa() {
        this.setNome("NOME INDEFINIDO");
        this.setDtnascimento(new Date());
        this.setSexo(SEXO.INDEFINIDO);
    }

    public Pessoa(String nome, Date dtnascimento, SEXO sexo) {
	this();
        this.setNome(nome);
        this.setDtnascimento(dtnascimento);
        this.setSexo(sexo);
    }

    public Pessoa(Pessoa p) {
        this(p.getNome(), p.getDtnascimento(), p.getSexo());
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        if (!nome.isEmpty() && Character.isLetter(nome.charAt(0)) && nome.contains(" "))
        	this.nome = nome;
    }

    public Date getDtnascimento() {
        return (Date) dtnascimento.clone();
    }

    public void setDtnascimento(Date dtnascimento) {
        if (!dtnascimento.after(new Date()))
            this.dtnascimento = (Date) dtnascimento.clone();
    }

    public SEXO getSexo() {
        return sexo;
    }

    public void setSexo(SEXO sexo) {
        this.sexo = sexo;
    }

    @Override
    public String toString() {
        StringBuffer resultado = new StringBuffer();

        resultado.append("\n\tPessoa");
        resultado.append("\n\t{");
        resultado.append("\n\t\tNome: "+this.getNome());
        resultado.append("\n\t\tSexo: "+this.getSexo());
        resultado.append("\n\t\tNascimento: "+this.getDtnascimento());
        resultado.append("\n\t}");

        return resultado.toString();
    }

    @Override
    public Pessoa clone() {
        return new Pessoa(this);
    }

    public int compareTo(Pessoa other) {
        return this.getNome().compareTo(other.getNome());
    }
}
