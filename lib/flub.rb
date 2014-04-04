require "flub/version"

module Flub
  class << self
    def configure &block
      instance_eval(&block)
      register_default
    end

    def on_error &block
      @on_error ||= []
      @on_error << block
    end

    def register_exception e, data = {}, log_level = :error
      @on_error.each do |handler|
        begin
          handler.call e, data, log_level
        rescue StandardError => e
          Rails.logger.error "#{self.class}#register_exception failed"
          Rails.logger.error "#{e.class} - #{e.message}"
        end
      end
    end

    private

    def register_default
      if defined? Rails
        on_error do |e, data, log_level|
          Rails.logger.send(log_level, e.message)
          Rails.logger.send(log_level, data) if data.keys.any?
        end
      end
    end

  end
end
