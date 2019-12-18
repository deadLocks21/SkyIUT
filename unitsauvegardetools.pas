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

(*Prend le fichier de sauvegarde et créer un personnage avec.*)
procedure lireSaveJ(var p : Personnage);



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
  vA, vM : String;

begin
  path := 'save.txt';
  assign(fC, path);

  Rewrite(fC);

  WriteLn(fC, 'Pseudo : ' + p.nom);
  WriteLn(fC, 'Race : ' + p.race);

  vA := IntToStr(p.vie.actuelle);
  vM := IntToStr(p.vie.max);
  if Length(vA) = 1 then vA := '00' + vA;
  if Length(vA) = 2 then vA := '0' + vA;

  if Length(vM) = 1 then vM := '00' + vM;
  if Length(vM) = 2 then vM := '0' + vM;

  WriteLn(fC, 'Vie : ' + vA + '/' + vM);

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

  lireSaveJ(p);

end;

(*Prend le fichier de sauvegarde et créer un personnage avec.*)
procedure lireSaveJ(var p : Personnage);
var
  fC : text;
  path, ligne, res : String;
  i : Integer;
  test : text;

begin
  path := 'save.txt';
  Assign(fC, path);
  assign(test, 'unF.txt');

  Reset(fC);
  Rewrite(test);

  // Récupération du pseudo.
  ReadLn(fC, ligne);
  res := '';
  for i := 10 to Length(ligne) do res := res + ligne[i];
  p.nom:=res;

  // Récupération du pseudo.
  ReadLn(fC, ligne);
  res := '';
  for i := 8 to Length(ligne) do res := res + ligne[i];
  p.race:=res;

  // Vie
  // Récupération vie.
  ReadLn(fC, ligne);
  res := ligne[7..9];
  p.vie.actuelle:=StrToInt(res);

  res := ligne[11..13];
  p.vie.actuelle:=StrToInt(res);

  // Récupération des golds
  ReadLn(fC, ligne);
  res := '';
  for i := 8 to Length(ligne) do res := res + ligne[i];
  p.gold:=StrToInt(res);

  // Récupération de la quete
  ReadLn(fC, ligne);
  p.quete:=StrToInt(ligne[9]);

  // Récupération du lieu
  ReadLn(fC, ligne);
  p.lieu:=ligne[8];

  // Récupération date
  ReadLn(fC, ligne);
  res := ligne[8..9];
  p.dateAjh.heure:=StrToInt(res);

  res := ligne[11..12];
  p.dateAjh.minute:=StrToInt(res);

  res := ligne[14..15];
  p.dateAjh.jour:=StrToInt(res);

  res := ligne[17..18];
  p.dateAjh.mois:=StrToInt(res);

  res := ligne[20..22];
  p.dateAjh.annee:=StrToInt(res);
  p.dateAjh.ere:='4E';

  ReadLn(fC);
  ReadLn(fC);

  // Récupération de l'item 1
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[1] := res;

   // Récupération de l'item 2
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[2] := res;

   // Récupération de l'item 3
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[3] := res;

   // Récupération de l'item 4
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[4] := res;

   // Récupération de l'item 5
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[5] := res;

   // Récupération de l'item 6
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[6] := res;

   // Récupération de l'item 7
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[7] := res;

   // Récupération de l'item 8
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[8] := res;

   // Récupération de l'item 9
  ReadLn(fC, ligne);
  res := '';
  for i := 4 to Length(ligne) do res := res + ligne[i];
  p.inv[9] := res;

   // Récupération de l'item 10
  ReadLn(fC, ligne);
  res := '';
  for i := 5 to Length(ligne) do res := res + ligne[i];
  p.inv[10] := res;

   // Récupération de l'item 11
  ReadLn(fC, ligne);
  res := '';
  for i := 5 to Length(ligne) do res := res + ligne[i];
  p.inv[11] := res;

   // Récupération de l'item 12
  ReadLn(fC, ligne);
  res := '';
  for i := 5 to Length(ligne) do res := res + ligne[i];
  p.inv[12] := res;

  ReadLn(fC);
  ReadLn(fC);

  // Récupération de l'équipement arme
  ReadLn(fC, ligne);
  res := '';
  for i := 8 to Length(ligne) do res := res + ligne[i];
  p.equip[arme] := res;

  // Récupération de l'équipement casque
  ReadLn(fC, ligne);
  res := '';
  for i := 10 to Length(ligne) do res := res + ligne[i];
  p.equip[casque] := res;

  // Récupération de l'équipement plastron
  ReadLn(fC, ligne);
  res := '';
  for i := 12 to Length(ligne) do res := res + ligne[i];
  p.equip[plastron] := res;



  Write(test, res);

  Close(test);
  Close(fC);
end;

end.


