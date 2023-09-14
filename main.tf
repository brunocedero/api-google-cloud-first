# Configuración de proveedor de Google Cloud
provider "google" {
  credentials = file("credenciales.json")
  project     = "careful-span-399014"
  region      = "us-central1" 
}

# Configuración de Cloud Endpoints
resource "google_endpoints_service" "mi_api" {
  service_name = "api-service"
  openapi_config {
    content = file("open-api.yaml")
  }
  hostname = "https://careful-span-399014.appspot.com" 

# Configuración de App Engine
resource "google_app_engine_application" "mi_app" {
  project = "careful-span-399014"
}

resource "google_app_engine_standard_app_version" "mi_app_version" {
  version_id = "v1"
  project    = "careful-span-399014"
  runtime    = "python3.9" 
  entrypoint {
    shell = "gunicorn -b :$PORT main:app" 
  }
  app_yaml = <<-YAML
runtime: python3.9
entrypoint: gunicorn -b :$PORT main:app

handlers:
- url: /.*
  script: auto
YAML
}
