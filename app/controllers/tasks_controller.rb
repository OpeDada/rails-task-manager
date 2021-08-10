class TasksController < ApplicationController

  before_action :task_attributes, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @completed =
    if @task.completed == true
      'This task is completed'
    elsif @task.completed == false
      'This task is not completed'
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new.html.erb'
    end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def task_attributes
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
