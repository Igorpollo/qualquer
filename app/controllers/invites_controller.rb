class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @invites = Invite.all
    respond_with(@invites)
  end

  def show
    respond_with(@invite)
  end

  

  def invite_response
    if params[:invite] 
      if params[:invite] == 1
        @invite = Invite.find_by(invited: current_user.id)
        @invite.update(accepted: params[:invite])
        current_user.update(team_id: @invite.team_id)
        render nothing: true
      else 
        @invite = Invite.find_by(invited: current_user.id)
        @invite.update(accepted: params[:invite])
        current_user.update(team_id: @invite.team_id)
        render nothing: true
      end
    end
  end

 def out_team
  if params[:user]
    @user = User.find_by(id: params[:user])  # pegando o usuario que a id é aquela que vc vai passar
    @user.update(team_id: nil) # da update na team_id dele pra null pra que ele fiquesem time
  end
  render nothing: true
 end

  def new
    if params[:user]
      @invite = Invite.new(user_id: current_user.id, invited: params[:user], team_id: params[:team])
      @invite.save
      render nothing: true
    else
      @invite = Invite.new
    end 
  end

  def edit
  end

  def create
   
  end

  def update
    @invite.update(invite_params)
    respond_with(@invite)
  end

  def destroy
    @invite.destroy
    respond_with(@invite)
  end

  private
    def set_invite
      @invite = Invite.find(params[:id])
    end

    def invite_params
      params.require(:invite).permit(:user_id, :invited, :team_id, :accepted)
    end
end
