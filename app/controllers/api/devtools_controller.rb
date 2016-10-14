class Api::DevtoolsController < ApiController

  def index
    devtools = Devtool.all
    render json: { devtools: devtools }, status: :ok
  end

  # def create
  #   respond_with :api, :v1, Devtool.create(devtool_params)
  #  end
  #
  #  def destroy
  #    respond_with Devtool.destroy(params[:id])
  #  end
  #
  #   def update
  #     devtool = Devtool.find(params["id"])
  #     devtool.update_attributes(devtool_params)
  #     respond_with item, json: devtool
  #    end
  #
  #   private
  #
  #   def devtool_params
  #     params.require(:devtool).permit(:id, :name, :description)
  #   end
end
