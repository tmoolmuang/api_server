module Api
  module V1
    class PowersController < ApplicationController
      protect_from_forgery with: :null_session
      before_filter :verify_token

      def index
        powers = Alien.find(params[:alien_id]).powers
        render json: { status: 'SUCCESS', message: "All Powers for Alien #{params[:alien_id]} loaded", data: powers }, status: :ok
      end

      def show
        power = Alien.find(params[:alien_id]).powers.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Power loaded', data: power }, status: :ok
      end

      def create
        power = Alien.find(params[:alien_id]).powers.build(power_params)
        if power.save
          render json: { status: 'SUCCESS', message: 'Power created', data: power }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Power not created', data: power.errors }, status: :unprocessable_entity
        end
      end

      def update
        power = Alien.find(params[:alien_id]).powers.find(params[:id])
        if power.update_attributes(power_params)
          render json: { status: 'SUCCESS', message: 'Powers updated', data: power }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Power not updated', data: power.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        power = Alien.find(params[:alien_id]).powers.find(params[:id])
        power.destroy
        render json: { status: 'SUCCESS', message: 'Power deleted', data: power },status: :ok
      end

      private
      def power_params
        params.require(:power).permit(:ability)
      end
      
      def verify_token
        authenticate_or_request_with_http_token do |token, options|
          User.find_by_api_token(token).present?
        end
      end      
    end
  end
end
