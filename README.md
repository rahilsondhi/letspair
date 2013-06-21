LetsPair
====

Setting up LetsPair on your development environment
----
1. `rvm --rvmrc --create ruby-1.9.3-p194@letspair`. You'll need to restart your shell. Do `rvm gemdir` and it should say `/Users/username/.rvm/gems/ruby-1.9.3-p194@letspair`
2. `bundle`
3. Make a new `Procfile-dev` with:

        rails: rails s -p 3010 # Or whatever port you want to use
        postgres: /usr/local/bin/postgres # Not necessary if you already have Postgres running (eg postgresapp.com)
        memcached: memcached

4. Put your local database credentials in `database.yml`
5. `rake db:create && rake db:migrate`
6. `foreman start -f Procfile-dev`
7. You should use livereload, so make a new `Guardfile` with the contents below, download the [Livereload Chrome Extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei), type `guard` in your terminal, turn it on in Chrome, voila :)

        guard 'livereload' do
          watch(%r{app/views/.+\.(erb|haml|slim)$})
          watch(%r{app/helpers/.+\.rb})
          watch(%r{public/.+\.(css|js|html)})
          watch(%r{config/locales/.+\.yml})
          # Rails Assets Pipeline
          watch(%r{(app|vendor)(/assets/\w+/(.+\.(s?css|coffee|js|html))).*}) { |m| "/assets/#{m[3]}" }
        end
