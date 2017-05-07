# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
# Rails.application.config.assets.precompile += ["themify-icons.css"]
# Rails.application.config.assets.precompile += ["owl.theme.default.min.css"]
# Rails.application.config.assets.precompile += ["magnific-popup.css"]
# Rails.application.config.assets.precompile += ["superfish.css"]
# Rails.application.config.assets.precompile += ["easy-responsive-tabs.css"]
# Rails.application.config.assets.precompile += ["style.css"]
Rails.application.config.assets.precompile += [/^[-_a-zA-Z0-9]*\..*/]

Rails.application.config.assets.precompile += ["jquery-1.10.2.min.js"]
Rails.application.config.assets.precompile += ["jquery.easing.1.3.js"]
Rails.application.config.assets.precompile += ["bootstrap.js"]
Rails.application.config.assets.precompile += ["owl.carousel.min.js"]
Rails.application.config.assets.precompile += ["jquery.magnific-popup.min.js"]
Rails.application.config.assets.precompile += ["hoverIntent.js"]
Rails.application.config.assets.precompile += ["superfish.js"]
Rails.application.config.assets.precompile += ["easyResponsiveTabs.js"]
Rails.application.config.assets.precompile += ["fastclick.js"]
Rails.application.config.assets.precompile += ["main.js"]