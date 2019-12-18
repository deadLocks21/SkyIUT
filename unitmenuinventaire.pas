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
function recupTUMInv(l : Integer) : String;

(*Procédure qui affiche le cadre du haut du menu de quête.*)
procedure initCadreHautMInv(p : Personnage);

(*Procedure qui affiche le cadre du bas du menu Quête*)
procedure initCadreBasMInv();

(*Affiche les items de l'inventaire du joueur.*)
procedure affLInventaire(p : Personnage);

(*Affiche l'équipement du joueur*)
procedure affLEquipement(p : Personnage);

(*Permet d'utiliser une potion ou d'afficher un message le cas échénant.*)
procedure utiliserUnePotion(var p : Personnage);

(*Passe en paramètre un objet de l'inventaire et l'équipe si possible.*)
procedure equiper(var p : Personnage; r : String);

(*Enlève un objet obj de l'inventaire*)
procedure enleverObjet(var p : personnage; obj : String);

(*Retourne TRUE si une potion est présente dans l'inventaire.*)
function presencePotion(p : Personnage) : Boolean;

(*Retourne TRUE si jamais l'inventaire n'est pas vide*)
function placeInventaire(p : Personnage):Boolean;

(*Ajoute un objet dans l'inventaire.*)
procedure ajouterObjet(var p : Personnage; obj : String);

(*Enlève un équipement s'il n'est pas présent dans l'inventaire*)
procedure enleverEquipement(var p : Personnage);

(*Initialiser les armureries*)
procedure initArmurerie(var armur : Armurerie);

(*Initialisation graphique entière de cette scène.*)
procedure initAffMInv(pe : Personnage);

(*Tente d'équiper une armure ou une arme sur un joueur.*)
procedure tenterDEquiperLeJoueur(var p : Personnage;rep : String);

(*Affiche équipement manière centrée*)
procedure affInvCentre(p : Personnage);

(*Affiche les armes et leurs prix*)
procedure affArmes(arm : Armurerie);

(*Affiche les armures et leurs prix*)
procedure affArmures(arm : Armurerie);

(*Affiche la potion et son prix*)
procedure affPrixPotion();

(*Initialise la partie en bas du menu magasin*)
procedure initCadreBasMMag();

(*Initialise les graphiques du magasin.*)
procedure initAffMag(p : Personnage);

(*Retourne le prix d'un objet de l'inventaire du joueur*)
function trouverPrixObj(p : Personnage; cb : Integer) : Integer;






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
function recupTUMInv(l : Integer) : String;
begin
  recupTUMInv := ligneDUnFichierTexte('unitMenuInventaire.txt', l);
end;

(*Procédure qui affiche le cadre du haut du menu de quête.*)
procedure initCadreHautMInv(p : Personnage);
begin
  dessinerCadreXY(2, 1, 196, 11, double,15,0);
  changerColonneCurseur(95);
  changerLigneCurseur(3);
  centrerTexte(p.nom, 3, 100);
  centrerTexte(recupTUMInv(1) + p.race, 5, 100);
  centrerTexte(recupTUMInv(2) + IntToStr(p.vie.actuelle) + '/' + IntToStr(p.vie.max), 7, 100);
  centrerTexte(recupTUMInv(3) + IntToStr(p.gold), 9, 100);
end;

(*Procedure qui affiche le cadre du bas du menu Quête*)
procedure initCadreBasMInv();
begin
  dessinerCadreXY(2, 49, 196, 58, double,15,0);
  dessinerCadreXY(2, 53, 196, 58, double,15,0);


  changerLigneCurseur(55);
  changerColonneCurseur(10);
  Write('>>> ', recupTUMInv(4));

  centrerTexte(recupTUMInv(5), 51, 66);
  centrerTexte(recupTUMInv(6), 51, 133);
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
    centrerTexte(recupTUMInv(7) , 30, 165)
  else
    centrerTexte(recupTUMInv(8) + p.equip[arme] , 30, 165);

  if p.equip[casque] = '' then
    centrerTexte(recupTUMInv(9) , 33, 165)
  else
    centrerTexte(recupTUMInv(10) + p.equip[casque] , 33, 165);

  if p.equip[plastron] = '' then
    centrerTexte(recupTUMInv(11) , 36, 165)
  else
    centrerTexte(recupTUMInv(12) + p.equip[plastron] , 36, 165);
end;

(*Permet d'utiliser une potion ou d'afficher un message le cas échénant.*)
procedure utiliserUnePotion(var p : Personnage);
begin
  if presencePotion(p) = False then
    centrerTexte(recupTUMInv(13), 48, 100)
  else
    begin
      if p.vie.actuelle = p.vie.max then
        centrerTexte(recupTUMInv(14), 48, 100)
      else
        begin
          p.vie.actuelle := p.vie.actuelle + 20;
          enleverObjet(p, recupTUMInv(15));

          if p.vie.actuelle > p.vie.max then p.vie.actuelle := p.vie.max;

          initAffMInv(p);

          centrerTexte(recupTUMInv(16), 48, 100)
        end;
    end;
end;

(*Passe en paramètre un objet de l'inventaire et l'équipe si possible.*)
procedure equiper(var p : Personnage; r : String);
var
  Armur : Armurerie;
  i:Integer;
  nom : String;
begin
  initArmurerie(Armur);

  nom := p.inv[StrToInt(r)];

  centrerTexte('                    ' + nom + recupTUMInv(17), 48, 100);

  for i:=0 to (length(Armur)-1) do
    begin
      if nom = Armur[i].nom then
         begin
           p.equip[Armur[i].typeE]:= nom;
         end;
    end;
end;

(*Enlève un objet obj de l'inventaire*)
procedure enleverObjet(var p : personnage; obj : String);
var
i, e, j: Integer;
begin
  for i :=1 to 12 do
    begin
      if p.inv[i] = obj then e := i;
    end;

  for j:= e to length(p.inv) do
    begin
      if j=12 then
        p.inv[j]:=''
      else
        p.inv[j] := p.inv[j+1];
    end;
end;

(*Retourne TRUE si une potion est présente dans l'inventaire.*)
function presencePotion(p : Personnage) : Boolean;
var
  rep : Boolean;
  i : Integer;
begin
  rep := False;

  for i:=1 to 12 do
      if p.inv[i] = recupTUMInv(15) then rep := True;

  presencePotion := rep;
end;

(*Retourne TRUE si jamais l'inventaire n'est pas vide*)
function placeInventaire(p : Personnage):Boolean;
var
  i: Integer;
  res:Boolean;
begin
  res:=FALSE;

  for i:=1 to 12 do
    begin
      if p.inv[i]='' then
        res:=TRUE;
    end;
  placeInventaire:=res;
end;

(*Ajoute un objet dans l'inventaire.*)
procedure ajouterObjet(var p : Personnage; obj : String);
var
  i, place : Integer;

begin
  for i:=12 downto 1 do
    if p.inv[i] = '' then place := i;

  p.inv[place] := obj;
end;

(*Enlève un équipement s'il n'est pas présent dans l'inventaire*)
procedure enleverEquipement(var p : Personnage);
var
  i : TypeNomEquipement;
  j : Integer;
  present : Boolean;

begin
  for i:=arme to plastron  do
    begin
      present := False;

      for j := 1 to 12 do
        begin
          if p.equip[i] = p.inv[j] then present:=True;
        end;

      if present = False then p.equip[i] := '';
    end;
end;

(*Initialiser les armureries*)
procedure initArmurerie(var armur : Armurerie);
var
  arm : Armurerie;
  obj : TypeEquipement;
begin
  //SetLength(arm, 18);

  obj.nom := recupTUMInv(18);
  obj.typeE := arme;
  obj.effet:=10;
  obj.prix:=150;
  arm[0] := obj;

  obj.nom := recupTUMInv(19);
  obj.typeE := arme;
  obj.effet:=12;
  obj.prix:=200;
  arm[1] := obj;

  obj.nom := recupTUMInv(20);
  obj.typeE := arme;
  obj.effet:=13;
  obj.prix:=220;
  arm[2] := obj;

  obj.nom := recupTUMInv(21);
  obj.typeE := arme;
  obj.effet:=11;
  obj.prix:=170;
  arm[3] := obj;

  obj.nom := recupTUMInv(22);
  obj.typeE := arme;
  obj.effet:=22;
  obj.prix:=450;
  arm[4] := obj;

  obj.nom := recupTUMInv(23);
  obj.typeE := arme;
  obj.effet:=25;
  obj.prix:=500;
  arm[5] := obj;

  obj.nom := recupTUMInv(24);
  obj.typeE := arme;
  obj.effet:=26;
  obj.prix:=520;
  arm[6] := obj;

  obj.nom := recupTUMInv(25);
  obj.typeE := arme;
  obj.effet:=23;
  obj.prix:=470;
  arm[7] := obj;

  obj.nom := recupTUMInv(26);
  obj.typeE := arme;
  obj.effet:=40;
  obj.prix:=900;
  arm[8] := obj;

  obj.nom := recupTUMInv(27);
  obj.typeE := arme;
  obj.effet:=45;
  obj.prix:=1000;
  arm[9] := obj;

  obj.nom := recupTUMInv(28);
  obj.typeE := arme;
  obj.effet:=46;
  obj.prix:=1100;
  arm[10] := obj;

  obj.nom := recupTUMInv(29);
  obj.typeE := arme;
  obj.effet:=43;
  obj.prix:=950;
  arm[11] := obj;

  obj.nom :=recupTUMInv(30);
  obj.typeE := casque;
  obj.effet:= 2;
  obj.prix:=100;
  arm[12] := obj;

  obj.nom :=recupTUMInv(31);
  obj.typeE := plastron;
  obj.effet:= 2;
  obj.prix:=100;
  arm[13] := obj;

  obj.nom :=recupTUMInv(32);
  obj.typeE := casque;
  obj.effet:= 5;
  obj.prix:=200;
  arm[14] := obj;

  obj.nom :=recupTUMInv(33);
  obj.typeE := plastron;
  obj.effet:= 5;
  obj.prix:=200;
  arm[15] := obj;

  obj.nom :=recupTUMInv(34);
  obj.typeE := casque;
  obj.effet:= 10;
  obj.prix:=375;
  arm[16] := obj;

  obj.nom :=recupTUMInv(35);
  obj.typeE := plastron;
  obj.effet:= 10;
  obj.prix:=375;
  arm[17] := obj;

  obj.nom :=recupTUMInv(15);
  obj.typeE := potion;
  obj.effet:= 20;
  obj.prix:=50;
  arm[18] := obj;

  armur := arm;
end;

(*Initialisation graphique entière de cette scène.*)
procedure initAffMInv(pe : Personnage);
var
  pos : coordonnees;
begin
  changerTailleConsole(200, 60);
  effacerEcran;
  dessinerCadreXY(2,1,196,58,double,15,0);

  initCadreHautMInv(pe);



  dessinerCadreXY(5,20,62,46,simple,15,0);
  dessinerCadreXY(85,15,115,17,simple,0,15);
  dessinerCadreXY(136,20,193,46,simple,15,0);
  couleurs(0,15);
  centrerTexte(recupTUMInv(36),16, 100);
  couleurs(15,0);

  pos.x:=8;
  pos.y:=20;
  ecrireEnPosition(pos,recupTUMInv(37));
  pos.x:=139;
  pos.y:=20;
  ecrireEnPosition(pos,recupTUMInv(38));

  affLInventaire(pe);
  affLEquipement(pe);


  initCadreBasMInv();

  dessinerTexte('artInv.txt', 20);
end;

(*Tente d'équiper une armure ou une arme sur un joueur.*)
procedure tenterDEquiperLeJoueur(var p : Personnage;rep : String);
begin
  if Length(rep)=3 then rep:=rep[3];
  if Length(rep)=4 then rep:=rep[3] + rep[4];

  if (p.inv[StrToInt(rep)] <> '') then
    begin
      if p.inv[StrToInt(rep)] <> recupTUMInv(15) then
        begin
          equiper(p, rep);
          affLEquipement(p);

          initAffMInv(p);
          centrerTexte(recupTUMInv(39), 48, 100);

        end
      else
        centrerTexte(recupTUMInv(40), 48, 100);
    end
  else
    centrerTexte(recupTUMInv(41), 48, 100);
end;

(*Affiche équipement manière centrée*)
procedure affInvCentre(p : Personnage);
begin

  if p.inv[1] <> '' then centrerTexte('1/ ' + p.inv[1], 22, 100);
  if p.inv[2] <> '' then centrerTexte('2/ ' + p.inv[2], 24, 100);
  if p.inv[3] <> '' then centrerTexte('3/ ' + p.inv[3], 26, 100);
  if p.inv[4] <> '' then centrerTexte('4/ ' + p.inv[4], 28, 100);
  if p.inv[5] <> '' then centrerTexte('5/ ' + p.inv[5], 30, 100);
  if p.inv[6] <> '' then centrerTexte('6/ ' + p.inv[6], 32, 100);
  if p.inv[7] <> '' then centrerTexte('7/ ' + p.inv[7], 34, 100);
  if p.inv[8] <> '' then centrerTexte('8/ ' + p.inv[8], 36, 100);
  if p.inv[9] <> '' then centrerTexte('9/ ' + p.inv[9], 38, 100);
  if p.inv[10] <> '' then centrerTexte('10/ ' + p.inv[10], 40, 100);
  if p.inv[11] <> '' then centrerTexte('11/ ' + p.inv[11], 42, 100);
  if p.inv[12] <> '' then centrerTexte('12/ ' + p.inv[12], 44, 100);

end;

(*Affiche les armes et leurs prix*)
procedure affArmes(arm : Armurerie);
begin
  centrerTexte('1/ '+arm[0].nom +' ('+IntToStr(arm[0].prix)+')', 22, 35);
  centrerTexte('2/ '+arm[1].nom +' ('+IntToStr(arm[1].prix)+')', 24, 35);
  centrerTexte('3/ '+arm[2].nom +' ('+IntToStr(arm[2].prix)+')', 26, 35);
  centrerTexte('4/ '+arm[3].nom +' ('+IntToStr(arm[3].prix)+')', 28, 35);
  centrerTexte('5/ '+arm[4].nom +' ('+IntToStr(arm[4].prix)+')', 30, 35);
  centrerTexte('6/ '+arm[5].nom +' ('+IntToStr(arm[5].prix)+')', 32, 35);
  centrerTexte('7/ '+arm[6].nom +' ('+IntToStr(arm[6].prix)+')', 34, 35);
  centrerTexte('8/ '+arm[7].nom +' ('+IntToStr(arm[7].prix)+')', 36, 35);
  centrerTexte('9/ '+arm[8].nom +' ('+IntToStr(arm[8].prix)+')', 38, 35);
  centrerTexte('10/ '+arm[9].nom +' ('+IntToStr(arm[9].prix)+')', 40, 35);
  centrerTexte('11/ '+arm[10].nom +' ('+IntToStr(arm[10].prix)+')', 42, 35);
  centrerTexte('12/ '+arm[11].nom +' ('+IntToStr(arm[11].prix)+')', 44, 35);
end;

(*Affiche les armures et leurs prix*)
procedure affArmures(arm : Armurerie);
begin
  centrerTexte('13/ '+arm[12].nom +' ('+IntToStr(arm[12].prix)+')', 22, 165);
  centrerTexte('14/ '+arm[13].nom +' ('+IntToStr(arm[13].prix)+')', 24, 165);
  centrerTexte('15/ '+arm[14].nom +' ('+IntToStr(arm[14].prix)+')', 26, 165);
  centrerTexte('16/ '+arm[15].nom +' ('+IntToStr(arm[15].prix)+')', 28, 165);
  centrerTexte('17/ '+arm[16].nom +' ('+IntToStr(arm[16].prix)+')', 30, 165);
  centrerTexte('18/ '+arm[17].nom +' ('+IntToStr(arm[17].prix)+')', 32, 165);
end;

(*Affiche la et son prix*)
procedure affPrixPotion();
begin
  dessinerCadreXY(136,34,193,46,simple,15,0);

  changerColonneCurseur(139);
  changerLigneCurseur(34);
  Write(recupTUMInv(42));

  centrerTexte(recupTUMInv(43), 36, 165);
end;

(*Initialise la partie en bas du menu magasin*)
procedure initCadreBasMMag();
begin
  dessinerCadreXY(2, 49, 196, 58, double,15,0);
  dessinerCadreXY(2, 53, 196, 58, double,15,0);

  changerLigneCurseur(55);
  changerColonneCurseur(10);
  Write('>>> ', recupTUMInv(44));
  centrerTexte(recupTUMInv(45), 51, 100);

end;

(*Initialise les graphiques du magasin.*)
procedure initAffMag(p : Personnage);
var
  armur : Armurerie;
  pos : coordonnees;

begin
  changerTailleConsole(200, 60);
  effacerEcran;
  dessinerCadreXY(2,1,196,58,double,15,0);

  initCadreHautMInv(p);

  if (p.dateAjh.heure < 18) AND (p.dateAjh.heure > 7) then
    begin
      initArmurerie(armur);

      dessinerCadreXY(5,20,62,46,simple,15,0);
      dessinerCadreXY(85,15,112,17,simple,0,15);
      dessinerCadreXY(136,20,193,46,simple,15,0);
      dessinerCadreXY(70,20,127,46,simple,15,0);
      couleurs(0,15);
      centrerTexte(recupTUMInv(46),16, 100);
      couleurs(15,0);
      pos.x:=8;
      pos.y:=20;
      ecrireEnPosition(pos,recupTUMInv(47));
      pos.x:=139;
      pos.y:=20;
      ecrireEnPosition(pos,recupTUMInv(48));
      pos.x:=73;
      pos.y:=20;
      ecrireEnPosition(pos,recupTUMInv(49));

      affArmes(armur);
      affArmures(armur);
      affPrixPotion();

      affInvCentre(p);

      initCadreBasMMag();
    end
  else
    begin

      dessinerCadreXY(2, 49, 196, 58, double,15,0);
      dessinerCadreXY(2, 53, 196, 58, double,15,0);

      changerLigneCurseur(55);
      changerColonneCurseur(10);
      Write('>>> ', recupTUMInv(50));
      centrerTexte(recupTUMInv(45), 51, 100);

      centrerTexte(recupTUMInv(51), 15, 100);
    end;
end;

(*Retourne le prix d'un objet de l'inventaire du joueur*)
function trouverPrixObj(p : Personnage; cb : Integer) : Integer;
var
  arm : Armurerie;
  i : Integer;
begin
  initArmurerie(arm);

  for i:= 0 to 18 do
    begin
      if p.inv[cb] = arm[i].nom then
        trouverPrixObj := arm[i].prix;
    end;
end;

end.
