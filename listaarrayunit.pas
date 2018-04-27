unit ListaArrayUnit;

interface

const max_elementos = 10;

type ListaArray = record
       elementos: array[1..max_elementos] of integer;
       cantidad: integer;
end;
type posicion = integer;
type Lista = ListaArray;
procedure Init(var L: Lista);
function Cantidad(var L: Lista): integer;
function Inicio(var L: Lista): posicion;
function Fin(var L: Lista): posicion;
function Siguiente(var L: Lista; pos: posicion): posicion;
procedure Insertar(var L: Lista; valor: integer; pos: posicion);
procedure Suprimir(var L: Lista; pos: posicion);
function Obtener(var L: Lista; pos: posicion): integer;

implementation

procedure Init(var L: ListaArray);
begin
  L.cantidad:=0;
end;

function Cantidad(var L: ListaArray): integer;
begin
  Cantidad:=L.cantidad;
end;
function Inicio(var L: ListaArray): posicion;
begin
  Inicio:=0;
end;

function Fin(var L: ListaArray): posicion;
begin
  Fin:=L.cantidad;
end;
procedure Insertar(var L: ListaArray; valor: integer; pos: posicion);
var i: posicion;
begin
  L.cantidad := L.cantidad +1;
  for i:=L.cantidad+1 downto pos+1 do
   begin
      L.elementos[i] := L.elementos[i-1];
   end;
  L.elementos[pos+1] := valor;
end;
procedure Suprimir(var L: ListaArray; pos: posicion);
var i: posicion;
begin
  for i:=pos+1 to L.cantidad+1 do
   begin
      L.elementos[i] := L.elementos[i+1];
   end;
  L.cantidad := L.cantidad -1;
end;
function Obtener(var L: ListaArray; pos: posicion): integer;
begin
  Obtener:=L.elementos[pos];
end;
function Siguiente(var L: ListaArray; pos: posicion): integer;
begin
  Siguiente:=pos + 1;
end;



end.
