require 'ruby-debug'
class TeamsController < ApplicationController
  include AuthenticatedSystem

  before_filter :login_required,:only=> [:new,:edit,:create,:destroy,:update,:join]
  # GET /teams
  # GET /teams.xml
  def index
    @teams = Team.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.xml
  def show
    @team = Team.find(params[:id])
    @comment = Comment.new
    @commentable = @team
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.xml
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.xml
  def create
    @team = Team.new(params[:team])
    @team.owner_id = current_user.id

    respond_to do |format|
      if @team.save
        @team.members<<current_user
        flash[:notice] = 'Team was successfully created.'
        format.html { redirect_to(@team) }
        format.xml  { render :xml => @team, :status => :created, :location => @team }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.xml
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        flash[:notice] = 'Team was successfully updated.'
        format.html { redirect_to(@team) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.xml
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to(teams_url) }
      format.xml  { head :ok }
    end
  end
  def join

    @team = Team.find(params[:id])
    respond_to do |format|
      if @team.members.include? current_user
        flash[:error] = "#current_user.login is already joined this team"
        format.html {redirect_to team_path(@team)}
        format.xml { head 401}
      else
        format.html {redirect_to team_path(@team)}
        format.xml {head :ok}
      end
    end
  end
end

