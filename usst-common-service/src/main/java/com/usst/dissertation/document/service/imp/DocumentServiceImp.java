package com.usst.dissertation.document.service.imp;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usst.dissertation.document.service.IDocumentService;
import com.usst.dissertation.sql.document.dao.DocumentDao;
import com.usst.dissertation.sql.document.entity.Document;
import com.usst.dissertation.sql.document.entity.DocumentType;

@Service("documentService")
public class DocumentServiceImp implements IDocumentService {

	@Autowired
	private DocumentDao documentDao;
	
	@Override
	public List<DocumentType> getDodumentTypes() {
		return documentDao.getDocumentTypes();
	}

	@Override
	public void saveArticle(Document document) {
		documentDao.saveArticle(document);
		
	}

	@Override
	public List<HashMap<String,String>> getDocuments(Document document) {
		return documentDao.getDocuments(document);
	}

	@Override
	public HashMap<String, String> getDocumentById(String documentId) {
		return documentDao.getDocumentById(documentId);
	}

	@Override
	public void updateDocument(Document document) {
		documentDao.updateDocument(document);
	}

	@Override
	public Document getDocument(String id) {
		return documentDao.getDocument(id);
	}

	@Override
	public void delete(String id) {
		documentDao.delete(id);		
	}


}
