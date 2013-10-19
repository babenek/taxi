//----------------------------------------------------------------------------
#ifndef UnitPasswordH
#define UnitPasswordH
//----------------------------------------------------------------------------
#include <vcl\Buttons.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Controls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Graphics.hpp>
#include <vcl\Classes.hpp>
#include <vcl\SysUtils.hpp>
#include <vcl\Windows.hpp>
#include <vcl\System.hpp>
//----------------------------------------------------------------------------
class TFormPassword : public TForm
{
__published:
	TLabel *Label1;
	TEdit *EditPassword;
	TButton *OKBtn;
	TButton *CancelBtn;
	void __fastcall OKBtnClick(TObject *Sender);
	void __fastcall CancelBtnClick(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
private:
public:
	bool ResultOK;
	AnsiString Password;
	virtual __fastcall TFormPassword(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TFormPassword *FormPassword;
//----------------------------------------------------------------------------
#endif    
