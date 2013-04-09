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
      @response[:status].should == 'ok'
      File.exist?(@response[:pdf_path]).should be_true
      File.exist?(@response[:swf_path]).should be_true
      File.exist?(@response[:cover_path]).should be_true
    end

    it "should convert ppt successfully" do
      @response = SharpOffice.process(File.expand_path("spec/fixture/test.ppt"))
      @response[:status].should == 'ok'
      File.exist?(@response[:pdf_path]).should be_true
      File.exist?(@response[:swf_path]).should be_true
      File.exist?(@response[:cover_path]).should be_true
    end

    it "should convert xls successfully" do
      @response = SharpOffice.process(File.expand_path("spec/fixture/test.xls"))
      @response[:status].should == 'ok'
      File.exist?(@response[:pdf_path]).should be_true
      File.exist?(@response[:swf_path]).should be_true
      File.exist?(@response[:cover_path]).should be_true
    end
    
    it "should convert docx successfully" do
      @response = SharpOffice.process(File.expand_path("spec/fixture/test.docx"))
      @response[:status].should == 'ok'
      File.exist?(@response[:pdf_path]).should be_true
      File.exist?(@response[:swf_path]).should be_true
      File.exist?(@response[:cover_path]).should be_true
    end
  end
end