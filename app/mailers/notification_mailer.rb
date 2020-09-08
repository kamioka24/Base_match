class NotificationMailer < ApplicationMailer
  default from: ENV["DEV_SMTP_USER_NAME"]

  def send_confirm_to_player(player)
    @player = player
    mail(
      subject: "選手会員登録が完了しました。", #メールのタイトル
      to: @player.email #宛先
    ) do |format|
      format.text
    end
  end

  def send_confirm_to_team(team)
    @team = team
    mail(
      subject: "チーム会員登録が完了しました。", #メールのタイトル
      to: @team.email #宛先
    ) do |format|
      format.text
    end
  end
end
