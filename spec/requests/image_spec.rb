require 'rails_helper'
require 'byebug'

RSpec.describe "Images endpoints", type: :request do
    describe "GET /images" do
        it "Should return 200 Status code" do
            get '/images'
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(response).to have_http_status(200)
        end
    end

    describe "with data in the database" do
        let!(:images) { create_list(:image, 10)}
        it " should return all the images" do
            get '/images'
            payload = JSON.parse(response.body)
            expect(payload["data"].size).to eq(images.size)
            expect(response).to have_http_status(200)
        end
        describe "GET /images/:id" do
            let!(:image) { create(:image)}
            before { get "/images/#{image[:id]}" }
            it "Should return a single image" do
                payload = JSON.parse(response.body)
                expect(payload).not_to be_empty
                expect(payload['data']['id']).to eq(image[:id])
                expect(payload['data']['unsplash_id']).to eq(image.unsplash_id)
                expect(payload['data']['description']).to eq(image.description)
                expect(payload['data']['url']).to eq(image.url)
                expect(payload['data']['html']).to eq(image.html)
                expect(response).to have_http_status(200)
            end
        end
        describe "POST /images" do
                it "Should create an image" do
                    req_payload = {
                        unsplash_id: "123abc", 
                        description: "some description",
                        url: "www.example.com/file.jpg",
                        html: "www.example.com/index.html"
                    }
                    post "/images", params: req_payload
                    payload = JSON.parse(response.body)
                    expect(payload).to_not be_empty
                    expect(payload["data"]["id"]).to_not be_nil
                    expect(response).to have_http_status(:created)
                end
            end
            describe "DELETE /images/:id" do
                let!(:image) { create(:image)}
                it "Should delete an image" do
                    delete "/images/#{image.id}"
                    payload = JSON.parse(response.body)
                    expect(payload).not_to be_empty
                    expect(payload['data']['id']).to eq(image[:id])
                    expect(payload['data']['unsplash_id']).to eq(image.unsplash_id)
                    expect(payload['data']['description']).to eq(image.description)
                    expect(payload['data']['url']).to eq(image.url)
                    expect(payload['data']['html']).to eq(image.html)
                    expect(response).to have_http_status(200)
                end
        end
    end
end