package com.excareers.service.articles;

import java.util.List;

import com.excareers.data.Articles;

public interface ArticleService {

	public Articles writeArticles(Articles articles);

	public Articles findById(Integer id);

	public List<Articles> findByUserid(Long id);

	public void editArticles(Integer id, String title, String conent);

}
