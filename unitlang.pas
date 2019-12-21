unit unitLang;

interface
(*Récupère la langue du jeu.*)
function recupLang() : String;

(*Modifie la langue du jeu.*)
procedure modifLang(l : String);


implementation
(*Récupère la langue du jeu.*)
function recupLang() : String;
var
  fC : text;
  path, res : String;

begin
  path := 'lang.txt';
  Assign(fC, path);
  Reset(fC);

  ReadLn(fC, res);

  Close(fC);

  recupLang := res;
end;

(*Modifie la langue du jeu.*)
procedure modifLang(l : String);
var
  fC : text;
  path : String;

begin
  path := 'lang.txt';
  Assign(fC, path);
  Rewrite(fC);

  Write(fC, l);

  Close(fC);
end;

end.

