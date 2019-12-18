unit unitMenuQuete;

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
uses unitEcran, typesDuJeu, sysutils;



    (*#################################################################*)
    (*                                                                 *)
    (*  ####  #  #  #  #   ##   #####      #  ####  ###    ###    ##   *)
    (*  #     #  #  ## #  #  #    #       #   #  #  #  #  #  #   #  #  *)
    (*  ###   #  #  # ##  #       #      #    ###   #  #  #  #   #     *)
    (*  #     #  #  #  #  #  #    #     #     #     ###   #  #   #  #  *)
    (*  #      ##   #  #   ##     #    #      #     #  #   ##     ##   *)
    (*                                                                 *)
    (*#################################################################*)

(*Récupère le texte pour ce fichier.*)
function recupTUQuete(l : Integer) : String;

(*Procédure qui affiche le cadre du haut du menu de quête.*)
procedure initCadreHautMQ(p : Personnage);

(*Procedure qui affiche le cadre du bas du menu Quête*)
procedure initCadreBasMQ();


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
function recupTUQuete(l : Integer) : String;
begin
  recupTUQuete := ligneDUnFichierTexte('unitMenuQuete.txt', l);
end;

(*Procédure qui affiche le cadre du haut du menu de quête.*)
procedure initCadreHautMQ(p : Personnage);
begin
  dessinerCadreXY(2, 1, 196, 11, double,15,0);
  changerColonneCurseur(95);
  changerLigneCurseur(3);
  centrerTexte(p.nom, 3, 100);
  centrerTexte(recupTUQuete(1) + p.race, 5, 100);
  centrerTexte(recupTUQuete(2) + IntToStr(p.vie.actuelle) + '/' + IntToStr(p.vie.max), 7, 100);
  centrerTexte(recupTUQuete(3) + IntToStr(p.gold), 9, 100);
end;

(*Procedure qui affiche le cadre du bas du menu Quête*)
procedure initCadreBasMQ();
begin
  dessinerCadreXY(2, 49, 196, 58, double,15,0);
  dessinerCadreXY(2, 53, 196, 58, double,15,0);


  changerLigneCurseur(55);
  changerColonneCurseur(10);
  Write('>>> ', recupTUQuete(4));

  centrerTexte(recupTUQuete(5), 51, 100);
end;

end.



