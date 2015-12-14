require 'spec_helper'

describe CbcWrapper do
  it 'has a version number' do
    expect(Cbc::VERSION).not_to be nil
  end

  it 'runs' do
    Cbc_wrapper
  end

end
