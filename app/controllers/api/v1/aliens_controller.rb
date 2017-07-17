module Api
  module V1
    class AliensController < ApplicationController
      skip_before_action :verify_authenticity_token #TODO: work on authentication
      
      def index
        aliens = Alien.all
        render json: { status: 'SUCCESS', message: 'Aliens loaded', data: aliens }, status: :ok
      end

      def show
        alien = Alien.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Alien loaded', data: alien }, status: :ok
      end

      def create
        alien = Alien.new(alien_params)

        if alien.save
          render json: { status: 'SUCCESS', message: 'Alien saved', data: alien }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Alien not saved', data: alien.errors }, status: :unprocessable_entity
        end
      end

      def update
        alien = Alien.find(params[:id])
        if alien.update_attributes(alien_params)
          render json: { status: 'SUCCESS', message: 'Alien updated', data: alien }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Alien not updated', data: alien.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        alien = Alien.find(params[:id])
        alien.destroy
        render json: { status: 'SUCCESS', message: 'Alien deleted', data: alien },status: :ok
      end

      private
      def alien_params
        params.require(:alien).permit(:name, :year, :month, :origin)
      end
    end
  end
end
