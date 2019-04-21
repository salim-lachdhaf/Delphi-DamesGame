unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons,shellapi,unit2, ImgList;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SG: TStringGrid;
    menu: TPanel;
    sortir: TBitBtn;
    reset: TBitBtn;
    son: TCheckBox;
    Panel2: TPanel;
    Timer2: TTimer;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    backe: TBitBtn;
    ImageList1: TImageList;
    noirsel: TSpeedButton;
    blansel: TSpeedButton;
    blan: TSpeedButton;
    themenoir: TSpeedButton;
    themeblan: TSpeedButton;
    sel: TSpeedButton;
    TREED: TCheckBox;
    noir: TSpeedButton;
    MANGEBLAN: TSpeedButton;
    mangenoir: TSpeedButton;
    score2: TLabel;
    score1: TLabel;
    noirdame: TSpeedButton;
    blandame: TSpeedButton;
    blandamesel: TSpeedButton;
    noirdamesel: TSpeedButton;
   
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sortirClick(Sender: TObject);
    procedure resetClick(Sender: TObject);
    procedure SGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure backeClick(Sender: TObject);
    procedure TREEDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}
   var nbselected,nbselectedaux,hauter,nbmange,nbmangeaux,scor1,scor1aux,scor2,scor2aux,ss,mm,hh,ss1,mm1,hh1,nb11,nb22,nbpiece:integer;
   player,player1,player2:string;
   selx,selxaux,sely,selyaux,mangex,mangexaux,mangey,mangeyaux  :array[0..10] of integer  ;
   back:array[0..10]of array[0..10]of string;
   proche,procheaux:boolean;

procedure backup();
var i,j:byte;
begin
for i:=0 to 9 do
  for j:=0 to 9 do
    back[i,j]:=form1.SG.Cells[i,j];
    nbselectedaux:=nbselected;
   nbmangeaux:= nbmange;
   scor1aux:= scor1;
   scor2aux:= scor2;
   procheaux:=proche;
   
    selxaux:=selx;
    selyaux:=sely;
    mangexaux:=mangex;
    mangeyaux:=mangey;
end;

procedure backover();
var i,j:byte;
begin
for i:=0 to 9 do
  for j:=0 to 9 do
  form1.SG.Cells[i,j]:=  back[i,j];
  nbselected:=nbselectedaux;
    nbmange:=nbmangeaux;
    scor1:=scor1aux;
    scor2:=scor2aux;
    proche:=procheaux;

    selx:=selxaux;
    sely:=selyaux;
    mangex:=mangexaux;
    mangey:=mangeyaux;

     form1.score2.Caption:=inttostr(scor2)+' ';
      form1.score1.Caption:=inttostr(scor1)+' ';

       if scor1<1 then
         begin
             form1.mangeBLAN.Visible:=false;
             form1.score1.Visible:=false;
         end;
         if scor2<1 then
         begin
             form1.mangeNOIR.Visible:=false;
             
             form1.score2.Visible:=false;
         end;
end;    



procedure coloration();
var i,j:integer;
begin
for i:=1 to 10   do
begin
 for j:=1 to 10 do
 begin
 
 if form1.SG.Cells[i-1,j-1]='1' then
  begin
  if form1.TREED.Checked=false then
     begin
   form1.SG.Canvas.Brush.Color:=clmaroon ;
   form1.SG.Canvas.Pen.Width:=1      ;
   form1.SG.Canvas.Pen.Color:=clmaroon     ;
   form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);
    end
     else
     FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.themenoir.Glyph);
 end
 else if form1.SG.Cells[i-1,j-1]='0' then
 begin
  if form1.TREED.Checked=false then
     begin
 form1.SG.Canvas.Brush.Color:=cl3Dlight;
   form1.SG.Canvas.Pen.Width:=1      ;
   form1.SG.Canvas.Pen.Color:=cl3Dlight    ;
   form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);
     end
  else   
 FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.themeblan.Glyph);
 end
 else if form1.SG.Cells[i-1,j-1]=player1 then
 begin
          
   if form1.TREED.Checked=false then
     begin
   form1.SG.Canvas.Brush.Color:=clmaroon ;
   form1.SG.Canvas.Pen.Width:=1      ;
   form1.SG.Canvas.Pen.Color:=clmaroon     ;
   form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);

          form1.SG.Canvas.Brush.Color:=clblack;
           form1.SG.Canvas.Pen.Width:=1;
           form1.SG.Canvas.Pen.Color:=clwhite;
           form1.SG.Canvas.Ellipse((J*90)-90+J-1+15,(I*hauter)-hauter+I-1+6,(J*90)+J-1-15,(I*hauter)+I-1-6);
 end
 else
 FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.noir.Glyph);

 end

 else if form1.SG.Cells[i-1,j-1]=player2 then
 begin

   if form1.TREED.Checked=false then
     begin
  form1.SG.Canvas.Brush.Color:=clmaroon ;
   form1.SG.Canvas.Pen.Width:=1      ;
   form1.SG.Canvas.Pen.Color:=clmaroon     ;
   form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);
 

          form1.SG.Canvas.Brush.Color:=clwhite;
           form1.SG.Canvas.Pen.Width:=1;
           form1.SG.Canvas.Pen.Color:=clblack;
           form1.SG.Canvas.Ellipse((J*90)-90+J-1+15,(I*hauter)-hauter+I-1+6,(J*90)+J-1-15,(I*hauter)+I-1-6);
    end
    else
 FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.blan.Glyph);
 end

 else if form1.SG.Cells[i-1,j-1]='playerselected' then
  begin
   if form1.TREED.Checked=true then
     begin
      if player=player1 then
        FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.noirsel.Glyph)
      else
      FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.blansel.Glyph);
          end
          else
          begin
          form1.SG.Canvas.Brush.Color:=clgreen;
              form1.SG.Canvas.Pen.Width:=1      ;
              form1.SG.Canvas.Pen.Color:=clblack     ;
           form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);

                  if player=player1 then
                  begin
                 form1.SG.Canvas.Brush.Color:=clblack ;
                 form1.SG.Canvas.Pen.Width:=1;
                 form1.SG.Canvas.Pen.Color:=clwhite;
                  end
                  else
                  begin
                 form1.SG.Canvas.Brush.Color:=clwhite;
                 form1.SG.Canvas.Pen.Width:=1;
                  form1.SG.Canvas.Pen.Color:=clblack;
                 end;

           form1.SG.Canvas.Ellipse((J*90)-90+J-1+15,(I*hauter)-hauter+I-1+6,(J*90)+J-1-15,(I*hauter)+I-1-6);
 end;
  end
  else if (pos('agagner',form1.SG.Cells[i-1,j-1])<>0) then
   begin
        if form1.TREED.Checked=false then
     begin
           form1.SG.Canvas.Brush.Color:=clgreen;
              form1.SG.Canvas.Pen.Width:=1      ;
              form1.SG.Canvas.Pen.Color:=clblack     ;
           form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);
       end
       else
        FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.sel.Glyph);
  end
   else if (form1.SG.Cells[i-1,j-1])='dama1' then
   begin
      if form1.TREED.Checked=false then
     begin

    form1.SG.Canvas.Brush.Color:=clmaroon ;
   form1.SG.Canvas.Pen.Width:=1      ;
   form1.SG.Canvas.Pen.Color:=clmaroon     ;
   form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);
 
          form1.SG.Canvas.Brush.Color:=clblack;
           form1.SG.Canvas.Pen.Width:=2;
           form1.SG.Canvas.Pen.Color:=clwhite;
           form1.SG.Canvas.Ellipse((J*90)-90+J-1+15,(I*hauter)-hauter+I-1+6,(J*90)+J-1-15,(I*hauter)+I-1-6);

            form1.SG.Canvas.Brush.Color:=clblack;
              form1.SG.Canvas.Pen.Width:=2 ;
              form1.SG.Canvas.Pen.Color:=clwhite     ;
           form1.SG.Canvas.ellipse((J*90)-90+J-1+25,(I*hauter)-hauter+I-1+16,(J*90)+J-1-25,(I*hauter)+I-1-16);
     end
       else         FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.noirdame.Glyph);
     end
   else if (form1.SG.Cells[i-1,j-1])='dama2' then
   begin
            if form1.TREED.Checked=false then
     begin
    form1.SG.Canvas.Brush.Color:=clmaroon ;
   form1.SG.Canvas.Pen.Width:=1      ;
   form1.SG.Canvas.Pen.Color:=clmaroon     ;
   form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);
 

          form1.SG.Canvas.Brush.Color:=clwhite;
           form1.SG.Canvas.Pen.Width:=2;
           form1.SG.Canvas.Pen.Color:=clblack;
           form1.SG.Canvas.Ellipse((J*90)-90+J-1+15,(I*hauter)-hauter+I-1+6,(J*90)+J-1-15,(I*hauter)+I-1-6);
 
 
            form1.SG.Canvas.Brush.Color:=clwhite;
              form1.SG.Canvas.Pen.Width:=2 ;
              form1.SG.Canvas.Pen.Color:=clblack     ;
           form1.SG.Canvas.ELLIPSE((J*90)-90+J-1+25,(I*hauter)-hauter+I-1+16,(J*90)+J-1-25,(I*hauter)+I-1-16);
          end
            else         FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.blandame.Glyph);

        end
 else if (form1.SG.Cells[i-1,j-1])='dama2selected' then
   begin
           if form1.TREED.Checked=true then
     begin


         FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.blandamesel.Glyph)


          end
          else
          begin

             form1.SG.Canvas.Brush.Color:=clgreen;
              form1.SG.Canvas.Pen.Width:=1      ;
              form1.SG.Canvas.Pen.Color:=clblack     ;
           form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);
      


     form1.SG.Canvas.Brush.Color:=clwhite;
           form1.SG.Canvas.Pen.Width:=2;
           form1.SG.Canvas.Pen.Color:=clblack;
           form1.SG.Canvas.Ellipse((J*90)-90+J-1+15,(I*hauter)-hauter+I-1+6,(J*90)+J-1-15,(I*hauter)+I-1-6);
 
           form1.SG.Canvas.Brush.Color:=clgreen;
              form1.SG.Canvas.Pen.Width:=2 ;
              form1.SG.Canvas.Pen.Color:=clblack     ;
           form1.SG.Canvas.ELLIPSE((J*90)-90+J-1+25,(I*hauter)-hauter+I-1+16,(J*90)+J-1-25,(I*hauter)+I-1-16);
         end;
   end

   else if (form1.SG.Cells[i-1,j-1])='dama1selected' then
   begin
     if form1.TREED.Checked=true then
     begin


         FORM1.SG.Canvas.Draw((J*90)-90+J-1,(I*hauter)-hauter+I-1,form1.noirdamesel.Glyph)


          end
          else
          begin
             form1.SG.Canvas.Brush.Color:=clgreen;
              form1.SG.Canvas.Pen.Width:=1      ;
              form1.SG.Canvas.Pen.Color:=clblack     ;
           form1.SG.Canvas.rectangle((J*90)-90+J-1,(I*hauter)-hauter+I-1,(J*90)+J-1,(I*hauter)+I-1);
      

    form1.SG.Canvas.Brush.Color:=clblack;
           form1.SG.Canvas.Pen.Width:=2;
           form1.SG.Canvas.Pen.Color:=clwhite;
           form1.SG.Canvas.Ellipse((J*90)-90+J-1+15,(I*hauter)-hauter+I-1+6,(J*90)+J-1-15,(I*hauter)+I-1-6);

           form1.SG.Canvas.Brush.Color:=clgreen;
              form1.SG.Canvas.Pen.Width:=2 ;
              form1.SG.Canvas.Pen.Color:=clwhite     ;
           form1.SG.Canvas.ELLIPSE((J*90)-90+J-1+25,(I*hauter)-hauter+I-1+16,(J*90)+J-1-25,(I*hauter)+I-1-16);
       end;
   end;
   
  end;









 end;

 form1.SG.Refresh;
 form1.SG.Canvas.Refresh;

end;//end coloration// 



procedure initialisation  () ;
var i,j:1..10;
begin
form1.label1.Caption:=form2.player11.Text+' ';
 form1.label2.Caption:=form2.player22.Text+' ';
 NB11:=strtoint(form2.nb1.Text);
 NB22:=strtoint(form2.nb2.Text);
 player1:=form1.Label1.Caption+' ';
player2:=form1.Label2.Caption+' ';
player:=player2;


  for i:=1to 10do
  begin
     for j:=1 to 10 do
       begin
          if(i+j)mod 2=0 then
          begin
          form1.SG.Cells[i-1,j-1]:='1';

          end

           else
              begin
              form1.SG.Cells[i-1,j-1]:='0';
              end;
       end;
  end;
i:=1;
nbpiece:=0;
repeat
     j:=1;
      repeat
        if(i+j)mod 2=0 then
          begin
        form1.sg.Cells[i-1,j-1]:=player1;
        inc(nbpiece);
          end;
          inc(j);
      until (j>10)or(nbpiece=nb11);
 inc(i);
 until (i>4)or(nbpiece=nb11);

 i:=9;
nbpiece:=0;
repeat
     j:=1;
      repeat
        if(i+j-1)mod 2=0 then
          begin
        form1.sg.Cells[i,j-1]:=player2;
        inc(nbpiece);
          end;
          inc(j);
      until (j>10)or(nbpiece=nb22);
 dec(i);
 until (i<6)or(nbpiece=nb22);


  coloration();
  coloration();




end;


function verif(lignei,colj:integer):boolean;
var aux,auy,i,j:byte;
begin


result:=false;
if (player=player1)and(pos('dama',form1.SG.Cells[sely[1],selx[1]])=0) then
begin
try
if (colj=selx[nbselected]+1)and (lignei=sely[nbselected]+1)and(nbselected=1) then
begin
result:=true;
proche:=true;
end
else if (colj=selx[nbselected]-1)and (lignei=sely[nbselected]+1) and(nbselected=1)then
begin
result:=true;
proche:=true;
end
else if ((colj=selx[nbselected]-2)and (lignei=sely[nbselected]+2) and(form1.SG.Cells[lignei-1,colj+1]=player2)and(proche=false))or(form1.SG.Cells[lignei-1,colj+1]='dama2')then
   begin
   inc(nbmange) ;
  mangex[nbmange]:= colj+1;
  mangey[nbmange]:= lignei-1;
result:=true;
   end
else if ((colj=selx[nbselected]+2)and (lignei=sely[nbselected]+2)and(form1.SG.Cells[lignei-1,colj-1]=player2)and(proche=false))or(form1.SG.Cells[lignei-1,colj-1]='dama2')then
  begin
  inc(nbmange) ;
  mangex[nbmange]:= colj-1;
  mangey[nbmange]:= lignei-1;
result:=true ;
  end
else result:=false;

except
end;
end;

try
if (player=player2)and(pos('dama',form1.SG.Cells[sely[1],selx[1]])=0) then
begin
if (colj=selx[nbselected]-1)and (lignei=sely[nbselected]-1)and(nbselected=1)then
begin
result:=true;
proche:=true;
end
else if (colj=selx[nbselected]+1)and (lignei=sely[nbselected]-1) and(nbselected=1)then
begin
result:=true;
proche:=true;
end
else if ((colj=selx[nbselected]-2)and (lignei=sely[nbselected]-2)and((form1.SG.Cells[lignei+1,colj+1]=player1)or(form1.SG.Cells[lignei+1,colj+1]='dama1'))and(proche=false))then
 begin
 inc(nbmange) ;
  mangex[nbmange]:= colj+1;
  mangey[nbmange]:= lignei+1;
result:=true;
   end
else if ((colj=selx[nbselected]+2)and (lignei=sely[nbselected]-2) and((form1.SG.Cells[lignei+1,colj-1]=player1)or(form1.SG.Cells[lignei+1,colj-1]='dama1'))and(proche=false))then
 begin
 inc(nbmange) ;
  mangex[nbmange]:= colj-1;
  mangey[nbmange]:= lignei+1;
result:=true;
   end ;

   end;
    except
   end;

//damma
try
 if (pos('dama',form1.SG.Cells[sely[1],selx[1]])<>0)then
 begin
   
 i:=sely[nbselected];j:=selx[nbselected];
 repeat
   if (i<lignei)and(j<colj) then
     begin
       inc(i);inc(j);
     end
     else  if (i>lignei)and(j<colj) then
     begin
       dec(i);inc(j);
     end

     else  if (i>lignei)and(j>colj) then
     begin
       dec(i);dec(j);
     end
     else  if (i<lignei)and(j>colj) then
     begin
       inc(i);dec(j);
     end
     else break;
     until (form1.SG.Cells[i,j]=player1)or((i=lignei)and(j=colj))or(form1.SG.Cells[i,j]=player2)or(form1.SG.Cells[i,j]='dama1')or(form1.SG.Cells[i,j]='dama2');

     if ((i=lignei)and(j=colj)) then
     begin
     proche:=true;
     if nbselected>=2 then
      verif:=false
     else  verif:=true;
      end;
              if player=player1 then
              begin
         if(form1.SG.Cells[i,j]<>player)and(form1.SG.Cells[i,j]<>'1')and(form1.SG.Cells[i,j]<>'0')and(proche=false)and(form1.SG.Cells[i,j]<>'dama1')then

            begin
            aux:=j;auy:=i;
            
               repeat
   if (i<lignei)and(j<colj) then
     begin
       inc(i);inc(j);
     end
     else  if (i>lignei)and(j<colj) then
     begin
       dec(i);inc(j);
     end

     else  if (i>lignei)and(j>colj) then
     begin
       dec(i);dec(j);
     end
     else  if (i<lignei)and(j>colj) then
     begin
       inc(i);dec(j);
     end
     else break;
     until (form1.SG.Cells[i,j]=player1)or((i=lignei)and(j=colj))or(form1.SG.Cells[i,j]=player2)or(form1.SG.Cells[i,j]='dama1')or(form1.SG.Cells[i,j]='dama2');



        if ((i=lignei)and(j=colj)) then
        begin

 if     (mangex[nbmange]= aux)and(mangey[nbmange]= auy) then
   result:=false
   else
   begin
   inc(nbmange) ;
  mangex[nbmange]:= aux;
  mangey[nbmange]:= auy;
result:=true;
end;
end;
 end;
 end
 else  if player=player2 then
              begin
         if(form1.SG.Cells[i,j]<>player)and(form1.SG.Cells[i,j]<>'1')and(form1.SG.Cells[i,j]<>'0')and(proche=false)and(form1.SG.Cells[i,j]<>'dama2')then

            begin
            aux:=j;auy:=i;
            
               repeat
   if (i<lignei)and(j<colj) then
     begin
       inc(i);inc(j);
     end
     else  if (i>lignei)and(j<colj) then
     begin
       dec(i);inc(j);
     end

     else  if (i>lignei)and(j>colj) then
     begin
       dec(i);dec(j);
     end
     else  if (i<lignei)and(j>colj) then
     begin
       inc(i);dec(j);
     end
     else break;
     until (form1.SG.Cells[i,j]=player1)or((i=lignei)and(j=colj))or(form1.SG.Cells[i,j]=player2)or(form1.SG.Cells[i,j]='dama1')or(form1.SG.Cells[i,j]='dama2');



        if ((i=lignei)and(j=colj)) then
        begin
if     (mangex[nbmange]= aux)and(mangey[nbmange]= auy) then
   result:=false
   else
   begin
   inc(nbmange) ;
  mangex[nbmange]:= aux;
  mangey[nbmange]:= auy;
result:=true;
end;

end;
 end;
 end;


 end;
  except
end;
//end damma verif
end;





procedure TForm1.Button1Click(Sender: TObject);



begin
 initialisation();
 end;


procedure TForm1.FormCreate(Sender: TObject);

begin
 hauter:=65;
 nbselected:=0;
 nbmange:=0;
 scor1:=0;
 scor2:=0;  ss:=00;SS1:=00;MM1:=00;mm:=00;hh:=00;HH1:=00;
 proche:=false;
 player:='0';

  with Form1 do  
    begin 
      BorderStyle := bsNone; 
      FormStyle   := fsStayOnTop; 
      Left        := 0; 
      Top         := 0; 
      Height      := Screen.Height; 
      Width       := Screen.Width; 
    end;
 
end;


procedure TForm1.SGMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var col,ligne:integer;
  begin
        Sg.MouseToCell(x,y,col,ligne);

        try


        if (sg.Cells[ligne,col]=player) then
        sg.Cursor:=crhandpoint
        else if sg.Cells[ligne,col]='1' then
        sg.Cursor:=crdrag
        else if sg.Cells[ligne,col]='0' then
          sg.Cursor:=crnodrop
        else if (sg.Cells[ligne,col]='playerselected')or(sg.Cells[ligne,col]='dama1selected')or(sg.Cells[ligne,col]='dama2selected') then
        sg.Cursor:=crhelp
        else if (pos('gagner',sg.Cells[ligne,col])<>0)then
        sg.Cursor:=crappstart
        else if sg.Cells[ligne,col]='dama1' then
          begin
            if (player1=player)then
               sg.Cursor:=crhandpoint
               else sg.Cursor:=crno;
          end
        else if sg.Cells[ligne,col]='dama2'  then
          begin
            if (player2=player)then
               sg.Cursor:=crhandpoint
               else sg.Cursor:=crno;
         end      
        else sg.Cursor:=crno;

       

          except
          end;

end;



procedure TForm1.SGMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var col,ligne,i,nb:integer;
  begin

   try
         backe.Visible:=false;
        Sg.MouseToCell(x,y,col,ligne);

        if sg.Cells[ligne,col]=player then
          begin
              if nbselected>0 then
                begin
                for i:=2 to nbselected do
              begin
              sg.Cells[sely[i],selx[i]]:='1';
              end;
                    if sg.Cells[sely[1],selx[1]]='playerselected' then
                           sg.Cells[sely[1],selx[1]]:=player
                         else
                            if player=player2 then
                               sg.Cells[sely[1],selx[1]]:='dama2'
                               else sg.Cells[sely[1],selx[1]]:='dama1';
                  proche:=false;
                  sg.Cells[ligne,col]:='playerselected';
                   nbselected:=1;
                  selx[nbselected]:=col;
                  sely[nbselected]:=ligne;
                  nbmange:=0;

                end
              else
              begin
                 inc(nbselected);
                 selx[nbselected]:=col;
                 sely[nbselected]:=ligne;
                 sg.Cells[ligne,col]:='playerselected';
              end;
           end
           else if sg.Cells[ligne,col]='playerselected' then
             begin
             for i:=2 to nbselected do
              begin
              sg.Cells[sely[i],selx[i]]:='1';
              end;
              nbselected:=0;
              sg.Cells[ligne,col]:=player;
              nbmange:=0;
               proche:=false;
           end

           else if pos('gagner',sg.Cells[ligne,col])<>0 then
           begin

           nb:= strtoint(copy(sg.Cells[ligne,col],length(sg.Cells[ligne,col]),1) );
           for i:=nb+1 to nbselected do
            begin
            sg.Cells[sely[i],selx[i]]:='1';
                if nbmange>0 then
                  dec(nbmange);

                  if  proche=true
                  then  proche:=false;
            end;
             nbselected:=nb ;
          
           end

           else if  sg.Cells[ligne,col]='1' then
           begin
            if ((verif(ligne,col))and(nbselected>0)) then
             begin
            sg.Cells[ligne,col]:='agagner'+inttostr(nbselected);
             inc(nbselected) ;
             selx[nbselected]:=col;
             sely[nbselected]:=ligne;
             end;
           end

     else if sg.Cells[ligne,col]='dama1' then
      begin
              if player=player1 then
               begin
                if nbselected=0 then
                begin
                 sg.Cells[ligne,coL]:='dama1selected';
                 inc(nbselected);
                 selx[nbselected]:=col;
                 sely[nbselected]:=ligne;

                 end
                 else
                 begin
                     if nbselected>0 then
                     begin
                      for i:=2 to nbselected do
                       begin
                         sg.Cells[sely[i],selx[i]]:='1';
                       end;
                         if sg.Cells[sely[1],selx[1]]='playerselected' then
                           sg.Cells[sely[1],selx[1]]:=player
                         else sg.Cells[sely[1],selx[1]]:='dama1';
                        proche:=false;
                        sg.Cells[ligne,col]:='dama1selected';
                        nbselected:=1;
                        selx[nbselected]:=col;
                        sely[nbselected]:=ligne;
                        nbmange:=0;

                 end;
                 end ;



              end;
          end

    else       if sg.Cells[ligne,coL]='dama1selected' then
                 begin
                    if player=player1 then
                     begin
                   for i:=2 to nbselected do
                     begin
                      sg.Cells[sely[i],selx[i]]:='1';
                     end;
                      nbselected:=0;
                      sg.Cells[ligne,coL]:='dama1';
                      nbmange:=0;
                      proche:=false;

                  end;
                  end

   else if sg.Cells[ligne,col]='dama2' then
      begin
              if player=player2 then
          begin
                if nbselected=0 then
                begin

                 sg.Cells[ligne,coL]:='dama2selected';
                 inc(nbselected);
                 selx[nbselected]:=col;
                 sely[nbselected]:=ligne;

                 end
                 else
                 begin
                     if nbselected>0 then
                     begin
                      for i:=2 to nbselected do
                       begin
                         sg.Cells[sely[i],selx[i]]:='1';
                       end;
                         if sg.Cells[sely[1],selx[1]]='playerselected' then
                           sg.Cells[sely[1],selx[1]]:=player
                         else sg.Cells[sely[1],selx[1]]:='dama2';
                        proche:=false;
                        sg.Cells[ligne,col]:='dama2selected';
                        nbselected:=1;
                        selx[nbselected]:=col;
                        sely[nbselected]:=ligne;
                        nbmange:=0;

                 end;
                 end ;


              end;
          end
           else if sg.Cells[ligne,coL]='dama2selected' then
                 begin
                    if player=player2 then
                    begin
                   for i:=2 to nbselected do
                     begin
                      sg.Cells[sely[i],selx[i]]:='1';
                     end;
                      nbselected:=0;
                      sg.Cells[ligne,coL]:='dama2';
                      nbmange:=0;
                      proche:=false;

                  end;
                  end;


            

          except
          end;

     coloration();
      coloration();


end;

procedure TForm1.sortirClick(Sender: TObject);
var rep:byte;
begin
 rep:=Application.messagebox('ya weldi mthabet t7eb to5rej !!! ??','<S@><ATTENTION><S@>',mb_yesNoCancel);
if rep=idyes then
application.Terminate;
end;

procedure TForm1.resetClick(Sender: TObject);
var rep:byte;
begin
if reset.Caption='RESET ' then
begin
timer2.Enabled:=false;
rep:=Application.messagebox('mthabet t7eb t3awed  !!! ??','<S@><Vérification><S@>',mb_yesNoCancel);
if rep=idyes then
begin
shellexecute(0,'open',pchar(application.ExeName),nil,nil,sw_show);
application.Terminate;
end
else
begin
timer2.Enabled:=true;
end;
end
else
begin
initialisation();
timer2.Enabled:=true;
sg.Enabled:=true;
reset.Caption:='RESET '
end;
end;

procedure TForm1.SGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var i,j:byte;play:string;
begin
 backup();
 if key=VK_RETURN then
 begin
 proche:=false;
     j:=1;
    if nbselected>1 then
    begin
     if sg.Cells[sely[1],selx[1]]='playerselected' then
       play:=player
       else
       if player=player1 then play:='dama1'
            else   play:='dama2';
    for i:=1 to nbselected-1  do
      begin
        sg.Cells[sely[i],selx[i]]:='1';
        sg.Cells[sely[i+1],selx[i+1]]:=play  ;
       
         if (nbmange>0)and(j<=nbmange) then
         begin
             if  (pos('dama',sg.Cells[mangey[j],mangex[j]]) <>0) then
           begin

                if player=player1 then
                begin
                 sg.Cells[sely[j],selx[j]]:='1';
                 scor1:=scor1+2;
                 MANGEBLAN.Visible:=true;
                 score1.Caption:=inttostr(scor1)+' ';
                end
                else
                begin
                scor2:=scor2+2;
                MANGENOIR.Visible:=true;
                score2.Caption:=inttostr(scor2)+' ';
                end;
           end
           else
           begin
              if player=player1 then
              begin
              inc(scor1);
              MANGEBLAN.Visible:=true;
              score1.Caption:=inttostr(scor1)+' ';
             end
            else
            begin
             inc(scor2);
            MANGENOIR.Visible:=true;
            score2.Caption:=inttostr(scor2)+' ';
            end;
         end;
      sg.Cells[mangey[j],mangex[j]]:='1';
      inc(j);
      end;
     if scor1<1 then
         begin
             form1.mangeBLAN.Visible:=false;
             form1.score1.Visible:=false;
         end
         else
         form1.mangeBLAN.Visible:=true;
             form1.score1.Visible:=true;
         begin
         end;
         if scor2<1 then
         begin
             form1.mangeNOIR.Visible:=false;
             
             form1.score2.Visible:=false;
         end
          else
          begin
         form1.mangenoir.Visible:=true;
             form1.score2.Visible:=true;
         end;
          coloration();
          coloration();
          if son.Checked=true then
         windows.Beep(2000,100);
        sleep(500);
      end;

         nbselected:=0;
         nbmange:=0;

         if player=player1 then
         begin
            for i:=0to 9 do
             begin
             if sg.Cells[9,i]=player then
              begin
             sg.Cells[9,i]:='dama1';
             dec(scor2);
             score2.Caption:=inttostr(scor2)+' ';
              score1.Visible:=true;
             end;
             end;
         end
         else if player=player2 then
         begin
            for i:=0to 9 do
             begin
             if sg.Cells[0,i]=player then
             begin
             sg.Cells[0,i]:='dama2';
             dec(scor1);
             score1.Caption:=inttostr(scor1)+' ';
             end;
             end;
         end;

         coloration();
         coloration();
         if player=player1 then begin player:=player2 ;end
       else
       begin
       player :=player1;
       end;

       IF (scor1=nb22) then
         begin
         form1.Timer2.Enabled:=false;
         form1.SG.Enabled:=false;
         backe.Visible:=false;
         showmessage(player1+' is the WINNER ,hhhh 3melt el3ar ya '+player2);
       
         end
         else IF (scor2=nb11) then
         begin
         form1.Timer2.Enabled:=false;
         form1.SG.Enabled:=false;
         backe.Visible:=false;
         showmessage(player2+' is the WINNER ,hhhh 3melt el3ar ya '+player1);

         end
         ELSE

         backe.Visible:=true;

    end;


 end;
 if scor1<1 then
         begin
             form1.mangeBLAN.Visible:=false;
             form1.score1.Visible:=false;
         end
         else
         form1.mangeBLAN.Visible:=true;
             form1.score1.Visible:=true;
         begin
         end;
         if scor2<1 then
         begin
             form1.mangeNOIR.Visible:=false;
             
             form1.score2.Visible:=false;
         end
          else
          begin
         form1.mangenoir.Visible:=true;
             form1.score2.Visible:=true;
         end;

 
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin

sg.SetFocus;
if player=player1 then
begin

panel6.Color:=clblack;panel2.Color:=cllime;


inc(ss1);
if ss1=60 then
begin
 inc(mm1);
 ss1:=0;
 end;
if(mm1=60) then
begin
inc(hh1);
mm1:=0;
end;
label3.Caption:=inttostr(hh1)+':'+inttostr(mm1)+':'+inttostr(ss1);
end
else
begin

panel6.Color:=cllime;panel2.Color:=clblack;


inc(ss);
if ss=60 then
begin
 inc(mm);
 ss:=0;
end;
if(mm=60) then
begin
inc(hh);
mm:=0;
end;
label4.Caption:=inttostr(hh)+':'+inttostr(mm)+':'+inttostr(ss);
end;



end;

procedure TForm1.backeClick(Sender: TObject);
begin
backover();
if player=player1 then
 player:=player2
 else player:=player1;
 coloration();
 coloration();
 backe.Visible:=false;
if scor1<1 then
         begin
             form1.mangeBLAN.Visible:=false;
             form1.score1.Visible:=false;
         end;
         if scor2<1 then
         begin
             form1.mangeNOIR.Visible:=false;
             
             form1.score2.Visible:=false;
         end;
   end;      

procedure TForm1.TREEDClick(Sender: TObject);
begin
 coloration();
  coloration();
end;

end.
