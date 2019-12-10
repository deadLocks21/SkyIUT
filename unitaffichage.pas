unit unitAffichage;

{$codepage utf8}

interface
uses unitEcran;

{Initialise la taille et le cadre de la console}
procedure initConsole();

implementation
{Initialise la taille et le cadre de la console}
procedure initConsole();
begin
  changerTailleConsole(200, 60);
  effacerEcran;
  dessinerCadreXY(2,1,196,58,double,15,0);
end;

end.

