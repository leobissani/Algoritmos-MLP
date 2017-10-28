package estruturas;

import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;
import estruturas.*;
import estruturas.Pessoa.SEXO;

public class Main {

    private static SimpleDateFormat auxiliarData;        

    public static void exercicio1b() throws ParseException {
    	
    	Pessoa[] listaPessoas = new Pessoa[12];
    	
    	listaPessoas[0] = new Pessoa("Danny Carey", auxiliarData.parse("10/05/1961"), Pessoa.SEXO.MASCULINO);
    	listaPessoas[1] = new Pessoa("Adam Jones", auxiliarData.parse("15/01/1965"), Pessoa.SEXO.MASCULINO);
    	listaPessoas[2] = new Pessoa("Maynard James Keenan", auxiliarData.parse("17/04/1964"), Pessoa.SEXO.MASCULINO);
    	listaPessoas[3] = new Pessoa("Adam Jones", auxiliarData.parse("19/09/1971"), Pessoa.SEXO.MASCULINO);
    	listaPessoas[4] = new Aluno("Leonardo Bissani", auxiliarData.parse("13/06/1989"), Pessoa.SEXO.MASCULINO, "220485", Aluno.NIVEL.GRADUAÇÃO);
    	listaPessoas[5] = new Aluno("Arnaldo Antunes", auxiliarData.parse("07/03/1983"), Pessoa.SEXO.MASCULINO, "217484", Aluno.NIVEL.MESTRADO);
    	listaPessoas[6] = new Aluno("Bárbara Broetto", auxiliarData.parse("04/11/1960"), Pessoa.SEXO.FEMININO, "183250", Aluno.NIVEL.DOUTORADO);
    	listaPessoas[7] = new Aluno("César Coelho", auxiliarData.parse("10/09/1956"), Pessoa.SEXO.FEMININO, "189520", Aluno.NIVEL.DOUTORADO);
    	listaPessoas[8] = new Funcionario("Jorge Junqueira", auxiliarData.parse("11/12/1980"), Pessoa.SEXO.MASCULINO, new Date(), Funcionario.CATEGORIA.PROGRAMADOR);
    	listaPessoas[9] = new Funcionario("Kathleen Kronenberg", auxiliarData.parse("26/05/1995"), Pessoa.SEXO.FEMININO, new Date(), Funcionario.CATEGORIA.ANALISTA);
    	listaPessoas[10] = new Funcionario("Laís Loureiro", auxiliarData.parse("02/03/1977"), Pessoa.SEXO.FEMININO, new Date(), Funcionario.CATEGORIA.GERENTE);
    	listaPessoas[11] = new Funcionario("Milton Macedo", auxiliarData.parse("22/08/1999"), Pessoa.SEXO.FEMININO, new Date(), Funcionario.CATEGORIA.INDEFINIDO);

    	for(Pessoa pessoas : listaPessoas) {
    		System.out.println(pessoas);
    	}
    	
    }
    
    
    public static void main(String[] args) throws ParseException {
        auxiliarData = new SimpleDateFormat("dd/MM/yyyy");

        System.out.println("\n");
        exercicio1b();
    }

}
