class HomeController < ApplicationController
  def index
    limit = 6 unless home_params["limit"].present?
    offset = 0 unless home_params["offset"].present?

    # 他ユーザのプロジェクトリスト
    projects = Project.order(created_at: "DESC")
    projects_list = []
    projects.each do |project|
      # タグを探して
      tags = ProjectTag.where(project_id: project.id)
      # くっつけて
      one_object = project.attributes.merge({ tag_list: tags.map(&:tag) })
      # push
      projects_list.push(one_object)
    end
    
    # 閲覧数上位5プロジェクト
    
    # おすすめユーザ3名を返す

    render :json => { project_list: projects_list, user_list: [], top_project_list: [] }
  end

  private
    def home_params
      params.permit(
        :limit,
        :offset
      )
    end
end
