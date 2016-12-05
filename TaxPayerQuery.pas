// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc?wsdl
//  >Import : http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc?wsdl=wsdl0
//  >Import : http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc?wsdl>0
//  >Import : http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc?xsd=xsd0
//  >Import : http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc?xsd=xsd2
//  >Import : http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc?xsd=xsd3
//  >Import : http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc?xsd=xsd1
// Encoding : utf-8
// Version  : 1.0
// (12/5/2016 1:28:55 PM - - $Rev: 76228 $)
// ************************************************************************ //

unit TaxPayerQuery;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]

  User2                = class;                 { "http://isisbilisim.com.tr/data/einvoice"[GblCplx] }
  User                 = class;                 { "http://isisbilisim.com.tr/data/einvoice"[GblElm] }

  ArrayOfUser = array of User2;                 { "http://isisbilisim.com.tr/data/einvoice"[GblCplx] }
  ArrayOfstring = array of string;              { "http://schemas.microsoft.com/2003/10/Serialization/Arrays"[GblCplx] }


  // ************************************************************************ //
  // XML       : User, global, <complexType>
  // Namespace : http://isisbilisim.com.tr/data/einvoice
  // ************************************************************************ //
  User2 = class(TRemotable)
  private
    FAlias: string;
    FAlias_Specified: boolean;
    FCreatedDate: TXSDateTime;
    FCreatedDate_Specified: boolean;
    FIdentifier: string;
    FIdentifier_Specified: boolean;
    FIsActive: Boolean;
    FIsActive_Specified: boolean;
    FTitle: string;
    FTitle_Specified: boolean;
    FType_: string;
    FType__Specified: boolean;
    FUpdatedDate: TXSDateTime;
    FUpdatedDate_Specified: boolean;
    procedure SetAlias(Index: Integer; const Astring: string);
    function  Alias_Specified(Index: Integer): boolean;
    procedure SetCreatedDate(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  CreatedDate_Specified(Index: Integer): boolean;
    procedure SetIdentifier(Index: Integer; const Astring: string);
    function  Identifier_Specified(Index: Integer): boolean;
    procedure SetIsActive(Index: Integer; const ABoolean: Boolean);
    function  IsActive_Specified(Index: Integer): boolean;
    procedure SetTitle(Index: Integer; const Astring: string);
    function  Title_Specified(Index: Integer): boolean;
    procedure SetType_(Index: Integer; const Astring: string);
    function  Type__Specified(Index: Integer): boolean;
    procedure SetUpdatedDate(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  UpdatedDate_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Alias:       string       Index (IS_OPTN or IS_NLBL) read FAlias write SetAlias stored Alias_Specified;
    property CreatedDate: TXSDateTime  Index (IS_OPTN) read FCreatedDate write SetCreatedDate stored CreatedDate_Specified;
    property Identifier:  string       Index (IS_OPTN or IS_NLBL) read FIdentifier write SetIdentifier stored Identifier_Specified;
    property IsActive:    Boolean      Index (IS_OPTN) read FIsActive write SetIsActive stored IsActive_Specified;
    property Title:       string       Index (IS_OPTN or IS_NLBL) read FTitle write SetTitle stored Title_Specified;
    property Type_:       string       Index (IS_OPTN or IS_NLBL) read FType_ write SetType_ stored Type__Specified;
    property UpdatedDate: TXSDateTime  Index (IS_OPTN or IS_NLBL) read FUpdatedDate write SetUpdatedDate stored UpdatedDate_Specified;
  end;



  // ************************************************************************ //
  // XML       : User, global, <element>
  // Namespace : http://isisbilisim.com.tr/data/einvoice
  // ************************************************************************ //
  User = class(User2)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://isisbilisim.com.tr/services/einvoice
  // soapAction: http://isisbilisim.com.tr/services/einvoice/ITaxPayerQuery/%operationName%
  // style     : document
  // use       : literal
  // binding   : BasicHttpBinding_ITaxPayerQuery
  // service   : TaxPayerQuery
  // port      : BasicHttpBinding_ITaxPayerQuery
  // URL       : http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc
  // ************************************************************************ //
  ITaxPayerQuery = interface(IInvokable)
  ['{9BE4B9F3-E835-B3A5-A889-65264B446897}']
    function  Filter(const vknList: ArrayOfstring; const startDate: string): ArrayOfUser; stdcall;
    function  GetList: ArrayOfUser; stdcall;
    function  GetActiveList: ArrayOfUser; stdcall;
    function  GetActiveListByVknList(const vknList: ArrayOfstring): ArrayOfUser; stdcall;
    function  GetListByVknList(const vknList: ArrayOfstring): ArrayOfUser; stdcall;
    function  GetActiveListByDate(const startDate: TXSDateTime; const endDate: TXSDateTime): ArrayOfUser; stdcall;
    function  GetListByDate(const startDate: TXSDateTime; const endDate: TXSDateTime): ArrayOfUser; stdcall;
    function  GetListByTitle(const title: string): ArrayOfUser; stdcall;
    function  GetActiveListByTitle(const title: string): ArrayOfUser; stdcall;
  end;

function GetITaxPayerQuery(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITaxPayerQuery;


implementation
  uses System.SysUtils;

function GetITaxPayerQuery(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITaxPayerQuery;
const
  defWSDL = 'http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc?wsdl';
  defURL  = 'http://musteritestws.isisbilisim.com.tr/services/TaxPayerQuery.svc';
  defSvc  = 'TaxPayerQuery';
  defPrt  = 'BasicHttpBinding_ITaxPayerQuery';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ITaxPayerQuery);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor User2.Destroy;
begin
  System.SysUtils.FreeAndNil(FCreatedDate);
  System.SysUtils.FreeAndNil(FUpdatedDate);
  inherited Destroy;
end;

procedure User2.SetAlias(Index: Integer; const Astring: string);
begin
  FAlias := Astring;
  FAlias_Specified := True;
end;

function User2.Alias_Specified(Index: Integer): boolean;
begin
  Result := FAlias_Specified;
end;

procedure User2.SetCreatedDate(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  FCreatedDate := ATXSDateTime;
  FCreatedDate_Specified := True;
end;

function User2.CreatedDate_Specified(Index: Integer): boolean;
begin
  Result := FCreatedDate_Specified;
end;

procedure User2.SetIdentifier(Index: Integer; const Astring: string);
begin
  FIdentifier := Astring;
  FIdentifier_Specified := True;
end;

function User2.Identifier_Specified(Index: Integer): boolean;
begin
  Result := FIdentifier_Specified;
end;

procedure User2.SetIsActive(Index: Integer; const ABoolean: Boolean);
begin
  FIsActive := ABoolean;
  FIsActive_Specified := True;
end;

function User2.IsActive_Specified(Index: Integer): boolean;
begin
  Result := FIsActive_Specified;
end;

procedure User2.SetTitle(Index: Integer; const Astring: string);
begin
  FTitle := Astring;
  FTitle_Specified := True;
end;

function User2.Title_Specified(Index: Integer): boolean;
begin
  Result := FTitle_Specified;
end;

procedure User2.SetType_(Index: Integer; const Astring: string);
begin
  FType_ := Astring;
  FType__Specified := True;
end;

function User2.Type__Specified(Index: Integer): boolean;
begin
  Result := FType__Specified;
end;

procedure User2.SetUpdatedDate(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  FUpdatedDate := ATXSDateTime;
  FUpdatedDate_Specified := True;
end;

function User2.UpdatedDate_Specified(Index: Integer): boolean;
begin
  Result := FUpdatedDate_Specified;
end;

initialization
  { ITaxPayerQuery }
  InvRegistry.RegisterInterface(TypeInfo(ITaxPayerQuery), 'http://isisbilisim.com.tr/services/einvoice', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITaxPayerQuery), 'http://isisbilisim.com.tr/services/einvoice/ITaxPayerQuery/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ITaxPayerQuery), ioDocument);
  { ITaxPayerQuery.Filter }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'Filter', '',
                                 '[ReturnName="FilterResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'Filter', 'vknList', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'Filter', 'startDate', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'Filter', 'FilterResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  { ITaxPayerQuery.GetList }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'GetList', '',
                                 '[ReturnName="GetListResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetList', 'GetListResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  { ITaxPayerQuery.GetActiveList }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'GetActiveList', '',
                                 '[ReturnName="GetActiveListResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetActiveList', 'GetActiveListResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  { ITaxPayerQuery.GetActiveListByVknList }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByVknList', '',
                                 '[ReturnName="GetActiveListByVknListResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByVknList', 'vknList', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByVknList', 'GetActiveListByVknListResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  { ITaxPayerQuery.GetListByVknList }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'GetListByVknList', '',
                                 '[ReturnName="GetListByVknListResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetListByVknList', 'vknList', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetListByVknList', 'GetListByVknListResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  { ITaxPayerQuery.GetActiveListByDate }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByDate', '',
                                 '[ReturnName="GetActiveListByDateResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByDate', 'endDate', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByDate', 'GetActiveListByDateResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  { ITaxPayerQuery.GetListByDate }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'GetListByDate', '',
                                 '[ReturnName="GetListByDateResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetListByDate', 'endDate', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetListByDate', 'GetListByDateResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  { ITaxPayerQuery.GetListByTitle }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'GetListByTitle', '',
                                 '[ReturnName="GetListByTitleResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetListByTitle', 'title', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetListByTitle', 'GetListByTitleResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  { ITaxPayerQuery.GetActiveListByTitle }
  InvRegistry.RegisterMethodInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByTitle', '',
                                 '[ReturnName="GetActiveListByTitleResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByTitle', 'title', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(ITaxPayerQuery), 'GetActiveListByTitle', 'GetActiveListByTitleResult', '',
                                '[Namespace="http://isisbilisim.com.tr/data/einvoice", ArrayItemName="User"]', IS_NLBL);
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfUser), 'http://isisbilisim.com.tr/data/einvoice', 'ArrayOfUser');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfstring), 'http://schemas.microsoft.com/2003/10/Serialization/Arrays', 'ArrayOfstring');
  RemClassRegistry.RegisterXSClass(User2, 'http://isisbilisim.com.tr/data/einvoice', 'User2', 'User');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(User2), 'Type_', '[ExtName="Type"]');
  RemClassRegistry.RegisterXSClass(User, 'http://isisbilisim.com.tr/data/einvoice', 'User');

end.