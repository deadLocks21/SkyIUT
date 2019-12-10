program main;

{$codepage utf8}

uses unitEcran, unitAffichage, typesDuJeu;


var
  hamadi : Boolean;  // Pas boolean juste boulet.
  qF : String;  // Variable qui permet de récupérer ce que veut faire l'utilisateur.
  ctn : Boolean;  // Variable booléene qui fait tourner la boule principale de jeu.
  joueur : Personnage;



begin
  affMenuInitiale(qF);

  if qF = 'exit' then ctn := False;
  if qF = 'n' then affMenuCreationPersonnage(joueur);

end.

