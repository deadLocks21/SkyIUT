program main;

{$codepage utf8}

uses unitEcran, unitAffichage, typesDuJeu, unitMenuCreationPersonnage,
  unitMenuQuete, unitMenuInventaire;


var
  hamadi : Boolean;  // Pas boolean juste boulet.
  qF : String;  // Variable qui permet de récupérer ce que veut faire l'utilisateur.
  ctn : Boolean;  // Variable booléene qui fait tourner la boule principale de jeu.
  joueur : Personnage;



begin
  ctn := True;
  {affMenuInitiale(qF);

  if qF = 'exit' then ctn := False;
  if qF = 'n' then affMenuCreationPersonnage(joueur);}

  creerPersonnage(joueur, 'deadLocks21', 1);

  while ctn do
    begin
      affMenuJeu(joueur, qF);

      case qF of
        'Inventaire' : affMenuInv(joueur, qF);
        'Quete' : affMenuQuete(joueur, qF);
        'Magasin' : affMenuMag(joueur, qF);
        'Mourrir' : ctn := False;
      end;

      if qF = 'exit' then ctn := False;
    end;
end.

