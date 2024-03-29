unit unitEcran;

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

uses SysUtils, Windows;



    (*###########################*)
    (*                           *)
    (*  #####  #  #  ####  ####  *)
    (*    #    #  #  #  #  #     *)
    (*    #     ###  ###   ###   *)
    (*    #       #  #     #     *)
    (*    #    ##    #     ####  *)
    (*                           *)
    (*###########################*)

// représente une coordonnée à l'écran (0,0 = coin haut-gauche)
type coordonnees = record
  x : integer;
  y : integer;
end;

// permet d'indiquer si l'on souhaite une bordure simple ou double
// pour les cadres
type typeBordure = (simple, double);



    (*#################################################################*)
    (*                                                                 *)
    (*  ####  #  #  #  #   ##   #####      #  ####  ###    ###    ##   *)
    (*  #     #  #  ## #  #  #    #       #   #  #  #  #  #  #   #  #  *)
    (*  ###   #  #  # ##  #       #      #    ###   #  #  #  #   #     *)
    (*  #     #  #  #  #  #  #    #     #     #     ###   #  #   #  #  *)
    (*  #      ##   #  #   ##     #    #      #     #  #   ##     ##   *)
    (*                                                                 *)
    (*#################################################################*)

// supprime tous les caractères de l'écran mais ne change pas les couleurs
// de fond
procedure effacerEcran;

// Change la taille de la fenetre
procedure changerTailleConsole(largeur,hauteur : Integer);

// supprime tous les caractères de l'écran et colorie le fond dans la couleur
// désirée (cette couleur est gardée comme couleur de fond par défaut et la
// couleur du texte est conservée)
procedure effacerEtColorierEcran(couleur : Byte);

// déplace le curseur à la position donnée
procedure deplacerCurseur(position : coordonnees);

// déplace le curseur aux coordonnées X, Y
procedure deplacerCurseurXY(x, y : integer);

// retourne la position actuelle du curseur
function  positionCurseur() : coordonnees;

// change la ligne du curseur sans changer la colonne
procedure changerLigneCurseur(position : integer);

// change la colonne du curseur sans changer la ligne
procedure changerColonneCurseur(position : integer);

// affiche le texte à la position donnée
procedure ecrireEnPosition(position : coordonnees; texte: string);

// dessine un cadre à partir des coordonnées des points haut-gauche
// et bas-droite, du type de bordure, de la couleur de trait et de
// la couleur de fond
procedure dessinerCadreXY(x,y,x2,y2 : integer; t : typeBordure; coulTrait, coulFond : byte);
procedure dessinerCadre(c1, c2 : coordonnees; t : typeBordure; ct, cf : byte);

// attends le nombre de ms indiqué
procedure attendre(millisecondes : integer);

// change la couleur de fond actuelle
procedure couleurFond(couleur : Byte);

// change la couleur de texte actuelle
procedure couleurTexte(couleur : Byte);

// change la couleur de texte et de fond
procedure couleurs(ct, cf : byte);

// Change la couleur de la zone
procedure ColorierZone(couleur : Byte ;couleurT : Byte; xStart,xEnd,y:Integer);

// Centre le texte à une ligne et autour d'une colonne donnée.
procedure centrerTexte(text : String; ligne, col : Integer);

// Affiche un texte sur plusieurs ligne si nécessaire.
procedure affTexte(t : String; ligneD : Integer);

// Affiche les >>> et vide ce qui a été écrit précedement.
procedure razConsole();

const
  // Codes des couleurs
  Black        = 0;
  Blue         = 1;
  Green        = 2;
  Cyan         = 3;
  Red          = 4;
  Magenta      = 5;
  Brown        = 6;
  LightGray    = 7;
  DarkGray     = 8;
  LightBlue    = 9;
  LightGreen   = 10;
  LightCyan    = 11;
  LightRed     = 12;
  LightMagenta = 13;
  Yellow       = 14;
  White        = 15;



(*#########################################################################################*)
(*                                                                                         *)
(*   ###  #   #  ####  #     ####  #   #  ####  #  #  #####   ###  #####  ###   ###  #  #  *)
(*    #   ## ##  #  #  #     #     ## ##  #     ## #    #    #  #    #     #   #  #  ## #  *)
(*    #   # # #  ###   #     ##    # # #  ##    # ##    #    #  #    #     #   #  #  # ##  *)
(*    #   #   #  #     #     #     #   #  #     #  #    #    ####    #     #   #  #  #  #  *)
(*   ###  #   #  #     ####  ####  #   #  ####  #  #    #    #  #    #    ###   ##   #  #  *)
(*                                                                                         *)
(*#########################################################################################*)

implementation
procedure effacerEcran;
var
  stdOutputHandle : Cardinal;
  cursorPos       : TCoord;
  width, height   : Cardinal;
  nbChars         : Cardinal;
TextAttr		  : Byte;
begin
  stdOutputHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  cursorPos := GetLargestConsoleWindowSize(stdOutputHandle);
  width := cursorPos.X;
  height := cursorPos.Y;
  cursorPos.X := 0;
  cursorPos.Y := 0;
  TextAttr := $0;
  FillConsoleOutputCharacter(stdOutputHandle, ' ', width*height, cursorPos, nbChars);
  FillConsoleOutputAttribute(stdOutputHandle, TextAttr, width*height, cursorPos, nbChars);
  cursorPos.X := 0;
  cursorPos.Y := 0;
  SetConsoleCursorPosition(stdOutputHandle, cursorPos);
  couleurFond(0);
end;

procedure changerTailleConsole(largeur,hauteur : Integer);
var
   Con: THandle;
   Size: TCoord;
   Rect: TSmallRect;
   Wnd: HWND;
begin
    effacerEcran();
    Con := GetStdHandle(STD_OUTPUT_HANDLE);
    Size := GetLargestConsoleWindowSize(Con);
    Size.X := largeur;
    Size.Y := hauteur;

    SetConsoleScreenBufferSize(Con, Size);

    Rect.Left := -10;
    Rect.Top := -10;
    Rect.Right := Size.X-11;
    Rect.Bottom := Size.Y-11;
    SetConsoleWindowInfo(Con, True, Rect);

    Wnd := GetConsoleWindow;

    SetWindowPos(Wnd, 0, 0, 0, 0, 0, SWP_NOSIZE);
end;

procedure ColorierZone(couleur : Byte ;couleurT : Byte; xStart,xEnd,y:Integer);
var
  LastMode: Word;
  Buffer : CONSOLE_SCREEN_BUFFER_INFO;
  stdOutputHandle : Cardinal;
  cursorPos       : TCoord;
  width, height   : Cardinal;
  nbChars         : Cardinal;
	TextAttr		  : Byte;
begin
  couleurTexte(couleurT);
  stdOutputHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  cursorPos := GetLargestConsoleWindowSize(stdOutputHandle);
  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE),Buffer);
  width := cursorPos.X;
  height := cursorPos.Y;
  cursorPos.X := xStart;
  cursorPos.Y := y;
  LastMode :=  Buffer.wAttributes;
  TextAttr := (LastMode and $0F) or ((couleur shl 4) and $F0);
  FillConsoleOutputAttribute(stdOutputHandle, TextAttr, xEnd-xStart+1, cursorPos, nbChars);
  cursorPos.X := 0;
  cursorPos.Y := 0;
  SetConsoleCursorPosition(stdOutputHandle, cursorPos);
  couleurTexte(white);
end;

procedure effacerEtColorierEcran(couleur : Byte);
var
  LastMode: Word;
  Buffer : CONSOLE_SCREEN_BUFFER_INFO;
  stdOutputHandle : Cardinal;
  cursorPos       : TCoord;
  width, height   : Cardinal;
  nbChars         : Cardinal;
	TextAttr		  : Byte;
begin
  stdOutputHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  cursorPos := GetLargestConsoleWindowSize(stdOutputHandle);
  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE),Buffer);
  width := cursorPos.X;
  height := cursorPos.Y;
  cursorPos.X := 0;
  cursorPos.Y := 0;
  LastMode :=  Buffer.wAttributes;
  TextAttr := (LastMode and $0F) or ((couleur shl 4) and $F0);
  FillConsoleOutputCharacter(stdOutputHandle, ' ', width*height, cursorPos, nbChars);
	FillConsoleOutputAttribute(stdOutputHandle, TextAttr, width*height, cursorPos, nbChars);
  couleurFond(couleur);
  cursorPos.X := 0;
  cursorPos.Y := 0;
  SetConsoleCursorPosition(stdOutputHandle, cursorPos);
end;

procedure deplacerCurseur(position : coordonnees);
var
  stdOutputHandle : Cardinal;
  cursorPos       : TCoord;
begin
  stdOutputHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  cursorPos.X := position.x;
  cursorPos.Y := position.y;
  SetConsoleCursorPosition(stdOutputHandle, cursorPos);
end;

procedure deplacerCurseurXY(x, y : integer);
var c : coordonnees;
begin
  c.x := x;
  c.y := y;
  deplacerCurseur(c);
end;

function positionCurseur() : coordonnees;
var
  stdOutputHandle : Cardinal;
  CSBI: TConsoleScreenBufferInfo;
  pos : TCoord;
  res : coordonnees;
begin
  stdOutputHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  GetConsoleScreenBufferInfo(stdOutputHandle, CSBI);
  pos := CSBI.dwCursorPosition;
  res.x := pos.X;
  res.y := pos.Y;
  positionCurseur := res;
end;

procedure changerLigneCurseur(position : integer);
var c : coordonnees;
begin
  c := positionCurseur();
  c.y := position;
  deplacerCurseur(c);
end;

procedure changerColonneCurseur(position : integer);
var c : coordonnees;
begin
  c := positionCurseur();
  c.x := position;
  deplacerCurseur(c);
end;

procedure ecrireEnPosition(position : coordonnees; texte: string);
begin
  deplacerCurseur(position);
  write(texte);
end;

procedure dessinerCadre(c1, c2 : coordonnees; t : typeBordure; ct, cf : byte);
type typeBords = (CHG, H, CHD, V, CBG, CBD);
type tabBordures = array[typeBords] of char;
const bordsSimples : tabBordures = (#218, #196, #191, #179, #192, #217);
      bordsDoubles : tabBordures = (#201, #205, #187, #186, #200, #188);
var bords : tabBordures;
    i, j : integer;
begin
  // changement de couleur
couleurs(ct, cf);

  // on choisit la bordure
  if t = simple then
    bords := bordsSimples
  else
    bords := bordsDoubles;

  // on dessine la ligne du haut
  deplacerCurseur(c1);
  write(bords[CHG]);
  for i := c1.x+1 to c2.x-1 do
    write(bords[H]);
  write(bords[CHD]);

  // on dessine les lignes intermédiaires
  for i := c1.y+1 to c2.y-1 do
  begin
    deplacerCurseurXY(c1.x, i);
    write(bords[V]);
    for j := c1.x+1 to c2.x-1 do
      write(' ');
    write(bords[V]);
  end;

  // on dessine la ligne du bas
  deplacerCurseurXY(c1.x, c2.y);
  write(bords[CBG]);
  for i := c1.x+1 to c2.x-1 do
    write(bords[H]);
  write(bords[CBD]);

end;

procedure dessinerCadreXY(x,y,x2,y2 : integer; t : typeBordure; coulTrait, coulFond : byte);
var c1, c2 : coordonnees;
begin
  c1.x := x;
  c1.y := y;
  c2.x := x2;
  c2.y := y2;
  dessinerCadre(c1, c2, t, coulTrait, coulFond);
end;

procedure attendre(millisecondes : integer);
begin
  sleep(millisecondes);
end;

procedure couleurs(ct, cf : byte);
begin
  couleurTexte(ct);
couleurFond(cf);
end;

procedure couleurTexte(couleur : Byte);
var LastMode: Word;
    Buffer : CONSOLE_SCREEN_BUFFER_INFO;
    TextAttr: Byte;
begin
  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE),Buffer);
  LastMode :=  Buffer.wAttributes;
  TextAttr := (LastMode and $F0) or (couleur and $0F);
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), TextAttr);
end;

procedure couleurFond(couleur : Byte);
    var LastMode: Word;
        Buffer : CONSOLE_SCREEN_BUFFER_INFO;
        TextAttr: Byte;
    begin
      GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE),Buffer);
      LastMode :=  Buffer.wAttributes;
      TextAttr := (LastMode and $0F) or ((couleur shl 4) and $F0);
      SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), TextAttr);
    end;

procedure centrerTexte(text : String; ligne, col : Integer);
    begin
    changerLigneCurseur(ligne);
    changerColonneCurseur(Round(col-(Length(text)/2)));
    Write(text);
    end;

procedure affTexte(t : String; ligneD : Integer);
var
  i, len, y, e, f, n, c : Integer;
  pos : coordonnees;
  ch : String;

begin
  t := t + ' ';
  len := Length(t);
  i := 0;
  y := ligneD;
  n := 189;

  //Write('i=',IntToStr(i), '  len=',IntToStr(len));
  //Write(i <> len);

  while (i <> len) do
    begin
      changerLigneCurseur(y);
      y := y + 1;
      changerColonneCurseur(4);

      i := i + 1;
      f := i + n;
      c := i;
      ch := '';

      while ((c <> f) AND (c <> len + 1)) do
        begin
          ch := ch + t[c];
          c := c + 1;
        end;

       c := c - 1;

      while t[c] <> ' ' do
        begin
          c := c - 1;
        end;

      ch := '';

      for e := i to c do
        begin
          //Sleep(10);
          {case t[e] of
            'é' : Write('é');
            'è' : Write('è');
            'ê' : Write('ê');
            'à' : Write('à');
            'ô' : Write('ô');
            'ï' : Write('ï');
            else Write(t[e]);
          end;}
          //Write(t[e]);
          if t[e] = 'é' then Write('é');
          if t[e] = 'è' then Write('è');
          if t[e] = 'ê' then Write('ê');
          if t[e] = 'à' then Write('à');
          if t[e] = 'ô' then Write('ô');
          if t[e] = 'ï' then Write('ï');
          if t[e] = 'î' then Write('î');
          if t[e] = 'ç' then Write('ç');
          if t[e] = 'ù' then Write('ù');
          if (t[e] <> 'é') AND (t[e] <> 'è') AND (t[e] <> 'ê') AND (t[e] <> 'à') AND (t[e] <> 'ô') AND (t[e] <> 'ï') AND (t[e] <> 'î') AND (t[e] <> 'ç') AND (t[e] <> 'ù') then Write(t[e]);
          //ch := ch + t[e];
        end;

      i := c;
      //pos.x := 4;
      //pos.y := y;
      //ecrireEnPosition(pos, ch);


    end;
end;

procedure razConsole();
begin
  changerLigneCurseur(56);
  changerColonneCurseur(10);
  Write('>>>                                             ');
  changerColonneCurseur(14);
end;

end.

