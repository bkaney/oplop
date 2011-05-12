require 'spec_helper'

describe Oplop do
  
  describe ".password" do

    specify "valid arguments" do
      lambda{ Oplop.password(:master => "a", :label => "a") }.should_not raise_error(ArgumentError)
    end

    specify "invalid arguments" do
      lambda{ Oplop.password }.should raise_error(ArgumentError, /Master and label are required/)
    end

    specify "invalid arguments" do
      lambda{ Oplop.password(:master => "a", :label => "b", :foo => 'c') }.should raise_error(ArgumentError, /Unknown key/)
    end

    context "tests from testdata.json (see Python implementation at http://code.google.com/p/oplop/)" do

      # loop around each "case" in testdata.yml
      Yajl::Parser.new.parse(File.new(File.dirname(__FILE__) + "/testdata.json", 'r')).each do |testdata|

        specify testdata["why"] do
          Oplop.password(:master => testdata["master"], :label => testdata["label"]).should == testdata["password"]
        end

      end

    end

  end

end
