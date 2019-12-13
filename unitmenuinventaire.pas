unit unitMenuInventaire;

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

uses unitEcran;



    (*#################################################################*)
    (*                                                                 *)
    (*  ####  #  #  #  #   ##   #####      #  ####  ###    ###    ##   *)
    (*  #     #  #  ## #  #  #    #       #   #  #  #  #  #  #   #  #  *)
    (*  ###   #  #  # ##  #       #      #    ###   #  #  #  #   #     *)
    (*  #     #  #  #  #  #  #    #     #     #     ###   #  #   #  #  *)
    (*  #      ##   #  #   ##     #    #      #     #  #   ##     ##   *)
    (*                                                                 *)
    (*#################################################################*)

(*Procédure qui affiche le cadre du haut du menu de quête.*)
procedure initCadreHautMInv(p : Personnage);

(*Procedure qui affiche le cadre du bas du menu Quête*)
procedure initCadreBasMInv();

(*Affiche les items de l'inventaire du joueur.*)
procedure affLInventaire(p : Personnage);

(*Affiche l'équipement du joueur*)
procedure affLEquipement(p : Personnage);


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

(*Procédure qui affiche le cadre du haut du menu de quête.*)
procedure initCadreHautMInv(p : Personnage);
begin
  dessinerCadreXY(2, 1, 196, 11, double,15,0);
  changerColonneCurseur(95);
  changerLigneCurseur(3);
  centrerTexte(p.nom, 3, 100);
  centrerTexte('race : ' + p.race, 5, 100);
  centrerTexte('PV : ' + IntToStr(p.vie.actuelle) + '/' + IntToStr(p.vie.max), 7, 100);
  centrerTexte('Gold : ' + IntToStr(p.gold), 9, 100);
end;

(*Procedure qui affiche le cadre du bas du menu Quête*)
procedure initCadreBasMInv();
begin
  dessinerCadreXY(2, 49, 196, 58, double,15,0);
  dessinerCadreXY(2, 53, 196, 58, double,15,0);


  changerLigneCurseur(55);
  changerColonneCurseur(10);
  Write('>>> Choississez quoi faire');

  centrerTexteGauche('a/ Equiper', 51);
  centrerTexte('b/ Utiliser potion ', 51);
  centrerTexteDroite('c/ Sortir', 51);
end;

(*Affiche les items de l'inventaire du joueur.*)
procedure affLInventaire(p : Personnage);
var
  pos : coordonnees;
begin
  pos.x:=8;
  pos.y:=22;
  if p.inv[1] <> '' then ecrireEnPosition(pos,'1/ '+ p.inv[1]);
  pos.y:=24;
  if p.inv[2] <> '' then ecrireEnPosition(pos,'2/ '+ p.inv[2]);
  pos.y:=26;
  if p.inv[3] <> '' then ecrireEnPosition(pos,'3/ '+ p.inv[3]);
  pos.y:=28;
  if p.inv[4] <> '' then ecrireEnPosition(pos,'4/ '+ p.inv[4]);
  pos.y:=30;
  if p.inv[5] <> '' then ecrireEnPosition(pos,'5/ '+ p.inv[5]);
  pos.y:=32;
  if p.inv[6] <> '' then ecrireEnPosition(pos,'6/ '+ p.inv[6]);
  pos.y:=34;
  if p.inv[7] <> '' then ecrireEnPosition(pos,'7/ '+ p.inv[7]);
  pos.y:=36;
  if p.inv[8] <> '' then ecrireEnPosition(pos,'8/ '+ p.inv[8]);
  pos.y:=38;
  if p.inv[9] <> '' then ecrireEnPosition(pos,'9/ '+ p.inv[9]);
  pos.y:=40;
  if p.inv[10] <> '' then ecrireEnPosition(pos,'10/ '+ p.inv[10]);
  pos.y:=42;
  if p.inv[11] <> '' then ecrireEnPosition(pos,'11/ '+ p.inv[11]);
  pos.y:=44;
  if p.inv[12] <> '' then ecrireEnPosition(pos,'12/ '+ p.inv[12]);
end;

(*Affiche l'équipement du joueur*)
procedure affLEquipement(p : Personnage);
begin
  if p.equip[arme] = '' then
    centrerTexteContrainte('Arme: null' , 30, 136)
  else
    centrerTexteContrainte('Arme: ' + p.equip[arme] , 30, 136);

  if p.equip[casque] = '' then
    centrerTexteContrainte('Casque: null' , 33, 136)
  else
    centrerTexteContrainte('Casque: ' + p.equip[casque] , 33, 136);

  if p.equip[plastron] = '' then
    centrerTexteContrainte('Plastron: null' , 36, 136)
  else
    centrerTexteContrainte('Plastron: ' + p.equip[plastron] , 36, 136);
end;

end.
