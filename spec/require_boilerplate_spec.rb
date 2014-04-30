require 'spec_helper'
require 'require_boilerplate'

describe RequireBoilerplate do
  it "should have a VERSION constant" do
    expect(const_get('VERSION')).not_to be_empty
  end

  describe '#configure' do
    it 'responds to the configure method' do
      expect(RequireBoilerplate).to respond_to(:configure)
    end
  end
end
