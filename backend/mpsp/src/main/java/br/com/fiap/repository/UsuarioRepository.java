package br.com.fiap.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.fiap.model.UsuarioModel;

@Repository
public interface UsuarioRepository extends JpaRepository<UsuarioModel, Long>{
	
	@Query("SELECT u from UsuarioModel u WHERE u.email = ?1 AND u.senha = ?2")
	UsuarioModel findUsuario(String email, String senha);
	
}
