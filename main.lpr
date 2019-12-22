program main;

{$codepage utf8}

uses unitEcran, unitAffichage, typesDuJeu, unitMenuCreationPersonnage,
  unitMenuQuete, unitMenuInventaire, unitDate, sysutils, unitSauvegardeTools,
  unitCombat, unitLang;


var
  hamadi : Boolean;  // Pas boolean juste boulet.
  qF : String;  // Variable qui permet de récupérer ce que veut faire l'utilisateur.
  ctn : Boolean;  // Variable booléene qui fait tourner la boule principale de jeu.
  joueur : Personnage;

begin
  changerTailleConsole(200, 60);
  effacerEcran;

  affEcranDem();

  ctn := True;
  affMenuInitiale(qF);

  if qF = 'exit' then ctn := False;
  if qF = 'n' then affMenuCreationPersonnage(joueur);
  if qF = 'r' then lireSaveJ(joueur);

  while ctn do
    begin
      affMenuJeu(joueur, qF);

      case qF of
        'Inventaire' : affMenuInv(joueur, qF);
        'Quete' : affMenuQuete(joueur, qF);
        'Magasin' : affMenuMag(joueur, qF);
        'MourrirFleche' : affMortFuite(ctn);
        'MourrirCombat' : affMort(ctn);
      end;

      if qF = 'exit' then ctn := False;
    end;
end.

