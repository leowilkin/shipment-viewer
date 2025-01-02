#this is kinda bad
mkdir -p build
cp -r app/public/* build
bundle config set --local without serve
bundle install
APP_ENV=development ruby app/build.rb