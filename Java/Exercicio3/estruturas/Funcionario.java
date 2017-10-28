package estruturas;

import java.util.Date;

public class Funcionario extends Pessoa {
	
	public enum CATEGORIA { INDEFINIDO, PROGRAMADOR, ANALISTA, GERENTE };
	
	protected Date dataIngresso;
	protected CATEGORIA categoria;
		
	public Funcionario() {
		this.setDataIngresso(new Date());
		this.setCategoria(CATEGORIA.INDEFINIDO);
	}
	
	public Date getDataIngresso() {
		return dataIngresso;
	}

	public void setDataIngresso(final Date dataIngresso) {
		this.dataIngresso = (Date)dataIngresso.clone();
	}

	public CATEGORIA getCategoria() {
		return categoria;
	}

	public void setCategoria(final CATEGORIA categoria) {
		this.categoria = categoria;
	}
	
	@Override
	public String toString() {
		StringBuffer resultado = new StringBuffer();
		
		resultado.append("\tFuncionario \n\t{").append("\n");
		resultado.append(super.toString());
		resultado.append("\t\tIngresso: ").append(this.getDtnascimento()).append("\n");
		resultado.append("\t\tCategoria: ").append(this.getSexo()).append("\n");
		resultado.append("\t}").append("\n");
		
		return resultado.toString();
	}
}
