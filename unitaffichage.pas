unit unitAffichage;

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

uses unitEcran, unitMenuInitiale, unitMenuCreationPersonnage, unitMenuJeu, typesDuJeu, sysutils;



    (*#################################################################*)
    (*                                                                 *)
    (*  ####  #  #  #  #   ##   #####      #  ####  ###    ###    ##   *)
    (*  #     #  #  ## #  #  #    #       #   #  #  #  #  #  #   #  #  *)
    (*  ###   #  #  # ##  #       #      #    ###   #  #  #  #   #     *)
    (*  #     #  #  #  #  #  #    #     #     #     ###   #  #   #  #  *)
    (*  #      ##   #  #   ##     #    #      #     #  #   ##     ##   *)
    (*                                                                 *)
    (*#################################################################*)

{Initialise la taille et le cadre de la console}
procedure initConsole();

(*Attend une réponse de la part de l'utilisateur.*)
function jeVeuxUneReponse() : String;

(*Affiche un texte sur plusieurs ligne si nécessaire.*)
procedure affTexte(t : String);




(*Procedure qui modifie qF en fonction du choix de l'utilisateur, soit il ferme le jeu, soit il démare une nouvelle partie.*)
procedure affMenuInitiale(var qF : String);

(*Procedure qui modifie qF en fonction du choix de l'utilisateur, soit il ferme le jeu, soit il démare une nouvelle partie.*)
procedure affMenuCreationPersonnage(var joueur : Personnage);

(*Procedure qui affiche la fenetre de jeu principale.*)
procedure affMenuJeu(var p : Personnage);




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

{Initialise la taille et le cadre de la console}
procedure initConsole();
begin
  changerTailleConsole(200, 60);
  effacerEcran;
  dessinerCadreXY(2,1,196,58,double,15,0);
end;

(*Attend une réponse de la part de l'utilisateur.*)
function jeVeuxUneReponse() : String;
var
  rep : String;
begin
  ReadLn(rep);
  jeVeuxUneReponse:=rep;
end;

(*Affiche un texte sur plusieurs ligne si nécessaire.*)
procedure affTexte(t : String);
var
  i, len, y, e, f, n, c : Integer;
  pos : coordonnees;
  ch : String;

begin
  t := t + ' ';
  len := Length(t);
  i := 0;
  y := 13;
  n := 190;

  //Write('i=',IntToStr(i), '  len=',IntToStr(len));
  //Write(i <> len);
  changerLigneCurseur(13);
  changerColonneCurseur(4);

  while (i <> len) do
    begin
      i := i + 1;
      f := i + n;
      c := i;
      ch := '';

      while ((c <> f) AND (c <> len + 1)) do
        begin
          ch := ch + t[c];
          c := c + 1;
        end;

       c := c - 1;

      while t[c] <> ' ' do
        begin
          c := c - 1;
        end;

      ch := '';

      for e := i to c do
        begin
          Sleep(10);
          Write(t[e]);
          //ch := ch + t[e];
        end;

      i := c;


      y := y + 1;
      changerLigneCurseur(y);
      changerColonneCurseur(4);
      //pos.x := 4;
      //pos.y := y;
      //ecrireEnPosition(pos, ch);
    end;
end;




(*Procedure qui modifie qF en fonction du choix de l'utilisateur, soit il ferme le jeu, soit il démare une nouvelle partie.*)
procedure affMenuInitiale(var qF : String);
var
  rep : String;  // Variable qui vaut n ou k pour respectivement créer une nouvelle partie ou killer le jeu.

begin
  initConsole();

  affichageTextesMI();

  repeat
    centrerTexte('                  ', 49, 100);
    centrerTexte('', 49, 100);
    rep := jeVeuxUneReponse();
  until (rep = '1') OR (rep = '2');

  if rep = '1' then rep := 'n';
  if rep = '2' then rep := 'exit';

  qF := rep;
end;

(*Procedure qui modifie qF en fonction du choix de l'utilisateur, soit il ferme le jeu, soit il démare une nouvelle partie.*)
procedure affMenuCreationPersonnage(var joueur : Personnage);
var
  ctn : Boolean;
  nom : String;
  race : Integer;

begin
  ctn := True;

  while ctn do
    begin
      initConsole();

      // Demande du nom du joueur
      affTexteDemandeNomPersMCP;
      nom :=jeVeuxUneReponse();

      centrerPseudoMCP(nom);

      // Affiche les races
      affRacesMCP;

      // Vérifie et donne la race que l'utilisateur désire.
      race := choixRaceMCP();

      ctn := confirmationMCP();
    end;

  creerPersonnage(joueur, nom, race);
end;

(*Procedure qui affiche la fenetre de jeu principale.*)
procedure affMenuJeu(var p : Personnage);
begin
  initConsole();
  initCadreHautMJ(p);
  initCadreBasMJ();
  //affTexte('abc abc abc');

  affTexte('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam scelerisque risus eget enim porttitor, quis mattis tellus luctus. Mauris a justo sed sem congue pretium vitae quis elit. Curabitur tincidunt ultricies mattis. Ut lectus dui, accumsan at commodo sed, finibus quis erat. Pellentesque volutpat nibh orci, non ultrices turpis finibus lobortis. Praesent eget justo vel erat finibus maximus et et elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla malesuada fringilla efficitur. ');

  ReadLn()
end;

end.

