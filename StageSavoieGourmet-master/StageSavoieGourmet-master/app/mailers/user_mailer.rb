class UserMailer < ApplicationMailer
    def confirm(user)
        @user = user
        mail(to: user.email, subject: 'Votre inscription sur le site SavoieGourmet')
    end
end
