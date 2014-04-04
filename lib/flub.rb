require "flub/version"

module Flub
  class << self

    def configure &block
      instance_eval(&block)
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
          logger.error "#{self.class}#register_exception failed"
          logger.error "#{e.class} - #{e.message}"
        end
      end
    end

    def logger l = :default
      @logger = l if l != :default

      @logger ||= NullLogger.new
    end
  end

  class NullLogger < Logger
    def initialize(*args)
    end

    def add(*args, &block)
    end
  end
end
