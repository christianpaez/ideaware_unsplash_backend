class ImagesController < ApplicationController
    #GET /images
    def index
        @images = Image.all
        render json:{status: "SUCCESS", message: "Loaded all images", data: @images}, status: :ok
    end

    #GET /images/:id
    def show
        @image = Image.find(params[:id])
        render json:{status: "SUCCESS", message: "Loaded single Image with id: #{params[:id]}", data: @image}, status: :ok
    end

     #POST /images
    def create
        @image = Image.create!(create_params)
        if @image.save
            render json:{status: "SUCCESS", message: "Created Image with id: #{@image.id}", data: @image}, status: :created
        else
            render json:{status: "ERROR", message: "Image Not Saved", data: @image.errors}, status: 422
        end

    end
    #DELETE /images/:id
    def destroy
        @image = Image.find(params[:id])
        if @image.destroy
           render json:{status: "SUCCESS", message: "Deleted Image with id: #{params[:id]}", data: @image}, status:200
        else
            render json:{status: "ERROR", message: "Image not deleted", data: @image.errors}, status:422
        end
    end

    private 
    def create_params
        params.permit(:unsplash_id, :description, :url, :html)
    end
end
