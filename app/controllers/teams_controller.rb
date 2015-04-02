class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @teams = Team.all
    respond_with(@teams)
  end

  def show
    @users = User.all
    @jogadores = @team.users.all
    respond_with(@team)

  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.save
    respond_with(@team)
    current_user.update(team_id: @team.id)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  private
    def set_team
      @team = Team.friendly.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :captain, :wins, :game_id)
    end
end
