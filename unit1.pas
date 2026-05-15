unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Menus, ECAccordion, ECEditBtns, ECSwitch, tcp_udpport,
  ISOTCPDriver, PLCBlock, PLCBlockElement, TagBit, HMIEdit, strutils,
  TAGraph, TASources, TASeries, TATransformations, Math, windows, TAChartUtils,
  Process, WinSock, JwaIpHlpAPI, JwaIpRtrMib;

function DwmGetWindowAttribute(hwnd: HWND; dwAttribute: DWORD; pvAttribute: PVOID; cbAttribute: DWORD): HRESULT; stdcall; external 'dwmapi.dll';

type

  { TForm1 }

  TForm1 = class(TForm)
    AccordionItem1: TAccordionItem;
    AccordionItem2: TAccordionItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ButtonComputerName: TButton;
    ButtonGetIPAddress: TButton;
    ButtonClear: TButton;
    ButtonIpconfig: TButton;
    ButtonIpconfigAl: TButton;
    ButtonPing: TButton;
    Chart2LineSeries1: TLineSeries;
    Chart6: TChart;
    Chart6LineSeries1: TLineSeries;
    Chart6LineSeries2: TLineSeries;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    ChartForceManual: TChart;
    ChartForceManualLineSeries6: TLineSeries;
    ChartForceManualLineSeries7: TLineSeries;
    ChartForceManualLineSeries5: TLineSeries;
    ChartMenu: TPopupMenu;
    ChartRefreshMenu: TMenuItem;
    ChartZoomOutMenu: TMenuItem;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    DB101_DBD1330: TPLCBlockElement;
    DB1XX_DBD912: TPLCBlockElement;
    DB1XX_DBD916: TPLCBlockElement;
    DB1XX_DBD920: TPLCBlockElement;
    DB1XX_DBD924: TPLCBlockElement;
    DB1XX_DBD928: TPLCBlockElement;
    DB1XX_DBD932: TPLCBlockElement;
    DB1XX_DBD936: TPLCBlockElement;
    DB1XX_DBD940: TPLCBlockElement;
    DB1XX_DBD944: TPLCBlockElement;
    DB1XX_DBD948: TPLCBlockElement;
    DB1XX_DBD960: TPLCBlockElement;
    DB1XX_DBD964: TPLCBlockElement;
    DB1XX_DBD968: TPLCBlockElement;
    DB1XX_DBD972: TPLCBlockElement;
    DB1XX_DBD976: TPLCBlockElement;
    DB1XX_DBD980: TPLCBlockElement;
    DB1XX_DBD984: TPLCBlockElement;
    DB1XX_DBD988: TPLCBlockElement;
    DB1XX_DBD992: TPLCBlockElement;
    DB1XX_DBD996: TPLCBlockElement;
    DB1XX_DBW310: TPLCBlockElement;
    DB1XX_DBWXX_Source1: TPLCBlockElement;
    DB1XX_DBW312: TPLCBlockElement;
    DB1XX_DBW320: TPLCBlockElement;
    DB1XX_DBW322: TPLCBlockElement;
    DB1XX_DBW332: TPLCBlockElement;
    DB1XX_DBW334: TPLCBlockElement;
    DB1XX_DBW342: TPLCBlockElement;
    DB1XX_DBW344: TPLCBlockElement;
    DB110_DBD1330: TPLCBlockElement;
    DB101_DBD1062: TPLCBlockElement;
    DB111_DBD1330: TPLCBlockElement;
    DB112_DBD1330: TPLCBlockElement;
    DB113_DBD1330: TPLCBlockElement;
    DB114_DBD1330: TPLCBlockElement;
    DB115_DBD1330: TPLCBlockElement;
    DB116_DBD1330: TPLCBlockElement;
    DB102_DBD1330: TPLCBlockElement;
    DB103_DBD1330: TPLCBlockElement;
    DB104_DBD1330: TPLCBlockElement;
    DB105_DBD1330: TPLCBlockElement;
    DB106_DBD1330: TPLCBlockElement;
    DB107_DBD1330: TPLCBlockElement;
    DB108_DBD1330: TPLCBlockElement;
    DB109_DBD1330: TPLCBlockElement;
    DB110_DBD1062: TPLCBlockElement;
    DB111_DBD1062: TPLCBlockElement;
    DB112_DBD1062: TPLCBlockElement;
    DB113_DBD1062: TPLCBlockElement;
    DB114_DBD1062: TPLCBlockElement;
    DB115_DBD1062: TPLCBlockElement;
    DB116_DBD1062: TPLCBlockElement;
    DB102_DBD1062: TPLCBlockElement;
    DB103_DBD1062: TPLCBlockElement;
    DB104_DBD1062: TPLCBlockElement;
    DB105_DBD1062: TPLCBlockElement;
    DB106_DBD1062: TPLCBlockElement;
    DB107_DBD1062: TPLCBlockElement;
    DB108_DBD1062: TPLCBlockElement;
    DB109_DBD1062: TPLCBlockElement;
    DB101_L: TPLCBlock;
    DB110_L: TPLCBlock;
    DB111_L: TPLCBlock;
    DB112_L: TPLCBlock;
    DB113_L: TPLCBlock;
    DB114_L: TPLCBlock;
    DB115_L: TPLCBlock;
    DB116_L: TPLCBlock;
    DB102_L: TPLCBlock;
    DB103_L: TPLCBlock;
    DB104_L: TPLCBlock;
    DB105_L: TPLCBlock;
    DB106_L: TPLCBlock;
    DB107_L: TPLCBlock;
    DB108_L: TPLCBlock;
    DB109_L: TPLCBlock;
    DB101_R: TPLCBlock;
    DB110_R: TPLCBlock;
    DB111_R: TPLCBlock;
    DB112_R: TPLCBlock;
    DB113_R: TPLCBlock;
    DB114_R: TPLCBlock;
    DB115_R: TPLCBlock;
    DB116_R: TPLCBlock;
    DB102_R: TPLCBlock;
    DB103R: TPLCBlock;
    DB104_R: TPLCBlock;
    DB105_R: TPLCBlock;
    DB106_R: TPLCBlock;
    DB107_R: TPLCBlock;
    DB108_R: TPLCBlock;
    DB109_R: TPLCBlock;
    DB1XX_DBWXX_Source2: TPLCBlockElement;
    DB1XX_DBWXX_Source3: TPLCBlockElement;
    DB1XX_Left_Act: TPLCBlock;
    DB1XX_Left_Set: TPLCBlock;
    DB1XX_Left_Ramp: TPLCBlock;
    DB1XX_SourceRecord1: TPLCBlock;
    DB1XX_Right_Act: TPLCBlock;
    DB1XX_Right_Ramp: TPLCBlock;
    DB1XX_Right_Set: TPLCBlock;
    DB1XX_SourceRecord2: TPLCBlock;
    DB1XX_SourceRecord3: TPLCBlock;
    ECAccordion1: TECAccordion;
    ECSpeedBtn1: TECSpeedBtn;
    ECSpeedBtn2: TECSpeedBtn;
    ECSpeedBtn3: TECSpeedBtn;
    ECSpeedBtn4: TECSpeedBtn;
    ECSpeedBtn5: TECSpeedBtn;
    ECSpeedBtn6: TECSpeedBtn;
    ECSpeedBtn7: TECSpeedBtn;
    ECSpeedBtn8: TECSpeedBtn;
    ECSwitch1: TECSwitch;
    ECSwitch2: TECSwitch;
    ECSwitch3: TECSwitch;
    ECSwitch4: TECSwitch;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    HMIEdit1: THMIEdit;
    HMIEdit10: THMIEdit;
    HMIEdit11: THMIEdit;
    HMIEdit12: THMIEdit;
    HMIEdit13: THMIEdit;
    HMIEdit14: THMIEdit;
    HMIEdit15: THMIEdit;
    HMIEdit16: THMIEdit;
    HMIEdit17: THMIEdit;
    HMIEdit18: THMIEdit;
    HMIEdit19: THMIEdit;
    HMIEdit2: THMIEdit;
    HMIEdit20: THMIEdit;
    HMIEdit21: THMIEdit;
    HMIEdit22: THMIEdit;
    HMIEdit23: THMIEdit;
    HMIEdit24: THMIEdit;
    HMIEdit25: THMIEdit;
    HMIEdit26: THMIEdit;
    HMIEdit27: THMIEdit;
    HMIEdit28: THMIEdit;
    HMIEdit29: THMIEdit;
    HMIEdit3: THMIEdit;
    HMIEdit30: THMIEdit;
    HMIEdit31: THMIEdit;
    HMIEdit32: THMIEdit;
    HMIEdit33: THMIEdit;
    HMIEdit34: THMIEdit;
    HMIEdit35: THMIEdit;
    HMIEdit36: THMIEdit;
    HMIEdit37: THMIEdit;
    HMIEdit38: THMIEdit;
    HMIEdit39: THMIEdit;
    HMIEdit4: THMIEdit;
    HMIEdit40: THMIEdit;
    HMIEdit41: THMIEdit;
    HMIEdit42: THMIEdit;
    HMIEdit43: THMIEdit;
    HMIEdit44: THMIEdit;
    HMIEdit45: THMIEdit;
    HMIEdit46: THMIEdit;
    HMIEdit47: THMIEdit;
    HMIEdit48: THMIEdit;
    HMIEdit49: THMIEdit;
    HMIEdit5: THMIEdit;
    HMIEdit50: THMIEdit;
    HMIEdit51: THMIEdit;
    HMIEdit52: THMIEdit;
    HMIEdit53: THMIEdit;
    HMIEdit54: THMIEdit;
    HMIEdit55: THMIEdit;
    HMIEdit56: THMIEdit;
    HMIEdit57: THMIEdit;
    HMIEdit58: THMIEdit;
    HMIEdit59: THMIEdit;
    HMIEdit6: THMIEdit;
    HMIEdit60: THMIEdit;
    HMIEdit61: THMIEdit;
    HMIEdit62: THMIEdit;
    HMIEdit63: THMIEdit;
    HMIEdit7: THMIEdit;
    HMIEdit8: THMIEdit;
    HMIEdit9: THMIEdit;
    Image2: TImage;
    ISOTCPDriver1: TISOTCPDriver;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_Source10: TLabel;
    Label_Source11: TLabel;
    Label_Source7: TLabel;
    Label_Source8: TLabel;
    Label_Source9: TLabel;
    ListChartSource5: TListChartSource;
    Memo1: TMemo;
    Memo2: TMemo;
    MenuItem1: TMenuItem;
    PageControl1: TPageControl;
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    SSC: TMenuItem;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TCP_UDPPort1: TTCP_UDPPort;
    Timer1: TTimer;
    Timer2: TTimer;
    _Base_: TListChartSource;
    _Source1_: TListChartSource;
    _Source2_: TListChartSource;
    ListChartSource7: TListChartSource;
    ListChartSource6: TListChartSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonComputerNameClick(Sender: TObject);
    procedure ButtonGetIPAddressClick(Sender: TObject);
    procedure ButtonIpconfigAlClick(Sender: TObject);
    procedure ButtonIpconfigClick(Sender: TObject);
    procedure ButtonPingClick(Sender: TObject);
    procedure ChartForceManualClick(Sender: TObject);
    procedure ChartRefreshMenuClick(Sender: TObject);
    procedure ChartZoomOutMenuClick(Sender: TObject);
    procedure CheckBox1EditingDone(Sender: TObject);
    procedure ComboBox1EditingDone(Sender: TObject);
    procedure ComboBox2EditingDone(Sender: TObject);
    procedure ComboBox3EditingDone(Sender: TObject);
    procedure ComboBox4EditingDone(Sender: TObject);
    procedure ComboBox5EditingDone(Sender: TObject);
    procedure ComboBox6EditingDone(Sender: TObject);
    procedure ComboBox7EditingDone(Sender: TObject);
    procedure ComboBox8EditingDone(Sender: TObject);
    procedure ECSpeedBtn1Click(Sender: TObject);
    procedure ECSpeedBtn2Click(Sender: TObject);
    procedure ECSpeedBtn3Click(Sender: TObject);
    procedure ECSpeedBtn4Click(Sender: TObject);
    procedure ECSpeedBtn5Click(Sender: TObject);
    procedure ECSpeedBtn6Click(Sender: TObject);
    procedure ECSpeedBtn7Click(Sender: TObject);
    procedure ECSpeedBtn8Click(Sender: TObject);
    procedure ECSwitch4Click(Sender: TObject);
    procedure Edit1EditingDone(Sender: TObject);
    procedure Edit2EditingDone(Sender: TObject);
    procedure Edit3EditingDone(Sender: TObject);
    procedure Edit4EditingDone(Sender: TObject);
    procedure Edit5EditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label_Source8Click(Sender: TObject);
    procedure SSCClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public
    Function RepairIPAddress(s: string):string;
    Function CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean; //True=Error
    procedure ScreenshotToFile(const Filename: string; Monitor_: integer);
    function get_ss_of(window: hwnd; var bmp: graphics.TBitmap): integer;
    procedure Log(const s : string);
    procedure Log(Const Fmt : String; const Args : Array of const);
  end;

var
  Form1: TForm1;
  Base_: array of float;
  CurrentSource1: array of float;
  TargetSource1: array of float;
  CurrentSource2: array of float;
  TargetSource2: array of float;

  TotalPointerX:integer;
  ChartMin:float;
  ChartMax:float;
  ChartForceManualMin:float;
  ChartForceManualMax:float;
  Chatr_Zoom:integer;
  Chart_Enter:boolean;
  RunChart:boolean;

  StartRecord:boolean;
  Directory_:string;
  fileout : TextFile;
  S_Name:string;
  File_OK:Boolean;
  Txt:String;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Log(const s : string);
begin
  Memo2.Lines.Add(s);
end;

procedure TForm1.Log(const Fmt : String; const Args : array of const);
begin
  Log(Format(Fmt,Args));
end;

function TForm1.get_ss_of(window: hwnd; var bmp: graphics.TBitmap): integer;
var
  outer: TRect;
  dc: HDC;
begin
  result := 0; // 0 = success
  if not IsWindow(window) then exit(1);
  if not (DwmGetWindowAttribute(window, 9{DWMWA_EXTENDED_FRAME_BOUNDS}, @outer, sizeof(outer)) = S_OK) then exit(2);
  bmp.Width := outer.Width;
  bmp.Height := outer.Height;
  bmp.PixelFormat := pf24bit;
  dc := GetDC(GetDesktopWindow);
  bmp.BeginUpdate(true);
  if not BitBlt(bmp.Canvas.Handle, 0, 0, outer.Width, outer.Height, dc, outer.Left, outer.Top, SRCCOPY) then result := 3;
  bmp.EndUpdate(true);
  bmp.Canvas.Changed;
  ReleaseDC(GetDesktopWindow, dc);
end;

procedure TForm1.ScreenshotToFile(const Filename: string; Monitor_: integer);
var
  BMP: Graphics.TBitmap;
  ScreenDC: HDC;
  M: TMonitor;
  W, H, X0, Y0: integer;
begin
  // Initialize coordinates of full composite area
  X0 := Screen.DesktopLeft;
  Y0 := Screen.DesktopTop;
  W  := Screen.DesktopWidth;
  H  := Screen.DesktopHeight;
  // Monitor=-1 takes entire screen, otherwise takes specified monitor
  if (Monitor_ >= 0) and (Monitor_ < Screen.MonitorCount) then begin
    M  := Screen.Monitors[Monitor_];
    X0 := M.Left;
    Y0 := M.Top;
    W  := M.Width;
    H  := M.Height;
  end;
  // prepare the bitmap
  BMP := Graphics.TBitmap.Create;
  BMP.Width  := W;
  BMP.Height := H;
  BMP.Canvas.Brush.Color := clWhite;
  BMP.Canvas.FillRect(0, 0, W, H);
  ScreenDC := GetDC(GetDesktopWindow);
  // copy the required area:
  BitBlt(BMP.Canvas.Handle, 0, 0, W, H, ScreenDC, X0, Y0, SRCCOPY);
  ReleaseDC(0, ScreenDC);
  // save to file (possibly to TStream, etc.)
  BMP.SaveToFile(Filename);
  BMP.Free;
end;

Function TForm1.CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean; //True=Error
var
  tfOut: TextFile;
begin
  result:= false;

  if(C_DNAME<>'')then
  if Not DirectoryExists(C_DNAME) Then
  begin
    {$I-}
    //{$I-} or {$IOCHECKS OFF}
    //{$I-} rewrite (f); {$I+}
    //if IOResult<>0 then begin Writeln ('Error opening file: "file.txt"'); exit; end;
    mkdir(C_DNAME);
    {$I+}
    if IOResult<>0 then
    begin
      Debug_.Append('Directory '+C_DNAME+' error occurred. Details: '+ EInOutError.ClassName);
      ShowMessage('Cannot create '+C_DNAME+' directory. Details: '+ EInOutError.ClassName);
      result:= true;
    end;
  end;

end;

Function TForm1.RepairIPAddress(s: string):string;
var
  i:integer;
  k:integer;
  s2:string;
  c:integer;
  A_s: TStringArray;
begin

  //Edit1.Text:=chr(ord('0'));
  //Edit1.Text:=IntToStr(ord('9');

  s:=Trim(s);
  //s:=leftstr(s,15);

  s2:='';
  for i:=1 to length(s) do
  begin
    if (((ord(s[i]) >= 48) and (ord(s[i]) <= 57)) or (s[i] = '.')) then s2:=s2+s[i];
  end;
  s:=s2;

  if length(s) = 0 then s:=s+'0.0.0.0';

  if (s[1] = '.') then s:='0'+s;

  k:=0;
  for i:=1 to length(s) do
  begin
    if(s[i] = '.') then k:=k+1;
  end;
  if k=0 then s:=s+'.0.0.0';
  if k=1 then s:=s+'.0.0';
  if k=2 then s:=s+'.0';
  if s[length(s)]='.' then s:=s+'0';

  k:=0;
  c:=0;
  s2:='';
  for i:=1 to length(s) do
  begin
    if(s[i] = '.') then begin k:=k+1; c:=0; end;
    if (k>3) then
      begin
        s2:=s2;
      end
    else
      begin
        if not(s[i] = '.')then c:=c+1;
        if (c<=3) then s2:=s2+s[i];
      end;
  end;
  s:=s2;

  A_s:=SplitString(s,'.');

  k:=0;
  Try
    k:=StrToInt(A_s[0]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[1]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[2]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[3]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  result := s;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  if not TCP_UDPPort1.Active  then
  begin
    StartRecord:=false;
    TCP_UDPPort1.EnableAutoReconnect:=true;
    TCP_UDPPort1.ExclusiveDevice:=true;
    TCP_UDPPort1.Active:=true;
    Button1.Caption:='Disconnect';
    Timer1.Enabled:=true;
    Timer2.Enabled:=true;
    exit;
  end;

  if TCP_UDPPort1.Active  then
  begin
    Timer1.Enabled:=false;
    Timer2.Enabled:=false;
    ECSwitch4.State:=cbUnchecked;
    TCP_UDPPort1.EnableAutoReconnect:=false;
    TCP_UDPPort1.ExclusiveDevice:=false;
    TCP_UDPPort1.Active:=false;
    Button1.Caption:='Connect';
    StartRecord:=false;
    exit;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

    ChartForceManual.Extent.YMax := 0;
    ChartForceManual.ExtentSizeLimit.YMax:= 0;
    ChartForceManualMax:=ChartForceManual.Extent.YMax;
    Edit3.Text:=ChartForceManualMax.ToString;

    ChartForceManual.Extent.YMin := 0;
    ChartForceManual.ExtentSizeLimit.YMin := 0;
    ChartForceManualMin:=ChartForceManual.Extent.YMin;
    Edit4.Text:=ChartForceManualMin.ToString;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ListChartSource5.Clear;
  ListChartSource6.Clear;
  ListChartSource7.Clear;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  RunChart:=not RunChart;
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  memo2.Clear;
end;

procedure TForm1.ButtonComputerNameClick(Sender: TObject);
var
ComputerName: Array [0 .. 256] of char;
Size: DWORD;
begin
     Size := 256;
     GetComputerName(ComputerName, Size);
     Log('>> %s',[ComputerName]);
end;

procedure TForm1.ButtonGetIPAddressClick(Sender: TObject);
var
  Ret: DWord;
  Table: PMib_IPAddrTable;
  TableSize: ULong;
  i: Integer;
  //Row: PMib_IPAddrRow;
  Addr: IN_ADDR;
begin
  // We begin by assuming there's just one entry, so we allocate space
  // for that one
  TableSize := SizeOf(Table^);
  GetMem(Table, TableSize);
  try
    // Request a list of IP addresses, unsorted
    Ret := GetIpAddrTable(Table, TableSize, False);
    case Ret of
      No_Error: ; // No error. Continue at the end of the case statement
      Error_Insufficient_Buffer:
      begin
        // Oops. Space for just one entry wasn't enough. Allocate more.
        ReallocMem(Table, TableSize);
        Ret := GetIpAddrTable(Table, TableSize, False);
        if Ret <> No_Error then
        begin
          // Function expects signed value, but Ret is unsigned. Type
          // cast to avoid range-check error, however unlikely.
          RaiseLastOSError(Integer(Ret));
        end;
      end;
    else
      RaiseLastOSError(Integer(Ret));
    end;
  //writeln(Table.dwNumEntries, ' entries:');

  if Table^.dwNumEntries > 0 then
  begin
    //Row := @Table^.Table[0];
    //for i := 0 to Pred(Table^.dwNumEntries) do
    //begin
    //  //writeln(inet_ntoa(in_addr(Row.dwAddr)));
    //  log(inet_ntoa(in_addr(Row^.dwAddr)));
    //  Inc(Row);
    //end;

    for i := 0 to Table^.dwNumEntries-1 do
    begin
      // Convert ADDR to String and add to IPList
      Addr.S_addr := Table^.table[i].dwAddr;
      // Prevent implicit string conversion warning in D2009 by explicit cast to string
      log(inet_ntoa(Addr));
    end;

  end;
  finally
    FreeMem(Table);
  end;
end;

procedure TForm1.ButtonIpconfigAlClick(Sender: TObject);
const
  BUF_SIZE = 2048; // Buffer size for reading the output in chunks

var
  AProcess     : TProcess;
  OutputStream : TStream;
  BytesRead    : longint;
  Buffer       : array[1..BUF_SIZE] of byte;
begin
  // Set up the process; as an example a recursive directory search is used
  // because that will usually result in a lot of data.
  AProcess := TProcess.Create(nil);

  // The commands for Windows and *nix are different hence the $IFDEFs
  {$IFDEF Windows}
    // In Windows the dir command cannot be used directly because it's a build-in
    // shell command. Therefore cmd.exe and the extra parameters are needed.
    AProcess.Executable := 'c:\windows\system32\cmd.exe';
    AProcess.Parameters.Add('/c');
    AProcess.Parameters.Add('ipconfig /all');     //'dir /s c:\windows' //'dir /w'
  {$ENDIF Windows}

  // Process option poUsePipes has to be used so the output can be captured.
  // Process option poWaitOnExit can not be used because that would block
  // this program, preventing it from reading the output data of the process.
  AProcess.Options := [poUsePipes];

  AProcess.ShowWindow:=swoHide;   //swoShow   //swoHide
  Log('>> %s',['Please wait']);

  // Start the process (run the dir/ls command)
  AProcess.Execute;

  // Create a stream object to store the generated output in. This could
  // also be a file stream to directly save the output to disk.
  OutputStream := TMemoryStream.Create;

  // All generated output from AProcess is read in a loop until no more data is available
  repeat
    // Get the new data from the process to a maximum of the buffer size that was allocated.
    // Note that all read(...) calls will block except for the last one, which returns 0 (zero).
    BytesRead := AProcess.Output.Read(Buffer, BUF_SIZE);

    // Add the bytes that were read to the stream for later usage
    OutputStream.Write(Buffer, BytesRead)

  until BytesRead = 0;  // Stop if no more data is available

  // The process has finished so it can be cleaned up
  AProcess.Free;

  // Or the data can be shown on screen
  with TStringList.Create do
  begin
    OutputStream.Position := 0; // Required to make sure all data is copied from the start
    LoadFromStream(OutputStream);
    Log('>> %s',[Text]);
    Free
  end;

  // Clean up
  OutputStream.Free;
end;

procedure TForm1.ButtonIpconfigClick(Sender: TObject);
const
  BUF_SIZE = 2048; // Buffer size for reading the output in chunks

var
  AProcess     : TProcess;
  OutputStream : TStream;
  BytesRead    : longint;
  Buffer       : array[1..BUF_SIZE] of byte;
begin
  // Set up the process; as an example a recursive directory search is used
  // because that will usually result in a lot of data.
  AProcess := TProcess.Create(nil);

  // The commands for Windows and *nix are different hence the $IFDEFs
  {$IFDEF Windows}
    // In Windows the dir command cannot be used directly because it's a build-in
    // shell command. Therefore cmd.exe and the extra parameters are needed.
    AProcess.Executable := 'c:\windows\system32\cmd.exe';
    AProcess.Parameters.Add('/c');
    AProcess.Parameters.Add('ipconfig');     //'dir /s c:\windows' //'dir /w'
  {$ENDIF Windows}

  // Process option poUsePipes has to be used so the output can be captured.
  // Process option poWaitOnExit can not be used because that would block
  // this program, preventing it from reading the output data of the process.
  AProcess.Options := [poUsePipes];

  AProcess.ShowWindow:=swoHide;   //swoShow   //swoHide
  Log('>> %s',['Please wait']);

  // Start the process (run the dir/ls command)
  AProcess.Execute;

  // Create a stream object to store the generated output in. This could
  // also be a file stream to directly save the output to disk.
  OutputStream := TMemoryStream.Create;

  // All generated output from AProcess is read in a loop until no more data is available
  repeat
    // Get the new data from the process to a maximum of the buffer size that was allocated.
    // Note that all read(...) calls will block except for the last one, which returns 0 (zero).
    BytesRead := AProcess.Output.Read(Buffer, BUF_SIZE);

    // Add the bytes that were read to the stream for later usage
    OutputStream.Write(Buffer, BytesRead)

  until BytesRead = 0;  // Stop if no more data is available

  // The process has finished so it can be cleaned up
  AProcess.Free;

  // Or the data can be shown on screen
  with TStringList.Create do
  begin
    OutputStream.Position := 0; // Required to make sure all data is copied from the start
    LoadFromStream(OutputStream);
    Log('>> %s',[Text]);
    Free
  end;

  // Clean up
  OutputStream.Free;
end;

procedure TForm1.ButtonPingClick(Sender: TObject);
const
  BUF_SIZE = 2048; // Buffer size for reading the output in chunks

var
  AProcess     : TProcess;
  OutputStream : TStream;
  BytesRead    : longint;
  Buffer       : array[1..BUF_SIZE] of byte;
begin
  // Set up the process; as an example a recursive directory search is used
  // because that will usually result in a lot of data.
  AProcess := TProcess.Create(nil);

  // The commands for Windows and *nix are different hence the $IFDEFs
  {$IFDEF Windows}
    // In Windows the dir command cannot be used directly because it's a build-in
    // shell command. Therefore cmd.exe and the extra parameters are needed.
    AProcess.Executable := 'c:\windows\system32\cmd.exe';
    AProcess.Parameters.Add('/c');
    AProcess.Parameters.Add('ping '+Edit5.Caption);     //'dir /s c:\windows' //'dir /w'
  {$ENDIF Windows}

  // Process option poUsePipes has to be used so the output can be captured.
  // Process option poWaitOnExit can not be used because that would block
  // this program, preventing it from reading the output data of the process.
  AProcess.Options := [poUsePipes];

  AProcess.ShowWindow:=swoHide;   //swoShow   //swoHide
  Log('>> %s',['Please wait']);

  // Start the process (run the dir/ls command)
  AProcess.Execute;

  // Create a stream object to store the generated output in. This could
  // also be a file stream to directly save the output to disk.
  OutputStream := TMemoryStream.Create;

  // All generated output from AProcess is read in a loop until no more data is available
  repeat
    // Get the new data from the process to a maximum of the buffer size that was allocated.
    // Note that all read(...) calls will block except for the last one, which returns 0 (zero).
    BytesRead := AProcess.Output.Read(Buffer, BUF_SIZE);

    // Add the bytes that were read to the stream for later usage
    OutputStream.Write(Buffer, BytesRead)

  until BytesRead = 0;  // Stop if no more data is available

  // The process has finished so it can be cleaned up
  AProcess.Free;

  // Or the data can be shown on screen
  with TStringList.Create do
  begin
    OutputStream.Position := 0; // Required to make sure all data is copied from the start
    LoadFromStream(OutputStream);
    Log('>> %s',[Text]);
    Free
  end;

  // Clean up
  OutputStream.Free;
end;

procedure TForm1.ChartForceManualClick(Sender: TObject);
begin
  ChartForceManual.Tag :=1;
end;

procedure TForm1.ChartRefreshMenuClick(Sender: TObject);
begin
  ChartForceManual.Tag:=0;
  Chatr_Zoom:=0;
end;

procedure TForm1.ChartZoomOutMenuClick(Sender: TObject);
var
  AC: TDoublePoint;
  AZ: TDoubleRect;
begin
  ChartForceManual.Tag:=1;
  AC:=ChartForceManual.LogicalExtent.a;
  AC.X:=AC.X-2;
  AC.Y:=AC.Y-2;
  AZ.a:=AC;
  AC:=ChartForceManual.LogicalExtent.b;
  AC.X:=AC.X+2;
  AC.Y:=AC.Y+2;
  AZ.b:=AC;
  ChartForceManual.LogicalExtent:=AZ;
  Chatr_Zoom:=Chatr_Zoom-5;
end;

procedure TForm1.CheckBox1EditingDone(Sender: TObject);
begin
  if (CheckBox1.Checked) then
  begin
    Edit3.Enabled:=false;
    Edit4.Enabled:=false;
  end;
  if (not CheckBox1.Checked) then
  begin
    Edit3.Enabled:=true;
    Edit4.Enabled:=true;
  end;
end;


procedure TForm1.ComboBox1EditingDone(Sender: TObject);
begin
  if not TCP_UDPPort1.Active  then
  begin
    DB1XX_Left_Set.MemFile_DB:=100+ ComboBox1.ItemIndex +1;
    DB1XX_Left_Act.MemFile_DB:=100+ ComboBox1.ItemIndex +1;
    DB1XX_Left_Ramp.MemFile_DB:=100+ ComboBox1.ItemIndex +1;

    HMIEdit33.Hint := 'DB'+DB1XX_Left_Set.MemFile_DB.ToString+'.DBW310';
    HMIEdit34.Hint := 'DB'+DB1XX_Left_Set.MemFile_DB.ToString+'.DBD312';
    HMIEdit35.Hint := 'DB'+DB1XX_Left_Act.MemFile_DB.ToString+'.DBD320';
    HMIEdit36.Hint := 'DB'+DB1XX_Left_Act.MemFile_DB.ToString+'.DBD322';

    HMIEdit37.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD912';
    HMIEdit38.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD916';
    HMIEdit39.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD920';
    HMIEdit40.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD924';
    HMIEdit41.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD928';
    HMIEdit42.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD932';
    HMIEdit43.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD936';
    HMIEdit44.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD940';
    HMIEdit45.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD944';
    HMIEdit46.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD948';

    exit;
  end;

  if TCP_UDPPort1.Active  then
  begin
    //Timer1.Enabled:=false;
    //TCP_UDPPort1.EnableAutoReconnect:=false;
    //TCP_UDPPort1.ExclusiveDevice:=false;
    //TCP_UDPPort1.Active:=false;
    //Button1.Caption:='Connect';

    DB1XX_Left_Set.MemFile_DB:=100+ ComboBox1.ItemIndex +1;
    DB1XX_Left_Act.MemFile_DB:=100+ ComboBox1.ItemIndex +1;
    DB1XX_Left_Ramp.MemFile_DB:=100+ ComboBox1.ItemIndex +1;

    //TCP_UDPPort1.EnableAutoReconnect:=true;
    //TCP_UDPPort1.ExclusiveDevice:=true;
    //TCP_UDPPort1.Active:=true;
    //Button1.Caption:='Disconnect';
    //Timer1.Enabled:=true;

    HMIEdit33.Hint := 'DB'+DB1XX_Left_Set.MemFile_DB.ToString+'.DBW310';
    HMIEdit34.Hint := 'DB'+DB1XX_Left_Set.MemFile_DB.ToString+'.DBD312';
    HMIEdit35.Hint := 'DB'+DB1XX_Left_Act.MemFile_DB.ToString+'.DBD320';
    HMIEdit36.Hint := 'DB'+DB1XX_Left_Act.MemFile_DB.ToString+'.DBD322';

    HMIEdit37.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD912';
    HMIEdit38.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD916';
    HMIEdit39.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD920';
    HMIEdit40.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD924';
    HMIEdit41.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD928';
    HMIEdit42.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD932';
    HMIEdit43.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD936';
    HMIEdit44.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD940';
    HMIEdit45.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD944';
    HMIEdit46.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD948';

    exit;
  end;
end;

procedure TForm1.ComboBox2EditingDone(Sender: TObject);
begin
  if not TCP_UDPPort1.Active  then
  begin
    DB1XX_Right_Set.MemFile_DB:=100+ ComboBox2.ItemIndex +1;
    DB1XX_Right_Act.MemFile_DB:=100+ ComboBox2.ItemIndex +1;
    DB1XX_Right_Ramp.MemFile_DB:=100+ ComboBox2.ItemIndex +1;

    HMIEdit47.Hint := 'DB'+DB1XX_Right_Set.MemFile_DB.ToString+'.DBD332';
    HMIEdit48.Hint := 'DB'+DB1XX_Right_Set.MemFile_DB.ToString+'.DBD334';
    HMIEdit49.Hint := 'DB'+DB1XX_Right_Act.MemFile_DB.ToString+'.DBD342';
    HMIEdit50.Hint := 'DB'+DB1XX_Right_Act.MemFile_DB.ToString+'.DBD344';

    HMIEdit51.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD960';
    HMIEdit52.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD964';
    HMIEdit53.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD968';
    HMIEdit54.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD972';
    HMIEdit55.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD976';
    HMIEdit56.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD980';
    HMIEdit57.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD984';
    HMIEdit58.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD988';
    HMIEdit59.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD992';
    HMIEdit60.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD996';

    exit;
  end;

  if TCP_UDPPort1.Active  then
  begin
    //Timer1.Enabled:=false;
    //TCP_UDPPort1.EnableAutoReconnect:=false;
    //TCP_UDPPort1.ExclusiveDevice:=false;
    //TCP_UDPPort1.Active:=false;
    //Button1.Caption:='Connect';

    DB1XX_Right_Set.MemFile_DB:=100+ ComboBox2.ItemIndex +1;
    DB1XX_Right_Act.MemFile_DB:=100+ ComboBox2.ItemIndex +1;
    DB1XX_Right_Ramp.MemFile_DB:=100+ ComboBox2.ItemIndex +1;

    //TCP_UDPPort1.EnableAutoReconnect:=true;
    //TCP_UDPPort1.ExclusiveDevice:=true;
    //TCP_UDPPort1.Active:=true;
    //Button1.Caption:='Disconnect';
    //Timer1.Enabled:=true;

    HMIEdit47.Hint := 'DB'+DB1XX_Right_Set.MemFile_DB.ToString+'.DBD332';
    HMIEdit48.Hint := 'DB'+DB1XX_Right_Set.MemFile_DB.ToString+'.DBD334';
    HMIEdit49.Hint := 'DB'+DB1XX_Right_Act.MemFile_DB.ToString+'.DBD342';
    HMIEdit50.Hint := 'DB'+DB1XX_Right_Act.MemFile_DB.ToString+'.DBD344';

    HMIEdit51.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD960';
    HMIEdit52.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD964';
    HMIEdit53.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD968';
    HMIEdit54.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD972';
    HMIEdit55.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD976';
    HMIEdit56.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD980';
    HMIEdit57.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD984';
    HMIEdit58.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD988';
    HMIEdit59.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD992';
    HMIEdit60.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD996';

    exit;
  end;
end;

procedure TForm1.ComboBox3EditingDone(Sender: TObject);
var
  i:integer;
begin
  if (ComboBox3.Caption='1L') or (ComboBox3.Caption='1R') then DB1XX_SourceRecord1.MemFile_DB:=101;
  if (ComboBox3.Caption='2L') or (ComboBox3.Caption='2R') then DB1XX_SourceRecord1.MemFile_DB:=102;
  if (ComboBox3.Caption='3L') or (ComboBox3.Caption='3R') then DB1XX_SourceRecord1.MemFile_DB:=103;
  if (ComboBox3.Caption='4L') or (ComboBox3.Caption='4R') then DB1XX_SourceRecord1.MemFile_DB:=104;
  if (ComboBox3.Caption='5L') or (ComboBox3.Caption='5R') then DB1XX_SourceRecord1.MemFile_DB:=105;
  if (ComboBox3.Caption='6L') or (ComboBox3.Caption='6R') then DB1XX_SourceRecord1.MemFile_DB:=106;
  if (ComboBox3.Caption='7L') or (ComboBox3.Caption='7R') then DB1XX_SourceRecord1.MemFile_DB:=107;
  if (ComboBox3.Caption='8L') or (ComboBox3.Caption='8R') then DB1XX_SourceRecord1.MemFile_DB:=108;
  if (ComboBox3.Caption='9L') or (ComboBox3.Caption='9R') then DB1XX_SourceRecord1.MemFile_DB:=109;
  if (ComboBox3.Caption='10L') or (ComboBox3.Caption='10R') then DB1XX_SourceRecord1.MemFile_DB:=110;
  if (ComboBox3.Caption='11L') or (ComboBox3.Caption='11R') then DB1XX_SourceRecord1.MemFile_DB:=111;
  if (ComboBox3.Caption='12L') or (ComboBox3.Caption='12R') then DB1XX_SourceRecord1.MemFile_DB:=112;
  if (ComboBox3.Caption='13L') or (ComboBox3.Caption='13R') then DB1XX_SourceRecord1.MemFile_DB:=113;
  if (ComboBox3.Caption='14L') or (ComboBox3.Caption='14R') then DB1XX_SourceRecord1.MemFile_DB:=114;
  if (ComboBox3.Caption='15L') or (ComboBox3.Caption='15R') then DB1XX_SourceRecord1.MemFile_DB:=115;
  if (ComboBox3.Caption='16L') or (ComboBox3.Caption='16R') then DB1XX_SourceRecord1.MemFile_DB:=116;

  i:=pos('L',ComboBox3.Caption);

  if (i>0) and (ComboBox4.Caption='Speed Setpoint') then DB1XX_SourceRecord1.MemAddress :=310;
  if (i>0) and (ComboBox4.Caption='Speed Actual') then DB1XX_SourceRecord1.MemAddress:=320;
  if (i>0) and (ComboBox4.Caption='Torque Setpoint') then DB1XX_SourceRecord1.MemAddress:=312;
  if (i>0) and (ComboBox4.Caption='Torque Actual') then DB1XX_SourceRecord1.MemAddress:=322;

  i:=pos('R',ComboBox3.Caption);

  if (i>0) and (ComboBox4.Caption='Speed Setpoint') then DB1XX_SourceRecord1.MemAddress :=332;
  if (i>0) and (ComboBox4.Caption='Speed Actual') then DB1XX_SourceRecord1.MemAddress:=342;
  if (i>0) and (ComboBox4.Caption='Torque Setpoint') then DB1XX_SourceRecord1.MemAddress:=334;
  if (i>0) and (ComboBox4.Caption='Torque Actual') then DB1XX_SourceRecord1.MemAddress:=344;
end;

procedure TForm1.ComboBox4EditingDone(Sender: TObject);
begin
  ComboBox3EditingDone(Sender);
end;

procedure TForm1.ComboBox5EditingDone(Sender: TObject);
var
  i:integer;
begin
  if (ComboBox5.Caption='1L') or (ComboBox5.Caption='1R') then DB1XX_SourceRecord2.MemFile_DB:=101;
  if (ComboBox5.Caption='2L') or (ComboBox5.Caption='2R') then DB1XX_SourceRecord2.MemFile_DB:=102;
  if (ComboBox5.Caption='3L') or (ComboBox5.Caption='3R') then DB1XX_SourceRecord2.MemFile_DB:=103;
  if (ComboBox5.Caption='4L') or (ComboBox5.Caption='4R') then DB1XX_SourceRecord2.MemFile_DB:=104;
  if (ComboBox5.Caption='5L') or (ComboBox5.Caption='5R') then DB1XX_SourceRecord2.MemFile_DB:=105;
  if (ComboBox5.Caption='6L') or (ComboBox5.Caption='6R') then DB1XX_SourceRecord2.MemFile_DB:=106;
  if (ComboBox5.Caption='7L') or (ComboBox5.Caption='7R') then DB1XX_SourceRecord2.MemFile_DB:=107;
  if (ComboBox5.Caption='8L') or (ComboBox5.Caption='8R') then DB1XX_SourceRecord2.MemFile_DB:=108;
  if (ComboBox5.Caption='9L') or (ComboBox5.Caption='9R') then DB1XX_SourceRecord2.MemFile_DB:=109;
  if (ComboBox5.Caption='10L') or (ComboBox5.Caption='10R') then DB1XX_SourceRecord2.MemFile_DB:=110;
  if (ComboBox5.Caption='11L') or (ComboBox5.Caption='11R') then DB1XX_SourceRecord2.MemFile_DB:=111;
  if (ComboBox5.Caption='12L') or (ComboBox5.Caption='12R') then DB1XX_SourceRecord2.MemFile_DB:=112;
  if (ComboBox5.Caption='13L') or (ComboBox5.Caption='13R') then DB1XX_SourceRecord2.MemFile_DB:=113;
  if (ComboBox5.Caption='14L') or (ComboBox5.Caption='14R') then DB1XX_SourceRecord2.MemFile_DB:=114;
  if (ComboBox5.Caption='15L') or (ComboBox5.Caption='15R') then DB1XX_SourceRecord2.MemFile_DB:=115;
  if (ComboBox5.Caption='16L') or (ComboBox5.Caption='16R') then DB1XX_SourceRecord2.MemFile_DB:=116;

  i:=pos('L',ComboBox5.Caption);

  if (i>0) and (ComboBox6.Caption='Speed Setpoint') then DB1XX_SourceRecord2.MemAddress :=310;
  if (i>0) and (ComboBox6.Caption='Speed Actual') then DB1XX_SourceRecord2.MemAddress:=320;
  if (i>0) and (ComboBox6.Caption='Torque Setpoint') then DB1XX_SourceRecord2.MemAddress:=312;
  if (i>0) and (ComboBox6.Caption='Torque Actual') then DB1XX_SourceRecord2.MemAddress:=322;

  i:=pos('R',ComboBox5.Caption);

  if (i>0) and (ComboBox6.Caption='Speed Setpoint') then DB1XX_SourceRecord2.MemAddress :=332;
  if (i>0) and (ComboBox6.Caption='Speed Actual') then DB1XX_SourceRecord2.MemAddress:=342;
  if (i>0) and (ComboBox6.Caption='Torque Setpoint') then DB1XX_SourceRecord2.MemAddress:=334;
  if (i>0) and (ComboBox6.Caption='Torque Actual') then DB1XX_SourceRecord2.MemAddress:=344;

end;

procedure TForm1.ComboBox6EditingDone(Sender: TObject);
begin
  ComboBox5EditingDone(Sender);
end;

procedure TForm1.ComboBox7EditingDone(Sender: TObject);
var
  i:integer;
begin
  if (ComboBox7.Caption='1L') or (ComboBox7.Caption='1R') then DB1XX_SourceRecord3.MemFile_DB:=101;
  if (ComboBox7.Caption='2L') or (ComboBox7.Caption='2R') then DB1XX_SourceRecord3.MemFile_DB:=102;
  if (ComboBox7.Caption='3L') or (ComboBox7.Caption='3R') then DB1XX_SourceRecord3.MemFile_DB:=103;
  if (ComboBox7.Caption='4L') or (ComboBox7.Caption='4R') then DB1XX_SourceRecord3.MemFile_DB:=104;
  if (ComboBox7.Caption='5L') or (ComboBox7.Caption='5R') then DB1XX_SourceRecord3.MemFile_DB:=105;
  if (ComboBox7.Caption='6L') or (ComboBox7.Caption='6R') then DB1XX_SourceRecord3.MemFile_DB:=106;
  if (ComboBox7.Caption='7L') or (ComboBox7.Caption='7R') then DB1XX_SourceRecord3.MemFile_DB:=107;
  if (ComboBox7.Caption='8L') or (ComboBox7.Caption='8R') then DB1XX_SourceRecord3.MemFile_DB:=108;
  if (ComboBox7.Caption='9L') or (ComboBox7.Caption='9R') then DB1XX_SourceRecord3.MemFile_DB:=109;
  if (ComboBox7.Caption='10L') or (ComboBox7.Caption='10R') then DB1XX_SourceRecord3.MemFile_DB:=110;
  if (ComboBox7.Caption='11L') or (ComboBox7.Caption='11R') then DB1XX_SourceRecord3.MemFile_DB:=111;
  if (ComboBox7.Caption='12L') or (ComboBox7.Caption='12R') then DB1XX_SourceRecord3.MemFile_DB:=112;
  if (ComboBox7.Caption='13L') or (ComboBox7.Caption='13R') then DB1XX_SourceRecord3.MemFile_DB:=113;
  if (ComboBox7.Caption='14L') or (ComboBox7.Caption='14R') then DB1XX_SourceRecord3.MemFile_DB:=114;
  if (ComboBox7.Caption='15L') or (ComboBox7.Caption='15R') then DB1XX_SourceRecord3.MemFile_DB:=115;
  if (ComboBox7.Caption='16L') or (ComboBox7.Caption='16R') then DB1XX_SourceRecord3.MemFile_DB:=116;

  i:=pos('L',ComboBox7.Caption);

  if (i>0) and (ComboBox8.Caption='Speed Setpoint') then DB1XX_SourceRecord3.MemAddress :=310;
  if (i>0) and (ComboBox8.Caption='Speed Actual') then DB1XX_SourceRecord3.MemAddress:=320;
  if (i>0) and (ComboBox8.Caption='Torque Setpoint') then DB1XX_SourceRecord3.MemAddress:=312;
  if (i>0) and (ComboBox8.Caption='Torque Actual') then DB1XX_SourceRecord3.MemAddress:=322;

  i:=pos('R',ComboBox7.Caption);

  if (i>0) and (ComboBox8.Caption='Speed Setpoint') then DB1XX_SourceRecord3.MemAddress :=332;
  if (i>0) and (ComboBox8.Caption='Speed Actual') then DB1XX_SourceRecord3.MemAddress:=342;
  if (i>0) and (ComboBox8.Caption='Torque Setpoint') then DB1XX_SourceRecord3.MemAddress:=334;
  if (i>0) and (ComboBox8.Caption='Torque Actual') then DB1XX_SourceRecord3.MemAddress:=344;
end;

procedure TForm1.ComboBox8EditingDone(Sender: TObject);
begin
  ComboBox7EditingDone(Sender);
end;

procedure TForm1.ECSpeedBtn1Click(Sender: TObject);
begin
  PageControl1.PageIndex:=0;       //PLC IP
end;

procedure TForm1.ECSpeedBtn2Click(Sender: TObject);
begin
  PageControl1.PageIndex:=1;     //Overview
  //showmessage('Overview');
end;


procedure TForm1.ECSpeedBtn3Click(Sender: TObject);
begin
  PageControl1.PageIndex:=2;     //RewindArm
end;

procedure TForm1.ECSpeedBtn4Click(Sender: TObject);
begin
  PageControl1.PageIndex:=3;     //RewindArm
end;

procedure TForm1.ECSpeedBtn5Click(Sender: TObject);
begin
  ChartForceManual.Series.Items[0].Active := not ChartForceManual.Series.Items[0].Active;
end;

procedure TForm1.ECSpeedBtn6Click(Sender: TObject);
begin
  ChartForceManual.Series.Items[1].Active := not ChartForceManual.Series.Items[1].Active;
end;

procedure TForm1.ECSpeedBtn7Click(Sender: TObject);
begin
  ChartForceManual.Series.Items[2].Active := not ChartForceManual.Series.Items[2].Active;
end;

procedure TForm1.ECSpeedBtn8Click(Sender: TObject);
begin
  PageControl1.PageIndex:=4;     //Debug
end;

procedure TForm1.ECSwitch4Click(Sender: TObject);
begin

  if not TCP_UDPPort1.Active  then
  begin
    StartRecord:=false;
    RunChart:=false;
    ECSwitch4.Checked:=false;
    ECSwitch1.Enabled:=True;
    ComboBox3.Enabled:=True;
    ComboBox4.Enabled:=True;
    ECSwitch2.Enabled:=True;
    ComboBox5.Enabled:=True;
    ComboBox6.Enabled:=True;
    ECSwitch3.Enabled:=True;
    ComboBox7.Enabled:=True;
    ComboBox8.Enabled:=True;
    exit;
  end;

  if (ECSwitch4.Checked) then
  begin

    if (FormatDateTime('MM YYYY',Now)<>Directory_) then
    begin
      Directory_:=FormatDateTime('MM YYYY',Now);
    end;
    if CheckDirectory(Directory_,Memo1) then
    begin
      showmessage('Unable to save file');
      ECSwitch4.Checked:=false;
      StartRecord:=false;
      Exit;
    end;

    S_Name:= Directory_+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.CSV';
    File_OK:=True;

    try
      AssignFile(fileout, S_Name);
    except
      on E: EInOutError do
      begin
        //showmessage('AssignFile: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        showmessage('Unable to save file');
        File_OK:=False;
        ECSwitch4.Checked:=false;
        StartRecord:=false;
        Exit;
      end;
    end;

    //CloseFile(fileout);
    RunChart:=true;
    StartRecord:=true;

    ECSwitch1.Enabled:=false;
    ComboBox3.Enabled:=false;
    ComboBox4.Enabled:=false;
    ECSwitch2.Enabled:=false;
    ComboBox5.Enabled:=false;
    ComboBox6.Enabled:=false;
    ECSwitch3.Enabled:=false;
    ComboBox7.Enabled:=false;
    ComboBox8.Enabled:=false;

  end;

  if (not ECSwitch4.Checked) then
  begin
    StartRecord:=false;
    RunChart:=false;
    ECSwitch1.Enabled:=True;
    ComboBox3.Enabled:=True;
    ComboBox4.Enabled:=True;
    ECSwitch2.Enabled:=True;
    ComboBox5.Enabled:=True;
    ComboBox6.Enabled:=True;
    ECSwitch3.Enabled:=True;
    ComboBox7.Enabled:=True;
    ComboBox8.Enabled:=True;
  end;

end;

procedure TForm1.Edit1EditingDone(Sender: TObject);
begin
  Edit1.Caption:=RepairIPAddress(Edit1.Caption);
  TCP_UDPPort1.Host:=Edit1.Caption;
end;

procedure TForm1.Edit2EditingDone(Sender: TObject);
var
  i:integer;
begin
  i:=0;
  Try
    i:=StrToInt(Edit2.Caption);
  except
    On E : EConvertError do
      i:=102;
  end;
  Edit2.Caption:= IntToStr(i);
  TCP_UDPPort1.Port:=i;
end;

procedure TForm1.Edit3EditingDone(Sender: TObject);
var
  i:Float;
begin

  i:=0;
  Try
    i:=StrToFloat(Edit3.Caption);
  except
    On E : EConvertError do
      i:=ChartForceManualMax;
  end;
  Edit3.Caption:= FloatToStr(i);

    if (ChartForceManualMax.ToString <> Edit3.Text) then
    begin
      ChartForceManual.Extent.YMax := i;
      ChartForceManual.ExtentSizeLimit.YMax:= i;
    end;
end;

procedure TForm1.Edit4EditingDone(Sender: TObject);
var
  i:Float;
begin

  i:=0;
  Try
    i:=StrToFloat(Edit4.Caption);
  except
    On E : EConvertError do
      i:=ChartForceManualMin;
  end;
  Edit4.Caption:= FloatToStr(i);

    if (ChartForceManualMin.ToString <> Edit4.Text) then
    begin
      ChartForceManual.Extent.YMin := i;
      ChartForceManual.ExtentSizeLimit.YMin:= i;
    end;
end;

procedure TForm1.Edit5EditingDone(Sender: TObject);
begin
  Edit5.Caption:=RepairIPAddress(Edit5.Caption);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin

  StartRecord:=false;
  Directory_:='';
  S_Name:='';
  RunChart:=false;

  //Randomize();

  TotalPointerX:=10;

  ChartMin:=999;
  ChartMax:=-999;

  Setlength(Base_,TotalPointerX);
  Setlength(CurrentSource1,TotalPointerX);
  Setlength(TargetSource1,TotalPointerX);
  Setlength(CurrentSource2,TotalPointerX);
  Setlength(TargetSource2,TotalPointerX);

  //for i:=0 to TotalPointerX-1 do
  //begin
  // Base_[i]:=random(50)+30;
  //end;

  HMIEdit33.Hint := 'DB'+DB1XX_Left_Set.MemFile_DB.ToString+'.DBW310';
  HMIEdit34.Hint := 'DB'+DB1XX_Left_Set.MemFile_DB.ToString+'.DBD312';
  HMIEdit35.Hint := 'DB'+DB1XX_Left_Act.MemFile_DB.ToString+'.DBD320';
  HMIEdit36.Hint := 'DB'+DB1XX_Left_Act.MemFile_DB.ToString+'.DBD322';

  HMIEdit47.Hint := 'DB'+DB1XX_Right_Set.MemFile_DB.ToString+'.DBD332';
  HMIEdit48.Hint := 'DB'+DB1XX_Right_Set.MemFile_DB.ToString+'.DBD334';
  HMIEdit49.Hint := 'DB'+DB1XX_Right_Act.MemFile_DB.ToString+'.DBD342';
  HMIEdit50.Hint := 'DB'+DB1XX_Right_Act.MemFile_DB.ToString+'.DBD344';

  CurrentSource1[0]:= DB1XX_DBD912.Value;
  CurrentSource1[1]:= DB1XX_DBD916.Value;
  CurrentSource1[2]:= DB1XX_DBD920.Value;
  CurrentSource1[3]:= DB1XX_DBD924.Value;
  CurrentSource1[4]:= DB1XX_DBD928.Value;
  CurrentSource1[5]:= DB1XX_DBD932.Value;
  CurrentSource1[6]:= DB1XX_DBD936.Value;
  CurrentSource1[7]:= DB1XX_DBD940.Value;
  CurrentSource1[8]:= DB1XX_DBD944.Value;
  CurrentSource1[9]:= DB1XX_DBD948.Value;

  CurrentSource2[0]:= DB1XX_DBD960.Value;
  CurrentSource2[1]:= DB1XX_DBD964.Value;
  CurrentSource2[2]:= DB1XX_DBD968.Value;
  CurrentSource2[3]:= DB1XX_DBD972.Value;
  CurrentSource2[4]:= DB1XX_DBD976.Value;
  CurrentSource2[5]:= DB1XX_DBD980.Value;
  CurrentSource2[6]:= DB1XX_DBD984.Value;
  CurrentSource2[7]:= DB1XX_DBD988.Value;
  CurrentSource2[8]:= DB1XX_DBD992.Value;
  CurrentSource2[9]:= DB1XX_DBD996.Value;

  HMIEdit37.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD912';
  HMIEdit38.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD916';
  HMIEdit39.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD920';
  HMIEdit40.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD924';
  HMIEdit41.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD928';
  HMIEdit42.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD932';
  HMIEdit43.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD936';
  HMIEdit44.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD940';
  HMIEdit45.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD944';
  HMIEdit46.Hint := 'DB'+DB1XX_Left_Ramp.MemFile_DB.ToString+'.DBD948';

  HMIEdit51.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD960';
  HMIEdit52.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD964';
  HMIEdit53.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD968';
  HMIEdit54.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD972';
  HMIEdit55.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD976';
  HMIEdit56.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD980';
  HMIEdit57.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD984';
  HMIEdit58.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD988';
  HMIEdit59.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD992';
  HMIEdit60.Hint := 'DB'+DB1XX_Right_Ramp.MemFile_DB.ToString+'.DBD996';

  for i:=0 to TotalPointerX-1 do
  begin
    //CurrentSource1[i]:=Base_[i]+5;
    //CurrentSource2[i]:=Base_[i]-5;

    if (CurrentSource1[i]<ChartMin) then ChartMin:=CurrentSource1[i];
    if (CurrentSource1[i]>ChartMax) then ChartMax:=CurrentSource1[i];
    if (CurrentSource2[i]<ChartMin) then ChartMin:=CurrentSource2[i];
    if (CurrentSource2[i]>ChartMax) then ChartMax:=CurrentSource2[i];
  end;

  if (ChartMin>0) then
    ChartMin:=0
  else
    ChartMin:=ChartMin-3;

  ChartMax:=ChartMax+3;

  Chart6.Extent.YMin:=ChartMin;
  Chart6.Extent.YMax:=ChartMax;
  Chart6.ExtentSizeLimit.YMin:=ChartMin;
  Chart6.ExtentSizeLimit.YMax:=ChartMax;

  _Source1_.Clear;
  _Base_.Clear;
  _Source2_.Clear;
  for i:=0 to TotalPointerX-1 do
  begin
    _Source1_.Add(i,CurrentSource1[i] );
    //_Base_.Add(i,Base_[i] );
    _Source2_.Add(i,CurrentSource2[i] );
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if StartRecord then CloseFile(fileout);

  StartRecord:=false;
  Timer1.Enabled:=false;
  Timer2.Enabled:=false;
  ECSwitch4.State:=cbUnchecked;
  TCP_UDPPort1.EnableAutoReconnect:=false;
  TCP_UDPPort1.ExclusiveDevice:=false;
  TCP_UDPPort1.Active:=false;

end;

procedure TForm1.Image2Click(Sender: TObject);
var
  bmp: graphics.TBitmap;
  i:integer;
  FileName_:string;
  Directory__:string;
begin
  if (FormatDateTime('MM YYYY',Now)<>Directory__) then
  begin
    Directory__:=FormatDateTime('MM YYYY',Now); FileName_:= Directory__+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.bmp';
  end;
  if CheckDirectory(Directory__,Memo1) then begin showmessage('Unable to save file'); Exit; end;

  try
    bmp := graphics.TBitmap.Create;
    for i:=1 to 1000 do
    begin
      Application.ProcessMessages
    end;
    if get_ss_of(Form1.Handle, bmp) = 0 then
    begin
      // display on TImage
      //image1.Picture.Assign(bmp);
      // or save to file
      FileName_:= Directory__+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.bmp';
      bmp.SaveToFile(FileName_);
      showmessage(FileName_);
    end;
  finally
    bmp.Free;
  end;
  //ScreenshotToFile('123.bmp',0);
end;

procedure TForm1.Label_Source8Click(Sender: TObject);
begin

end;

procedure TForm1.SSCClick(Sender: TObject);
var
  bmp: graphics.TBitmap;
  i:integer;
  FileName_:string;
  Directory__:string;
begin
  if (FormatDateTime('MM YYYY',Now)<>Directory__) then
  begin
    Directory__:=FormatDateTime('MM YYYY',Now); FileName_:= Directory__+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.bmp';
  end;
  if CheckDirectory(Directory__,Memo1) then begin showmessage('Unable to save file'); Exit; end;

  try
    bmp := graphics.TBitmap.Create;
    for i:=1 to 1000 do
    begin
      Application.ProcessMessages
    end;
    if get_ss_of(Form1.Handle, bmp) = 0 then
    begin
      // display on TImage
      //image1.Picture.Assign(bmp);
      // or save to file
      FileName_:= Directory__+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.bmp';
      bmp.SaveToFile(FileName_);
      showmessage(FileName_);
    end;
  finally
    bmp.Free;
  end;
  //ScreenshotToFile('123.bmp',0);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i:integer;
  check:boolean;
begin
  if (PageControl1.TabIndex=2) then
  begin

    check:=false;

    if (CurrentSource1[0]<> DB1XX_DBD912.Value) then check:=true;
    if (CurrentSource1[1]<> DB1XX_DBD916.Value) then check:=true;
    if (CurrentSource1[2]<> DB1XX_DBD920.Value) then check:=true;
    if (CurrentSource1[3]<> DB1XX_DBD924.Value) then check:=true;
    if (CurrentSource1[4]<> DB1XX_DBD928.Value) then check:=true;
    if (CurrentSource1[5]<> DB1XX_DBD932.Value) then check:=true;
    if (CurrentSource1[6]<> DB1XX_DBD936.Value) then check:=true;
    if (CurrentSource1[7]<> DB1XX_DBD940.Value) then check:=true;
    if (CurrentSource1[8]<> DB1XX_DBD944.Value) then check:=true;
    if (CurrentSource1[9]<> DB1XX_DBD948.Value) then check:=true;

    if (CurrentSource2[0]<> DB1XX_DBD960.Value) then check:=true;
    if (CurrentSource2[1]<> DB1XX_DBD964.Value) then check:=true;
    if (CurrentSource2[2]<> DB1XX_DBD968.Value) then check:=true;
    if (CurrentSource2[3]<> DB1XX_DBD972.Value) then check:=true;
    if (CurrentSource2[4]<> DB1XX_DBD976.Value) then check:=true;
    if (CurrentSource2[5]<> DB1XX_DBD980.Value) then check:=true;
    if (CurrentSource2[6]<> DB1XX_DBD984.Value) then check:=true;
    if (CurrentSource2[7]<> DB1XX_DBD988.Value) then check:=true;
    if (CurrentSource2[8]<> DB1XX_DBD992.Value) then check:=true;
    if (CurrentSource2[9]<> DB1XX_DBD996.Value) then check:=true;

    if (check=false) then exit;

    TotalPointerX:=10;

    ChartMin:=999;
    ChartMax:=-999;

    CurrentSource1[0]:= DB1XX_DBD912.Value;
    CurrentSource1[1]:= DB1XX_DBD916.Value;
    CurrentSource1[2]:= DB1XX_DBD920.Value;
    CurrentSource1[3]:= DB1XX_DBD924.Value;
    CurrentSource1[4]:= DB1XX_DBD928.Value;
    CurrentSource1[5]:= DB1XX_DBD932.Value;
    CurrentSource1[6]:= DB1XX_DBD936.Value;
    CurrentSource1[7]:= DB1XX_DBD940.Value;
    CurrentSource1[8]:= DB1XX_DBD944.Value;
    CurrentSource1[9]:= DB1XX_DBD948.Value;

    CurrentSource2[0]:= DB1XX_DBD960.Value;
    CurrentSource2[1]:= DB1XX_DBD964.Value;
    CurrentSource2[2]:= DB1XX_DBD968.Value;
    CurrentSource2[3]:= DB1XX_DBD972.Value;
    CurrentSource2[4]:= DB1XX_DBD976.Value;
    CurrentSource2[5]:= DB1XX_DBD980.Value;
    CurrentSource2[6]:= DB1XX_DBD984.Value;
    CurrentSource2[7]:= DB1XX_DBD988.Value;
    CurrentSource2[8]:= DB1XX_DBD992.Value;
    CurrentSource2[9]:= DB1XX_DBD996.Value;

    for i:=0 to TotalPointerX-1 do
    begin
      if (CurrentSource1[i]<ChartMin) then ChartMin:=CurrentSource1[i];
      if (CurrentSource1[i]>ChartMax) then ChartMax:=CurrentSource1[i];
    end;

    for i:=0 to TotalPointerX-1 do
    begin
      if (CurrentSource2[i]<ChartMin) then ChartMin:=CurrentSource2[i];
      if (CurrentSource2[i]>ChartMax) then ChartMax:=CurrentSource2[i];
    end;

    ChartMin:=ChartMin-1;

    ChartMax:=ChartMax+1;

    Chart6.Extent.YMin:=ChartMin;
    Chart6.Extent.YMax:=ChartMax;
    Chart6.ExtentSizeLimit.YMin:=ChartMin;
    Chart6.ExtentSizeLimit.YMax:=ChartMax;

    _Source1_.Clear;
    _Base_.Clear;
    _Source2_.Clear;
    for i:=0 to TotalPointerX-1 do
    begin
      _Source1_.Add(i,CurrentSource1[i] );
      _Source2_.Add(i,CurrentSource2[i] );
    end;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  i:integer;
  MaxRecordTime:integer;
  Txt:String;
  Ra1:Double;
  Ra2:Double;
  Ra3:Double;
  ChartSimulate:boolean;

begin
  Randomize();

  MaxRecordTime:=60*60*12;

  if StartRecord and File_OK then RunChart:=true;
  if not RunChart then exit;

  if ListChartSource5.Count >= MaxRecordTime then
  begin
    for i:=0 to MaxRecordTime-2 do
    begin
      //ListChartSource1.Item[i]^.Y:=ListChartSource1.Item[i+1]^.Y;
      //ListChartSource1.Item[i]^.Text:=ListChartSource1.Item[i+1]^.Text;

      //ListChartSource4.Item[i]^.Y:=ListChartSource4.Item[i+1]^.Y;
      //ListChartSource4.Item[i]^.Text:=ListChartSource4.Item[i+1]^.Text;

      ListChartSource5.Item[i]^.Y:=ListChartSource5.Item[i+1]^.Y;
      ListChartSource5.Item[i]^.Text:=ListChartSource5.Item[i+1]^.Text;

      ListChartSource6.Item[i]^.Y:=ListChartSource6.Item[i+1]^.Y;
      ListChartSource6.Item[i]^.Text:=ListChartSource6.Item[i+1]^.Text;

      ListChartSource7.Item[i]^.Y:=ListChartSource7.Item[i+1]^.Y;
      ListChartSource7.Item[i]^.Text:=ListChartSource7.Item[i+1]^.Text;

    end;
    //ListChartSource1.Delete(MaxRecordTime-1);
    //ListChartSource4.Delete(MaxRecordTime-1);
    ListChartSource5.Delete(MaxRecordTime-1);
    ListChartSource6.Delete(MaxRecordTime-1);
    ListChartSource7.Delete(MaxRecordTime-1);
  end;


  Txt:=FormatDateTime('hh',  Now)+':'+FormatDateTime('nn',  Now)+':'+FormatDateTime('ss',  Now);

  //if TCP_UDPPort1.Active then Ra:= PIW272.Value;
  //if not TCP_UDPPort1.Active then Ra:=0.0;
  //if ChartSimulate then Ra:= Int(Random(1*1000));
  //if ChartForceManual.Extent.YMax<Ra then ChartForceManual.Extent.YMax:=Ra+1;
  //if ChartForceManual.Extent.YMin>Ra then ChartForceManual.Extent.YMin:=Ra-1;
  //if ListChartSource1.Count < MaxRecordTime then ListChartSource1.Add(ListChartSource1.Count,Ra,Txt,clBlue);    //I_DC_CheckBox  DB1_DBD68

  //if TCP_UDPPort1.Active then Ra:= PIW272.Value;
  //if not TCP_UDPPort1.Active then Ra:=0.0;
  //if ChartSimulate then Ra:= Int(Random(1*1000));
  //if ChartForceManual.Extent.YMax<Ra then ChartForceManual.Extent.YMax:=Ra+1;
  //if ChartForceManual.Extent.YMin>Ra then ChartForceManual.Extent.YMin:=Ra-1;
  //if ListChartSource4.Count < MaxRecordTime then ListChartSource2.Add(ListChartSource2.Count,Ra,Txt,clMaroon); //V_DC  DB1_DBD72

  //if TCP_UDPPort1.Active then Ra:= PIW272.Value;
  //if not TCP_UDPPort1.Active then Ra:=0.0;
  //if ChartSimulate then Ra:= Int(Random(1*1000));
  //if ChartForceManual.Extent.YMax<Ra then ChartForceManual.Extent.YMax:=Ra+1;
  //if ChartForceManual.Extent.YMin>Ra then ChartForceManual.Extent.YMin:=Ra-1;
  //if ListChartSource5.Count < MaxRecordTime then ListChartSource3.Add(ListChartSource3.Count,Ra,Txt,clFuchsia);   //LineSpeed  DB1_DBD76

  //if TCP_UDPPort1.Active then Ra:= PIW272.Value;
  //if not TCP_UDPPort1.Active then Ra:=0.0;
  //if ChartSimulate then Ra:= Int(Random(1*1000));
  //if ChartForceManual.Extent.YMax<Ra then ChartForceManual.Extent.YMax:=Ra+1;
  //if ChartForceManual.Extent.YMin>Ra then ChartForceManual.Extent.YMin:=Ra-1;
  //if ListChartSource5.Count < MaxRecordTime then ListChartSource4.Add(ListChartSource4.Count,Ra,Txt,clGreen);   //Power_Out  DB1_DBD252

  if TCP_UDPPort1.Active then Ra1:= DB1XX_DBW310.Value;
  if not TCP_UDPPort1.Active then Ra1:=0.0;

  ChartSimulate:=true;
  if ChartSimulate then Ra1:= DB1XX_DBWXX_Source1.Value; //Int(Random(1*1000));
  if ChartSimulate then Ra2:= DB1XX_DBWXX_Source2.Value; //Int(Random(1*1000));
  if ChartSimulate then Ra3:= DB1XX_DBWXX_Source3.Value; //Int(Random(1*1000));

  if ChartForceManual.Extent.YMax < Ra1+2 then
  begin
    if CheckBox1.Checked then ChartForceManual.Extent.YMax := Ra1+2;
    if CheckBox1.Checked then ChartForceManual.ExtentSizeLimit.YMax:= Ra1+2;
    ChartForceManualMax:=Ra1+2;
    if CheckBox1.Checked then Edit3.Text:=ChartForceManual.Extent.YMax.ToString;
  end;
  if ChartForceManual.Extent.YMin > Ra1-1 then
  begin
    if CheckBox1.Checked then ChartForceManual.Extent.YMin := Ra1-1;
    if CheckBox1.Checked then ChartForceManual.ExtentSizeLimit.YMin:= Ra1-1;
    ChartForceManualMin:=Ra1-1;
    if CheckBox1.Checked then Edit4.Text:=ChartForceManual.Extent.YMin.ToString;
  end;

  if ChartForceManual.Extent.YMax < Ra2+2 then
  begin
    if CheckBox1.Checked then ChartForceManual.Extent.YMax := Ra2+2;
    if CheckBox1.Checked then ChartForceManual.ExtentSizeLimit.YMax:= Ra2+2;
    ChartForceManualMax:=Ra2+2;
    if CheckBox1.Checked then Edit3.Text:=ChartForceManual.Extent.YMax.ToString;
  end;
  if ChartForceManual.Extent.YMin > Ra2-1 then
  begin
    if CheckBox1.Checked then ChartForceManual.Extent.YMin := Ra2-1;
    if CheckBox1.Checked then ChartForceManual.ExtentSizeLimit.YMin:= Ra2-1;
    ChartForceManualMin:=Ra2-1;
    if CheckBox1.Checked then Edit4.Text:=ChartForceManual.Extent.YMin.ToString;
  end;

  if ChartForceManual.Extent.YMax < Ra3+2 then
  begin
    if CheckBox1.Checked then ChartForceManual.Extent.YMax := Ra3+2;
    if CheckBox1.Checked then ChartForceManual.ExtentSizeLimit.YMax:= Ra3+2;
    ChartForceManualMax:=Ra3+2;
    if CheckBox1.Checked then Edit3.Text:=ChartForceManual.Extent.YMax.ToString;
  end;
  if ChartForceManual.Extent.YMin > Ra3-1 then
  begin
    if CheckBox1.Checked then ChartForceManual.Extent.YMin := Ra3-1;
    if CheckBox1.Checked then ChartForceManual.ExtentSizeLimit.YMin:= Ra3-1;
    ChartForceManualMin:=Ra3-1;
    if CheckBox1.Checked then Edit4.Text:=ChartForceManual.Extent.YMin.ToString;
  end;

  if CheckBox1.Checked then
  begin
    if (ChartForceManualMax.ToString <> Edit3.Text) then
    begin
      ChartForceManual.Extent.YMax := ChartForceManualMax;
      ChartForceManual.ExtentSizeLimit.YMax:= ChartForceManualMax;
      Edit3.Text:=ChartForceManualMax.ToString;
    end;
    if (ChartForceManualMin.ToString <> Edit4.Text) then
    begin
      ChartForceManual.Extent.YMin := ChartForceManualMin;
      ChartForceManual.ExtentSizeLimit.YMin:= ChartForceManualMin;
      Edit4.Text:=ChartForceManualMin.ToString;
    end;
  end;

  if ListChartSource5.Count < MaxRecordTime then ListChartSource5.Add(ListChartSource5.Count,Ra1,Txt,clRed);
  if ListChartSource6.Count < MaxRecordTime then ListChartSource6.Add(ListChartSource6.Count,Ra2,Txt,clLime);
  if ListChartSource7.Count < MaxRecordTime then ListChartSource7.Add(ListChartSource7.Count,Ra3,Txt,clBlue);

If (ListChartSource5.Count>240) and (ChartForceManual.Tag = 0) then
  begin
    ChartForceManual.BottomAxis.Range.Max:=ListChartSource5.Count;
    //ChartForceManual.BottomAxis.Range.UseMax:=True;
    ChartForceManual.BottomAxis.Range.Min:=ListChartSource5.Count-240;
    //ChartForceManual.BottomAxis.Range.UseMin:=True;
    ChartForceManual.Extent.XMin:=ListChartSource5.Count-240;  ChartForceManual.Extent.XMax:=ListChartSource5.Count;
  end;
  If (ListChartSource5.Count<=240) and (ChartForceManual.Tag = 0) then
  begin
    if(ListChartSource5.Count<=60)then
    ChartForceManual.BottomAxis.Range.Max:=60;
    if(ListChartSource5.Count>60)then
    ChartForceManual.BottomAxis.Range.Max:=ListChartSource5.Count;
    ChartForceManual.BottomAxis.Range.Min:=0;
    ChartForceManual.Extent.XMin:=0;
    if(ListChartSource5.Count<=60)then
    ChartForceManual.Extent.XMax:=60;
    if(ListChartSource5.Count>60)then
    ChartForceManual.Extent.XMax:=ListChartSource5.Count;
  end;

  if StartRecord and File_OK then
  begin
   try
     Append(fileout);
   except
     //on E: EInOutError do
     //showmessage('Append: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
     on E: EInOutError do
     try
       rewrite (fileout);
       writeln(fileout, 'Timex200ms');
       writeln(fileout, 'TimeStamp' + ',' + ComboBox3.Caption + ' ' + ComboBox4.Caption + ',' + ComboBox5.Caption+ ' ' + ComboBox6.Caption + ',' + ComboBox7.Caption + ' ' + ComboBox8.Caption);
     except
       //on E: EInOutError do
       //showmessage('Append: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
       showmessage('Can not save file');
       File_OK:=false;
       StartRecord:=false;
       ECSwitch4.Checked:=false;
       ECSwitch4Click(Sender);
     end;
   end;

   try         //FloatToStr(Int(Random(1*10)))
     begin
       if (TCP_UDPPort1.Active) then writeln(fileout,FormatDateTime('DD MM YYYY hh nn ss',Now)+','+FloatToStr(DB1XX_DBWXX_Source1.Value)+','+FloatToStr(DB1XX_DBWXX_Source2.Value)+','+FloatToStr(DB1XX_DBWXX_Source3.Value));
       if (not TCP_UDPPort1.Active) then writeln(fileout,'PLC Disconnect');
     end;
     CloseFile(fileout);
   except
     //On E: EInOutError do
     //showmessage('Append: '+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
     showmessage('Can not save file');
     File_OK:=false;
     StartRecord:=false;
     ECSwitch4.Checked:=false;
     ECSwitch4Click(Sender);
   end;

  end;

end;

end.

