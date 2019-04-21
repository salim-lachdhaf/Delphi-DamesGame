unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    player11: TEdit;
    player22: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Label3: TLabel;
    nb1: TEdit;
    Label5: TLabel;
    nb2: TEdit;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
if ((player11.Text='')or(player22.Text=''))or(player22.Text=player11.Text) then
showmessage('thabet fesmek yahdik RABBI')
else  if(strtoint(nb1.Text)<1)or(strtoint(nb1.Text)>20)or(strtoint(nb2.Text)<1)or(strtoint(nb2.Text)>20)  then
 showmessage('thabet fi 3ded la9ras (Piéce)')
else
begin
form1.Label1.Caption:=form2.player11.Text+' ';
form1.Label2.Caption:=form2.player22.Text+' ';
form1.Show;
form2.Hide;

end;
end;

end.
