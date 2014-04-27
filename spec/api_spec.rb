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

  it 'Get status' do
    response = RestClient.get 'http://httpbin.org'
    expect(response.code).to eq(200)

  end

  it 'Post data' do
    response =  RestClient.post "http://httpbin.org/post", { 'x' => 1 }.to_json, :content_type => :json, :accept => :json

    expect(response.code).to eq(200)
    response = JSON.parse(response, :symbolize_names => true)
    expect(response[:json][:x]).to be(1)
  end

end