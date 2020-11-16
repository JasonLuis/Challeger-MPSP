package br.com.fiap.controller;

import java.net.URI;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import br.com.fiap.model.UsuarioModel;
import br.com.fiap.repository.UsuarioRepository;
import br.com.fiap.upload.UploadImage;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {
	
	@Autowired
	public UsuarioRepository repository;

	@Autowired
	public UploadImage upload;
	
	@GetMapping()
	@ApiOperation(value = "Retorna todos os usuarios")
	public ResponseEntity<List<UsuarioModel>> findAll() {
		List<UsuarioModel> usuario = repository.findAll();
		return ResponseEntity.ok(usuario);
	}
	
	
	@GetMapping("/{id}")
	@ApiOperation(value = "Retorna os dados do usuario apartir do id")
	public ResponseEntity<UsuarioModel> findById(@PathVariable("id") long id) {
		UsuarioModel usuario = repository.findById(id).get();
		return ResponseEntity.ok(usuario);
	}
	
	@PutMapping("/{id}")
	@ApiOperation(value = "Atualiza um usuario a partir do identificador")
	public ResponseEntity update(@PathVariable("id") long id, @RequestBody @Valid UsuarioModel usuarioModel) {
		
		usuarioModel.setIdUsuario(id);
		repository.save(usuarioModel);
		
		return ResponseEntity.ok().build();
	}
	
	@PostMapping()
	@ApiOperation(value = "Salva um usuario")
	public ResponseEntity save(
			@RequestBody @Valid UsuarioModel usuarioModel) {

		UsuarioModel usuario = repository.save(usuarioModel);
		
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
				.buildAndExpand(usuario.getIdUsuario()).toUri();
		
		return ResponseEntity.created(location).build();
	}
	
	@PostMapping("/login")
	@ApiOperation(value = "Verifica se um usuario existe")
	public ResponseEntity longin(
			@RequestBody UsuarioModel usuarioModel) {
		
		UsuarioModel login = repository.findUsuario(
				usuarioModel.getEmail(),
				usuarioModel.getSenha());
		
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
				.buildAndExpand(login.getIdUsuario()).toUri();
		
		if(login.getIdUsuario() > 0) {
			return ResponseEntity.ok(login);
		}else {
			return ResponseEntity.created(location).build();
		}
	}
	
}
