class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # POST /tasks
  def create
    begin
      task = Task.new(task_params)
      if task.save
        render json: TaskSerializer.render(task)
      else
        render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ArgumentError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # GET /tasks
  def index
    tasks = Task.all
    tasks = tasks.filter_records(task_filters) if task_filters.present?
    render json: TaskSerializer.render(tasks)
  end

  # PATCH/PUT /tasks/:id
  def update
    begin
      if @task.update(task_params)
        render json: TaskSerializer.render(@task)
      else
        render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ArgumentError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # GET /tasks/:id
  def show
    render json: TaskSerializer.render(@task)
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    head :ok
  end

  private

  def set_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Task not found" }, status: :not_found
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :tag, :priority)
  end

  def task_filters
    params.permit(:status, :tag, :priority)
  end
end
