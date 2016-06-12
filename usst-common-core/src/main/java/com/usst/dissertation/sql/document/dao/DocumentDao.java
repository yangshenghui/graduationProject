package com.usst.dissertation.sql.document.dao;

import java.util.HashMap;
import java.util.List;

import com.usst.dissertation.sql.document.entity.Document;
import com.usst.dissertation.sql.document.entity.DocumentType;

public interface DocumentDao {
	
	public List<DocumentType> getDocumentTypes();
	
	public void saveArticle(Document document);
	
	public List<HashMap<String,String>> getDocuments(Document document);

	public HashMap<String, String> getDocumentById(String documentId);
	
	public void updateDocument(Document document);

	public Document getDocument(String id);

	public void delete(String id);
}
