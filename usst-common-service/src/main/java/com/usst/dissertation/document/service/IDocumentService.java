package com.usst.dissertation.document.service;

import java.util.HashMap;
import java.util.List;

import com.usst.dissertation.sql.document.entity.Document;
import com.usst.dissertation.sql.document.entity.DocumentType;

public interface IDocumentService {
	
	public List<DocumentType> getDodumentTypes();
	
	public void saveArticle(Document document);
	
	public List<HashMap<String,String>> getDocuments(Document document);
	
	public HashMap<String,String> getDocumentById(String documentId);
	
	public void updateDocument(Document document);

	public Document getDocument(String id);
	
	public void delete(String id);
}
