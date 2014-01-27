class BacklogsController < ApplicationController
  before_action :set_backlog, only: [:show, :edit, :update, :destroy]

  # GET /project/:project_id/backlogs
  # GET /project/:project_id/backlogs.json
  def index
    @project = Project.find params[:project_id].to_i
    @backlogs = @project.backlogs
  end

  # GET /project/:project_id/backlogs/1
  # GET /project/:project_id/backlogs/1.json
  def show
  end

  # GET /project/:project_id/backlogs/new
  def new
    @project = Project.find params[:project_id].to_i
    @backlog = @project.backlogs.build
  end

  # GET /project/:project_id/backlogs/1/edit
  def edit
    @project = Project.find params[:project_id].to_i
    @backlog = Backlog.find params[:id].to_i
  end

  # POST /project/:project_id/backlogs
  # POST /project/:project_id/backlogs.json
  def create

    @backlog = Backlog.new(backlog_params)
   
    # adiciona o backlog no final da lista
    p = Project.find params[:project_id]
    @backlog.position = (p.get_last_backlog_position + 1)

    respond_to do |format|
      if @backlog.save
        format.html { redirect_to project_backlogs_path(@backlog.project.id), notice: 'Backlog criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @backlog }
      else
        format.html { render action: 'new' }
        format.json { render json: @backlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project/:project_id/backlogs/1
  # PATCH/PUT /project/:project_id/backlogs/1.json
  def update
    respond_to do |format|
      if @backlog.update(backlog_params)
        format.html { redirect_to project_backlogs_path(@backlog.project.id), notice: 'Backlog atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project/:project_id/backlogs/1
  # DELETE /project/:project_id/backlogs/1.json
  def destroy
    project = @backlog.project
    @backlog.destroy
    respond_to do |format|
      format.html { redirect_to project_backlogs_path(project.id), :notice => "Backlog deletado com sucesso" }
      format.json { head :no_content }
    end
  end
 
  # POST /project/:project_id/backlog/sort
  def sort
    
    Backlog.sort(params[:backlogs])
    render :nothing => true, :status => 200

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backlog
      @backlog = Backlog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backlog_params
      params.require(:backlog).permit(:title, :description, :project_id)
    end
end
