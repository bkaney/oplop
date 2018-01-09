require 'spec_helper'

describe Oplop do
  describe ".password" do
    context "tests from testdata.json (see Python implementation at http://code.google.com/p/oplop/)" do
      # loop around each "case" in testdata.yml
      Yajl::Parser.new.parse(File.new(File.dirname(__FILE__) + "/testdata.json", 'r')).each do |testdata|
        specify testdata["why"] do
          password = Oplop.password(:master => testdata["master"], :label => "*" + testdata["label"])
          expect(password).to eq testdata["password"]

          password = Oplop.password(:master => testdata["master"], :length => 8, :label => testdata["label"])
          expect(password).to eq testdata["password"]
        end
      end
    end
  end
end
