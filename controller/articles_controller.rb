class ArticlesController
    def initialize(article_repository)
      @article_repository = article_repository
    end
  
    def index
      @article_repository.all
    end
  
    def show(id)
      @article_repository.find(id)
    end
  
    def create(params)
      article = @article_repository.new(params)
      if article.save
        article
      else
        article.errors
      end
    end
  
    def update(id, params)
      article = @article_repository.find(id)
      if article.update(params)
        article
      else
        article.errors
      end
    end
  
    def destroy(id)
      article = @article_repository.find(id)
      article.destroy
    end
  end
  