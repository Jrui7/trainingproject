class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = User.find(user)
    Mailjet.configure do |config|
      config.api_version = "v3.1"
    end
    # This call sends a message to the given recipient with vars and custom vars.
    variable = Mailjet::Send.create(messages: [{
      'From'=> {
        'Email'=> "jorge@pickalgo.com",
        'Name'=> "Jorge de Pickalgo"
      },
      'To'=> [
        {
          'Email'=> "#{@user.email}"
        }
      ],
      'TemplateID'=> 507732,
      'TemplateLanguage'=> true,
      'Subject'=> "Bienvenue dans la communauté Pickalgo",
      'Variables'=> {
        "pseudo" => "#{@user.pseudo}"
      }
    }])
    p variable.attributes['Messages']
  end

end
