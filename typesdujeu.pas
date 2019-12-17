unit typesDuJeu;


interface
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




implementation

end.

