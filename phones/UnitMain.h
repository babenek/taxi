//$$---- Form HDR ----
//---------------------------------------------------------------------------

#ifndef UnitMainH
#define UnitMainH
#include "DBGridEh.hpp"
#include "FIBDatabase.hpp"
#include "FIBDataSet.hpp"
#include "GridsEh.hpp"
#include "pFIBDatabase.hpp"
#include "pFIBDataSet.hpp"
#include "VersionInfoComponent.h"
#include <Classes.hpp>
#include <Controls.hpp>
#include <DB.hpp>
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Sockets.hpp>
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
	TDBGridEh *DBGridEh1;
	TVersionInfo *VersionInfo;
	TTcpClient *TcpClient;
	TDBNavigator *DBNavigator1;
	TPanel *Panel;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall DataSetMainBeforeOpen(TDataSet *DataSet);
	void __fastcall DBGridEh1TitleBtnClick(TObject *Sender, int ACol, TColumnEh *Column);
private:	// User declarations
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
	__fastcall TFormMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
