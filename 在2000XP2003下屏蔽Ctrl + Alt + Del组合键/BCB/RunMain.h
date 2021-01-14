//---------------------------------------------------------------------------

#ifndef RunMainH
#define RunMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
typedef BOOL (WINAPI *_EnabledKey)(unsigned char *DllName);
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TButton *Button2;
        TMemo *Memo1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
        _EnabledKey EnabledKey;
        _EnabledKey DisabledKey;
        HINSTANCE hDLLInst;
        AnsiString DLLPath;
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
