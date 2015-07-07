Rails.application.config.middleware.use OmniAuth::Builder do
provider :facebook, "id","key"
end