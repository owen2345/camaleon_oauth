class Plugins::CamaleonOauth::Api::V1::CategoryController < Plugins::CamaleonOauth::Api::ApiController

  swagger_controller :categories, 'Categories'

  swagger_api :categories do
    summary 'Fetches all categories'
  end

  def categories
    @categories = current_site.full_categories
    render json: ActiveModel::ArraySerializer.new(@categories, each_serializer: CamaleonCms::Api::V1::CategorySerializer)
  end

end
