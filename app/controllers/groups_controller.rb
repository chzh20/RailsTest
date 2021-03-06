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
    def update
        @group=Group.find(params[:id])
        if  @group.update(groups_params)
            redirect_to groups_path,notice:"Update Success"
        else
            render :edit
        end
    end
    def destroy
        @group=Group.find(params[:id])
        @group.destroy
        flash[:alert]="Group deleted"
        redirect_to groups_path
    end
    def create
        @group=Group.new(groups_params)
        if @group.save
        redirect_to groups_path
        else 
            render :new
        end
    end
    private
    def  groups_params
        params.require(:group).permit(:title,:desctription)
        
    end


end
