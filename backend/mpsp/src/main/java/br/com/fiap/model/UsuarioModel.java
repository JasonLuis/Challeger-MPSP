package br.com.fiap.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

import io.swagger.annotations.ApiModelProperty;

@Entity
@Table(name = "TB_USUARIO")
public class UsuarioModel {

	private long idUsuario;
	private String nome;
	private String email;
	private String senha;
	private String cidade;
	
	public UsuarioModel() {}

	public UsuarioModel(long idUsuario, String nome, String email, String senha, 
			String cidade) {
		super();
		this.idUsuario = idUsuario;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.cidade = cidade;
	}
	
	
	
	@Id
	@Column(name = "ID_USUARIO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "USUARIO_SEQ")
	@SequenceGenerator(name = "USUARIO_SEQ", sequenceName = "USUARIO_SEQ", allocationSize = 1)
	@ApiModelProperty(value = "Id do Usuario")
	public long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(long idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	
	@Column(name = "NOME")
	@NotNull(message = "Nome obrigatorio")
	@Size(min = 2, max = 50, message = "NOME deve ser entre 3 e 50 caracteres")
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}

	@Column(name = "EMAIL")
	@NotNull(message = "E-mail obrigatorio")
	@Size(min = 2, max = 50, message = "EMAIL deve ser entre 10 e 50 caracteres")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "SENHA")
	@NotNull(message = "Senha obrigatorio")
	@Size(min = 2, max = 50, message = "SENHA deve ser entre 10 e 50 caracteres")
	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	@Column(name = "CIDADE")
	@NotNull(message = "cidade é obrigatorio")
	@Size(min = 3, max = 100, message = "Cidade de ter no minino 3 e no maximo 100 caracteres")
	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
}
