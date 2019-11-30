class GroupsController < ApplicationController
    def index
        @groups=Group.all
    end
    def new
        @group=Group.new
    end
    def show
        @group=Group.find(params[:id])     
    end
    def edit
        @group=Group.find(params[:id])
    end
    def create
        @group=Group.new(groups_params)
        @group.save
        redirect_to groups_path
    end
    private
    def  groups_params
        params.require(:group).permit(:title,:desctription)
        
    end


end
