//---------------------------------------------------------------------------

#ifndef UnitMainH
#define UnitMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DBGridEh.hpp"
#include "FIBDatabase.hpp"
#include "FIBDataSet.hpp"
#include "pFIBDatabase.hpp"
#include "pFIBDataSet.hpp"
#include <Db.hpp>
#include <Grids.hpp>
#include <ExtCtrls.hpp>
#include "VersionInfoComponent.h"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Mask.hpp>
#include "FIBQuery.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include "PrnDbgeh.hpp"

#include "GridsEh.hpp"
#include <DB.hpp>
#include <Sockets.hpp>
#include "DBCtrlsEh.hpp"
#include "DBLookupEh.hpp"
#include <Dialogs.hpp>
//#include "GridsEh.hpp"
//---------------------------------------------------------------------------
class TFormOrders : public TForm
{
__published:	// IDE-managed Components
	TVersionInfo *VersionInfoOrders;
	TSplitter *Splitter1;
	TTcpClient *TcpClient1;
	TSpeedButton *BitBtnRefresh;
	TEdit *EditMONTH;
	TLabel *Label10;
	TLabel *LabelCost;
	TEdit *EditYEAR;
	TOpenDialog *OpenDialogSQL;
	TMemo *Memo1;
	TDBGridEh *DBGridEhOrders;
	TGroupBox *GroupBoxTop;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall BitBtnRefreshClick(TObject *Sender);
private:	// User declarations
	int CurrentSmena;
	bool AdminProtect;
	int *CodOrdType;
	bool MainHost;
// _________________________________________________________DATABASE CONNECTIONS
	AnsiString HostName;
	AnsiString PrimaryHost;
	AnsiString SecondaryHost;
	AnsiString UserName;
	AnsiString Password;
	AnsiString DBName;
	AnsiString DBPhone;
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ DATABASE CONNECTIONS

public:		// User declarations
	__fastcall TFormOrders(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormOrders *FormOrders;
//---------------------------------------------------------------------------
#endif
