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
            redirect_to tasks_path #一覧ページへ
        # 保存に失敗した場合
        else
            render 'new' #失敗したら新規作成ページのまま
        end
    end

    # ストロングパラメーターの設定
    private
    def task_params
        params.require(:task).permit(:title, :body)
    end
end
