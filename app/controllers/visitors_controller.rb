class VisitorsController < InheritedResources::Base

  private

    def visitor_params
      params.require(:visitor).permit(:name, :email, :ip)
    end
end

