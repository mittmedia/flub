# Flub

Simple error recipient for centralizing error logging in an app.

No more of those pesky NewRelic::Agent.notice_error everywhere, only Flub.register_exception

## Installation

Add this line to your application's Gemfile:

    gem 'flub'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flub

## Usage
    # config/initializers/flub.rb

    Flub.configure do
      on_error do |e, data, log_level|
        Rollbar.report_exception(e, nil, data, log_level)
      end

      on_error do |e, data, log_level|
        NewRelic::Agent.notice_error(e, custom_params: data)
      end
    end

    # somewhere else
    Flub.register_exception(ActiveRecord::RecordNotFound.new, {current_user: 123}, :warn)

## Contributing

1. Fork it ( http://github.com/<my-github-username>/flub/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
