unit uStatistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, TeEngine, Series, TeeProcs, Chart,
  ExtCtrls, IBDatabase, DB, IBCustomDataSet, IBTable, IBQuery, Grids,
  DBGrids, ComCtrls, DbChart, TeeFunci, OleCtrls, DBCtrls, Menus, GanttCh;

type
  TfStatistic = class(TForm)
    Bevel1: TBevel;
    pClient: TPanel;
    IBDatabase1: TIBDatabase;
    IBTransaction: TIBTransaction;
    IBQuery: TIBQuery;
    Bevel2: TBevel;
    Chart: TDBChart;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Series1: TFastLineSeries;
    Series2: TPointSeries;
    gbMark: TGroupBox;
    lUser: TLabel;
    lDN: TLabel;
    lCount: TLabel;
    Bevel4: TBevel;
    lDate: TLabel;
    dtpEnd: TDateTimePicker;
    LabelTo: TLabel;
    dtpStart: TDateTimePicker;
    LabelFrom: TLabel;
    bbChart: TBitBtn;
    chbD1: TCheckBox;
    chbD2: TCheckBox;
    cbD1: TComboBox;
    cbD2: TComboBox;
    rbSmenaD: TRadioButton;
    rbSmenaN: TRadioButton;
    rbSmenaDN: TRadioButton;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery_D: TIBQuery;
    Series3: TFastLineSeries;
    Series4: TPointSeries;
    Series5: TFastLineSeries;
    Series6: TPointSeries;
    IBQuery1CNT: TIntegerField;
    IBQuery1SMN_DATE: TDateField;
    IBQuery1USR_LIST: TIBStringField;
    IBQuery1SMN_DAY_NIGHT: TSmallintField;
    IBQuery2CNT: TIntegerField;
    IBQuery2SMN_DATE: TDateField;
    IBQuery2USR_LIST: TIBStringField;
    IBQuery2SMN_DAY_NIGHT: TSmallintField;
    IBQuery_DCOD_ORD_TYPE: TSmallintField;
    IBQuery_DNAME_ORD_TYPE: TIBStringField;
    Series7: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    EditTheme: TEdit;
    LabelTheme: TLabel;
    IBQueryCNT: TIntegerField;
    IBQuerySMN_DATE: TDateField;
    IBQueryUSR_LIST: TIBStringField;
    IBQuerySMN_DAY_NIGHT: TSmallintField;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    IBQueryS: TIBQuery;
    IntegerField1: TIntegerField;
    IBQueryS1: TIBQuery;
    IntegerField2: TIntegerField;
    IBQueryS2: TIBQuery;
    IntegerField3: TIntegerField;
    Series8: TLineSeries;
    IBQueryAVG: TIBQuery;
    IntegerField5: TIntegerField;
    DateField1: TDateField;
    SmallintField1: TSmallintField;
    RadioButtonAVG: TRadioButton;
    RadioButtonSMN: TRadioButton;
    procedure bbChartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Series2Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series4Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series6Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    function ConnectDB (user_name: string; user_password: string): boolean;
            { Public declarations }
  end;


var
  fStatistic: TfStatistic;

  //настройки бд
  Connected: boolean;
  DB_File_Name: string;
  default_user_name: string;
  default_password: string;

  //цвет графиков
  Color_D1, Color_D2 : TColor;

  ORD_D1, ORD_D2 : integer;
  MM : array [0..11] of string; //месяца
  Days: array[1..7] of string;   //дни недели

implementation
{$R *.dfm}
uses IniFiles;
procedure TfStatistic.bbChartClick(Sender: TObject);
var D1, D2 : TDateTime;
begin
 IBQueryAVG.Active := false;
 IBQuery.Active := false;
 IBQuery1.Active := false;
 IBQuery2.Active := false;
 D2 := dtpEnd.DateTime;
 D1 := dtpStart.DateTime;
 IBQueryAVG.SQL.Clear;
 IBQuery.SQL.Clear;
 IBQuery1.SQL.Clear;
 IBQuery2.SQL.Clear;

 IBQueryAVG.SQL.LoadFromFile('QueryAVG.txt');
 IBQuery.SQL.LoadFromFile('QueryZ.txt');
 IBQuery1.SQL.LoadFromFile('QueryZ1.txt');
 IBQuery2.SQL.LoadFromFile('QueryZ2.txt');

   if rbSmenaD.Checked=true then begin
      IBQueryAVG.SQL.Append('and SMENA.SMN_DAY_NIGHT = 0');
      IBQuery.SQL.Append('and SMENA.SMN_DAY_NIGHT = 0');
      IBQuery1.SQL.Append('and SMENA.SMN_DAY_NIGHT = 0');
      IBQuery2.SQL.Append('and SMENA.SMN_DAY_NIGHT = 0');
      end;
   if rbSmenaN.Checked=true then begin
      IBQueryAVG.SQL.Append('and SMENA.SMN_DAY_NIGHT = 1');
      IBQuery.SQL.Append('and SMENA.SMN_DAY_NIGHT = 1');
      IBQuery1.SQL.Append('and SMENA.SMN_DAY_NIGHT = 1');
      IBQuery2.SQL.Append('and SMENA.SMN_DAY_NIGHT = 1');
      end;

//   if Length(EditTheme.Text)>0 then IBQueryAVG.SQL.Append('and orders.key_theme in ('+EditTheme.Text+')');

   if Length(EditTheme.Text)>0 then IBQuery.SQL.Append('and orders.key_theme in ('+EditTheme.Text+')');
   IBQuery.SQL.Append('group by  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST, SMENA.SMN_DAY_NIGHT');
   if Length(EditTheme.Text)>0 then IBQuery1.SQL.Append('and orders.key_theme in ('+EditTheme.Text+')');
   IBQuery1.SQL.Append('group by  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST, SMENA.SMN_DAY_NIGHT');
   if Length(EditTheme.Text)>0 then IBQuery2.SQL.Append('and orders.key_theme in ('+EditTheme.Text+')');
   IBQuery2.SQL.Append('group by  SMENA.UNIQS, SMENA.SMN_DATE, SMENA.USR_LIST, SMENA.SMN_DAY_NIGHT');
 if (D2<D1)  then begin
   ShowMessage ('Не верно задан интервал дат!');
// end else if (D2>=Dp)  then begin  ShowMessage ('Срок использования окончен!');
   end
 else begin
  IBQuery.ParamByName('D1').AsDateTime := D1;
  IBQuery1.ParamByName('D1').AsDateTime := D1;
  IBQuery2.ParamByName('D1').AsDateTime := D1;
  IBQueryAVG.ParamByName('D1').AsDateTime := D1;  
  IBQuery.ParamByName('D2').AsDateTime := D2;
  IBQuery1.ParamByName('D2').AsDateTime := D2;
  IBQuery2.ParamByName('D2').AsDateTime := D2;
  IBQueryAVG.ParamByName('D2').AsDateTime := D2;
  if chbD1.Checked=true then begin
    if (cbD1.ItemIndex=(-1)) then begin
      ShowMessage ('Выберите параметр Дополнительного графика 1');
    end else begin
      IBQuery1.ParamByName('ORD').AsInteger := cbD1.ItemIndex;
      IBQuery1.Active := true;
    end;
  end;
  if chbD2.Checked=true then begin
    if (cbD2.ItemIndex=(-1)) then begin
      ShowMessage ('Выберите параметр Дополнительного графика 2');
    end else begin
      IBQuery2.ParamByName('ORD').AsInteger := cbD2.ItemIndex;
      IBQuery2.Active := true;
    end;
  end;
  if RadioButtonAVG.Checked=true then IBQueryAVG.Active := true;
  if RadioButtonSMN.Checked=true then IBQuery.Active := true;
  if RadioButtonAVG.Checked=true and RadioButtonSMN.Checked=true then begin
   IBQueryAVG.Active := true;
   IBQuery.Active := true;
   end;
////////////////////
 IBQueryS.Active := false;
 IBQueryS1.Active := false;
 IBQueryS2.Active := false;
 D2 := dtpEnd.DateTime;
 D1 := dtpStart.DateTime;

 IBQueryS.SQL.Clear;
 IBQueryS1.SQL.Clear;
 IBQueryS2.SQL.Clear;

 IBQueryS.SQL.LoadFromFile('QuerySZ.txt');
 IBQueryS1.SQL.LoadFromFile('QuerySZ1.txt');
 IBQueryS2.SQL.LoadFromFile('QuerySZ2.txt');
   if rbSmenaD.Checked=true then begin
      IBQueryS.SQL.Append('and SMENA.SMN_DAY_NIGHT = 0');
      IBQueryS1.SQL.Append('and SMENA.SMN_DAY_NIGHT = 0');
      IBQueryS2.SQL.Append('and SMENA.SMN_DAY_NIGHT = 0');
      end;
   if rbSmenaN.Checked=true then begin
      IBQueryS.SQL.Append('and SMENA.SMN_DAY_NIGHT = 1');
      IBQueryS1.SQL.Append('and SMENA.SMN_DAY_NIGHT = 1');
      IBQueryS2.SQL.Append('and SMENA.SMN_DAY_NIGHT = 1');
      end;
   if Length(EditTheme.Text)>0 then begin
      IBQueryS.SQL.Append('and orders.key_theme in ('+EditTheme.Text+')');
      IBQueryS1.SQL.Append('and orders.key_theme in ('+EditTheme.Text+')');
      IBQueryS2.SQL.Append('and orders.key_theme in ('+EditTheme.Text+')');
      end;
 if (D2<D1)  then begin
   ShowMessage ('Не верно задан интервал дат!');
// end else if (D2>=Dp)  then begin  ShowMessage ('Срок использования окончен!');
   end
 else begin
     IBQueryS.ParamByName('D1').AsDateTime := D1;
     IBQueryS1.ParamByName('D1').AsDateTime := D1;
     IBQueryS2.ParamByName('D1').AsDateTime := D1;
     IBQueryS.ParamByName('D2').AsDateTime := D2;
     IBQueryS1.ParamByName('D2').AsDateTime := D2;
     IBQueryS2.ParamByName('D2').AsDateTime := D2;
     if chbD1.Checked=true then begin
       if (cbD1.ItemIndex=(-1)) then begin
         ShowMessage ('Выберите параметр Дополнительного графика 1');
       end else begin
         IBQueryS1.ParamByName('ORD').AsInteger := cbD1.ItemIndex;
         IBQueryS1.Active := true;
       end;
     end;
     if chbD2.Checked=true then begin
       if (cbD2.ItemIndex=(-1)) then begin
         ShowMessage ('Выберите параметр Дополнительного графика 2');
       end else begin
         IBQueryS2.ParamByName('ORD').AsInteger := cbD2.ItemIndex;
         IBQueryS2.Active := true;
       end;
     end;
     //if RadioButtonAVG.Checked=false then

  if RadioButtonSMN.Checked=true then IBQueryS.Active := true;
  if RadioButtonAVG.Checked=false and RadioButtonSMN.Checked=false then IBQueryS.Active := true;


 end;




   end;
Label1.Caption:=IBQuerys.FieldByName('Cnt').AsString;
Label3.Caption:=IBQuerys1.FieldByName('Cnt').AsString;
Label5.Caption:=IBQuerys2.FieldByName('Cnt').AsString;
end;

procedure TfStatistic.FormCreate(Sender: TObject);
Var
  ini: TIniFile;
  ORD: String;
  Count, i: integer;
begin
   Days[2] := 'понедельник';
   Days[3] := 'вторник';
   Days[4] := 'среда';
   Days[5] := 'четверг';
   Days[6] := 'пятница';
   Days[7] := 'суббота';
   Days[1] := 'воскресенье';
   MM[0]:= 'января';
   MM[1]:= 'февраля';
   MM[2]:= 'марта';
   MM[3]:= 'апреля';
   MM[4]:= 'мая';
   MM[5]:= 'июня';
   MM[6]:= 'июля';
   MM[7]:= 'августа';
   MM[8]:= 'сентября';
   MM[9]:= 'октября';
   MM[10]:= 'ноября';
   MM[11]:= 'декабря';
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'DBConnect.ini');
  Connected         := ini.ReadBool ( 'DataBase', 'Connected', false );
  DB_File_Name      := ini.ReadString ( 'DataBase', 'DataBaseName', '' );
  default_user_name := ini.ReadString ( 'DataBase', 'DefaultUserName', '' );
  default_password  := ini.ReadString ( 'DataBase', 'DefaultPassword', '' );
  Color_D1 := TColor(ini.ReadInteger('Options', 'Color1', clBtnFace));
  Color_D2 := TColor(ini.ReadInteger('Options', 'Color2', clBtnFace));
  ini.Free;
  IBDatabase1.Connected := false;
  IBDatabase1.DatabaseName := DB_File_Name;

  if Connected then begin
    ConnectDB (default_user_name, default_password);
  end;

  dtpEnd.Date := now;
  dtpStart.Date := now;

  Label3.Font.Color := Color_D1;
  chbD1.Font.Color := Color_D1;
  Series3.SeriesColor := Color_D1;
  Series4.Pointer.Brush.Color := Color_D1;

  chbD2.Font.Color := Color_D2;
  Label5.Font.Color := Color_D2;
  Series5.SeriesColor := Color_D2;
  Series6.Pointer.Brush.Color := Color_D2;

  cbD1.Items.Clear;
  cbD2.Items.Clear;
  IBQuery_D.Active := true;
  IBQuery_D.Last;
  Count := IBQuery_D.RecordCount;
  IBQuery_D.RecNo := 0;
  for i:=1 to Count do begin
    IBQuery_D.RecNo := i;
    ORD := IBQuery_D.FieldByName('NAME_ORD_TYPE').AsString+ ' (' + IBQuery_D.FieldByName('COD_ORD_TYPE').AsString + ')';
    cbD1.Items.Append(ORD);
    cbD2.Items.Append(ORD);
    IBQuery_D.RecNo := i;
  end;
end;

function TfStatistic.ConnectDB(user_name: string; user_password: string): boolean;
begin
  result := false;
  IBDatabase1.Connected := false;
  IBDatabase1.DatabaseName := DB_File_Name;
  IBDatabase1.Params.Clear;
  IBDatabase1.Params.Add('user_name=' + user_name );
  IBDatabase1.Params.Add('password=' + user_password );
  IBDatabase1.Params.Add('lc_ctype=WIN1251');
  try
    IBDatabase1.Connected := true;
    IBTransaction.Active := true;
    result := true;
  except
    Application.MessageBox('Ошибка подлючения к базе данных.', 'Ошибка', MB_ICONERROR or MB_OK	);
  end;
end;

procedure TfStatistic.Series2Click(Sender: TChartSeries;ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
var month : string;
    i : integer;
begin
 IBQuery.RecNo := ValueIndex+1;
 lUser.Caption :=  'Диспетчера:     '+IBQuery.FieldByName('USR_LIST').AsString;
 if (IBQuery.FieldByName('SMN_DAY_NIGHT').AsInteger=1)  then
     lDN.Caption := 'ночь'
   else lDN.Caption := 'день' ;
 lCount.Caption := 'Количество заказов:      '+IBQuery.FieldByName('Cnt').AsString;
 month := IBQuery.FieldByName('SMN_DATE').AsString;
 i := StrToInt (month[4]+month[5]);
 month := month[1]+month[2]+'  '+MM[i-1]+'  '+month[7]+month[8]+month[9]+month[10];
 lDate.Caption := 'Дата:       '+ month+ '  ' + Days[DayOfWeek(IBQuery.FieldByName('SMN_DATE').AsDateTime)];
end;

procedure TfStatistic.Series4Click(Sender: TChartSeries;  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
var month : string;
    i : integer;
begin
 IBQuery1.RecNo := ValueIndex+1;
 lUser.Caption :=  'Диспетчера:     '+IBQuery1.FieldByName('USR_LIST').AsString;
 if (IBQuery1.FieldByName('SMN_DAY_NIGHT').AsInteger=1)  then
     lDN.Caption := 'ночь'
   else lDN.Caption := 'день' ;
 lCount.Caption := 'Количество заказов:      '+IBQuery1.FieldByName('Cnt').AsString;
 month := IBQuery1.FieldByName('SMN_DATE').AsString;
 i := StrToInt (month[4]+month[5]);
 month := month[1]+month[2]+'  '+MM[i-1]+'  '+month[7]+month[8]+month[9]+month[10];
 lDate.Caption := 'Дата:       '+ month + '  '+ Days[DayOfWeek(IBQuery1.FieldByName('SMN_DATE').AsDateTime)];
end;

procedure TfStatistic.Series6Click(Sender: TChartSeries;  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);
var month : string;
    i : integer;
begin
 IBQuery2.RecNo := ValueIndex+1;
 lUser.Caption :=  'Диспетчера:     '+IBQuery2.FieldByName('USR_LIST').AsString;
 if (IBQuery2.FieldByName('SMN_DAY_NIGHT').AsInteger=1)  then
     lDN.Caption := 'ночь'
   else lDN.Caption := 'день' ;
 lCount.Caption := 'Количество заказов:      '+IBQuery2.FieldByName('Cnt').AsString;
 month := IBQuery2.FieldByName('SMN_DATE').AsString;
 i := StrToInt (month[4]+month[5]);
 month := month[1]+month[2]+'  '+MM[i-1]+'  '+month[7]+month[8]+month[9]+month[10];
 lDate.Caption := 'Дата:       '+ month + '  '+Days[DayOfWeek(IBQuery2.FieldByName('SMN_DATE').AsDateTime)];
 end;

end.
