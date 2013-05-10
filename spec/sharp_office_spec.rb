require 'spec_helper'
require 'find'

describe SharpOffice do
  context "given office files, and can be converted" do
    after(:all) do
      Find.find(File.expand_path("spec/fixture/")) do |path|
        File.delete(path) if path =~ /.*\.pdf$/
        File.delete(path) if path =~ /.*\.swf$/
        File.delete(path) if path =~ /.*\.png$/
      end
    end
    it "should convert doc successfully" do
      @response = SharpOffice.process(File.expand_path("spec/fixture/test.doc"))
      @response.should be_converted_successfully
    end

    it "should convert ppt successfully" do
      @response = SharpOffice.process(File.expand_path("spec/fixture/test.ppt"))
      @response.should be_converted_successfully

    end

    it "should convert xls successfully" do
      @response = SharpOffice.process(File.expand_path("spec/fixture/test.xls"))
      @response.should be_converted_successfully
    end
    
    it "should convert docx successfully" do
      @response = SharpOffice.process(File.expand_path("spec/fixture/test.docx"))
      @response.should be_converted_successfully
    end

    it "should convert docx with params successfully" do
      @response = SharpOffice.process(File.expand_path("spec/fixture/test.docx"), {pages: '1-20'})
      @response.should be_converted_successfully
    end
  end
end