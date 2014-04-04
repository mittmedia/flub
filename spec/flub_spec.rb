require 'spec_helper'

describe Flub do
  it 'should call a error handler' do
    error = StandardError.new
    error_handler = double("error_handler")
    expect(error_handler).to receive(:report_exception).with(error, nil, {}, :error)

    Flub.configure do
      on_error do |e, data, log_level|
        error_handler.report_exception(e, nil, data, log_level)
      end
    end

    Flub.register_exception(error)
  end
end
