//---------------------------------------------------------------------------
#ifndef UnitMainH
#define UnitMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DBGridEh.hpp"
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <jpeg.hpp>
#include "FIBDatabase.hpp"
#include "pFIBDatabase.hpp"
#include "FIBDataSet.hpp"
#include "FIBQuery.hpp"
#include "pFIBDataSet.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include <Db.hpp>
#include <DBGrids.hpp>
#include <Menus.hpp>
#include "VersionInfoComponent.h"
#include "VersionInfoUI.h"
#include <Sockets.hpp>
#include <DB.hpp>
#include <DBClient.hpp>
#include <MConnect.hpp>
#include <SConnect.hpp>
#include <ScktComp.hpp>

#define MYWM_NOTIFY         (WM_APP+100)
#define IDC_MYICON                     1006

//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
	TVersionInfo *VersionInfo;
	TTcpClient *TcpClient;
	TMemo *MemoTest;
	TClientSocket *ClientSocket;
	TTrayIcon *TrayIcon;
	TPopupMenu *PopupMenuTray;
	TMenuItem *N1;
	TMenuItem *N2;
	TMenuItem *N3;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall LocRefresh(TObject *Sender);
	void __fastcall N3Click(TObject *Sender);
	void __fastcall N2Click(TObject *Sender);
	void __fastcall FormPaint(TObject *Sender);
	void __fastcall N1Click(TObject *Sender);
private:	// User declarations
	// _________________________________________________________DATABASE CONNECTIONS
	AnsiString HostName;
	AnsiString PrimaryHost;
	AnsiString SecondaryHost;
	AnsiString UserName;
	AnsiString Password;
	AnsiString DBName;
	AnsiString DBPhone;
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ DATABASE CONNECTIONS
	AnsiString XlamName;
	AnsiString XlamPass;	
	bool Busy;
public:		// User declarations
	__fastcall TFormMain(TComponent* Owner);
	bool MainHost;
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
