unit typesDuJeu;

interface
uses unitLang;

type
  (*Liste contenant le nom des races du jeu.*)
  TypeRace = Array[1..10] of String;

  (*Type qui permet de stocker la vie en cours de jeu et la vie max d'un joueur.*)
  TypeVie = record
    actuelle : Integer;
    max : Integer;
  end;

  (*Type énuméré qui contient les differentes classes d'équipement possible.*)
  TypeNomEquipement = (arme, casque, plastron, potion);

  (*Représente les 12 slots de l'équipement du héros.*)
  Inventaire = Array[1..12] of String;

  (*Contient un objet armure et réference le nom, la défence et le prix d'une pièce d'armure.*)
  TypeEquipement = record
      nom : String;
      typeE : TypeNomEquipement;
      effet : Integer;
      prix : Integer;
    end;  // Armure du joueur

  (*Contient toutes les equipements présente dans le jeu.*)
  Armurerie = Array[0..18] of TypeEquipement;

  (*Correspond à ce que le joueur a d'équipé sur lui.*)
  Equipement = Array[arme..plastron] of String;

  (*Contient la date du moment ou le joueur joue.*)
  Date = record
    ere : String;
    annee : Integer;
    mois : Integer;
    jour : Integer;
    heure : Integer;
    minute: Integer;
  end;

  (*Type qui reprend toutes les caractéristiques d'un personnage.*)
  Personnage = record
    nom : String;
    race : String;
    vie : TypeVie;
    gold : Integer;
    inv : Inventaire;
    equip : Equipement;
    quete : Integer;
    lieu : String;
    dateAjh : Date;
  end;

  Enemy = record
    nom : String;
    vie : TypeVie;
    degat : Integer;
  end;

(*Retourne une ligne d'un fichier texte.*)
function ligneDUnFichierTexte(fichier : String; l : Integer) : String;

(*Récupère le texte pour ce fichier.*)
function recupT(l : Integer) : String;

(*Initialiser les armureries*)
procedure initArmurerie(var armur : Armurerie);




implementation
(*Retourne une ligne d'un fichier texte.*)
function ligneDUnFichierTexte(fichier : String; l : Integer) : String;
var
  path : String;
  t : text;
  i : Integer;

begin
  path := 'ressources/textes/' + recupLang() + '/' + fichier;

  Assign(t, path);
  Reset(t);

  for i := 1 to l-1 do ReadLn(t);

  ReadLn(t, ligneDUnFichierTexte)
end;

(*Récupère le texte pour ce fichier.*)
function recupT(l : Integer) : String;
begin
  recupT := ligneDUnFichierTexte('unitMenuInventaire.txt', l);
end;

(*Initialiser les armureries*)
procedure initArmurerie(var armur : Armurerie);
var
  arm : Armurerie;
  obj : TypeEquipement;

begin
  //SetLength(arm, 18);

  obj.nom := recupT(18);
  obj.typeE := arme;
  obj.effet:=10;
  obj.prix:=150;
  arm[0] := obj;

  obj.nom := recupT(19);
  obj.typeE := arme;
  obj.effet:=12;
  obj.prix:=200;
  arm[1] := obj;

  obj.nom := recupT(20);
  obj.typeE := arme;
  obj.effet:=13;
  obj.prix:=220;
  arm[2] := obj;

  obj.nom := recupT(21);
  obj.typeE := arme;
  obj.effet:=11;
  obj.prix:=170;
  arm[3] := obj;

  obj.nom := recupT(22);
  obj.typeE := arme;
  obj.effet:=22;
  obj.prix:=450;
  arm[4] := obj;

  obj.nom := recupT(23);
  obj.typeE := arme;
  obj.effet:=25;
  obj.prix:=500;
  arm[5] := obj;

  obj.nom := recupT(24);
  obj.typeE := arme;
  obj.effet:=26;
  obj.prix:=520;
  arm[6] := obj;

  obj.nom := recupT(25);
  obj.typeE := arme;
  obj.effet:=23;
  obj.prix:=470;
  arm[7] := obj;

  obj.nom := recupT(26);
  obj.typeE := arme;
  obj.effet:=40;
  obj.prix:=900;
  arm[8] := obj;

  obj.nom := recupT(27);
  obj.typeE := arme;
  obj.effet:=45;
  obj.prix:=1000;
  arm[9] := obj;

  obj.nom := recupT(28);
  obj.typeE := arme;
  obj.effet:=46;
  obj.prix:=1100;
  arm[10] := obj;

  obj.nom := recupT(29);
  obj.typeE := arme;
  obj.effet:=43;
  obj.prix:=950;
  arm[11] := obj;

  obj.nom :=recupT(30);
  obj.typeE := casque;
  obj.effet:= 2;
  obj.prix:=100;
  arm[12] := obj;

  obj.nom :=recupT(31);
  obj.typeE := plastron;
  obj.effet:= 2;
  obj.prix:=100;
  arm[13] := obj;

  obj.nom :=recupT(32);
  obj.typeE := casque;
  obj.effet:= 5;
  obj.prix:=200;
  arm[14] := obj;

  obj.nom :=recupT(33);
  obj.typeE := plastron;
  obj.effet:= 5;
  obj.prix:=200;
  arm[15] := obj;

  obj.nom :=recupT(34);
  obj.typeE := casque;
  obj.effet:= 10;
  obj.prix:=375;
  arm[16] := obj;

  obj.nom :=recupT(35);
  obj.typeE := plastron;
  obj.effet:= 10;
  obj.prix:=375;
  arm[17] := obj;

  obj.nom :=recupT(15);
  obj.typeE := potion;
  obj.effet:= 20;
  obj.prix:=50;
  arm[18] := obj;

  armur := arm;
end;

end.

