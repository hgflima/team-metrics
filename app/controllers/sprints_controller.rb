class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]

  # GET /project/:project_id/sprints
  # GET /project/:project_id/sprints.json
  def index
    @project = Project.find params[:project_id].to_i
    @sprints = @project.sprints
  end

  # GET /project/:project_id/sprints/1
  # GET /project/:project_id/sprints/1.json
  def show
  end

  # GET /sprints/new
  def new
    #@sprint = Sprint.new
    @project = Project.find params[:project_id].to_i
    @sprint = @project.sprints.build
  end

  # GET /project/:project_id/sprints/1/edit
  def edit
    @project = Project.find params[:project_id].to_i
    @sprint = Sprint.find params[:id].to_i
  end

  # POST /sprints
  # POST /sprints.json
  def create
    
    @sprint = Sprint.new(sprint_params)

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to @sprint.project, notice: 'Sprint criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sprint }
      else
        format.html { render action: 'new' }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to project_sprints_path(@sprint.project.id), notice: 'Sprint atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    project = @sprint.project
    @sprint.destroy
    respond_to do |format|
      format.html { redirect_to project_sprints_path(project.id), :notice => "Sprint deletado com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_params
      params.require(:sprint).permit(:title, :description, :project_id)
    end
end
