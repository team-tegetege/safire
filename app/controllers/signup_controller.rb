class SignupController < ApplicationController
  def index
    # authenticate!
    logger.debug("come in")
    # Match.where('id>0').destroy_all
    render :json => { message: "テスト", user: "none", status: 200}
  end

  def create
    logger.debug(signup_params["tags"])
    ActiveRecord::Base.transaction do
      user = User.new(
        user_id: signup_params["user_id"],
        password: signup_params["password"],
        token: SecureTokenService.issue_token
      )
      user.save!
      profile = Profile.new(
        user_id: signup_params["user_id"],
        age: signup_params["age"],
        gender: signup_params["gender"],
        description: signup_params["description"]
      )
      profile.save!
      # signup_params["tags"].each do |tag|
      #   favorite = Favorite.new(
      #     user_id: signup_params["user_id"],
      #     tag_id: tag
      #   )
      #   favorite.save!:
      # end
    end
    # user.authenticate
    render :json => { message: "ユーザ登録に成功しました。"}
    # id: 'yuta' の重複時のリターンも確認してみる
  end

  private
    def signup_params
      params.permit(
        :user_id,
        :password,
        :age,
        :gender,
        :description,
        # tags: []
      )
    end
end