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

uses unitEcran, sysutils;



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

end.


