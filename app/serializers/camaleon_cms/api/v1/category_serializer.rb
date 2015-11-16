class CamaleonCms::Api::V1::CategorySerializer < CamaleonCms::Api::BaseSerializer
  attributes :id, :name, :slug, :count, :post_type_parent_name

  def post_type_parent_name
    object.post_type_parent.name
  end

end