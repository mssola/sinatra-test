
require 'spec_helper'


describe 'Leaky::Routes' do
  it 'reaches the main GET routes' do
    %w{ / /blog /snippets /contact /login }.each do |r|
      get r
      last_response.should be_ok
    end
  end
end
