unit unitCombat;

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
uses unitEcran, typesDuJeu, sysutils, unitMenuInventaire;

(*Affiche et fait le combat entre un joueur et un ennemie à definir..*)
function combat(var p :personnage; en : Enemy) : String;

(*Retourne l'arme de type TypeEquipement que le joueur porte sur lui et le retourne.*)
function trouverArme(p : Personnage) : TypeEquipement;

(*Retourne le plastorn de type TypeEquipement que le joueur porte sur lui et le retourne.*)
function trouverPlastron(p : Personnage) : TypeEquipement;

(*Retourne le casque de type TypeEquipement que le joueur porte sur lui et le retourne.*)
function trouverCasque(p : Personnage) : TypeEquipement;

(*Retourne p ou e en fonction de qui commence. On détermine ça au hasard.*)
function quiCommence() : String;

(*Récupère ce que veux faire le joueur.*)
function queVeuxFaireLeJoueur() : String;







(*Initialise les graphiques de la fenetre de combat*)
procedure initFenetreCombat(p :personnage; en : Enemy);

(*Met a jour l'affichage des PV.*)
procedure miseAJourPv(p :personnage; en : Enemy);

(*Ne propose aucun choix au joueur ni aucune alternative.*)
procedure affBasPacifMCombat();

(*Propose au joueur de ne rien faire, d'attaquer ou d'utiliser une potion.*)
procedure affBasJoueurAttCombat();





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

(*Affiche et fait le combat entre un joueur et un ennemie à definir..*)
function combat(var p :personnage; en : Enemy) : String;
var
  arme, casque, plastron : TypeEquipement;
  ptArmure,
  y : Integer;
  po,
  tour : Boolean;
  qF,
  att : String;

begin
  arme := trouverArme(p);
  casque := trouverCasque(p);
  plastron := trouverPlastron(p);

  ptArmure := casque.effet + plastron.effet;

  y := 13;

  att := quiCommence();

  initFenetreCombat(p, en);
  centrerTexte(recupTUMInv(52) + en.nom + recupTUMInv(53) + p.nom + recupTUMInv(54), y, 100);
  y := y + 2;

  while (en.vie.actuelle > 0) AND (0 < p.vie.actuelle) do
    begin
      tour := True;

      if (att = 'e') AND (tour) then
        begin
          affBasPacifMCombat();

          if (en.degat - ptArmure) > 0 then
            begin
              p.vie.actuelle := p.vie.actuelle - (en.degat - ptArmure);
              centrerTexte(recupTUMInv(55) + IntToStr(en.degat - ptArmure) + recupTUMInv(56), y, 150);
              y := y + 2;
              miseAJourPv(p, en);
            end
          else
            begin
              centrerTexte(recupTUMInv(57), y, 150);
              y := y + 2;
            end;

          tour := False;
          att := 'p';

          changerLigneCurseur(56);
          changerColonneCurseur(10);
          Write('>>>                                             ');
          changerColonneCurseur(14);

          ReadLn();
        end;



      if (att = 'p') AND (tour) then
        begin
          affBasJoueurAttCombat();

          qF := queVeuxFaireLeJoueur();


          if qF = 'attaquer' then
            begin
              en.vie.actuelle := en.vie.actuelle - arme.effet;
              centrerTexte(recupTUMInv(58) + IntToStr(arme.effet) + recupTUMInv(56), y, 50);
              y := y + 2;
              miseAJourPv(p, en);
            end;

          if qF = 'potion' then
            begin
              po := presencePotion(p);

              if po then
                begin
                  p.vie.actuelle := p.vie.actuelle + 20;
                  enleverObjet(p, recupTUMInv(15));

                  if p.vie.actuelle > p.vie.max then p.vie.actuelle := p.vie.max;

                  centrerTexte(recupTUMInv(59) + IntToStr(20) + recupTUMInv(60), y, 50);
                  y := y + 2;
                  miseAJourPv(p, en);
                end
              else
                begin
                  centrerTexte(recupTUMInv(61), y, 50);
                  y := y + 2;
                end;
            end;

          if qF = 'rienFaire' then
            begin
              centrerTexte(recupTUMInv(62), y, 50);
              y := y + 2;
            end;

          att := 'e';
          tour := False;
        end;

    end;

  if en.vie.actuelle <= 0 then
    begin
      centrerTexte(recupTUMInv(63), y, 100);
      combat := 'OK';
    end
  else
  begin
    combat := 'MourrirCombat';
    centrerTexte(recupTUMInv(64), y, 100);
  end;

  ReadLn;

end;

(*Retourne l'arme de type TypeEquipement que le joueur porte sur lui et le retourne.*)
function trouverArme(p : Personnage) : TypeEquipement;
var
  arm : Armurerie;
  lArme : TypeEquipement;
  i : Integer;

begin
  initArmurerie(arm);

  if p.equip[arme] = '' then
    lArme.effet:=5  // Frappe eu poing
  else
    for i := 0 to 18 do if arm[i].nom = p.equip[arme] then lArme := arm[i];

  trouverArme := lArme;
end;

(*Retourne le plastorn de type TypeEquipement que le joueur porte sur lui et le retourne.*)
function trouverPlastron(p : Personnage) : TypeEquipement;
var
  arm : Armurerie;
  lePlastron : TypeEquipement;
  i : Integer;

begin
  initArmurerie(arm);

  if p.equip[plastron] = '' then
    lePlastron.effet:=0
  else
    for i := 0 to 18 do if arm[i].nom = p.equip[plastron] then lePlastron := arm[i];

  trouverPlastron := lePlastron;
end;

(*Retourne le casque de type TypeEquipement que le joueur porte sur lui et le retourne.*)
function trouverCasque(p : Personnage) : TypeEquipement;
var
  arm : Armurerie;
  leCasque : TypeEquipement;
  i : Integer;

begin
  initArmurerie(arm);

  if p.equip[casque] = '' then
    leCasque.effet:=0
  else for i := 0 to 18 do if arm[i].nom = p.equip[casque] then leCasque := arm[i];

  trouverCasque := leCasque;
end;

(*Retourne p ou e en fonction de qui commence. On détermine ça au hasard.*)
function quiCommence() : String;
var
  qui : String;
  nbr : Integer;

begin
  nbr := Random(2);

  if nbr = 0 then qui := 'e';
  if nbr = 1 then qui := 'p';


  quiCommence := qui;
end;

(*Récupère ce que veux faire le joueur.*)
function queVeuxFaireLeJoueur() : String;
var
  qF,
  rep : String;

begin
  repeat
    ReadLn(rep);

  until (rep = '1') OR (rep = '2') OR (rep = '3');

  case rep of
    '1' : qF := 'attaquer';
    '2' : qF := 'potion';
    '3' : qF := 'rienFaire';
  end;

  queVeuxFaireLeJoueur := qF;
end;






(*Initialise les graphiques de la fenetre de combat*)
procedure initFenetreCombat(p :personnage; en : Enemy);
begin
  dessinerCadreXY(2,1,196,58,double,15,0);

  dessinerCadreXY(2, 1, 196, 11, double,15,0);
  changerColonneCurseur(95);
  changerLigneCurseur(3);
  centrerTexte(p.nom, 3, 50);
  centrerTexte(recupTUMInv(1) + p.race, 5, 50);
  centrerTexte(recupTUMInv(2) + IntToStr(p.vie.actuelle) + '/' + IntToStr(p.vie.max), 7, 50);
  centrerTexte(recupTUMInv(3) + IntToStr(p.gold), 9, 50);

  centrerTexte(en.nom, 5, 150);
  centrerTexte(recupTUMInv(2) + IntToStr(en.vie.actuelle) + '/' + IntToStr(en.vie.max), 7, 150);
end;

(*Met a jour l'affichage des PV.*)
procedure miseAJourPv(p :personnage; en : Enemy);
begin
  centrerTexte('              ', 7, 50);
  centrerTexte(recupTUMInv(2) + IntToStr(p.vie.actuelle) + '/' + IntToStr(p.vie.max), 7, 50);

  centrerTexte('              ', 7, 150);
  centrerTexte(recupTUMInv(2) + IntToStr(en.vie.actuelle) + '/' + IntToStr(en.vie.max), 7, 150);
end;

(*Ne propose aucun choix au joueur ni aucune alternative.*)
procedure affBasPacifMCombat();
begin
  dessinerCadreXY(2, 49, 196, 58, double,15,0);
  dessinerCadreXY(2, 53, 196, 58, double,15,0);


  changerLigneCurseur(55);
  changerColonneCurseur(10);
  Write('>>> ', recupTUMInv(65));

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>>                                             ');
  changerColonneCurseur(14);
end;

(*Propose au joueur de ne rien faire, d'attaquer ou d'utiliser une potion.*)
procedure affBasJoueurAttCombat();
begin
  dessinerCadreXY(2, 49, 196, 58, double,15,0);
  dessinerCadreXY(2, 53, 196, 58, double,15,0);


  changerLigneCurseur(55);
  changerColonneCurseur(10);
  Write('>>> ', recupTUMInv(66));

  centrerTexte(recupTUMInv(67), 51, 50);
  centrerTexte(recupTUMInv(68), 51, 100);
  centrerTexte(recupTUMInv(69), 51, 150);

  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>>                                             ');
  changerColonneCurseur(14);
end;

end.
