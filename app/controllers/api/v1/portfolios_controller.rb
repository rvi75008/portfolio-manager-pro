class Api::V1::PortfoliosController < ApplicationController
    before_action :set_portfolio, only: %i[show edit update destroy]
    before_action :authenticate_user!
  
    def index
      @portfolios = current_user.portfolios.all
    end
  
    def show
      if authorized?
        respond_to { |format| format.json { render :show } }
      else
        handle_unauthorized
      end
    end
  
    def create
      @portfolio = current_user.portfolios.build(portfolio_params)
  
      if authorized?
        respond_to do |format|
          if @portfolio.save
            format.json do
              render :show,
                     status: :created,
                     location: api_v1_portfolio_path(@portfolio)
            end
          else
            format.json do
              render json: @portfolio.errors, status: :unprocessable_entity
            end
          end
        end
      else
        handle_unauthorized
      end
    end
  

    def update
      if authorized?
        respond_to do |format|
          if @portfolio.update(portfolio_params)
            format.json do
              render :show,
                    status: :ok,
                    location: api_v1_portfolio_path(@portfolio)
            end
          else
            format.json do
              render json: @portfolio.errors, status: :unprocessable_entity
            end
          end
        end
      else
        handle_unauthorized
      end
    end
  
    def destroy
      if authorized?
        @portfolio.destroy
        respond_to { |format| format.json { head :no_content } }
      else
        handle_unauthorized
      end
    end
  
    private
  
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def authorized?
      @portfolio.user == current_user
    end

    def handle_unauthorized
      unless authorized?
        respond_to { |format| format.json { render :unauthorized, status: 401 } }
      end
    end

    def portfolio_params
      params.require(:portfolio).permit(:name, :description)
    end
end