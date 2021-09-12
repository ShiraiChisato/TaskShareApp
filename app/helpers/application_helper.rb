module ApplicationHelper
  def user_icon_url(user)
    if user.nil?
      puts "ユーザー削除済み"
      user_icon_url = "icon.jpg"
    elsif user.icon_url.blank?
      puts "アイコン画像なし"
      user_icon_url = "icon.jpg"
    else
      puts "アイコン画像あり"
      user_icon_url = user.icon_url
    end
  end
end