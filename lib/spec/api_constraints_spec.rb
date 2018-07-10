require 'spec_helper'

describe ApiConstraints do
  let(:api_constraints_v1) { ApiConstraints.new(version: 1) }
  let(:api_constraints_v2) { ApiConstraints.new(version: 2, default: true) }

  describe "matches?" do

    it "returns true when the version matches the 'Accept' header" do

    # change name of marketplace

      request = double(host: 'api.quoteKeeper.dev', headers: {"Accept" => "application/vnd.quoteKeeper.v1"})
      expect(api_constraints_v1.matches?(request)).to be_truthy
    end

    it "returns the default version when 'default' options is specified" do
      request = double(host: 'api.quoteKeeper.dev')
      expect(api_constraints_v2.matches?(request)).to be_truthy
    end
  end
end
