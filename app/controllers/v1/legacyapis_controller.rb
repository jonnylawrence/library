class V1::LegacyapisController < ApplicationController
    def index
        legacyapis = Legacyapi.all
        render json: legacyapis, status: :ok
      end
    
      def create
        legacyapis = Legacyapi.new(legacyapi_params)
        if legacyapis.save
          render json: legacyapis, status: :created
        else
          render json: { errors: legacyapi.errors }, status:    :unprocessable_entity
        end
      end
    
      def show
        legacyapis = Legacyapi.find(params[:id])
        render json: legacyapi, status: :ok
      end
    
      def update
        legacyapis = Legacyapi.find(params[:id])
        if book.update(legacyapi_params)
          render json: legacyapi, status: :ok
        else
          render json: { errors: legacyapi.errors }, status: :unprocessable_entity
        end
      end
    
      def destroy
        legacyapis = Legacyapi.find(params[:id])
        legacyapis.destroy
        head 204
      end
    
        private
        
        def legacyapi_params
          params.require(:legacyapi).permit(:LoginSucceeded, :RetryLimitExceeded, :IsEmailValidated, :ReusePassword, :Version, :Status, :UserMessage, :DeveloperMessage, :RequestId)
        end
    
    end
