unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var a,b,s,m,d,formula:real;
begin
  a:= Strtofloat(edit1.text);
  b:= Strtofloat(edit2.text);
  s:=a+b;
  d:=a-b;
  m:=a*b;
  formula:=(abs(a)-abs(b))/(1+abs(a*b));
  memo1.lines.add('A = '+floattostr(a)+'; B = '+floattostr(b));
  memo1.lines.add('Сумма : '+floattostr(s));
  memo1.Lines.add('Разность : '+floattostr(d));
  memo1.lines.add('Произведение : '+floattostr(m));
  memo1.lines.add('Формула : '+floattostr(formula));
  memo1.lines.add('');


end;

procedure TForm1.MenuItem1Click(Sender: TObject);

var
 f:textfile;
 x:real;
begin
if opendialog1.Execute then
   begin
     assignfile(f,opendialog1.filename);
     reset(f);
     readln(f,x);
     edit1.text:=floatToStr(x);
     readln(f,x);
     edit2.text:=floatToStr(x);
      closefile(f);

     end;

     end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var
f:textfile;
x:real;
begin
    if savedialog1.Execute then
   begin

      assignfile(f,savedialog1.FileName);
     rewrite(f);
     x:=StrToFloat(edit1.Text);
     writeln(f,x);
     x:=StrToFloat(edit2.Text);
     writeln(f,x);
     closefile(f);

   end;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
   if savedialog1.Execute then
      Memo1.Lines.SaveToFile(savedialog1.FileName);
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
   showmessage('Борисов А.С.'+#13#10+'Задача №1'+#13#10+'Работа над UI в Lazarus'+#13#10+'https://github.com/anderbor123'+#13#10+'https://github.com/ivtipm/HCI/tree/master/Tasks-2020-spring');
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  close;
end;

end.

