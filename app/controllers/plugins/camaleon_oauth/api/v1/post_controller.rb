class Plugins::CamaleonOauth::Api::V1::PostController < Plugins::CamaleonOauth::Api::ApiController

  swagger_controller :post, 'Posts'

  swagger_api :index do
    summary 'Fetches all posts'
  end

  swagger_api :slug do
    summary 'Fetch a single Post item by slug'
    param :path, :slug, :integer, :required, 'Slug'
    response :ok, 'Success', :Post
  end

  swagger_api :show do
    summary 'Fetch a single Post item by id'
    param :path, :id, :integer, :optional, 'Post Id'
    response :ok, 'Success', :Post
  end

  swagger_api :category_name do
    summary 'Fetches all Posts with a category name'
    param :path, :category_name, :string, :required, 'Category name'
    response :ok, 'Success', :Post
  end

  swagger_api :category_id do
    summary 'Fetches all  Posts with a category id'
    param :path, :category_id, :integer, :required, 'Category id'
    response :ok, 'Success', :Post
  end

  swagger_api :featured do
    summary 'Fetches all featured posts'
  end

  def index
    post_type = current_site.post_types.find_by_slug('post')
    render json: post_type.posts
  end

  def slug
    render json: current_site.the_post_type('post').the_posts.where(:slug => params[:slug])
  end

  def show
    render json: current_site.the_post_type('post').the_posts.where(:id => params[:id])
  end


  def category_name
    category = current_site.full_categories.where(:slug => params[:category_name]).first
    if category.nil?
      render json: []
    else
      render json: category.posts
    end
  end

  def category_id
    begin
      render json: current_site.full_categories.find(params[:category_id]).posts
    rescue ActiveRecord::RecordNotFound
      render json: []
    end
  end

  def featured
    # posts = current_site.posts.joins(:custom_field_values).where("#{CustomFieldsRelationship.table_name}.custom_field_slug = ? and #{CustomFieldsRelationship.table_name}.object_class = ?", 'featured', 'Post')
    posts = current_site.posts.sort_by_field('featured', 'desc')
    render json: posts
  end
end