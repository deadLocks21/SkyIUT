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
  Write('>>> Choississez quoi faire. Pour t''équiper, utilise la commande e-x ou e-xx pour choissir le numero de ton équipement.');

  centrerTexte('a/ Utiliser potion ', 51, 66);
  centrerTexte('b/ Sortir', 51, 133);
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
    centrerTexte('Arme: null' , 30, 165)
  else
    centrerTexte('Arme: ' + p.equip[arme] , 30, 165);

  if p.equip[casque] = '' then
    centrerTexte('Casque: null' , 33, 165)
  else
    centrerTexte('Casque: ' + p.equip[casque] , 33, 165);

  if p.equip[plastron] = '' then
    centrerTexte('Plastron: null' , 36, 165)
  else
    centrerTexte('Plastron: ' + p.equip[plastron] , 36, 165);
end;

(*Permet d'utiliser une potion ou d'afficher un message le cas échénant.*)
procedure utiliserUnePotion(var p : Personnage);
begin
  if presencePotion(p) = False then
    centrerTexte('           Tu n''as pas de potion dans ton inventaire ... Tu as essayé de ma la faire à l''envers ?!           ', 48, 100)
  else
    begin
      if p.vie.actuelle = p.vie.max then
        centrerTexte('                               Que veut tu faire de cette potion tu as toute ta vie !!                               ', 48, 100)
      else
        begin
          p.vie.actuelle := p.vie.actuelle + 20;
          enleverObjet(p, 'Potion');

          if p.vie.actuelle > p.vie.max then p.vie.actuelle := p.vie.max;
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

  centrerTexte('                    ' + nom + ' est equipe.                    ', 48, 100);

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
      if p.inv[i] = 'Potion' then rep := True;

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

  obj.nom := 'Epee en fer';
  obj.typeE := arme;
  obj.effet:=10;
  obj.prix:=150;
  arm[0] := obj;

  obj.nom := 'Epee a deux mains en fer';
  obj.typeE := arme;
  obj.effet:=12;
  obj.prix:=200;
  arm[1] := obj;

  obj.nom := 'Masse en fer';
  obj.typeE := arme;
  obj.effet:=13;
  obj.prix:=220;
  arm[2] := obj;

  obj.nom := 'Hache en fer';
  obj.typeE := arme;
  obj.effet:=11;
  obj.prix:=170;
  arm[3] := obj;

  obj.nom := 'Epee elfique';
  obj.typeE := arme;
  obj.effet:=22;
  obj.prix:=450;
  arm[4] := obj;

  obj.nom := 'Epee a deux mains elfique';
  obj.typeE := arme;
  obj.effet:=25;
  obj.prix:=500;
  arm[5] := obj;

  obj.nom := 'Masse elfique';
  obj.typeE := arme;
  obj.effet:=26;
  obj.prix:=520;
  arm[6] := obj;

  obj.nom := 'Hache elfique';
  obj.typeE := arme;
  obj.effet:=23;
  obj.prix:=470;
  arm[7] := obj;

  obj.nom := 'Epee d''ebonite';
  obj.typeE := arme;
  obj.effet:=40;
  obj.prix:=900;
  arm[8] := obj;

  obj.nom := 'Epee a deux mains d''ebonite';
  obj.typeE := arme;
  obj.effet:=45;
  obj.prix:=1000;
  arm[9] := obj;

  obj.nom := 'Masse d''ebonite';
  obj.typeE := arme;
  obj.effet:=46;
  obj.prix:=1100;
  arm[10] := obj;

  obj.nom := 'Hache d''ebonite';
  obj.typeE := arme;
  obj.effet:=43;
  obj.prix:=950;
  arm[11] := obj;

  obj.nom :='Casque de fer';
  obj.typeE := casque;
  obj.effet:= 2;
  obj.prix:=100;
  arm[12] := obj;

  obj.nom :='Plastron en fer';
  obj.typeE := plastron;
  obj.effet:= 2;
  obj.prix:=100;
  arm[13] := obj;

  obj.nom :='Casque elfique';
  obj.typeE := casque;
  obj.effet:= 5;
  obj.prix:=200;
  arm[14] := obj;

  obj.nom :='Plastron elfique';
  obj.typeE := plastron;
  obj.effet:= 5;
  obj.prix:=200;
  arm[15] := obj;

  obj.nom :='Casque d''ebonite';
  obj.typeE := casque;
  obj.effet:= 10;
  obj.prix:=375;
  arm[16] := obj;

  obj.nom :='Plastron d''ebonite';
  obj.typeE := plastron;
  obj.effet:= 10;
  obj.prix:=375;
  arm[17] := obj;

  obj.nom :='Potion';
  obj.typeE := potion;
  obj.effet:= 20;
  obj.prix:=50;
  arm[18] := obj;

  armur := arm;
end;

end.
