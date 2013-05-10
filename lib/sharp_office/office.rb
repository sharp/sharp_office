require 'singleton'
require 'flash_tool'
require 'mini_magick'

module SharpOffice
  class Office

    attr_reader :path, :pdf_path, :swf_path
    include Singleton

    def start(path, options)
      @path = File.expand_path(path)
      system_or_exit convert_to_pdf
      swfile = FlashTool::FlashObject.new(pdf_path)
      swfile.pages(options[:pages])
      swfile.save(swf_path)
      system_or_exit "convert #{pdf_path} #{temp_file_path}"

      image = MiniMagick::Image.open(temp_file_path)
      image.resize "300x300"
      image.write cover_path

      File.delete(temp_file_path)

      {status: 'ok', pdf_path: pdf_path, swf_path: swf_path, cover_path: cover_path}
    end

    def system_or_exit(cmd, stdout = nil)
      puts "Executing #{cmd}"
      cmd += " >#{stdout}" if stdout
      system(cmd) or raise "******** Run failed ********"
    end

    protected

    def convert_to_pdf
      jar = File.expand_path File.join(File.dirname(__FILE__), "..", "..", "ext", "jodconverter-core-3.0-SNAPSHOT.jar")
      sigar = File.expand_path File.join(File.dirname(__FILE__), "..", "..", "ext", "sigar")
      "java -Djava.library.path=#{sigar} -jar #{jar} #{@path} #{pdf_path}"
    end

    def pdf_path
      @path.gsub('.', '-').to_s+'.pdf'
    end
    
    def temp_file_path
      @path.gsub('.', '-').to_s+'.temp'
    end

    def cover_path
      @path.gsub('.', '-').to_s+'.png'
    end

    def swf_path
      @path.gsub('.', '-').to_s+'.swf'
    end

    def convert_to_swf
      output[/test/] # Running a regexp on the string throws error if it's not UTF-8
    rescue ArgumentError
      output.force_encoding("ISO-8859-1")
    end
  end
end
