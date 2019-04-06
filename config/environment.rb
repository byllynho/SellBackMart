# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Paperclip config:
# Paperclip.options[:image_magick_path] = "/usr/local/bin/"
Paperclip.options[:command_path] = "/opt/ImageMagick/bin/"