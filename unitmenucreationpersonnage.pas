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

uses unitEcran, sysutils, typesDuJeu;



    (*#################################################################*)
    (*                                                                 *)
    (*  ####  #  #  #  #   ##   #####      #  ####  ###    ###    ##   *)
    (*  #     #  #  ## #  #  #    #       #   #  #  #  #  #  #   #  #  *)
    (*  ###   #  #  # ##  #       #      #    ###   #  #  #  #   #     *)
    (*  #     #  #  #  #  #  #    #     #     #     ###   #  #   #  #  *)
    (*  #      ##   #  #   ##     #    #      #     #  #   ##     ##   *)
    (*                                                                 *)
    (*#################################################################*)
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

(*Retourne un type personnage en fonction de la race renseigné.*)
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

(*Attend une réponse de la part de l'utilisateur.*)
function jeVeuxUneReponse() : String;
var
  rep : String;
begin
  ReadLn(rep);
  jeVeuxUneReponse:=rep;
end;



(*Affiche le texte de demande du pseudo du personnage.*)
procedure affTexteDemandeNomPersMCP();
begin
  centrerTexte('Comment veux-tu qu''on t''appelle ?', 15, 100);
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
  centrerTexte('1/ Altmer', 25, 100);
  centrerTexte('2/ Argonien', 26, 100);
  centrerTexte('3/ Bosmer', 27, 100);
  centrerTexte('4/ Breton', 28, 100);
  centrerTexte('5/ Dunmer', 29, 100);
  centrerTexte('6/ Imperial', 30, 100);
  centrerTexte('7/ Khajit', 31, 100);
  centrerTexte('8/ Nordique', 32, 100);
  centrerTexte('9/ Orsimer', 33, 100);
  centrerTexte('10/ Rougegarde', 34, 100);
end;

(*Retourne la race que le joueur désire utiliser.*)
function choixRaceMCP() : Integer;
var
  rep : String;
  A, B, C, D, R, S : Boolean;

begin
  repeat
    centrerTexte('De quelle race est-tu ?', 36, 100);
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
    centrerTexte('Es-tu prêt à commencer la partie ? (oui/non)', 45, 100);
    centrerTexte('', 46, 100);
    rep := jeVeuxUneReponse();
  until (rep <> 'oui') OR (rep <> 'non');

  if rep = 'oui' then
    res := FALSE
  else
    res := TRUE;

  confirmationMCP := res;
end;



(*Initialise le nom des races dans la liste des races*)
procedure initRace(var r : TypeRace);
begin
  r[1] := 'Altmer';
  r[2] := 'Argonien';
  r[3] :=  'Bosmer';
  r[4] :=  'Breton';
  r[5] :=  'Dunmer';
  r[6] :=  'Imperial';
  r[7] :=  'Khajit';
  r[8] :=  'Nordique';
  r[9] :=  'Orsimer';
  r[10] :=  'Rougegarde';
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
end;

end.


