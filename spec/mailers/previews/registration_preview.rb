# Preview all emails at http://localhost:3000/rails/mailers/registration
class RegistrationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/registration/welcome
  def welcome
    RegistrationMailer.welcome
  end

end
