unit unitDate;

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
uses unitEcran, typesDuJeu;

(*Initialise la date quand un joueur débute dans le jeu.*)
procedure initDate(var p : Personnage);

(*Avance le jeu d'un mois*)
procedure avancerMois(var p : Personnage);

(*Avance le jeu d'un jour*)
procedure avancerJour(var p : Personnage);

(*Avance le jeu d'une heure*)
procedure avancerHeure(var p : Personnage);

(*Avance le temps du jeu de nbrMin*)
procedure avancerMinutes(var p : Personnage; nbrMin : Integer);



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

(*Initialise la date quand un joueur débute dans le jeu.*)
procedure initDate(var p : Personnage);
var
  laDate : Date;

begin
  laDate.ere:='4E';
  laDate.annee:=201;
  laDate.mois:=5;
  laDate.jour:=23;
  laDate.heure:=6;
  laDate.minute:=0;

  p.dateAjh := laDate;
end;

(*Avance le jeu d'un mois*)
procedure avancerMois(var p : Personnage);
begin
  if (p.dateAjh.mois = 12) then
    begin
      p.dateAjh.mois := 1;
      p.dateAjh.annee := p.dateAjh.annee + 1;
      ReadLn();
    end
  else
    p.dateAjh.mois := p.dateAjh.mois + 1;

end;

(*Avance le jeu d'un jour*)
procedure avancerJour(var p : Personnage);
var
  m : Integer;

begin
  m := p.dateAjh.mois;

  // Vérifie si on est le dernier jour du mois en prenant en compte le nombre de jour dans un mois.
  if ((((m = 1) OR (m = 3) OR (m = 5) OR (m = 5) OR (m = 7) OR (m = 8) OR (m = 10) OR (m = 12)) AND (p.dateAjh.jour = 31)) OR (((m = 4) OR (m = 6) OR (m = 9) OR (m = 11)) AND (p.dateAjh.jour = 30)) OR ((m=2) AND (p.dateAjh.jour = 28))) then
    begin
      p.dateAjh.jour:=1;
      avancerMois(p);
      ReadLn;
    end
  else
    p.dateAjh.jour := p.dateAjh.jour + 1;
end;

(*Avance le jeu d'une heure*)
procedure avancerHeure(var p : Personnage);
begin
  if p.dateAjh.heure = 23 then
    begin
      p.dateAjh.heure:=0;
      avancerJour(p);
    end
  else
    p.dateAjh.heure := p.dateAjh.heure+ 1;
end;

(*Avance le temps du jeu de nbrMin*)
procedure avancerMinutes(var p : Personnage; nbrMin : Integer);
begin
  p.dateAjh.minute := p.dateAjh.minute + nbrMin;

  if p.dateAjh.minute > 59 then
    begin
      p.dateAjh.minute := p.dateAjh.minute - 60;
      avancerHeure(p);
    end;
end;

end.

