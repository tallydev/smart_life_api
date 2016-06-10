json.result {
  if @user.present?
    json.salt @user.salt
  else
    json.message "登录失败,用户或密码错误!"
  end  
}
