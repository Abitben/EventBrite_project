class AdminEventMailer < ApplicationMailer
  default from: 'dupaquier_ben@live.fr'

  def notify_admin(admin, user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @admin = admin 
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: "Un utilisateur vient de s'inscrire !") 
  end


end
