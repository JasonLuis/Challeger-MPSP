package br.com.fiap.upload;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class UploadImage {

	@Value("${mpsp.upload.raiz}")
	private String raiz;
	
	@Value("${mpsp.upload.diretorio-image}")
	private String diretorioFotos;
	
	public void salvarFoto(MultipartFile imagem, long id) {
		this.salvar(this.diretorioFotos, imagem, id);
	}
	
	public void salvar(String diretorio, MultipartFile arquivo,long id) {
		Path diretorioPath = Paths.get(this.raiz, diretorio);
		Path arquivoPath = diretorioPath.resolve(arquivo.getOriginalFilename()+id);
		
		try {
			Files.createDirectories(diretorioPath);
			arquivo.transferTo(arquivoPath.toFile());			
		} catch (IOException e) {
			throw new RuntimeException("Problemas na tentativa de salvar Imagem.", e);
		}		
	}
}
