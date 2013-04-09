$LOAD_PATH.unshift File.dirname(__FILE__)

require 'logger'
require "sharp_office/version"
require "sharp_office/office"

module SharpOffice
  def self.logger=(log)
    @logger = log
  end

  def self.logger
    return @logger if @logger
    logger = Logger.new(STDOUT)
    logger.level = Logger::INFO
    @logger = logger
  end

  def self.process(path)
    raise Errno::ENOENT, "the file '#{path}' does not exist" unless File.exists?(path)
    Office.instance.start(path)
  end

end
