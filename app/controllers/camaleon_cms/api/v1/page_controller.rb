class CamaleonCms::Api::V1::PageController < CamaleonCms::Api::ApiController

  swagger_controller :page, 'Pages'

  swagger_api :index do
    summary 'Fetches all pages'
  end

  def index
    post_type = current_site.post_types.find_by_slug('page')
    render json: post_type.posts
  end

end