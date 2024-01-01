source "https://rubygems.org"
# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!

gem "jekyll", "~> 4.3.3"

# The blog's theme
gem "minimal-mistakes-jekyll"

gem "faraday-retry" # Required for retrying network requests if they fail
# Network requests are used to query the GitHub API, among other things

# The plugins required for the blog
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-figure"
  gem "jekyll-target-blank" # Gem to open all links in a new tab
  gem "jekyll-assets"
  gem "jekyll-algolia" # search plugin
  gem "jekyll-paginate-v2"
  gem "jemoji" # GitHub-style Markdown emojis
  gem "jekyll-last-modified-at"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
