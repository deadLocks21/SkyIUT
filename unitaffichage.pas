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

(*Vérifie si la masse d'ébonite est dans l'inventaire. Retourne TRUE si oui.*)
function presenceMasseEbo(p:personnage):Boolean;




(*Procedure qui modifie qF en fonction du choix de l'utilisateur, soit il ferme le jeu, soit il démare une nouvelle partie.*)
procedure affMenuInitiale(var qF : String);

(*Procedure qui modifie qF en fonction du choix de l'utilisateur, soit il ferme le jeu, soit il démare une nouvelle partie.*)
procedure affMenuCreationPersonnage(var joueur : Personnage);

(*Procedure qui affiche la fenetre de jeu principale.*)
procedure affMenuJeu(var p : Personnage; var rep : String);




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
procedure affMenuJeu(var p : Personnage; var rep : String);
begin
  initConsole();
  initCadreHautMJ(p);
  initCadreBasMJ();
  //affTexte('abc abc abc');
  rep := '';

  //p.lieu:='c';
  p.quete:=3;

  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'a') AND (p.quete = 1) then scenario1MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'a') AND (p.quete = 5) then scenario19MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'a') AND (p.quete <> 1) AND (p.quete <> 5) then scenario26MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'b') AND (p.quete = 1) then scenario2MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'b') AND (p.quete <> 1) then scenario25MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'c') AND (p.quete = 1) then scenario5MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'c') AND (p.quete = 2) then scenario6MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'c') AND (p.quete > 2) then scenario9MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'd') AND (p.quete = 1) then scenario7MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'd') AND (p.quete = 5) AND (p.gold < 1100) then scenario27MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'd') AND ((p.quete <> 1) OR ((p.quete = 5) AND TRUE{POSSIBLE SOUCIS ICI}) ) then scenario8MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'e') then scenario3MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'f') AND (p.quete < 3) then scenario10MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'f') AND (p.quete > 2) then scenario11MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'g') AND (p.quete = 4) then scenario12MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'h') then scenario13MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'i') then scenario14MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'j') AND (p.quete = 5) AND presenceMasseEbo(p) then scenario21MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'j') AND (p.quete = 5) AND not presenceMasseEbo(p) then scenario20MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'k') then scenario16MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'm') then scenario24MJ(p, rep);
  //if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'n') then scenario23MJ(p, rep);


  ReadLn;

  //affTexte('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam scelerisque risus eget enim porttitor, quis mattis tellus luctus. Mauris a justo sed sem congue pretium vitae quis elit. Curabitur tincidunt ultricies mattis. Ut lectus dui, accumsan at commodo sed, finibus quis erat. Pellentesque volutpat nibh orci, non ultrices turpis finibus lobortis. Praesent eget justo vel erat finibus maximus et et elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla malesuada fringilla efficitur. ');

end;

end.

