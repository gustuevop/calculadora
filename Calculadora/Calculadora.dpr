program Calculadora;



uses
  System.StartUpCopy,
  FMX.Forms,
  U_Calculadora in 'U_Calculadora.pas' {frm_calculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_calculadora, frm_calculadora);
  Application.Run;
end.
