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

(*Affiche le scénario de l'évènement 1*)
procedure scenario1MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 1*)
procedure scenario19MJ(var p : Personnage; var rep : String);

(*Affiche le scénario de l'évènement 1*)
procedure scenario26MJ(var p : Personnage; var rep : String);






(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête.*)
procedure reponseScenario1(var pe : Personnage; var r : String);



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

(*Affiche le scénario de l'évènement 1*)
procedure scenario1MJ(var p : Personnage; var rep : String);
begin
  centrerTexte('1/ Pénétrer dans le fort dragon', 47, 40);
  centrerTexte('2/ Parler aux gardes', 47, 80);
  centrerTexte('3/ Marché', 47, 120);
  centrerTexte('4/ Rejoindre la porte principale de Blancherive', 47, 160);



  //affTexte(#09'Vous voici devant les portes de Blancherive, décontenancé par ce qui vient de vous arriver. Votre seul but aujourd''hui : parvenir à transmettre les informations communiquées par le Jarl d''Helgen, Gorna Tyradon. Paraît-il qu''un dragon aurait détruit plusieurs villes aux alentours de Blancherive. Vous ne l''avez pas encore aperçu mais une promesse se doit d''être tenue pour un aventurier de votre envergure.', 13);
  //affTexte(#09'Aussitôt dans Blancherive, vous vous apercevez de l''étendue de la ville. Une taverne gigantesque ainsi que des marchés tenus par des marchands d''équipement et des marchands de potions vous entoure. Vous marchez en direction du Fort-Dragon, malgré les gardes vous observant. Vous n''avez plus le temps, il vous faut retrouver le Jarl de Blancherive le plus vite possible.', 16);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>> ');

  reponseScenario1(p, rep);
end;

(*Affiche le scénario de l'évènement 2*)
procedure scenario2MJ(var p : Personnage; var rep : String);
begin
  ReadLn();
end;





(*Permet d'analyser la réponse du joueur et de changer le lieu et la quête.*)
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


end;

end.
