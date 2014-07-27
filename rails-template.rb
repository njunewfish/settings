gem_group :development do
  gem 'quiet_assets'
  gem 'pry'
  gem 'rvm-capistrano'
end

gem_group :production do
  gem 'unicorn', '4.6.3'
end

# 数据库
gem 'mysql2', '0.3.14'

# 用户系统
gem 'omniauth', '1.1.4'
gem 'devise', '2.0.4'

# 图片
gem 'carrierwave', '0.6.2'
gem 'carrierwave-qiniu', '0.0.8'
gem 'mini_magick', '3.3'

# 配置
gem 'settingslogic', '2.0.9'

# api接口
gem 'grape', '0.6.1'
gem 'grape-entity', '0.3.0'

# 搜索
if yes?("support search? : ")
  gem 'tire'
  gem 'elasticsearch', '1.0.4'
  gem 'elasticsearch-model', '0.1.4'
  gem 'elasticsearch-rails', '1.0.4'
end

# 缓存
if yes?("support cache? : ")
  gem 'redis', '2.1.1'
end

# 页面
if no?("only api? : ")
  gem 'simple_form', '2.0.1'
  gem 'social-share-button', "0.1.1"

  gem 'easy_captcha', '0.6.4'
  gem 'will_paginate', '3.0.4'
  gem 'bootstrap-will_paginate', '0.0.10'
end

rake("bundle install")

############## 针对不同的gems ###################
generate("devise:install")
generate(:devise, "user")

comment_lines 'Gemfile', /sqlite3/
comment_lines 'Gemfile', /coffee-rails/
comment_lines 'Gemfile', /sass-rails/

################## 其它 #######################
run "rm public/index.html"
