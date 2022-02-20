class TasksController < ApplicationController
     
    # タスク一覧
    def index
        @tasks = Task.all
    end

    # 新規作成ページ表示
    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        # 保存に成功した場合
        if @task.save
            # 一覧ページへ
            redirect_to tasks_path 
        # 保存に失敗した場合
        else
            # 新規作成ページのまま
            render 'new' 
        end
    end

    # 編集ページ表示
    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        # 編集に成功した場合
        if @task.update(task_params)
            # 一覧ページへ
            redirect_to tasks_path 
        # 編集に失敗した場合
        else
            # 編集ページのまま
            render 'edit' 
        end
    end

    # ストロングパラメーターの設定
    private
    def task_params
        params.require(:task).permit(:title, :body)
    end
end
