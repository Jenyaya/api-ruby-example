require 'rest-client'
require 'rspec'
require 'json'

res = ''

describe 'Test open API' do

  it 'GET status' do
     res = RestClient.get 'http://httpbin.org/ip'
  end

  it 'check responce' do
    res = JSON.parse(res, :symbolize_names => true)
    expect(res[:origin]).to eq("213.111.77.93")
  end

end