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

uses sysutils,unitEcran, unitDate, typesDuJeu, unitSauvegardeTools, unitLang, unitCombat;

(*Récupère le texte pour ce fichier.*)
function recupTUJeu(l : Integer) : String;

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

(*Affiche le scénario de l'évènement 15*)
procedure scenario15MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 16*)
procedure scenario16MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 17*)
procedure scenario17MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 18*)
procedure scenario18MJ(var p : Personnage; var rep : String);

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

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 17.*)
procedure reponseScenario17(var pe : Personnage; var r : String);

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 18.*)
procedure reponseScenario18(var pe : Personnage; var r : String);

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

(*Permet de combattre des sombrages*)
procedure combattreSombrage(var p : Personnage; var r : String);

(*Permet de combattre le dragon*)
procedure combattreDragon(var p : Personnage; var r : String);






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

(*Récupère le texte pour ce fichier.*)
function recupTUJeu(l : Integer) : String;
begin
  recupTUJeu := ligneDUnFichierTexte('unitMenuJeu.txt', l);
end;

(*Affiche l'en-tête du menu.*)
procedure initCadreHautMJ(p : Personnage);
var
  date : String;
begin
  dessinerCadreXY(2, 1, 196, 11, double,15,0);
  changerColonneCurseur(95);
  changerLigneCurseur(3);
  centrerTexte(p.nom, 3, 100);
  centrerTexte(recupTUJeu(1) + p.race, 5, 100);
  centrerTexte(recupTUJeu(2) + IntToStr(p.vie.actuelle) + '/' + IntToStr(p.vie.max), 7, 100);
  centrerTexte(recupTUJeu(3) + IntToStr(p.gold), 9, 100);

  //date := IntToStr(p.dateAjh.heure) + ':' + IntToStr(p.dateAjh.heure) + '   ' + IntToStr(p.dateAjh.jour) + ' ';

  date := p.dateAjh.ere + ' ' + IntToStr(p.dateAjh.annee) + ', ';

  case p.dateAjh.mois of
    1 : date := date + 'Primétoile';
    2 : date := date + 'Clairciel';
    3 : date := date + 'Semailles';
    4 : date := date + 'Ondepluie';
    5 : date := date + 'Plantaisons';
    6 : date := date + 'Mi-l''an';
    7 : date := date + 'Hautzénith';
    8 : date := date + 'Vifazur';
    9 : date := date + 'Âtrefeu';
    10 : date := date + 'Soufflegivre';
    11 : date := date + 'Sombreciel';
    12 : date := date + 'Soirétoile';
  end;

  date := date + ' le ' + IntToStr(p.dateAjh.jour) + ' à ';

  if p.dateAjh.heure < 10 then date := date + '0' + IntToStr(p.dateAjh.heure)
  else date := date + IntToStr(p.dateAjh.heure);

  date := date + ':';

  if p.dateAjh.minute < 10 then date := date + '0' + IntToStr(p.dateAjh.minute)
  else date := date + IntToStr(p.dateAjh.minute);

  centrerTexte(date, 43, 100);

end;

(*Procédure qui affiche le cadre du bas du menu de Jeu.*)
procedure initCadreBasMJ();
begin
  dessinerCadreXY(2, 45, 196, 58, double,15,0);
  dessinerCadreXY(2, 49, 196, 58, double,15,0);
  dessinerCadreXY(2, 53, 196, 58, double,15,0);


  changerLigneCurseur(55);
  changerColonneCurseur(10);
  Write('>>> ', recupTUJeu(4));

  centrerTexte(recupTUJeu(5), 51, 67);
  centrerTexte(recupTUJeu(6), 51, 133);
end;

(*Attend une réponse de la part de l'utilisateur.*)
function jeVeuxUneReponse() : String;
var
  rep : String;
begin
  ReadLn(rep);
  jeVeuxUneReponse:=rep;

  if rep = 'var lang fr' then modifLang('fr');
  if rep = 'var lang en' then modifLang('en');
  if rep = 'var lang la' then modifLang('la');
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
      if  p.inv[i]=recupTUJeu(7) then
        begin
          rep:=TRUE;
        end;
    end;
  presenceMasseEbo:=rep;
end;



(*Affiche le scénario de l'évènement 1*)
procedure scenario1MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(10), 47, 40);
  centrerTexte(recupTUJeu(11), 47, 80);
  centrerTexte(recupTUJeu(12), 47, 120);
  centrerTexte(recupTUJeu(13), 47, 160);



  affTexte(#09 + recupTUJeu(14), 13);
  affTexte(#09 + recupTUJeu(15), 16);

  dessinerTexte('blancherive_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario1(p, rep);

  avancerMinutes(p, 30);
end;

(*Affiche le scénario de l'évènement 2*)
procedure scenario2MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(18), 47, 50);
  centrerTexte(recupTUJeu(19), 47, 100);
  centrerTexte(recupTUJeu(20), 47, 150);

  affTexte(recupTUJeu(21), 13);
  affTexte(p.nom+ recupTUJeu(22), 14);  // Texte à colorier
  affTexte(recupTUJeu(23), 15);

  dessinerTexte('fortDragon_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario2(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 3*)
procedure scenario3MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(10), 47, 50);
  centrerTexte(recupTUJeu(26), 47, 100);
  centrerTexte(recupTUJeu(27), 47, 150);

  affTexte(#09 + recupTUJeu(28), 13);

  dessinerTexte('blancherive_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario3(p, rep);

  avancerMinutes(p, 10);
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
  centrerTexte(recupTUJeu(31), 47, 100);

  affTexte(recupTUJeu(32), 13);
  affTexte(p.nom + recupTUJeu(33), 14);  // Texte
  affTexte(recupTUJeu(34), 15);

  dessinerTexte('bibliotheque_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario5(p, rep);

  avancerMinutes(p, 30);
end;

(*Affiche le scénario de l'évènement 6*)
procedure scenario6MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(31), 47, 100);

  affTexte(#09 + recupTUJeu(37), 13);

  dessinerTexte('bibliotheque_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario6(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 7*)
procedure scenario7MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(31), 47, 100);

  affTexte(#09 + recupTUJeu(40), 13);
  affTexte(recupTUJeu(41), 14);
  affTexte(recupTUJeu(42) + p.nom + recupTUJeu(43), 15);  // Dialogue
  affTexte(#09 + recupTUJeu(44), 16);

  dessinerTexte('salleDuTrone_AA.txt', 25);


  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario7(p, rep);

  avancerMinutes(p, 30);
end;

(*Affiche le scénario de l'évènement 8*)
procedure scenario8MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(31), 47, 100);

  affTexte(#09 + recupTUJeu(47), 13);

  dessinerTexte('salleDuTrone_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario8(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 9*)
procedure scenario9MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(31), 47, 100);

  affTexte(#09 + recupTUJeu(50), 13);
  affTexte(recupTUJeu(51) + p.nom + recupTUJeu(52), 14);

  dessinerTexte('bibliotheque_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario9(p, rep);

  avancerMinutes(p, 20);
end;

(*Affiche le scénario de l'évènement 10*)
procedure scenario10MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(55), 47, 100);

  affTexte(#09 + recupTUJeu(56), 13);

  dessinerTexte('porte_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario10(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 11*)
procedure scenario11MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(59), 47, 66);
  centrerTexte(recupTUJeu(60), 47, 133);

  affTexte(#09 + recupTUJeu(61), 13);

  dessinerTexte('porte_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario11(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 12*)
procedure scenario12MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(64), 47, 66);
  centrerTexte(recupTUJeu(65), 47, 133);

  affTexte(#09 + recupTUJeu(66), 13);
  affTexte(#09 + recupTUJeu(67), 14);
  affTexte(#09 + recupTUJeu(68), 15);
  affTexte(#09 + recupTUJeu(69), 16);

  dessinerTexte('bordeciel_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario12(p, rep);

  avancerMinutes(p, 60);
end;

(*Affiche le scénario de l'évènement 13*)
procedure scenario13MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(72), 47, 66);
  centrerTexte(recupTUJeu(73), 47, 133);

  affTexte(#09 + recupTUJeu(74), 13);
  affTexte(#09 + recupTUJeu(75), 14);
  affTexte(#09 + recupTUJeu(76), 15);

  dessinerTexte('caleche_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario13(p, rep);

  avancerMinutes(p, 0);
end;

(*Affiche le scénario de l'évènement 14*)
procedure scenario14MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(79), 47, 100);

  affTexte(#09 + recupTUJeu(80), 13);
  affTexte(recupTUJeu(81), 14);

  dessinerTexte('bordeciel_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario14(p, rep);

  avancerMinutes(p, 90);
end;

(*Affiche le scénario de l'évènement 15*)
procedure scenario15MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(79), 47, 100);

  affTexte(#09 + recupTUJeu(84), 13);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario14(p, rep);
end;

(*Affiche le scénario de l'évènement 16*)
procedure scenario16MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(72), 47, 66);
  centrerTexte(recupTUJeu(73), 47, 133);

  affTexte(#09 + recupTUJeu(87), 13);

  dessinerTexte('bordeciel_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario16(p, rep);

  avancerMinutes(p, 90);
end;

(*Affiche le scénario de l'évènement 17*)
procedure scenario17MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(90), 47, 100);

  affTexte(#09 + recupTUJeu(91), 13);

  dessinerTexte('bordeciel_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario17(p, rep);

  avancerMinutes(p, 60);
end;

(*Affiche le scénario de l'évènement 18*)
procedure scenario18MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(90), 47, 100);

  affTexte(#09 + recupTUJeu(94), 13);

  dessinerTexte('bordeciel_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario18(p, rep);
end;

(*Affiche le scénario de l'évènement 19*)
procedure scenario19MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(97), 47, 50);
  centrerTexte(recupTUJeu(98), 47, 100);
  centrerTexte(recupTUJeu(99), 47, 150);

  affTexte(#09 + recupTUJeu(100), 13);

  dessinerTexte('blancherive_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario19(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 20*)
procedure scenario20MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(103), 47, 100);

  affTexte(#09 + recupTUJeu(104), 13);
  affTexte(#09 + recupTUJeu(105), 14);

  dessinerTexte('tourDeGuet_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');
  reponseScenario20(p, rep);
end;

(*Affiche le scénario de l'évènement 21*)
procedure scenario21MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(108), 47, 100);

  affTexte(#09 + recupTUJeu(109), 13);
  affTexte(recupTUJeu(110), 14);

  dessinerTexte('tourDeGuet_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');
  reponseScenario21(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 23*)
procedure scenario23MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(113), 47, 100);

  affTexte(#09 + recupTUJeu(114), 13);

  dessinerTexte('tourDeGuet_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');
  reponseScenario23(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 24*)
procedure scenario24MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(117), 47, 100);
  affTexte(#09 + recupTUJeu(118), 13);

  dessinerTexte('tourDeGuet_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');
  reponseScenario24(p, rep);

  avancerMinutes(p, 10);
end;

(*Affiche le scénario de l'évènement 25*)
procedure scenario25MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(18), 47, 50);
  centrerTexte(recupTUJeu(19), 47, 100);
  centrerTexte(recupTUJeu(20), 47, 150);

  affTexte(#09 + recupTUJeu(121), 13);

  dessinerTexte('fortDragon_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario25(p, rep);

  avancerMinutes(p, 60);
end;

(*Affiche le scénario de l'évènement 26*)
procedure scenario26MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(10), 47, 40);
  centrerTexte(recupTUJeu(11), 47, 80);
  centrerTexte(recupTUJeu(12), 47, 120);
  centrerTexte(recupTUJeu(13), 47, 160);

  affTexte(#09 + recupTUJeu(124), 13);

  dessinerTexte('blancherive_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario26(p, rep);

  avancerMinutes(p, 90);
end;

(*Affiche le scénario de l'évènement 27*)
procedure scenario27MJ(var p : Personnage; var rep : String);
begin
  centrerTexte(recupTUJeu(31), 47, 100);

  affTexte(#09 + recupTUJeu(127), 13);
  affTexte(recupTUJeu(128), 14);
  affTexte(#09 + recupTUJeu(129), 15);

  dessinerTexte('salleDuTrone_AA.txt', 25);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario27(p, rep);

  avancerMinutes(p, 10);
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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;

  pe.quete:=2;
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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;

  if pe.quete = 2 then pe.quete:=3;
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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


  until X OR Y OR Z OR ( P AND A AND E );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if pe.quete=3 then pe.quete:=4;

  if ( P AND A AND E ) then
     begin

       if (rep = '1') AND (pe.quete=4) then pe.lieu:='g';
       if (rep = '1') AND (pe.quete<>4) then pe.lieu:='j';

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

    if rep = 'save' then saveJ(pe);


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
  i : Integer;

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

    if rep = 'save' then saveJ(pe);


  until X OR Y OR Z OR ( P AND A AND E );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND E ) then
     case rep of
       '1' : r := 'MourrirFleche';
       '2' : pe.lieu:='o';
     end;

  if (pe.dateAjh.heure > 17) AND (r = 'MourrirFleche') then
     begin
       for i:=1 to (34 - pe.dateAjh.heure) do
         begin
           avancerHeure(pe);
         end;

       pe.lieu:='r';
       r := 'OK';
     end;

  if (pe.dateAjh.heure < 6) AND (r = 'MourrirFleche') then
     begin
       for i:=1 to (11 - pe.dateAjh.heure) do
         begin
           avancerHeure(pe);
         end;

       pe.lieu:='r';
       r := 'OK';
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

    if rep = 'save' then saveJ(pe);


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
  i : Integer;

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

    if rep = 'save' then saveJ(pe);


  until X OR Y OR Z OR ( P AND A AND E );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND A AND E ) then
     case rep of
       '1' : r := 'MourrirFleche';
       '2' : pe.lieu:='p';
     end;

  if (pe.dateAjh.heure > 17) then
     begin
       for i := 1 to (34 - pe.dateAjh.heure) do
         begin
           avancerHeure(pe);
         end;

       pe.lieu:='s';
       r := 'OK';
     end;

  if (pe.dateAjh.heure < 6) then
     begin
       for i := 1 to (11 - pe.dateAjh.heure) do
         begin
           avancerHeure(pe);
         end;

       pe.lieu:='s';
       r := 'OK';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 17.*)
procedure reponseScenario17(var pe : Personnage; var r : String);
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

    if rep = 'save' then saveJ(pe);


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='f';
     end;
end;

(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête pour la scene 18.*)
procedure reponseScenario18(var pe : Personnage; var r : String);
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

    if rep = 'save' then saveJ(pe);


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='f';
     end;
end;

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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);

  until X OR Y OR Z OR ( P AND D );
  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';
  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='k';
     end;

  pe.quete:=5;
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

    if rep = 'save' then saveJ(pe);

  until X OR Y OR Z OR ( P AND D );
  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';
  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='n';
     end;

  pe.quete:=7;
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

    if rep = 'save' then saveJ(pe);

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
  ReadLn;
  effacerEcran;

  dessinerImageMenuDem('DLC_AA.txt', 20);
  centrerTexte(recupTUJeu(131), 40, 100);
  ReadLn;
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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


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

    if rep = 'save' then saveJ(pe);


  until X OR Y OR Z OR ( P AND D );

  if Z then r := 'exit';
  if X then r := 'Inventaire';
  if Y then r := 'Quete';

  if ( P AND D ) then
     case rep of
       '1' : pe.lieu:='b';
     end;

  pe.gold:=pe.gold + (1100-pe.gold);
end;

(*Permet de combattre des sombrages*)
procedure combattreSombrage(var p : Personnage; var r : String);
var
  en : Enemy;

begin
  en.nom:='un groupe de Sombrage';
  en.degat:=11;
  en.vie.max := 111;
  en.vie.actuelle := 111;

  r := combat(p, en);

  if (r = 'OK') AND (p.lieu='o') then p.lieu:='i';
  if (r = 'OK') AND (p.lieu='p') then p.lieu:='l';
end;

(*Permet de combattre le dragon*)
procedure combattreDragon(var p : Personnage; var r : String);
var
  en : Enemy;

begin
  en.nom:='le DRAGON';
  en.degat:=25;
  en.vie.max := 200;
  en.vie.actuelle := 200;

  r := combat(p, en);

  if (r = 'OK') then p.lieu:='m';
end;


end.
