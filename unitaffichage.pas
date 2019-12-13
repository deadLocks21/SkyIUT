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

uses unitEcran, unitMenuInitiale, unitMenuCreationPersonnage, unitMenuJeu, unitMenuQuete, unitMenuInventaire, typesDuJeu, sysutils;



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

(*Procedure qui affiche la quête actuelle*)
procedure affMenuQuete(var p : Personnage; var rep : String);

(*Procedure qui affiche le menu de inventaire.*)
procedure affMenuInv(var pe : Personnage; var rep : String);




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

  //p.lieu:='m';
  p.quete:=5;
  //p.gold:=1100;
  p.inv[1] := 'Masse d''ebonite';

  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'a') AND (p.quete = 1) then scenario1MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'a') AND (p.quete = 5) then scenario19MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'a') AND (p.quete <> 1) AND (p.quete <> 5) then scenario26MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'b') AND (p.quete = 1) then scenario2MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'b') AND (p.quete <> 1) then scenario25MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'c') AND (p.quete = 1) then scenario5MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'c') AND (p.quete = 2) then scenario6MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'c') AND (p.quete > 2) then scenario9MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'd') AND (p.quete = 1) then scenario7MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'd') AND (p.quete = 5) AND (p.gold < 1100) then scenario27MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'd') AND (((p.quete <> 1) AND ((p.quete = 5) AND (p.gold >= 1100)) OR ((p.quete <> 1) AND ((p.quete <> 5))))) then scenario8MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'e') then scenario3MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'f') AND (p.quete < 3) then scenario10MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'f') AND (p.quete > 2) then scenario11MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'g') then scenario12MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'h') then scenario13MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'i') then scenario14MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'j') AND (p.quete = 5) AND presenceMasseEbo(p) then scenario21MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'j') AND (p.quete = 5) AND not presenceMasseEbo(p) then scenario20MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'k') then scenario16MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'm') then scenario24MJ(p, rep);
  if ((rep <> 'OK') AND (rep<>'exit') AND (rep<>'Mourrir') AND (rep<>'Magasin') AND (rep<>'Quete') AND (rep<>'Inventaire')) AND (p.lieu = 'n') then scenario23MJ(p, rep);


  // ReadLn;

  //affTexte('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam scelerisque risus eget enim porttitor, quis mattis tellus luctus. Mauris a justo sed sem congue pretium vitae quis elit. Curabitur tincidunt ultricies mattis. Ut lectus dui, accumsan at commodo sed, finibus quis erat. Pellentesque volutpat nibh orci, non ultrices turpis finibus lobortis. Praesent eget justo vel erat finibus maximus et et elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla malesuada fringilla efficitur. ');

end;

(*Procedure qui affiche la quête actuelle*)
procedure affMenuQuete(var p : Personnage; var rep : String);
var
  pos : coordonnees;
  //rep : String;
begin
  initConsole();

  initCadreHautMQ(p);

  if p.quete = 1 then centrerTexte('Retrouver le Jarl de Blancherive dans le Fort Dragon', 30, 100);
  if p.quete = 2 then centrerTexte('Retrouver le Chambellan : Cavovius Dargogne', 30, 100);
  if p.quete = 3 then centrerTexte('Rejoindre la porte principale de Blancherive', 30, 100);
  if p.quete = 4 then centrerTexte('Retrouver les soldats à la Tour de Guet', 30, 100);
  if p.quete = 5 then centrerTexte('Aller a l’armurerie de Blancherive pour s’équiper de la Masse d’Ebonite', 30, 100);
  if p.quete = 6 then centrerTexte('Retourner à la Tour de Guet combattre le Dragon', 30, 100);
  if p.quete = 7 then centrerTexte('Vaincre le Dragon', 30, 100);


  initCadreBasMQ();

  repeat
    changerLigneCurseur(56);
    changerColonneCurseur(10);
    Write('>>>                                             ');
    changerColonneCurseur(14);

    rep := jeVeuxUneReponse();

  until (rep = 'a') OR (rep = 'exit');

  if rep = 'a' then rep := 'OK';
end;

(*Procedure qui affiche le menu de inventaire.*)
procedure affMenuInv(var pe : Personnage; var rep : String);
var
  pos : coordonnees;
  //rep : String;
  A, B, C, D, E, F, G, H, I, J, K, P, Q : Boolean;
begin
  initConsole();
  initCadreHautMInv(pe);



  dessinerCadreXY(5,20,62,46,simple,15,0);
  dessinerCadreXY(85,15,115,17,simple,0,15);
  dessinerCadreXY(136,20,193,46,simple,15,0);
  couleurs(0,15);
  centrerTexte('Inventaire du heros',16, 100);
  couleurs(15,0);

  pos.x:=8;
  pos.y:=20;
  ecrireEnPosition(pos,' Liste de l''inventaire ');
  pos.x:=139;
  pos.y:=20;
  ecrireEnPosition(pos,' Equipement equiper ');

  affLInventaire(pe);
  affLEquipement(pe);


  initCadreBasMInv();

  repeat
    repeat
      changerLigneCurseur(56);
      changerColonneCurseur(10);
      Write('>>>                                             ');
      changerColonneCurseur(14);

      rep := jeVeuxUneReponse();

      P := Length(rep)=3;
      Q := Length(rep)=4;
      A := rep = 'exit';
      B := rep = 'a';
      C := rep = 'b';

      if rep <> '' then
        begin
          E := rep[1] = 'e';
          F := rep[2] = '-';
          G := Ord(rep[3]) <= Ord('9');
          H := Ord(rep[3]) > Ord('0');
          I := Ord(rep[3]) = Ord('1');
          J := Ord(rep[4]) >= Ord('0');
          K := Ord(rep[4]) < Ord('3');
        end;

    until A OR B OR C OR ( E AND F AND ( (P AND G AND H) OR (Q AND I AND J AND K) ) );






  until A OR C;

  if rep = 'b' then rep := 'OK';


  //repeat
  //
  //  repeat
  //    changerLigneCurseur(56);
  //    changerColonneCurseur(10);
  //    Write('>>>                                             ');
  //    changerColonneCurseur(14);
  //
  //    rep := jeVeuxUneReponse();
  //
  //  until ((rep >= 'a') AND (rep <= 'c')) OR (rep = 'exit');
  //
  //  if rep = 'a' then rep := 'equip';  // Menu Equuiper
  //  if rep = 'c' then rep := 'OK';
  //
  //  if rep = 'b' then
  //    begin
        // OK
  //    end;
  //
  //  rep := 'Inventaire'
  //
  //until (rep='equip') OR (rep='OK') OR (rep='exit');
end;

end.
