class RenameOauthTables < ActiveRecord::Migration
  def change
    rename_table :"#{PluginRoutes.static_system_info["db_prefix"]}oauth_access_grants", :oauth_access_grants
    rename_table :"#{PluginRoutes.static_system_info["db_prefix"]}oauth_access_tokens", :oauth_access_tokens
    rename_table :"#{PluginRoutes.static_system_info["db_prefix"]}oauth_applications", :oauth_applications
  end
end
