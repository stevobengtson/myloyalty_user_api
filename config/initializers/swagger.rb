class Swagger::Docs::Config
  def self.base_api_controller
    ActionController::API
  end

  def self.transform_path(path, api_version)
    # Make a distinction between the APIs and API documentation paths.
    "swagger/#{path}"
  end
end

Swagger::Docs::Config.register_apis({
  '1.0' => {
    api_extension_type: :json,
    controller_base_path: '',
    api_file_path: 'public/swagger/v1',
    base_path: 'http://localhost:3000',
    parent_controller: Api::V1::ApiController,
    clean_directory: true,
    attributes: {
      info: {
        title: 'User API',
        description: 'Handles User logins, creation, etc'
      }
    }
  }
})
