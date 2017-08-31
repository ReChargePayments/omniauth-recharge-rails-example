# omniauth-recharge-rails-example

This project was created using ruby 2.4.1 and rails 5.1.3.

All the code required to get omniauth included in your app is contained in the commit [f94c9213685d9d426491419d81aa10aa96e353d9](https://github.com/SocalProofit/omniauth-recharge-rails-example/commit/f94c9213685d9d426491419d81aa10aa96e353d9)

## OAuth in a few simple steps

1. Create the initializer `config/initializers/omniauth.rb`:
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :recharge, ENV['RECHARGE_CLIENT_ID'], ENV['RECHARGE_CLIENT_SECRET']
end
```

2. Add the environemnt variables `RECHARGE_CLIENT_ID` and `RECHARGE_CLIENT_SECRET` with the values for the ReCharge app you are making.

3. Create a SessionsController `app/controllers/sessions_controller.rb` with the create action:
```ruby
def create
  session[:user_info] = request.env['omniauth.auth']
  redirect_to root_path
end
```

4. Add `get '/auth/:provider/callback', to: 'sessions#create'` to the routes.

5. Run the server and go to `/auth/recharge`. This will kick off the OAuth flow from the omniauth gem and the user info will be placed in the session after the callback.

## Running this example

In your partner app, set the callback url to `http://localhost:3000/auth/recharge/callback`.

Create a `.env.development` file in the root of the project and add the environment variables `RECHARGE_CLIENT_ID=<client_id>` and `RECHARGE_CLIENT_SECRET=<client_secret>`

Start the server using `bundle exec rails server` and go to http://localhost:3000 in your browser.
