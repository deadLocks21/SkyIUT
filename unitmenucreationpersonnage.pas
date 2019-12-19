unit unitMenuCreationPersonnage;

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

uses unitEcran, sysutils, typesDuJeu, unitDate, unitSauvegardeTools;



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
function recupTUCP(l : Integer) : String;

(*Attend une réponse de la part de l'utilisateur.*)
function jeVeuxUneReponse() : String;




(*Affiche le texte de demande du pseudo du personnage.*)
procedure affTexteDemandeNomPersMCP();

(*Affiche le pseudo de manière centrée.*)
procedure centrerPseudoMCP(p : String);

(*Affiche le texte des différentes races.*)
procedure affRacesMCP();

(*Retourne la race que le joueur désire utiliser.*)
function choixRaceMCP() : Integer;

(*Demande au joueur s'il veut lancer et retourne sa réponse (FALSE si oui et vice versa).*)
function confirmationMCP() : Boolean;



(*Initialise le nom des races dans la liste des races*)
procedure initRace(var r : TypeRace);

(*modifie la variable de type personnage en fonction de la race et du nom renseigné.*)
procedure creerPersonnage(var p : Personnage; nom : String; race : Integer);




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
function recupTUCP(l : Integer) : String;
begin
  recupTUCP := ligneDUnFichierTexte('unitMenuCreationPersonnage.txt', l);
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



(*Affiche le texte de demande du pseudo du personnage.*)
procedure affTexteDemandeNomPersMCP();
begin
  centrerTexte(recupTUCP(1), 15, 100);
  centrerTexte('', 16, 100);
end;

(*Affiche le pseudo de manière centrée.*)
procedure centrerPseudoMCP(p : String);
begin
  centrerTexte('                                                       ', 16, 100);
  centrerTexte(p, 16, 100);
end;

(*Affiche le texte des différentes races.*)
procedure affRacesMCP();
begin
  centrerTexte(recupTUCP(2), 25, 100);
  centrerTexte(recupTUCP(3), 26, 100);
  centrerTexte(recupTUCP(4), 27, 100);
  centrerTexte(recupTUCP(5), 28, 100);
  centrerTexte(recupTUCP(6), 29, 100);
  centrerTexte(recupTUCP(7), 30, 100);
  centrerTexte(recupTUCP(8), 31, 100);
  centrerTexte(recupTUCP(9), 32, 100);
  centrerTexte(recupTUCP(10), 33, 100);
  centrerTexte(recupTUCP(11), 34, 100);
end;

(*Retourne la race que le joueur désire utiliser.*)
function choixRaceMCP() : Integer;
var
  rep : String;
  A, B, C, D, R, S : Boolean;

begin
  repeat
    centrerTexte(recupTUCP(12), 36, 100);
    centrerTexte('              ', 37, 100);
    centrerTexte('', 37, 100);
    rep := jeVeuxUneReponse();

    R := Length(rep) = 1;
    S := Length(rep) = 2;
    A := Ord('0') < Ord(rep[1]);
    B := Ord(rep[1]) <= Ord('9');
    C := rep[1] = '1';
    D := rep[2] = '0';

  until ( (R AND A AND B) OR (S AND C AND D) );

  choixRaceMCP := StrToInt(rep);
end;

(*Demande au joueur s'il veut lancer et retourne sa réponse (FALSE si oui et vice versa).*)
function confirmationMCP() : Boolean;
var
  rep : String;
  res : Boolean;

begin
  repeat
    centrerTexte(recupTUCP(13), 45, 100);
    centrerTexte('', 46, 100);
    rep := jeVeuxUneReponse();
  until (rep <> recupTUCP(14)) OR (rep <> recupTUCP(15));

  if rep = recupTUCP(14) then
    res := FALSE
  else
    res := TRUE;

  confirmationMCP := res;
end;



(*Initialise le nom des races dans la liste des races*)
procedure initRace(var r : TypeRace);
begin
  r[1] := recupTUCP(16);
  r[2] := recupTUCP(17);
  r[3] := recupTUCP(18);
  r[4] := recupTUCP(19);
  r[5] := recupTUCP(20);
  r[6] := recupTUCP(21);
  r[7] := recupTUCP(22);
  r[8] := recupTUCP(23);
  r[9] := recupTUCP(24);
  r[10] :=  recupTUCP(25);
end;

(*Retourne un type personnage en fonction de la race renseigné.*)
procedure creerPersonnage(var p : Personnage; nom : String; race : Integer);
var
  i : Integer;
  e : TypeNomEquipement;
  tabInv : Inventaire;
  tabEquip : Equipement;
  racesNom : TypeRace;

begin
  p.nom:=nom;
  initRace(racesNom);


  case race of
    1: p.race:=racesNom[1];
    2: p.race:=racesNom[2];
    3: p.race:=racesNom[3];
    4: p.race:=racesNom[4];
    5: p.race:=racesNom[5];
    6: p.race:=racesNom[6];
    7: p.race:=racesNom[7];
    8: p.race:=racesNom[8];
    9: p.race:=racesNom[9];
    10: p.race:=racesNom[10];
  end;


  case race of
    1: p.vie.max:=80;
    2: p.vie.max:=120;
    3: p.vie.max:=100;
    4: p.vie.max:=80;
    5: p.vie.max:=100;
    6: p.vie.max:=100;
    7: p.vie.max:=80;
    8: p.vie.max:=120;
    9: p.vie.max:=140;
    10: p.vie.max:=120;
  end;

  p.vie.actuelle:=p.vie.max;


  p.gold:=500;


  for i:=1 to 12 do
    tabInv[i] := '';

  p.inv := tabInv;



  for e := arme to plastron do
    tabEquip[e]:= '';

  p.equip:= tabEquip;

  p.quete:= 1;

  p.lieu:='a';

  initDate(p);
end;

end.


