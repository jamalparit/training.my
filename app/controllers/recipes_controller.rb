class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.unscoped.all
    #session[:makan]='lapar'
    #session[:makan]=nil
    #reset_session
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe=Recipe.find(params[:id])
    @comments= Comment.where("recipe_id=?",@recipe.id)
  end

  def lists
    @recipes=Recipe.unscoped.all
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @states = State.all
    @categories = Category.published
  end

  # GET /recipes/1/edit
  def edit
    @states = State.all
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @states = State.all

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def category
    @category=Category.find(params[:id])
    @recipes = Recipe.where("category_id=?",params[:id]).order('id desc')
  end

  def state
    @state=State.find(params[:id])
    @recipes = Recipe.where("state_id=?",params[:id]).order('id desc')
  end

  def create_comment
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.recipe_id =@recipe.id
    if @comment.save
      flash[:notice]='Terima Kasih'
      redirect_to(recipe_path(@recipe))
    else
      flash[:notice]= 'Opps.. gagal...sila cuba lagi'
      render :action => 'show'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :description, :ingredients, :directions, :category_id, :published,:image_url,:video_url, :state_id)
    end
    def comment_params
      params.require(:comment).permit(:author, :message)
    end
end
