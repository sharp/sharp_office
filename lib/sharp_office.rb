$LOAD_PATH.unshift File.dirname(__FILE__)

require 'logger'
require File.join(File.dirname(__FILE__), "sharp_office/version")
require File.join(File.dirname(__FILE__), "sharp_office/office")

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

  def self.process(path, options={pages: '1-10'})
    raise Errno::ENOENT, "the file '#{path}' does not exist" unless File.exists?(path)
    Office.instance.start(path, options)
  end

end
