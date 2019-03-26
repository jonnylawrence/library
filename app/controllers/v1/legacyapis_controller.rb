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
        if params[:id] =~ /[0-9]*/
          legacyapis = Legacyapi.find(params[:id])
          render json: legacyapis, status: :ok
        end

        if params[:email] 
          params.each do |id, value|
            puts id.to_s + " : " + value.to_s
          end

          
          #legacyapis = Legacyapi.where(email: params[:email]).first 
          legacyapis.email = params[:email] 
          legacyapis.ReusePassword = Sail.get("ReusePassword") 
          legacyapis.RetryLimitExceeded = Sail.get("RetryLimitExceeded") 
          legacyapis.DeveloperMessage = Sail.get("DeveloperMessage")
          legacyapis.UserMessage = Sail.get("UserMessage")
          legacyapis.Version = Sail.get("Version")
          legacyapis.IsEmailValidated = Sail.get("IsEmailValidated") 
          legacyapis.LoginSucceeded = Sail.get("LoginSucceeded")
          legacyapis.Status = Sail.get("Status") 
          legacyapis.RequestId = Sail.get("RequestId") 
          
          render json: legacyapis, status: :ok
        end
      end
    
      def update
        legacyapis = Legacyapi.find(params[:id])
        if book.update(legacyapi_params)
          render json: legacyapis, status: :ok
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
          params.require(:legacyapi).permit(:LoginSucceeded, :RetryLimitExceeded, :IsEmailValidated, :ReusePassword, :Version, :Status, :UserMessage, :DeveloperMessage, :RequestId, :email)
        end
    
    end
