unit unitMenuJeu;

{$codepage utf8}

interface
(*#########################################################*)
(*                                                         *)
(*   ###  #  #  #####  ####  ###   ####   ###   ##   ####  *)
(*    #   ## #    #    #     #  #  #     #  #  #  #  #     *)
(*    #   # ##    #    ##    #  #  ##    #  #  #     ##    *)
(*    #   #  #    #    #     ###   #     ####  #  #  #     *)
(*   ###  #  #    #    ####  #  #  #     #  #   ##   ####  *)
(*                                                         *)
(*#########################################################*)

uses sysutils,unitEcran, typesDuJeu;

(*Affiche l'en-tête du menu.*)
procedure initCadreHautMJ(p : Personnage);

(*Procédure qui affiche le cadre du bas du menu de Jeu.*)
procedure initCadreBasMJ();

(*Attend une réponse de la part de l'utilisateur.*)
function jeVeuxUneReponse() : String;

(*Vérifie si la masse d'ébonite est dans l'inventaire. Retourne TRUE si oui.*)
function presenceMasseEbo(p:personnage):Boolean;



(*Affiche le scénario de l'évènement 1*)
procedure scenario1MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 2*)
procedure scenario2MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 3*)
procedure scenario3MJ(var p : Personnage; var rep : String);

//(*Affiche le scénario de l'évènement 4*)
//procedure scenario4MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 5*)
procedure scenario5MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 6*)
procedure scenario6MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 7*)
procedure scenario7MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 8*)
procedure scenario8MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 9*)
procedure scenario9MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 10*)
procedure scenario10MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 11*)
procedure scenario11MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 12*)
procedure scenario12MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 13*)
procedure scenario13MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 14*)
procedure scenario14MJ(var p : Personnage; var rep : String);

//(*Affiche le scénario de l'évènement 15*)
//procedure scenario15MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 16*)
procedure scenario16MJ(var p : Personnage; var rep : String);

//(*Affiche le scénario de l'évènement 17*)
//procedure scenario17MJ(var p : Personnage; var rep : String);
//
//(*Affiche le scénario de l'évènement 18*)
//procedure scenario18MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 19*)
procedure scenario19MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 20*)
procedure scenario20MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 21*)
procedure scenario21MJ(var p : Personnage; var rep : String);

//(*Affiche le scénario de l'évènement 22*)
////procedure scenario22MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 23*)
procedure scenario23MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 24*)
procedure scenario24MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 25*)
procedure scenario25MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 26*)
procedure scenario26MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 27*)
procedure scenario27MJ(var p : Personnage; var rep : String);


(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 1.*)
procedure reponseScenario1(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 2.*)
procedure reponseScenario2(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 3.*)
procedure reponseScenario3(var pe : Personnage; var r : String);

//(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 4.*)
//procedure reponseScenario4(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 5.*)
procedure reponseScenario5(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 6.*)
procedure reponseScenario6(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 7.*)
procedure reponseScenario7(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 8.*)
procedure reponseScenario8(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 9.*)
procedure reponseScenario9(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 10.*)
procedure reponseScenario10(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 11.*)
procedure reponseScenario11(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 12.*)
procedure reponseScenario12(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 13.*)
procedure reponseScenario13(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 14.*)
procedure reponseScenario14(var pe : Personnage; var r : String);

//(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 15.*)
// procedure reponseScenario15(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 16.*)
procedure reponseScenario16(var pe : Personnage; var r : String);

//(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 17.*)
//procedure reponseScenario17(var pe : Personnage; var r : String);
//
//(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 18.*)
//procedure reponseScenario18(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 19.*)
procedure reponseScenario19(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 20.*)
procedure reponseScenario20(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 21.*)
procedure reponseScenario21(var pe : Personnage; var r : String);

//(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 22.*)
////procedure reponseScenario22(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 23.*)
procedure reponseScenario23(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 24.*)
procedure reponseScenario24(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 25.*)
procedure reponseScenario25(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 26.*)
procedure reponseScenario26(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 27.*)
procedure reponseScenario27(var pe : Personnage; var r : String);






    (*#################################################################*)
    (*                                                                 *)
    (*  ####  #  #  #  #   ##   #####      #  ####  ###    ###    ##   *)
    (*  #     #  #  ## #  #  #    #       #   #  #  #  #  #  #   #  #  *)
    (*  ###   #  #  # ##  #       #      #    ###   #  #  #  #   #     *)
    (*  #     #  #  #  #  #  #    #     #     #     ###   #  #   #  #  *)
    (*  #      ##   #  #   ##     #    #      #     #  #   ##     ##   *)
    (*                                                                 *)
    (*#################################################################*)



implementation
(*#########################################################################################*)
(*                                                                                         *)
(*   ###  #   #  ####  #     ####  #   #  ####  #  #  #####   ###  #####  ###   ###  #  #  *)
(*    #   ## ##  #  #  #     #     ## ##  #     ## #    #    #  #    #     #   #  #  ## #  *)
(*    #   # # #  ###   #     ##    # # #  ##    # ##    #    #  #    #     #   #  #  # ##  *)
(*    #   #   #  #     #     #     #   #  #     #  #    #    ####    #     #   #  #  #  #  *)
(*   ###  #   #  #     ####  ####  #   #  ####  #  #    #    #  #    #    ###   ##   #  #  *)
(*                                                                                         *)
(*#########################################################################################*)

(*Affiche l'en-tête du menu.*)
procedure initCadreHautMJ(p : Personnage);
begin
  dessinerCadreXY(2, 1, 196, 11, double,15,0);
  changerColonneCurseur(95);
  changerLigneCurseur(3);
  centrerTexte(p.nom, 3, 100);
  centrerTexte('race : ' + p.race, 5, 100);
  centrerTexte('PV : ' + IntToStr(p.vie.actuelle) + '/' + IntToStr(p.vie.max), 7, 100);
  centrerTexte('Gold : ' + IntToStr(p.gold), 9, 100);
end;

(*Procédure qui affiche le cadre du bas du menu de Jeu.*)
procedure initCadreBasMJ();
begin
  dessinerCadreXY(2, 45, 196, 58, double,15,0);
  dessinerCadreXY(2, 49, 196, 58, double,15,0);
  dessinerCadreXY(2, 53, 196, 58, double,15,0);


  changerLigneCurseur(55);
  changerColonneCurseur(10);
  Write('>>> Choississez quoi faire');

  centrerTexte('a/ Inventaire', 51, 67);
  centrerTexte('b/ Quête', 51, 133);
end;

(*Attend une réponse de la part de l'utilisateur.*)
function jeVeuxUneReponse() : String;
var
  rep : String;
begin
  ReadLn(rep);
  jeVeuxUneReponse:=rep;
end;

(*Vérifie si la masse d'ébonite est dans l'inventaire. Retourne TRUE si oui.*)
function presenceMasseEbo(p:personnage):Boolean;
var
  i:Integer;
  rep : Boolean;

begin
rep:=FALSE;

  for i:=1 to 12 do
    begin
      if  p.inv[i]='Masse d''ebonite' then
        begin
          rep:=TRUE;
        end;
    end;
  presenceMasseEbo:=rep;
end;



(*Affiche le scénario de l'évènement 1*)
procedure scenario1MJ(var p : Personnage; var rep : String);
begin
  centrerTexte('1/ Pénétrer dans le fort dragon', 47, 40);
  centrerTexte('2/ Parler aux gardes', 47, 80);
  centrerTexte('3/ Marché', 47, 120);
  centrerTexte('4/ Rejoindre la porte principale de Blancherive', 47, 160);



  affTexte(#09'Vous voici devant les portes de Blancherive, décontenancé par ce qui vient de vous arriver. Votre seul but aujourd''hui : parvenir à transmettre les informations communiquées par le Jarl d''Helgen, Gorna Tyradon. Paraît-il qu''un dragon aurait détruit plusieurs villes aux alentours de Blancherive. Vous ne l''avez pas encore aperçu mais une promesse se doit d''être tenue pour un aventurier de votre envergure.', 13);
  affTexte(#09'Aussitôt dans Blancherive, vous vous apercevez de l''étendue de la ville. Une taverne gigantesque ainsi que des marchés tenus par des marchands d''équipement et des marchands de potions vous entoure. Vous marchez en direction du Fort-Dragon, malgré les gardes vous observant. Vous n''avez plus le temps, il vous faut retrouver le Jarl de Blancherive le plus vite possible.', 16);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario1(p, rep);
end;

(*Affiche le scénario de l'évènement 2*)
procedure scenario2MJ(var p : Personnage; var rep : String);
begin
  centrerTexte('1/ Sortir du Fort', 47, 50);
  centrerTexte('2/ Parler au Chambellan', 47, 100);
  centrerTexte('3/ Parler au Jarl', 47, 150);

  affTexte('A peine rentré dans le Fort-Dragon, deux gardes viennent à votre rencontre, l''un de vous demande de vous présenter.', 13);
  affTexte(p.nom+ ', aventurier, je viens de la part de Gorna Tyradon transmettre au Jarl qu''un dragon à détruit de nombreuses villes et se rapproche de Blancherive.', 14);
  affTexte('Le garde stupéfait vous fait une brève description du Fort et vous remercia pour votre bravoure.', 15);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario2(p, rep);
end;

(*Affiche le scénario de l'évènement 3*)
procedure scenario3MJ(var p : Personnage; var rep : String);
begin
  centrerTexte('1/ Pénétrer dans le Fort Dragon', 47, 50);
  centrerTexte('2/ Marché', 47, 100);
  centrerTexte('3/ Rejoindre la porte principale de Blancherive', 47, 150);

  affTexte(#09'Vous vous approchez d''un garde pour vous présenter et expliquer la raison de votre venue. Le garde n''a pas l''air si effrayé, ont-ils l''habitude ?', 13);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario3(p, rep);
end;

//(*Affiche le scénario de l'évènement 4*)
//procedure scenario4MJ(var p : Personnage; var rep : String);
//begin
//  centrerTexte('1/ Pénétrer dans le Fort Dragon', 47, 40);
//  centrerTexte('2/ Parler aux gardes', 47, 80);
//  centrerTexte('3/ Marché', 47, 120);
//  centrerTexte('4/ Rejoindre la porte principale de Blancherive', 47, 160);
//
//  affTexte(#09'Pourquoi vous, simple aventurier ? Est-ce le hasard ou le destin ? Peu importe, vous avez tenu une promesse.', 13);
//
//  changerLigneCurseur(56);
//  changerColonneCurseur(10);
//  Write('>>> ');
//
//  reponseScenario4(p, rep);
//end;

(*Affiche le scénario de l'évènement 5*)
procedure scenario5MJ(var p : Personnage; var rep : String);
begin
  centrerTexte('1/ Sortir', 47, 100);

  affTexte('Devant vous se dresse le Chambellan du Jarl de Blancherive : Cavovius Dargogne. Il lève les yeux de son livre et vous impose de déclarer votre identité et la raison de votre venue.', 13);
  affTexte(p.nom + ' aventurier, je suis à la recherche du Jarl pour lui transmettre un message de la part du Jarl d''Helgen.', 14);
  affTexte('Le Chambellan dépose son livre et vous montre l''emplacement du bureau du Jarl.', 15);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario5(p, rep);
end;

(*Affiche le scénario de l'évènement 6*)
procedure scenario6MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Sortir', 47, 100);

affTexte(#09'Faites vite et allez voir le Jarl, le temps nous est compté ', 13);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario6(p, rep);
end;

(*Affiche le scénario de l'évènement 7*)
procedure scenario7MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Sortir', 47, 100);

affTexte(#09'Vous vous approchez du Jarl de Blancherive. Après une brève présentation, vous lui transmettez les informations du Jarl d''Helgen. ', 13);
affTexte('Le Jarl estomaqué vous dit : ', 14);
affTexte('Je ne sais comment vous remerciez '+p.nom+', je vais prévenir de ce pas mes gardes pour défendre notre ville.', 15);
affTexte(#09'Le message est transmis mais ce n''est pas assez pour vous, vous demandez comment vous pourriez aider les gardes au Jarl. Allez voir le Chambellan il vous dira quoi faire, je ne peux m''occuper de ça pour l''instant, ne vous inquiétez pas, la récompense sera au rendez-vous.', 16);


changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario7(p, rep);
end;

(*Affiche le scénario de l'évènement 8*)
procedure scenario8MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Sortir', 47, 100);

affTexte(#09'Je n''ai vraiment pas le temps, allez voir le Chambellan', 13);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario8(p, rep);
end;

(*Affiche le scénario de l'évènement 9*)
procedure scenario9MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Sortir', 47, 100);

affTexte(#09'Le Jarl à transmis les instructions au Chambellan, vous êtes déterminé à aider les gardes et pouvoir sauver ce qu''il reste du pays mais c''est une tout autre mission qui vous attend.', 13);
affTexte('Merci pour tout ' + p.nom + ', le Jarl a une entière confiance en vous et vous demande de rejoindre la tour de Guet au sud, une équipe de garde est déjà en route. Le Jarl a surement du vous le dire mais une très grosse récompense vous attend si le dragon est vaincu ', 14);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario9(p, rep);
end;

(*Affiche le scénario de l'évènement 10*)
procedure scenario10MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Rejoindre le centre de Blancherive', 47, 100);

affTexte(#09'Pourquoi vous, simple aventurier ? Est-ce le hasard ou le destin ? Peu importe vous avez une promesse à tenir.', 13);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario10(p, rep);
end;

(*Affiche le scénario de l'évènement 11*)
procedure scenario11MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Aller direction la Tour de Guet', 47, 66);
centrerTexte('2/ Rejoindre le centre de Blancherive', 47, 133);

affTexte(#09'Le Jarl de Blancherive compte sur vous, un simple vagabond comme vous devient soldat du jour au lendemain, vous ne pouvez le décevoir.', 13);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario11(p, rep);
end;

(*Affiche le scénario de l'évènement 12*)
procedure scenario12MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Monter avec le Jarl d''Helgen', 47, 66);
centrerTexte('2/ Décliner l''invitation', 47, 133);

affTexte(#09'Vous marchez jusqu''à la tour, soudain une calèche s''arrêta devant vous, c''est Gorna Tyradon.', 13);
affTexte(#09'Vous avez réussi à transmettre le message au Jarl de Blancherive ? Vous demande le Jarl d’Helgen.', 14);
affTexte(#09'Vous lui répondis que oui et que vous étiez en route pour aider les gardes à la Tour de Guet au Sud.', 15);
affTexte(#09'Venez donc dans ma calèche je vous y emmène, je vous dois bien ça', 16);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario12(p, rep);
end;

(*Affiche le scénario de l'évènement 13*)
procedure scenario13MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Fuir', 47, 66);
centrerTexte('2/ Combattre', 47, 133);

affTexte(#09'Vous vous approchez de la Tour de Guet quand soudainement des soldats sombrages vous attaque.', 13);
affTexte(#09'Vous regardez autour de vous les possibilités de fuite, c''est la première fois que vous vous faites attaquer.', 14);
affTexte(#09'La vie du Jarl d''Helgen est entre vos mains, que faire ?', 15);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario13(p, rep);
end;

(*Affiche le scénario de l'évènement 14*)
procedure scenario14MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Rejoindre la porte de la Tour de Guet', 47, 100);

affTexte(#09'Je ne sais quoi vous dire, vous venez de me sauver la vie et je vous en serai éternellement reconnaissant. Tenez c''est pour vous ! Je n''ai rien de plus sur moi.', 13);
affTexte('La calèche est totalement détruite mais il vous reste encore de la route avant la Tour de Guet, vous devez faire vite : nous n''avons pas d''informations sur l''état des gardes présent sur place.', 14);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario14(p, rep);
end;

//(*Affiche le scénario de l'évènement 15*)
//procedure scenario15MJ(var p : Personnage; var rep : String);
//begin
//centrerTexte('1/ Retourner à Blancherive', 47, 100);
//
//affTexte(#09'Vous êtes enfin arrivé et vous apercevez pour la première fois le dragon. Les gardes de Blancherive sont en train de se combattre. Vous n''avez qu''une hâte, les aider.', 13);
//affTexte(#09'Les gardes vous conseillent de revenir avec la Masse d''Ebonite que vous trouverez dans le marché de Blancherive sans quoi vous n''aurez aucune chance de vaincre le dragon.', 15);
//
//changerLigneCurseur(56);
//changerColonneCurseur(10);
//Write('>>> ');
//
////reponseScenario15(p, rep);
//end;

(*Affiche le scénario de l'évènement 16*)
procedure scenario16MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Fuir', 47, 66);
centrerTexte('2/ Combattre', 47, 133);

affTexte(#09'Vous approchez de la porte principale de Blancherive mais un barrage vous bloque le passage. Fuir et prendre le risque de se faire tirer dessus ou combattre ?', 13);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario16(p, rep);
end;

//(*Affiche le scénario de l'évènement 17*)
//procedure scenario17MJ(var p : Personnage; var rep : String);
//begin
//centrerTexte('1/ Rejoindre Blancherive', 47, 100);
//
//affTexte(#09'Vous venez de vaincre les soldats Sombrages mais le dragon est toujours à la Tour de Guet, il vous faut trouver la Masse d''Ebonite au Marché de Blancherive au plus vite.', 13);
//
//changerLigneCurseur(56);
//changerColonneCurseur(10);
//Write('>>> ');
//
//reponseScenario17(p, rep);
//end;
//
//(*Affiche le scénario de l'évènement 18*)
//procedure scenario18MJ(var p : Personnage; var rep : String);
//begin
//centrerTexte('1/ Rejoindre Blancherive', 47, 100);
//
//affTexte(#09'Vous venez de fuir les soldats Sombrages en vous cachant dans des fougères mais le dragon est toujours à la Tour de Guet, il vous faut trouver la Masse d''Ebonite au Marché de Blancherive au plus vite.', 13);
//
//changerLigneCurseur(56);
//changerColonneCurseur(10);
//Write('>>> ');
//
//reponseScenario18(p, rep);
//end;

(*Affiche le scénario de l'évènement 19*)
procedure scenario19MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Marché', 47, 50);
centrerTexte('2/ Porte de Blancherive', 47, 100);
centrerTexte('3/ Pénétrer dans le fort dragon', 47, 150);

affTexte(#09'Vous n''oubliez pas votre mission, tuer le dragon avant qu''il n''arrive à Blancherive. Vous êtes essoufflé mais un soldat ne se plaint jamais. Avec la Masse d''Ebonite, le dragon ne devrait pas pouvoir résister. Vous apercevez le marché d''armement au loin et le temps presse, il ne faut pas perdre de temps.', 13);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario19(p, rep);
end;

(*Affiche le scénario de l'évènement 20*)
procedure scenario20MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Portes de Blancherive', 47, 100);
affTexte(#09'Un garde vous arrête et vous dit :', 13);
affTexte(#09'Vous n''êtes pas équiper de la Masse d''Ebonite, sans elle vous ne pourrez vaincre le dragon', 14);
changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');
reponseScenario20(p, rep);
end;

(*Affiche le scénario de l'évènement 21*)
procedure scenario21MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Rentrer dans la Tour de Guet', 47, 100);
affTexte(#09'Vous êtes prêt à partir combattre, un  enfant sans genre disctinct du nom de Thorn vous arrête et vous dit : ', 13);
affTexte('La sécurité de Blancherive est en danger mais nous avons tous confiance en vous, faites attention.', 14);
changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');
reponseScenario21(p, rep);
end;

(*Affiche le scénario de l'évènement 23*)
procedure scenario23MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Affronter le Dragon', 47, 100);
affTexte(#09'Vous êtes arrivé à la Tour de Guet, la moitié des soldats du Jarl de Blancherive sont déjà bien amochés. Le dragon ne vous voit pas. Vous, équipé de votre Masse d''Ebonite, êtes le seul à pouvoir vaincre le dragon avant qu''il ne fasse encore plus de dégâts.', 13);
changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');
reponseScenario23(p, rep);
end;

(*Affiche le scénario de l'évènement 24*)
procedure scenario24MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Sortir de la Tour de Guet', 47, 100);
affTexte(#09'Vous venez de sauver Blancherive et ses habitants d''une attaque de dragon. Les quelques survivants de la Tour de Guet vous remercient pendant que les blessés se font soigner. Parait-il qu''un autre dragon serait en route vers Bordeciel. Est-ce des rumeurs ? Peu importe il vous faut rejoindre le Jarl de Blancherive pour le prévenir de la mort du dragon et qu''un autre dragon se rapproche.', 13);
changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');
reponseScenario24(p, rep);
end;

(*Affiche le scénario de l'évènement 25*)
procedure scenario25MJ(var p : Personnage; var rep : String);
begin
  centrerTexte('1/ Sortir du Fort', 47, 50);
  centrerTexte('2/ Parler au Chambellan', 47, 100);
  centrerTexte('3/ Parler au Jarl', 47, 150);

  affTexte(#09'Description fort', 13);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario25(p, rep);
end;

(*Affiche le scénario de l'évènement 26*)
procedure scenario26MJ(var p : Personnage; var rep : String);
begin
  centrerTexte('1/ Pénétrer dans le Fort Dragon', 47, 40);
  centrerTexte('2/ Parler aux gardes', 47, 80);
  centrerTexte('3/ Marché', 47, 120);
  centrerTexte('4/ Rejoindre la porte principale de Blancherive', 47, 160);

  affTexte(#09'Description de blancherive', 13);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario26(p, rep);
end;

(*Affiche le scénario de l'évènement 27*)
procedure scenario27MJ(var p : Personnage; var rep : String);
begin
centrerTexte('1/ Sortir', 47, 100);

affTexte(#09'Don lingot du Jarl', 13);

changerLigneCurseur(56);
changerColonneCurseur(10);
Write('>>> ');

reponseScenario27(p, rep);
end;





(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 1.*)
procedure reponseScenario1(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';
    //A := False;
    //B := False;

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
       end;


  until X OR Y OR Z OR ( P AND A AND B );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';



  if ( P AND A AND B ) then
     case rep of
       '1' : pe.lieu:='b';
       '2' : pe.lieu:='e';
       '3' : r := 'Magasin';
       '4' : pe.lieu:='f';
     end;
  centrerTexte(pe.lieu, 1, 100);

end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 2.*)
procedure reponseScenario2(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';
    //A := False;
    //B := False;

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
       end;


  until X OR Y OR Z OR ( P AND A AND C );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND C ) then
     case rep of
       '1' : pe.lieu:='a';
       '2' : pe.lieu:='c';
       '3' : pe.lieu:='d';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 3.*)
procedure reponseScenario3(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
       end;


  until X OR Y OR Z OR ( P AND A AND C );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND C ) then
     case rep of
       '1' : pe.lieu:='b';
       '2' : r := 'Magasin';
       '3' : pe.lieu:='f';
     end;
end;

//(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 4.*)
//procedure reponseScenario4(var pe : Personnage; var r : String);
//var
//  rep : String;
//  A, B, C, P, X, Y, Z : Boolean;
//
//begin
//  r := 'OK';
//
//  repeat
//    razConsole;
//    rep := jeVeuxUneReponse();
//
//    P := Length(rep) = 1;
//    X := rep = 'a';
//    Y := rep = 'b';
//    Z := rep = 'exit';
//
//    if Length(rep) > 0 then
//       begin
//         A := Ord(rep[1]) > Ord('0');
//         B := Ord(rep[1]) < Ord('5');
//         C := Ord(rep[1]) < Ord('4');
//       end;
//
//
//  until X OR Y OR Z OR ( P AND A AND B );
//
//  if Z then r := 'exit';
//  if X then r := 'Inventaire';
//  if Y then r := 'Quete';
//
//  if ( P AND A AND B ) then
//     case rep of
//       '1' : pe.lieu:='b';
//       '2' : pe.lieu:='e';
//       '3' : r := 'Magasin';
//       '4' : pe.lieu:='f';
//     end;
//end;
//

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 5.*)
procedure reponseScenario5(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
       end;


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 6.*)
procedure reponseScenario6(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
       end;


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 7.*)
procedure reponseScenario7(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
       end;


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 8.*)
procedure reponseScenario8(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
       end;


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 9.*)
procedure reponseScenario9(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
       end;


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 10.*)
procedure reponseScenario10(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1'
       end;


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='a';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 11.*)
procedure reponseScenario11(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;


  until X OR Y OR Z OR ( P AND A AND E );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND E ) then
     begin

       if (rep = '1') AND (pe.quete=4) then pe.lieu:='g'
       else pe.lieu:='j';

       case rep of
         '2' : pe.lieu:='a';
       end;
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 12.*)
procedure reponseScenario12(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;


  until X OR Y OR Z OR ( P AND A AND E );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND E ) then
     case rep of
       '1' : pe.lieu:='h';
       '2' : pe.lieu:='j';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 13.*)
procedure reponseScenario13(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;


  until X OR Y OR Z OR ( P AND A AND E );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND E ) then
     case rep of
       '1' : r := 'Mourrir';
       '2' : pe.lieu:='o';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 14.*)
procedure reponseScenario14(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='j';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 16.*)
procedure reponseScenario16(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;


  until X OR Y OR Z OR ( P AND A AND E );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND E ) then
     case rep of
       '1' : r := 'Mourrir';
       '2' : pe.lieu:='p';
     end;
end;

//(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 17.*)
//procedure reponseScenario17(var pe : Personnage; var r : String);
//var
//  rep : String;
//  A, B, C, D, E, P, X, Y, Z : Boolean;
//
//begin
//  r := 'OK';
//
//  repeat
//    razConsole;
//    rep := jeVeuxUneReponse();
//
//    P := Length(rep) = 1;
//    X := rep = 'a';
//    Y := rep = 'b';
//    Z := rep = 'exit';
//
//    if Length(rep) > 0 then
//       begin
//         A := Ord(rep[1]) > Ord('0');
//         B := Ord(rep[1]) < Ord('5');
//         C := Ord(rep[1]) < Ord('4');
//         D := rep = '1';
//         E := Ord(rep[1]) < Ord('3');
//       end;
//
//
//  until X OR Y OR Z OR ( P AND D );
//
//  if Z then r := 'exit';
//  if X then r := 'Inventaire';
//  if Y then r := 'Quete';
//
//  if ( P AND D ) then
//     case rep of
//       '1' : pe.lieu:='f';
//     end;
//end;
//
//(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 18.*)
//procedure reponseScenario18(var pe : Personnage; var r : String);
//var
//  rep : String;
//  A, B, C, D, E, P, X, Y, Z : Boolean;
//
//begin
//  r := 'OK';
//
//  repeat
//    razConsole;
//    rep := jeVeuxUneReponse();
//
//    P := Length(rep) = 1;
//    X := rep = 'a';
//    Y := rep = 'b';
//    Z := rep = 'exit';
//
//    if Length(rep) > 0 then
//       begin
//         A := Ord(rep[1]) > Ord('0');
//         B := Ord(rep[1]) < Ord('5');
//         C := Ord(rep[1]) < Ord('4');
//         D := rep = '1';
//         E := Ord(rep[1]) < Ord('3');
//       end;
//
//
//  until X OR Y OR Z OR ( P AND D );
//
//  if Z then r := 'exit';
//  if X then r := 'Inventaire';
//  if Y then r := 'Quete';
//
//  if ( P AND D ) then
//     case rep of
//       '1' : pe.lieu:='f';
//     end;
//end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 19.*)
procedure reponseScenario19(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;


  until X OR Y OR Z OR ( P AND A AND C );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND C ) then
     case rep of
       '1' : r := 'Magasin';
       '2' : pe.lieu:='f';
       '3' : pe.lieu:='b';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 20.*)
procedure reponseScenario20(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;
begin
  r := 'OK';
  repeat
    razConsole;
    rep := jeVeuxUneReponse();
    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';
    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;
  until X OR Y OR Z OR ( P AND D );
  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';
  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='k';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 21.*)
procedure reponseScenario21(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;
begin
  r := 'OK';
  repeat
    razConsole;
    rep := jeVeuxUneReponse();
    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';
    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;
  until X OR Y OR Z OR ( P AND D );
  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';
  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='n';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 23.*)
procedure reponseScenario23(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;
begin
  r := 'OK';
  repeat
    razConsole;
    rep := jeVeuxUneReponse();
    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';
    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
         E := Ord(rep[1]) < Ord('3');
       end;
  until X OR Y OR Z OR ( P AND D );
  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';
  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='q';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 24.*)
procedure reponseScenario24(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;
begin
  effacerEcran;
  centrerTexte('Cinématique du turfu achète le DLC', 30, 100);
  r := 'exit';
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 25.*)
procedure reponseScenario25(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';
    //A := False;
    //B := False;

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
       end;


  until X OR Y OR Z OR ( P AND A AND C );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND C ) then
     case rep of
       '1' : pe.lieu:='a';
       '2' : pe.lieu:='c';
       '3' : pe.lieu:='d';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 26.*)
procedure reponseScenario26(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, E, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';
    //A := False;
    //B := False;

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
       end;


  until X OR Y OR Z OR ( P AND A AND B );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND B ) then
     case rep of
       '1' : pe.lieu:='b';
       '2' : pe.lieu:='e';
       '3' : r := 'Magasin';
       '4' : pe.lieu:='f';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 27.*)
procedure reponseScenario27(var pe : Personnage; var r : String);
var
  rep : String;
  A, B, C, D, P, X, Y, Z : Boolean;

begin
  r := 'OK';

  repeat
    razConsole;
    rep := jeVeuxUneReponse();

    P := Length(rep) = 1;
    X := rep = 'a';
    Y := rep = 'b';
    Z := rep = 'exit';

    if Length(rep) > 0 then
       begin
         A := Ord(rep[1]) > Ord('0');
         B := Ord(rep[1]) < Ord('5');
         C := Ord(rep[1]) < Ord('4');
         D := rep = '1';
       end;


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;
end;
end.
