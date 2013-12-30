require 'singleton'
require 'mini_magick'

module SharpOffice
  class Office

    attr_reader :path, :pdf_path, :swf_path
    include Singleton

    def start(path, options)
      @path = File.expand_path(path)

      system_or_exit convert_to_pdf
      system_or_exit convert_to_swf
      system_or_exit convert_to_cover
      image = MiniMagick::Image.open(cover_path)
      image.resize "300x300"
      image.write cover_path

      #File.delete(tmp_file_path)

      {status: 'ok', pdf_path: pdf_path, swf_path: swf_path, cover_path: cover_path}
    end

    protected

    def convert_to_pdf
      jar = File.expand_path File.join(File.dirname(__FILE__), "..", "..", "ext", "jodconverter-core-3.0-SNAPSHOT.jar")
      sigar = File.expand_path File.join(File.dirname(__FILE__), "..", "..", "ext", "sigar")
      "java -Djava.library.path=#{sigar} -jar #{jar} #{@path} #{pdf_path}"
    end

    def convert_to_swf
      "pdf2swf #{pdf_path} #{swf_path}"
    end

    def convert_to_cover
      "convert #{pdf_path} #{cover_path}"
    end

    def pdf_path
      @path.gsub('.', '-').to_s+'.pdf'
    end

    def cover_path
      @path.gsub('.', '-').to_s+'.png'
    end

    def swf_path
      @path.gsub('.', '-').to_s+'.swf'
    end

    private

    def system_or_exit(cmd, stdout = nil)
      puts "Executing #{cmd}"
      cmd += " >#{stdout}" if stdout
      system(cmd) or raise "******** Run failed ********"
    end

  end
end
