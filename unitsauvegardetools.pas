unit unitSauvegardeTools;

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

uses typesDuJeu, sysutils;

    (*#################################################################*)
    (*                                                                 *)
    (*  ####  #  #  #  #   ##   #####      #  ####  ###    ###    ##   *)
    (*  #     #  #  ## #  #  #    #       #   #  #  #  #  #  #   #  #  *)
    (*  ###   #  #  # ##  #       #      #    ###   #  #  #  #   #     *)
    (*  #     #  #  #  #  #  #    #     #     #     ###   #  #   #  #  *)
    (*  #      ##   #  #   ##     #    #      #     #  #   ##     ##   *)
    (*                                                                 *)
    (*#################################################################*)

(*Prend en paramètre le joueur à sauvegarder et crée le fichier contenant les infos.*)
procedure saveJ(p : Personnage);



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

(*Prend en paramètre le joueur à sauvegarder et crée le fichier contenant les infos.*)
procedure saveJ(p : Personnage);
var
  fC : text;
  path : String;
  laDate : String;

begin
  path := 'saves/' + p.nom + '.txt';
  assign(fC, path);

  Rewrite(fC);

  WriteLn(fC, 'Pseudo : ' + p.nom);
  WriteLn(fC, 'Race : ' + p.race);
  WriteLn(fC, 'Vie : ' + IntToStr(p.vie.actuelle) + '/' + IntToStr(p.vie.max));
  WriteLn(fC, 'Gold : ' + IntToStr(p.gold));
  WriteLn(fC, 'Quete : ' + IntToStr(p.quete));
  WriteLn(fC, 'Lieu : ' + p.lieu);

  if p.dateAjh.heure < 10 then laDate := '0' + IntToStr(p.dateAjh.heure)
  else laDate := IntToStr(p.dateAjh.heure);

  laDate := laDate + ':';

  if p.dateAjh.minute < 10 then laDate := laDate + '0' + IntToStr(p.dateAjh.minute)
  else laDate := laDate + IntToStr(p.dateAjh.minute);

  laDate := laDate + ' ';

  if p.dateAjh.jour < 10 then laDate := laDate + '0' + IntToStr(p.dateAjh.jour)
  else laDate := laDate + IntToStr(p.dateAjh.jour);

  laDate := laDate + '/';

  if p.dateAjh.mois < 10 then laDate := laDate + '0' + IntToStr(p.dateAjh.mois)
  else laDate := laDate + IntToStr(p.dateAjh.mois);

  laDate := laDate + '/' + IntToStr(p.dateAjh.annee);

  WriteLn(fC, 'Date : ' + laDate);
  WriteLn(fC);
  WriteLn(fC, 'Inventaire');
  WriteLn(fC, '#1 ' + p.inv[1]);
  WriteLn(fC, '#2 ' + p.inv[2]);
  WriteLn(fC, '#3 ' + p.inv[3]);
  WriteLn(fC, '#4 ' + p.inv[4]);
  WriteLn(fC, '#5 ' + p.inv[5]);
  WriteLn(fC, '#6 ' + p.inv[6]);
  WriteLn(fC, '#7 ' + p.inv[7]);
  WriteLn(fC, '#8 ' + p.inv[8]);
  WriteLn(fC, '#9 ' + p.inv[9]);
  WriteLn(fC, '#10 ' + p.inv[10]);
  WriteLn(fC, '#11 ' + p.inv[11]);
  WriteLn(fC, '#12 ' + p.inv[12]);
  WriteLn(fC);
  WriteLn(fC, 'Equipement');
  WriteLn(fC, 'Arme : ' + p.equip[arme]);
  WriteLn(fC, 'Casque : ' + p.equip[casque]);
  WriteLn(fC, 'Plastron : ' + p.equip[plastron]);




  Close(fC);

end;

end.


