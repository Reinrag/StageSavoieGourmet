class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show]
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "L'article à bien été créé"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @article.update(article_params)
            flash[:success] = "Mise à jour de l'article avec succès"
            redirect_to article_path
        else
            render 'edit'
        end
    end
    
    private
    
        def set_article
            @article = Article.find(params[:id]) 
        end
        def article_params
            params.require(:article).permit(:titre, :description)
        end
    
end