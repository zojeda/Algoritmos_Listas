unit testcaseListas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry, ListaEnlazadaUnit;

function Imprimir(var L: Lista): string;

type
  PruebaListaTDA= class(TTestCase)
  protected
    procedure SetUp; override;
  published
    procedure PruebaInit;
    procedure PruebaFinVacia;
    procedure PruebaInsertarAlFinal;
    procedure PruebaInsertarAlFinalYObtener;
    procedure PruebaInsertarAlInicioYObtener;
    procedure PruebaSuprimirPrimero;
    procedure PruebaSuprimirSegundo;
    procedure PruebaSuprimirFinal;
  end;

implementation
function Imprimir(var L: Lista): string;
var
  r: string;
  p: posicion;
  v: integer;
begin
  p:= Inicio(l);
  r:='';
  while(p <> Fin(l)) do
    begin
         p:= Siguiente(l, p);
         v:= Obtener(l, p);
         r := r+IntToStr(v)+' ';
    end;
  Imprimir:=r;
end;

procedure PruebaListaTDA.PruebaInit;
var l: Lista;
begin
  Init(l);
  AssertEquals('la cantidad inicial debe ser 0', 0, Cantidad(l));
end;

procedure PruebaListaTDA.PruebaFinVacia;
var l: Lista;
begin
  Init(l);
  //AssertEquals('el fin debe apuntar a uno sig al ultimo valor', l, Fin(l));
end;
procedure PruebaListaTDA.PruebaInsertarAlFinal;
var l: Lista;
begin
  Init(l);
  Insertar(l, 100, Fin(l));
  AssertEquals('la cantidad debe incrementarse en cada insert', 1, Cantidad(l));
  Insertar(l, 101, Fin(l));
  AssertEquals('la cantidad debe incrementarse en cada insert', 2, Cantidad(l));
  Insertar(l, 102, Fin(l));
  AssertEquals('la cantidad debe incrementarse en cada insert', 3, Cantidad(l));
end;

procedure PruebaListaTDA.PruebaInsertarAlFinalYObtener;
var
  l: Lista;
  r: string;
begin
  Init(l);

  Insertar(l, 100, Fin(l));
  Insertar(l, 101, Fin(l));
  Insertar(l, 102, Fin(l));

  r:=Imprimir(l);
  AssertEquals('el order debe estar conservado', '100 101 102 ', r);
end;

procedure PruebaListaTDA.PruebaInsertarAlInicioYObtener;
var
  l: Lista;
  r: string;
begin
  Init(l);
  Insertar(l, 100, Inicio(l));
  Insertar(l, 101, Inicio(l));
  Insertar(l, 102, Inicio(l));

  r:=Imprimir(l);
  AssertEquals('el order debe estar invertido', '102 101 100 ', r);

end;

procedure PruebaListaTDA.PruebaSuprimirPrimero;
var
  l: Lista;
  p: posicion;
  r: string;
begin
  Init(l);
  Insertar(l, 100, Inicio(l));
  Insertar(l, 101, Inicio(l));
  Insertar(l, 102, Inicio(l));

  p:=Inicio(l);
  Suprimir(l,p);


  r:=Imprimir(l);
  AssertEquals('el order debe estar invertido', '101 100 ', r);

end;
procedure PruebaListaTDA.PruebaSuprimirSegundo;
var
  l: Lista;
  p: posicion;
  r: string;
begin
  Init(l);
  Insertar(l, 100, Inicio(l));
  Insertar(l, 101, Inicio(l));
  Insertar(l, 102, Inicio(l));

  p:=Inicio(l);
  p:=Siguiente(l,p);
  Suprimir(l,p);

  r:=Imprimir(l);
  AssertEquals('el order debe estar invertido', '102 100 ', r);

end;
procedure PruebaListaTDA.PruebaSuprimirFinal;
var
  l: Lista;
  p: posicion;
  r: string;
begin
  Init(l);
  Insertar(l, 100, Inicio(l));
  Insertar(l, 101, Inicio(l));
  Insertar(l, 102, Inicio(l));

  p:=Inicio(l);
  p:=Siguiente(l,p);
  p:=Siguiente(l,p);
  Suprimir(l,p);

  r:=Imprimir(l);
  AssertEquals('el order debe estar invertido', '102 101 ', r);

end;

procedure PruebaListaTDA.SetUp;
begin

end;


initialization

  RegisterTest(PruebaListaTDA);
end.

