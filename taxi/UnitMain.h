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
#include <ComCtrls.hpp>
#include <Mask.hpp>
#include <Dialogs.hpp>
#include "SIBEABase.hpp"
#include "SIBFIBEA.hpp"
#include <DB.hpp>
#include "GridsEh.hpp"
#include <Sockets.hpp>
#include "DBCtrlsEh.hpp"
#include "DBLookupEh.hpp"
//---------------------------------------------------------------------------
class TThemeLabel : public TLabel{
public:
	__fastcall TThemeLabel(TComponent* Owner):TLabel(Owner){;};
	short Type;
	short Freq;
	short Theme;
	short LocType;
	short PrevLocType;
	short Ressort;
	short Location;
	short PrevLocation;
	int Locations;
	int PrevLocations;
	bool ThemeVisible;
	TDateTime TimeStart;
};
//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
	TPanel *PanelBottom;
	TPopupMenu *PopupMenuLocTypeOnLine;
	TMenuItem *miClients;
	TMenuItem *miPause;
	TVersionInfo *VersionInfo;
	TPanel *PanelTop;
	TGroupBox *GroupBoxRemont;
	TGroupBox *GroupBoxShtraf;
	TGroupBox *GroupBoxDolg;
	TGroupBox *GroupBoxPark;
	TScrollBox *ScrollBoxPark;
	TScrollBox *ScrollBoxDolg;
	TScrollBox *ScrollBoxShtraf;
	TScrollBox *ScrollBoxRemont;
	TSplitter *Splitter1;
	TSplitter *Splitter4;
	TPopupMenu *PopupMenuOffLine;
	TMenuItem *MenuItem8;
	TMenuItem *MenuItem13;
	TMenuItem *MenuItem14;
	TMenuItem *miInfo;
	TMenuItem *miNoResponse;
	TMenuItem *miConflict;
	TMenuItem *miOtkaz;
	TTimer *TimerOrdRezervFlash;
	TPanel *PanelRight;
	TMenuItem *miNight;
	TMenuItem *miWithSave;
	TSplitter *Splitter6;
	TSplitter *Splitter7;
	TPanel *PanelLocation;
	TMenuItem *miFirst;
	TMenuItem *miOutAuto;
	TStaticText *StaticTextWeekEnd;
	TPopupMenu *PopupMenuClient;
	TMenuItem *N13;
	TMenuItem *miOrderEdit;
	TMenuItem *miUnMark;
	TMenuItem *miSort;
	TMenuItem *miRestore;
	TMenuItem *miSetReserv;
	TMenuItem *miResetReserv;
	TMenuItem *miLast;
	TTimer *TimerCheck;
	TPanel *PanelDayNight;
	TBitBtn *BitBtnRessortNight;
	TBitBtn *BitBtnRessortDay;
	TCheckBox *CheckBoxRezerv;
	TGroupBox *GroupBoxZakazOnline;
	TGroupBox *GroupBoxZakazEdit;
	TSpeedButton *ButtonStartOrder;
	TEdit *EditDeparture;
	TCheckBox *CheckBoxMultiOrder;
	TEdit *EditPHONE;
	TEdit *EditDiskont;
	TScrollBox *ScrollBoxZakazOnLine;
	TDateTimePicker *DateTimePicker;
	TMaskEdit *MaskEditTime;
	TSplitter *Splitter3;
	TGroupBox *GroupBox_ORD_ONLINE;
	TDBGridEh *DBGridEh_ORD_ONLINE;
	TShape *ShapeLighting;
	TSpeedButton *ButtonClients;
	TSpeedButton *ButtonReserv;
	TSpeedButton *ButtonDelay;
	TSpeedButton *ButtonClear;
	TSpeedButton *ButtonPhone;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TEdit *EditTheme;
	TLabel *Label5;
	TSpeedButton *ButtonTheme;
	TGroupBox *GroupBox_ORD_DELAY;
	TSplitter *Splitter2;
	TDBGridEh *DBGridEh_ORD_DELAY;
	TDBGridEh *DBGridEh_ORD_RESERV;
	TEdit *EditDestination;
	TListBox *ListBoxSmenaRepNo;
	TSplitter *Splitter9;
	TListBox *ListBoxInfo;
	TSplitter *Splitter5;
	TGroupBox *GroupBoxArenda;
	TSplitter *Splitter8;
	TPopupMenu *PopupMenuFalseOrder;
	TMenuItem *miNoCar;
	TMenuItem *N1471;
	TMenuItem *N2;
	TMenuItem *miPrior;
	TSplitter *Splitter10;
	TStaticText *StaticTextAction;
	TSpeedButton *SpeedButtonGarbage;
	TMenuItem *N3;
	TTcpClient *TcpClient;
	TPopupMenu *PopupMenuOnLine;
	TDBLookupComboboxEh *DBLookupComboboxEhOrdType;
	TScrollBox *ScrollBoxArenda;
	TMenuItem *miMarker;
	TGroupBox *GroupBoxOtpusk;
	TScrollBox *ScrollBoxOtpusk;
	TSplitter *Splitter11;
	TMenuItem *N4;
	TMenuItem *N5;
	TMenuItem *N01;
	TMenuItem *N6;
	TMenuItem *N7;
	TMenuItem *N8;
	TMenuItem *miMark;
	TMenuItem *miPenalty;
	TMenuItem *N11;
	TMenuItem *miPromove;
	TMenuItem *N1;
	TMenuItem *N9;
	TMenuItem *N10;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall TimerOrdRezervFlashTimer(TObject *Sender);
	void __fastcall StaticTextWeekEndClick(TObject *Sender);
	void __fastcall ThemeLabelMouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
	void __fastcall ScrollBoxParkMouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
	void __fastcall ScrollBoxParkMouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
	void __fastcall ScrollBoxParkMouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ReLocation(TObject *Sender);
	void __fastcall ReLocType(TObject *Sender);
	void __fastcall Ressort(TObject *Sender);
	void __fastcall SendOrder(TObject *Sender);
	void __fastcall BitBtnRessortDayClick(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall StartOrder(TObject *Sender);
	void __fastcall DBGridEh_ORD_DELAYDblClick(TObject *Sender);
	void __fastcall DBGridEh_ORD_RESERVDblClick(TObject *Sender);
	void __fastcall ButtonDelayClick(TObject *Sender);
	void __fastcall ButtonClearClick(TObject *Sender);
	void __fastcall ThemeLabelDblClick(TObject *Sender);
	void __fastcall DateTimePickerChange(TObject *Sender);
	void __fastcall PopupMenuLocTypeOnLinePopup(TObject *Sender);
	void __fastcall ThemeLabelMouseMove(TObject *Sender, TShiftState Shift, int X,
          int Y);
	void __fastcall ScrollBoxDragOver(TObject *Sender, TObject *Source,
          int X, int Y, TDragState State, bool &Accept);
	void __fastcall ScrollBoxStaticDragDrop(TObject *Sender, TObject *Source,
          int X, int Y);
	void __fastcall ScrollBoxLocationDragDrop(TObject *Sender, TObject *Source,
          int X, int Y);
	void __fastcall ThemeLabelClick(TObject *Sender);
	void __fastcall BitBtnRessortNightClick(TObject *Sender);
	void __fastcall miRollbackClick(TObject *Sender);
	void __fastcall OrderEdit(TObject *Sender);
	void __fastcall miOrderEditClick(TObject *Sender);
	void __fastcall FormDeactivate(TObject *Sender);
	void __fastcall TimerCheckTimer(TObject *Sender);
	void __fastcall EditDepartureKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall MaskEditTimeKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall miClientsClick(TObject *Sender);
	void __fastcall ButtonThemeClick(TObject *Sender);
	void __fastcall EditThemeKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall DBGridEh_ORD_ONLINEEnter(TObject *Sender);
	void __fastcall DBGridEh_ORD_ONLINEExit(TObject *Sender);
	void __fastcall DBGridEh_ORD_DELAYEnter(TObject *Sender);
	void __fastcall DBGridEh_ORD_DELAYExit(TObject *Sender);
	void __fastcall DBGridEh_ORD_RESERVEnter(TObject *Sender);
	void __fastcall DBGridEh_ORD_RESERVExit(TObject *Sender);
	void __fastcall DateTimePickerKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall ButtonClientsClick(TObject *Sender);
	void __fastcall EditDiskontChange(TObject *Sender);
	void __fastcall DBGridEh_ORD_ONLINEKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall miFalseOrderClick(TObject *Sender);
	void __fastcall ScrollBoxLocationMouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
	void __fastcall LocRefresh(TObject *Sender);
	void __fastcall DBGridEh_ORD_DELAYKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall DBGridEh_ORD_RESERVKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall StaticTextActionClick(TObject *Sender);
	void __fastcall ButtonPhoneClick(TObject *Sender);
	void __fastcall MenuItemOnLineClick(TObject *Sender);
	void __fastcall miMarkClick(TObject *Sender);
	void __fastcall miUnMarkClick(TObject *Sender);
	void __fastcall miMarkerClick(TObject *Sender);
	void __fastcall ThemeLabelMouseLeave(TObject *Sender);
	void __fastcall ThemeLabelDragOver(TObject *Sender, TObject *Source, int X, int Y, TDragState State, bool &Accept);
	void __fastcall ThemeLabelDragDrop(TObject *Sender, TObject *Source, int X, int Y);
	void __fastcall miCustomMarkerClick(TObject *Sender);
private:	// User declarations
	int LabelColors[9][16];
	int FontColors[9][16];
   	TCheckBox **CheckBoxFreq;	
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  LABEL Colors

// _________________________________________________________DATABASE CONNECTIONS
	AnsiString HostName;
	AnsiString PrimaryHost;
	AnsiString SecondaryHost;
	AnsiString UserName;
	AnsiString Password;
	AnsiString DBName;
	AnsiString DBPhone;
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ DATABASE CONNECTIONS
	int *tmpThemeLabelsIndex;

	TGroupBox **GroupBoxLocation;
	TScrollBox **ScrollBoxLocation;
	TImage **ImageLocation;

	TThemeLabel *DummyThemeLabel;
	TThemeLabel **ThemeLabel;


	int LocationsCount;
	int LocationCount;
	int ThemeCount;


//	int NumOrdType;
//	int *CodOrdType;

	short CurrentLocation;

	int ScrollBoxStartX;
	int ScrollBoxStartY;

public:		// User declarations
	__fastcall TFormMain(TComponent* Owner);

   TThemeLabel *CurrentThemeLabel;
	bool MainHost;
	int CurrentSmena;
	short SmenaWeekend;
	int NewLocations;

	bool OrdRefreshOnline;
	bool OrdRefreshDelay;
	bool OrdRefreshRezerv;
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
