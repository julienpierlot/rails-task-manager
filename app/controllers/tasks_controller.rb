class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      @task.save
      redirect_to task_path(@task)
    else
      redirect_to new_task
    end
  end

  def edit
  end

  def update
    @task.update(task_params)

    if @task.persisted?
      redirect_to task_path(@task)
    else
      redirect_to edit_task_path(@task)
    end
  end

  def destroy
    if @task.delete
      @task.delete

      redirect_to tasks_path
    else
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
