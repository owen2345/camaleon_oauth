Rails.application.routes.draw do
  scope PluginRoutes.system_info["relative_url_root"] do
    use_doorkeeper

    #Admin Panel
    scope 'admin', as: 'admin' do
      namespace 'plugins' do
        namespace 'camaleon_oauth' do

          get 'index' => 'admin#index'

          # if ENV['RAILS_SERVE_STATIC_FILES'].present?
          # if Rails.application.config.serve_static_files
          #   get 'documentation' => redirect('/docs/index.html')
          # else
          #   get 'documentation' => redirect('public/docs/index_public.html')
          # end
          get 'documentation' => redirect('/docs/index.html')
        end
      end
    end
    #Api methods
    scope module: "plugins", as: "plugins" do
      scope module: 'camaleon_oauth', as: 'camaleon_oauth' do
        namespace :api do
          get 'account' => 'api#account'

          namespace :v1 do
            get 'categories' => 'category#categories'
            get 'posts' => 'post#index'
            get 'pages' => 'page#index'

            scope :users do
              get '*' => 'user#users'
              post 'create' => 'user#create'
            end

            scope :contact_form do
              get 'show/:slug' => 'contact_form#contact_form_by_slug'
              post 'create' => 'contact_form#save_form'
            end
          end
        end
      end
    end
  end
end