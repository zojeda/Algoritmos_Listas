unit ListaEnlazadaUnit;

interface

type Nodo = record
       dato: integer;
       sig: ^Nodo;
end;
type posicion = ^Nodo;
type Lista = ^Nodo;
type PNodo = ^Nodo;

procedure Init(var L: Lista);
function Cantidad(var L: Lista): integer;
function Inicio(var L: Lista): posicion;
function Fin(L: Lista): posicion;
function Siguiente(var L: Lista; pos: posicion): posicion;
procedure Insertar(var L: Lista; valor: integer; pos: posicion);
procedure Suprimir(var L: Lista; pos: posicion);
function Obtener(var L: Lista; pos: posicion): integer;

implementation

procedure Init(var L: Lista);
begin
  new(L);
  L^.sig:=nil;
end;

function Cantidad(var L: Lista): integer;
var
  p: posicion;
  cant: integer;
begin
  p:= L;
  cant:=0;
  while(p^.sig <> nil) do
     begin
       cant:= cant +1;
       p := Siguiente(L, p);
     end;
  Cantidad := cant;
end;
function Inicio(var L: Lista): posicion;
begin
  Inicio:=L;
end;

function Fin(L: Lista): posicion;
var p: posicion;
begin
  p:= L;
  while(p^.sig <> nil) do
     begin
       p := Siguiente(L, p);
     end;
  Fin := p;
end;
procedure Insertar(var L: Lista; valor: integer; pos: posicion);
var
  temp: posicion;
  nuevo: ^Nodo;
begin
     temp:= pos^.sig;
     new(pos^.sig);
     pos^.sig^.dato:=valor;
     pos^.sig^.sig:= temp;
end;
procedure Suprimir(var L: Lista; pos: posicion);
begin
     pos^.sig:=pos^.sig^.sig;
end;
function Obtener(var L: Lista; pos: posicion): integer;
begin
  Obtener:=pos^.dato;
end;
function Siguiente(var L: Lista; pos: posicion): posicion;
begin
  Siguiente:=pos^.sig;
end;





end.
