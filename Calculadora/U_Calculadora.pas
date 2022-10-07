unit U_Calculadora;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit;

type
  Tfrm_calculadora = class(TForm)
    btn_0: TButton;
    btn_1: TButton;
    btn_2: TButton;
    btn_8: TButton;
    btn_7: TButton;
    btn_4: TButton;
    btn_5: TButton;
    btn_6: TButton;
    btn_3: TButton;
    btn_9: TButton;
    btn_virgula: TButton;
    btn_subtrair: TButton;
    btn_multiplicar: TButton;
    btn_somar: TButton;
    btn_dividir: TButton;
    layout_topo: TLayout;
    txt_resultado: TEdit;
    btn_resultado: TButton;
    btn_limpar: TButton;
    btn_apagar: TButton;
    lbl_memoria: TLabel;
    procedure btn_0Click(Sender: TObject);
    procedure btn_1Click(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
    procedure btn_3Click(Sender: TObject);
    procedure btn_4Click(Sender: TObject);
    procedure btn_5Click(Sender: TObject);
    procedure btn_6Click(Sender: TObject);
    procedure btn_7Click(Sender: TObject);
    procedure btn_8Click(Sender: TObject);
    procedure btn_9Click(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_virgulaClick(Sender: TObject);
    procedure btn_somarClick(Sender: TObject);
    procedure btn_resultadoClick(Sender: TObject);
    procedure btn_subtrairClick(Sender: TObject);
    procedure btn_multiplicarClick(Sender: TObject);
    procedure btn_dividirClick(Sender: TObject);
    procedure btn_apagarClick(Sender: TObject);
  private
    { Private declarations }
    procedure preenche_textbox(str: string);
    procedure rotina_calculo();
    function pega_valor_digitado(): double;
    var memoria_valor: double;
    var memoria_operador: string;
    var resultado: double;
  public
    { Public declarations }
  end;


var
  frm_calculadora: Tfrm_calculadora;

implementation
{$R *.fmx}

//--PREENCHE TEXT BOX--
//Concatena no txt_result o valor do botão clicado
procedure Tfrm_calculadora.preenche_textbox(str: string);
begin
  txt_resultado.Text := txt_resultado.Text + str;
end;

//--PEGA VALOR DIGITADO--
//Transforma o texto no txt_result em Double
function Tfrm_calculadora.pega_valor_digitado(): double;
begin
  if txt_resultado.Text = '' then
    Exit
  else
    result := txt_resultado.Text.ToDouble
end;

//--ROTINA CÁLCULO--
//Rotina ao clicar em qualquer botão de cálculo
procedure Tfrm_calculadora.rotina_calculo();
begin
  if txt_resultado.Text = '' then
    Exit
    else
    memoria_valor := pega_valor_digitado;
    lbl_memoria.Text := txt_resultado.Text + memoria_operador;
    txt_resultado.Text := '';
end;



{$REGION 'Botões numéricos da calculadora' default=folded}
procedure Tfrm_calculadora.btn_1Click(Sender: TObject);
begin
  preenche_textbox('1');
end;

procedure Tfrm_calculadora.btn_2Click(Sender: TObject);
begin
  preenche_textbox('2');
end;

procedure Tfrm_calculadora.btn_3Click(Sender: TObject);
begin
  preenche_textbox('3');
end;

procedure Tfrm_calculadora.btn_4Click(Sender: TObject);
begin
  preenche_textbox('4');
end;

procedure Tfrm_calculadora.btn_5Click(Sender: TObject);
begin
  preenche_textbox('5');
end;

procedure Tfrm_calculadora.btn_6Click(Sender: TObject);
begin
  preenche_textbox('6');
end;

procedure Tfrm_calculadora.btn_7Click(Sender: TObject);
begin
  preenche_textbox('7');
end;

procedure Tfrm_calculadora.btn_8Click(Sender: TObject);
begin
  preenche_textbox('8');
end;

procedure Tfrm_calculadora.btn_9Click(Sender: TObject);
begin
  preenche_textbox('9');
end;

procedure Tfrm_calculadora.btn_apagarClick(Sender: TObject);
begin
  var
    temp: integer := txt_resultado.Text.Length - 1;
  txt_resultado.Text := copy(txt_resultado.Text, 0, temp);
end;

procedure Tfrm_calculadora.btn_0Click(Sender: TObject);
begin
  preenche_textbox('0');
end;

procedure Tfrm_calculadora.btn_virgulaClick(Sender: TObject);
begin
  preenche_textbox(',');
end;
{$ENDREGION}


{$REGION 'Operações' default=folded}
//SOMAR
procedure Tfrm_calculadora.btn_somarClick(Sender: TObject);
begin
  memoria_operador := '+';
  rotina_calculo;
end;

//SUBTRAIR
procedure Tfrm_calculadora.btn_subtrairClick(Sender: TObject);
begin
  memoria_operador := '-';
  rotina_calculo;
end;

//MULTIPLICAR
procedure Tfrm_calculadora.btn_multiplicarClick(Sender: TObject);
begin
  memoria_operador := 'x';
  rotina_calculo;
end;

//DIVIDIR
procedure Tfrm_calculadora.btn_dividirClick(Sender: TObject);
begin
  memoria_operador := '÷';
  rotina_calculo;
end;
{$ENDREGION}


// BOTÃO PARA LIMPAR TUDO
//Limpa tudo, inclusive as memórias
procedure Tfrm_calculadora.btn_limparClick(Sender: TObject);
begin
  txt_resultado.Text := '';
  memoria_valor := 0;
  memoria_operador := '';
  lbl_memoria.Text := '';
end;


// BOTÃO RESULTADO
procedure Tfrm_calculadora.btn_resultadoClick(Sender: TObject);
begin
  if memoria_operador = '+' then
  begin
      resultado := memoria_valor + pega_valor_digitado;
      txt_resultado.Text := resultado.ToString;
  end;
  if memoria_operador = '-' then
  begin
      resultado := memoria_valor - pega_valor_digitado;
      txt_resultado.Text := resultado.ToString;
  end;
  if memoria_operador = 'x' then
  begin
      resultado := memoria_valor * pega_valor_digitado;
      txt_resultado.Text := resultado.ToString;
  end;
  if memoria_operador = '÷' then
  begin
      resultado := memoria_valor / pega_valor_digitado;
      txt_resultado.Text := resultado.ToString;
  end;

end;


end.
