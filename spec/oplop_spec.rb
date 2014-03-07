require 'spec_helper'

describe Oplop do
  describe ".password" do
    specify "valid arguments" do
      expect { Oplop.password(:master => "a", :label => "a") }.not_to raise_error
    end

    specify "invalid arguments" do
      expect { Oplop.password }.to raise_error(ArgumentError, /Master and label are required/)
    end

    specify "invalid arguments" do
      expect { Oplop.password(:master => "a", :label => "b", :foo => 'c') }.to raise_error(ArgumentError, /Unknown key/)
    end

    context "tests from testdata.json (see Python implementation at http://code.google.com/p/oplop/)" do
      # loop around each "case" in testdata.yml
      Yajl::Parser.new.parse(File.new(File.dirname(__FILE__) + "/testdata.json", 'r')).each do |testdata|
        specify testdata["why"] do
          password = Oplop.password(:master => testdata["master"], :label => testdata["label"])
          expect(password).to eq testdata["password"]
        end
      end
    end
  end
end
