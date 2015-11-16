class CamaleonCms::Api::V1::PostController < CamaleonCms::Api::ApiController

  swagger_controller :post, 'Posts'

  swagger_api :index do
    summary 'Fetches all posts'
  end

  def index
    post_type = current_site.post_types.find_by_slug('post')
    render json: post_type.posts
  end

end