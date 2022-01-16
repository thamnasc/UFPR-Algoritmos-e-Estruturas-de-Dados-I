program v_003;
const MIN = 1; MAX = 200;
type vetor = array [MIN..MAX] of longint;
var seq, seq_aux: vetor;
tam: integer;

procedure le_vetor(var seq: vetor; var seq_aux: vetor; tam: integer);
var i: integer;
begin
	for i:= 1 to tam do
	begin
		read(seq[i]);
		seq_aux[i]:= seq[i];
	end;
end;

procedure zera_vetores(var seq: vetor; var seq_aux: vetor);
var i: integer;
begin
	for i:= 1 to MAX do
	begin
		seq[i]:= 0;
		seq_aux[i]:= 0;
	end;
end;

procedure ordenacao(var seq_aux: vetor; var tam: integer);
var aux: longint;
i, j, pos_menor: integer;
begin
        for i:= 1 to (tam - 1) do       //ultimo que sobra sempre é o maior
        begin
                pos_menor:= i;
                for j:= (i + 1) to tam do
                begin
                        if(seq_aux[pos_menor] > seq_aux[j]) then
                                pos_menor:= j;
                end;
                aux:= seq_aux[pos_menor];
                seq_aux[pos_menor]:= seq_aux[i];
                seq_aux[i]:= aux;
        end;
end;

procedure comparacao(var seq: vetor; var seq_aux: vetor; tam: integer);
var i: integer;
igual: boolean;
begin
	igual:= true;

	for i:= 1 to tam do
	begin
		if(seq[i] <> seq_aux[i]) then
				igual:= false;
	end;
	if(tam <> 0) then
	begin
		if(igual) then
			writeln('sim')
		else
			writeln('nao');
	end;
end;

procedure imprime_inverso(var seq: vetor; tam: integer);
var i: integer;
begin
	for i:= tam downto 1 do
		write(seq[i], ' ');
	writeln;
end;

begin
	read(tam);
	zera_vetores(seq, seq_aux);
	if(tam = 0) then
		writeln('vetor vazio');
	if(tam <> 0) then
		le_vetor(seq, seq_aux, tam);
	ordenacao(seq_aux, tam);
	comparacao(seq, seq_aux, tam);
	imprime_inverso(seq, tam);
end.
