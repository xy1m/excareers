package com.excareers.service.articles;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.excareers.dao.ArticlesMapper;
import com.excareers.data.Articles;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Resource
	private ArticlesMapper articlesMapper;
	@Override
	public Articles writeArticles(Articles articles) {
		articlesMapper.insert(articles);
		return articles;
	}

	@Override
	public Articles findById(Integer id) {
		return articlesMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Articles> findByUserid(Long id) {
		return articlesMapper.selectByUserid(id);
	}

	@Override
	public void editArticles(Integer id, String title, String conent) {
		articlesMapper.updateByPrimaryKeyWithBLOBs(null);
	}

}
