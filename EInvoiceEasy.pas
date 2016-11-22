// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://musteritestws.isisbilisim.com.tr/services/EInvoiceEasy.svc?wsdl
// >Import : http://musteritestws.isisbilisim.com.tr/Services/EInvoiceEasy.svc?wsdl=wsdl0
// >Import : http://musteritestws.isisbilisim.com.tr/services/EInvoiceEasy.svc?wsdl>0
// >Import : http://musteritestws.isisbilisim.com.tr/Services/EInvoiceEasy.svc?xsd=xsd0
// >Import : http://musteritestws.isisbilisim.com.tr/Services/EInvoiceEasy.svc?xsd=xsd2
// >Import : http://musteritestws.isisbilisim.com.tr/Services/EInvoiceEasy.svc?xsd=xsd3
// >Import : http://musteritestws.isisbilisim.com.tr/Services/EInvoiceEasy.svc?xsd=xsd4
// >Import : http://musteritestws.isisbilisim.com.tr/Services/EInvoiceEasy.svc?xsd=xsd1
// Encoding : utf-8
// Codegen  : [wfForceSOAP11+]
// Version  : 1.0
// (11.12.2015 13:33:16 - - $Rev: 76228 $)
// ************************************************************************ //

unit EInvoiceEasy;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF = $0080;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  Contracts_ResponseType2 = class;
  { "http://isisbilisim.com.tr/data/einvoice"[GblCplx] }
  Contracts_ResponseType = class;
  { "http://isisbilisim.com.tr/data/einvoice"[GblElm] }

{$SCOPEDENUMS ON}
  { "http://isisbilisim.com.tr/data/einvoice"[GblSmpl] }
  Contracts_StatusType = (OK, ERROR, PROCCESSING, ACCEPTED, REJECTED);

  { "http://isisbilisim.com.tr/data/einvoice"[GblSmpl] }
  Contracts_CommercialResponseType = (ACCEPTED, REJECTED);

  { "http://isisbilisim.com.tr/core/enums"[GblSmpl] }
  Enums_PDFType = (NORMAL, ATTACHMENT, DETAIL, PREPRINTED, LEGAL);

  { "http://isisbilisim.com.tr/data/einvoice"[GblSmpl] }
  Contracts_DirectionType = (INBOUND, OUTBOUND);

{$SCOPEDENUMS OFF}

  // ************************************************************************ //
  // XML       : Contracts.ResponseType, global, <complexType>
  // Namespace : http://isisbilisim.com.tr/data/einvoice
  // ************************************************************************ //
  Contracts_ResponseType2 = class(TRemotable)
  private
    FByteData: TByteDynArray;
    FByteData_Specified: boolean;
    FCommercialResponse: string;
    FCommercialResponse_Specified: boolean;
    FCommercialResponseEnvelopeUUID: string;
    FCommercialResponseEnvelopeUUID_Specified: boolean;
    FETTN: string;
    FETTN_Specified: boolean;
    FEnvelopeUUID: string;
    FEnvelopeUUID_Specified: boolean;
    FGIBCode: Integer;
    FGIBCode_Specified: boolean;
    FGIBMessage: string;
    FGIBMessage_Specified: boolean;
    FID: string;
    FID_Specified: boolean;
    FProfile: string;
    FProfile_Specified: boolean;
    FReceiverAlias: string;
    FReceiverAlias_Specified: boolean;
    FReceiverVKN: string;
    FReceiverVKN_Specified: boolean;
    FSenderAlias: string;
    FSenderAlias_Specified: boolean;
    FSenderVKN: string;
    FSenderVKN_Specified: boolean;
    FStatus: Contracts_StatusType;
    FStatus_Specified: boolean;
    procedure SetByteData(Index: Integer; const ATByteDynArray: TByteDynArray);
    function ByteData_Specified(Index: Integer): boolean;
    procedure SetCommercialResponse(Index: Integer; const Astring: string);
    function CommercialResponse_Specified(Index: Integer): boolean;
    procedure SetCommercialResponseEnvelopeUUID(Index: Integer;
      const Astring: string);
    function CommercialResponseEnvelopeUUID_Specified(Index: Integer): boolean;
    procedure SetETTN(Index: Integer; const Astring: string);
    function ETTN_Specified(Index: Integer): boolean;
    procedure SetEnvelopeUUID(Index: Integer; const Astring: string);
    function EnvelopeUUID_Specified(Index: Integer): boolean;
    procedure SetGIBCode(Index: Integer; const AInteger: Integer);
    function GIBCode_Specified(Index: Integer): boolean;
    procedure SetGIBMessage(Index: Integer; const Astring: string);
    function GIBMessage_Specified(Index: Integer): boolean;
    procedure SetID(Index: Integer; const Astring: string);
    function ID_Specified(Index: Integer): boolean;
    procedure SetProfile(Index: Integer; const Astring: string);
    function Profile_Specified(Index: Integer): boolean;
    procedure SetReceiverAlias(Index: Integer; const Astring: string);
    function ReceiverAlias_Specified(Index: Integer): boolean;
    procedure SetReceiverVKN(Index: Integer; const Astring: string);
    function ReceiverVKN_Specified(Index: Integer): boolean;
    procedure SetSenderAlias(Index: Integer; const Astring: string);
    function SenderAlias_Specified(Index: Integer): boolean;
    procedure SetSenderVKN(Index: Integer; const Astring: string);
    function SenderVKN_Specified(Index: Integer): boolean;
    procedure SetStatus(Index: Integer;
      const AContracts_StatusType: Contracts_StatusType);
    function Status_Specified(Index: Integer): boolean;
  published
    property ByteData: TByteDynArray Index(IS_OPTN or IS_NLBL)read FByteData
      write SetByteData stored ByteData_Specified;
    property CommercialResponse: string Index(IS_OPTN or IS_NLBL)
      read FCommercialResponse write SetCommercialResponse
      stored CommercialResponse_Specified;
    property CommercialResponseEnvelopeUUID: string Index(IS_OPTN or IS_NLBL)
      read FCommercialResponseEnvelopeUUID
      write SetCommercialResponseEnvelopeUUID
      stored CommercialResponseEnvelopeUUID_Specified;
    property ETTN: string Index(IS_OPTN or IS_NLBL)read FETTN write SetETTN
      stored ETTN_Specified;
    property EnvelopeUUID: string Index(IS_OPTN or IS_NLBL)read FEnvelopeUUID
      write SetEnvelopeUUID stored EnvelopeUUID_Specified;
    property GIBCode: Integer Index(IS_OPTN)read FGIBCode write SetGIBCode
      stored GIBCode_Specified;
    property GIBMessage: string Index(IS_OPTN or IS_NLBL)read FGIBMessage
      write SetGIBMessage stored GIBMessage_Specified;
    property ID: string Index(IS_OPTN or IS_NLBL)read FID write SetID
      stored ID_Specified;
    property Profile: string Index(IS_OPTN or IS_NLBL)read FProfile
      write SetProfile stored Profile_Specified;
    property ReceiverAlias: string Index(IS_OPTN or IS_NLBL)read FReceiverAlias
      write SetReceiverAlias stored ReceiverAlias_Specified;
    property ReceiverVKN: string Index(IS_OPTN or IS_NLBL)read FReceiverVKN
      write SetReceiverVKN stored ReceiverVKN_Specified;
    property SenderAlias: string Index(IS_OPTN or IS_NLBL)read FSenderAlias
      write SetSenderAlias stored SenderAlias_Specified;
    property SenderVKN: string Index(IS_OPTN or IS_NLBL)read FSenderVKN
      write SetSenderVKN stored SenderVKN_Specified;
    property Status: Contracts_StatusType Index(IS_OPTN)read FStatus
      write SetStatus stored Status_Specified;
  end;

  ArrayOfEnums_PDFType = array of Enums_PDFType;
  { "http://isisbilisim.com.tr/core/enums"[GblCplx] }
  ArrayOfstring = array of string;
  { "http://schemas.microsoft.com/2003/10/Serialization/Arrays"[GblCplx] }

  // ************************************************************************ //
  // XML       : Contracts.ResponseType, global, <element>
  // Namespace : http://isisbilisim.com.tr/data/einvoice
  // ************************************************************************ //
  Contracts_ResponseType = class(Contracts_ResponseType2)
  private
  published
  end;

  // ************************************************************************ //
  // Namespace : http://isisbilisim.com.tr/services/einvoice
  // soapAction: http://isisbilisim.com.tr/services/einvoice/IEasy/%operationName%
  // style     : document
  // use       : literal
  // binding   : BasicHttpBinding_IEasy
  // service   : Easy
  // port      : BasicHttpBinding_IEasy
  // URL       : http://musteritestws.isisbilisim.com.tr/Services/EInvoiceEasy.svc
  // ************************************************************************ //
  IEasy = interface(IInvokable)
    ['{046412CE-1C8F-94FE-6384-B47A5A5FFB75}']
    function SendInvoice(const VKN: string; const SenderAlias: string;
      const ReceiverAlias: string; const ByteData: TByteDynArray)
      : Contracts_ResponseType2; stdcall;
    function SendEnvelope(const VKN: string; const ByteData: TByteDynArray)
      : Contracts_ResponseType2; stdcall;
    function SendResponse(const VKN: string; const ETTN: string;
      const Response: Contracts_CommercialResponseType; const Reason: string)
      : Contracts_ResponseType2; stdcall;
    function GetInvoice(const VKN: string): Contracts_ResponseType2; stdcall;
    function GetSingleInvoice(const VKN: string)
      : Contracts_ResponseType2; stdcall;
    function GetStatus(const VKN: string;
      const Direction: Contracts_DirectionType; const ETTN: string)
      : Contracts_ResponseType2; stdcall;
    function GetSingleEnvelope(const VKN: string)
      : Contracts_ResponseType2; stdcall;
    function GetEnvelope(const VKN: string;
      const Direction: Contracts_DirectionType; const ETTN: string)
      : Contracts_ResponseType2; stdcall;
    function GetPostboxList(const ReceiverVKN: string): ArrayOfstring; stdcall;
    function GetPdfInvoice(const VKN: string;
      const Direction: Contracts_DirectionType; const ETTN: string;
      const PDFType: ArrayOfEnums_PDFType): Contracts_ResponseType2; stdcall;
    function ReceiveDone(const VKN: string; const ETTN: string)
      : Contracts_ResponseType2; stdcall;
    function ReceiveEnvelopeDone(const VKN: string; const ETTN: string)
      : Contracts_ResponseType2; stdcall;
    function ReceiveInvoiceDone(const VKN: string; const ETTN: string)
      : Contracts_ResponseType2; stdcall;
    function AcceptInvoice(const VKN: string;
      const Direction: Contracts_DirectionType; const ETTN: string;
      const ResponseNote: string): Contracts_ResponseType2; stdcall;
    function RejectInvoice(const VKN: string;
      const Direction: Contracts_DirectionType; const ETTN: string;
      const ResponseNote: string): Contracts_ResponseType2; stdcall;
    function ApproveInvoice(const VKN: string;
      const Direction: Contracts_DirectionType; const ETTN: string;
      const ResponseNote: string): Contracts_ResponseType2; stdcall;
    function DenyInvoice(const VKN: string;
      const Direction: Contracts_DirectionType; const ETTN: string;
      const ResponseNote: string): Contracts_ResponseType2; stdcall;
  end;

function GetIEasy(UseWSDL: boolean = System.False; Addr: string = '';
  HTTPRIO: THTTPRIO = nil): IEasy;

implementation

uses System.SysUtils;

function GetIEasy(UseWSDL: boolean; Addr: string; HTTPRIO: THTTPRIO): IEasy;
const
  defWSDL = 'http://musteritestws.isisbilisim.com.tr/services/EInvoiceEasy.svc?wsdl';
  defURL = 'http://musteritestws.isisbilisim.com.tr/Services/EInvoiceEasy.svc';
  defSvc = 'Easy';
  defPrt = 'BasicHttpBinding_IEasy';
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
    Result := (RIO as IEasy);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end
    else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;

procedure Contracts_ResponseType2.SetByteData(Index: Integer;
  const ATByteDynArray: TByteDynArray);
begin
  FByteData := ATByteDynArray;
  FByteData_Specified := True;
end;

function Contracts_ResponseType2.ByteData_Specified(Index: Integer): boolean;
begin
  Result := FByteData_Specified;
end;

procedure Contracts_ResponseType2.SetCommercialResponse(Index: Integer;
  const Astring: string);
begin
  FCommercialResponse := Astring;
  FCommercialResponse_Specified := True;
end;

function Contracts_ResponseType2.CommercialResponse_Specified
  (Index: Integer): boolean;
begin
  Result := FCommercialResponse_Specified;
end;

procedure Contracts_ResponseType2.SetCommercialResponseEnvelopeUUID
  (Index: Integer; const Astring: string);
begin
  FCommercialResponseEnvelopeUUID := Astring;
  FCommercialResponseEnvelopeUUID_Specified := True;
end;

function Contracts_ResponseType2.CommercialResponseEnvelopeUUID_Specified
  (Index: Integer): boolean;
begin
  Result := FCommercialResponseEnvelopeUUID_Specified;
end;

procedure Contracts_ResponseType2.SetETTN(Index: Integer;
  const Astring: string);
begin
  FETTN := Astring;
  FETTN_Specified := True;
end;

function Contracts_ResponseType2.ETTN_Specified(Index: Integer): boolean;
begin
  Result := FETTN_Specified;
end;

procedure Contracts_ResponseType2.SetEnvelopeUUID(Index: Integer;
  const Astring: string);
begin
  FEnvelopeUUID := Astring;
  FEnvelopeUUID_Specified := True;
end;

function Contracts_ResponseType2.EnvelopeUUID_Specified(Index: Integer)
  : boolean;
begin
  Result := FEnvelopeUUID_Specified;
end;

procedure Contracts_ResponseType2.SetGIBCode(Index: Integer;
  const AInteger: Integer);
begin
  FGIBCode := AInteger;
  FGIBCode_Specified := True;
end;

function Contracts_ResponseType2.GIBCode_Specified(Index: Integer): boolean;
begin
  Result := FGIBCode_Specified;
end;

procedure Contracts_ResponseType2.SetGIBMessage(Index: Integer;
  const Astring: string);
begin
  FGIBMessage := Astring;
  FGIBMessage_Specified := True;
end;

function Contracts_ResponseType2.GIBMessage_Specified(Index: Integer): boolean;
begin
  Result := FGIBMessage_Specified;
end;

procedure Contracts_ResponseType2.SetID(Index: Integer; const Astring: string);
begin
  FID := Astring;
  FID_Specified := True;
end;

function Contracts_ResponseType2.ID_Specified(Index: Integer): boolean;
begin
  Result := FID_Specified;
end;

procedure Contracts_ResponseType2.SetProfile(Index: Integer;
  const Astring: string);
begin
  FProfile := Astring;
  FProfile_Specified := True;
end;

function Contracts_ResponseType2.Profile_Specified(Index: Integer): boolean;
begin
  Result := FProfile_Specified;
end;

procedure Contracts_ResponseType2.SetReceiverAlias(Index: Integer;
  const Astring: string);
begin
  FReceiverAlias := Astring;
  FReceiverAlias_Specified := True;
end;

function Contracts_ResponseType2.ReceiverAlias_Specified
  (Index: Integer): boolean;
begin
  Result := FReceiverAlias_Specified;
end;

procedure Contracts_ResponseType2.SetReceiverVKN(Index: Integer;
  const Astring: string);
begin
  FReceiverVKN := Astring;
  FReceiverVKN_Specified := True;
end;

function Contracts_ResponseType2.ReceiverVKN_Specified(Index: Integer): boolean;
begin
  Result := FReceiverVKN_Specified;
end;

procedure Contracts_ResponseType2.SetSenderAlias(Index: Integer;
  const Astring: string);
begin
  FSenderAlias := Astring;
  FSenderAlias_Specified := True;
end;

function Contracts_ResponseType2.SenderAlias_Specified(Index: Integer): boolean;
begin
  Result := FSenderAlias_Specified;
end;

procedure Contracts_ResponseType2.SetSenderVKN(Index: Integer;
  const Astring: string);
begin
  FSenderVKN := Astring;
  FSenderVKN_Specified := True;
end;

function Contracts_ResponseType2.SenderVKN_Specified(Index: Integer): boolean;
begin
  Result := FSenderVKN_Specified;
end;

procedure Contracts_ResponseType2.SetStatus(Index: Integer;
  const AContracts_StatusType: Contracts_StatusType);
begin
  FStatus := AContracts_StatusType;
  FStatus_Specified := True;
end;

function Contracts_ResponseType2.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

initialization

{ IEasy }
InvRegistry.RegisterInterface(TypeInfo(IEasy),
  'http://isisbilisim.com.tr/services/einvoice', 'utf-8');
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IEasy),
  'http://isisbilisim.com.tr/services/einvoice/IEasy/%operationName%');
InvRegistry.RegisterInvokeOptions(TypeInfo(IEasy), ioDocument);
{ IEasy.SendInvoice }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'SendInvoice', '',
  '[ReturnName="SendInvoiceResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendInvoice', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendInvoice', 'SenderAlias', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendInvoice', 'ReceiverAlias',
  '', '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendInvoice', 'ByteData', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendInvoice',
  'SendInvoiceResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.SendEnvelope }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'SendEnvelope', '',
  '[ReturnName="SendEnvelopeResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendEnvelope', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendEnvelope', 'ByteData', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendEnvelope',
  'SendEnvelopeResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.SendResponse }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'SendResponse', '',
  '[ReturnName="SendResponseResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendResponse', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendResponse', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendResponse', 'Response', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]');
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendResponse', 'Reason', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'SendResponse',
  'SendResponseResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.GetInvoice }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'GetInvoice', '',
  '[ReturnName="GetInvoiceResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetInvoice', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetInvoice', 'GetInvoiceResult',
  '', '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.GetSingleInvoice }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'GetSingleInvoice', '',
  '[ReturnName="GetSingleInvoiceResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetSingleInvoice', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetSingleInvoice',
  'GetSingleInvoiceResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.GetStatus }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'GetStatus', '',
  '[ReturnName="GetStatusResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetStatus', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetStatus', 'Direction', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]');
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetStatus', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetStatus', 'GetStatusResult',
  '', '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.GetSingleEnvelope }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'GetSingleEnvelope', '',
  '[ReturnName="GetSingleEnvelopeResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetSingleEnvelope', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetSingleEnvelope',
  'GetSingleEnvelopeResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.GetEnvelope }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'GetEnvelope', '',
  '[ReturnName="GetEnvelopeResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetEnvelope', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetEnvelope', 'Direction', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]');
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetEnvelope', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetEnvelope',
  'GetEnvelopeResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.GetPostboxList }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'GetPostboxList', '',
  '[ReturnName="GetPostboxListResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetPostboxList', 'ReceiverVKN',
  '', '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetPostboxList',
  'GetPostboxListResult', '',
  '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]',
  IS_NLBL);
{ IEasy.GetPdfInvoice }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'GetPdfInvoice', '',
  '[ReturnName="GetPdfInvoiceResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetPdfInvoice', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetPdfInvoice', 'Direction', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]');
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetPdfInvoice', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetPdfInvoice', 'PDFType', '',
  '[Namespace="http://isisbilisim.com.tr/core/enums", ArrayItemName="Enums.PDFType"]',
  IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'GetPdfInvoice',
  'GetPdfInvoiceResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.ReceiveDone }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'ReceiveDone', '',
  '[ReturnName="ReceiveDoneResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveDone', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveDone', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveDone',
  'ReceiveDoneResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.ReceiveEnvelopeDone }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'ReceiveEnvelopeDone', '',
  '[ReturnName="ReceiveEnvelopeDoneResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveEnvelopeDone', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveEnvelopeDone', 'ETTN',
  '', '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveEnvelopeDone',
  'ReceiveEnvelopeDoneResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.ReceiveInvoiceDone }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'ReceiveInvoiceDone', '',
  '[ReturnName="ReceiveInvoiceDoneResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveInvoiceDone', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveInvoiceDone', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ReceiveInvoiceDone',
  'ReceiveInvoiceDoneResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.AcceptInvoice }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'AcceptInvoice', '',
  '[ReturnName="AcceptInvoiceResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'AcceptInvoice', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'AcceptInvoice', 'Direction', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]');
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'AcceptInvoice', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'AcceptInvoice', 'ResponseNote',
  '', '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'AcceptInvoice',
  'AcceptInvoiceResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.RejectInvoice }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'RejectInvoice', '',
  '[ReturnName="RejectInvoiceResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'RejectInvoice', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'RejectInvoice', 'Direction', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]');
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'RejectInvoice', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'RejectInvoice', 'ResponseNote',
  '', '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'RejectInvoice',
  'RejectInvoiceResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.ApproveInvoice }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'ApproveInvoice', '',
  '[ReturnName="ApproveInvoiceResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ApproveInvoice', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ApproveInvoice', 'Direction',
  '', '[Namespace="http://isisbilisim.com.tr/data/einvoice"]');
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ApproveInvoice', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ApproveInvoice', 'ResponseNote',
  '', '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'ApproveInvoice',
  'ApproveInvoiceResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
{ IEasy.DenyInvoice }
InvRegistry.RegisterMethodInfo(TypeInfo(IEasy), 'DenyInvoice', '',
  '[ReturnName="DenyInvoiceResult"]', IS_OPTN or IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'DenyInvoice', 'VKN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'DenyInvoice', 'Direction', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]');
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'DenyInvoice', 'ETTN', '',
  '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'DenyInvoice', 'ResponseNote',
  '', '', IS_NLBL);
InvRegistry.RegisterParamInfo(TypeInfo(IEasy), 'DenyInvoice',
  'DenyInvoiceResult', '',
  '[Namespace="http://isisbilisim.com.tr/data/einvoice"]', IS_NLBL);
RemClassRegistry.RegisterXSInfo(TypeInfo(Contracts_StatusType),
  'http://isisbilisim.com.tr/data/einvoice', 'Contracts_StatusType',
  'Contracts.StatusType');
RemClassRegistry.RegisterXSClass(Contracts_ResponseType2,
  'http://isisbilisim.com.tr/data/einvoice', 'Contracts_ResponseType2',
  'Contracts.ResponseType');
RemClassRegistry.RegisterXSInfo(TypeInfo(Contracts_CommercialResponseType),
  'http://isisbilisim.com.tr/data/einvoice', 'Contracts_CommercialResponseType',
  'Contracts.CommercialResponseType');
RemClassRegistry.RegisterXSInfo(TypeInfo(Enums_PDFType),
  'http://isisbilisim.com.tr/core/enums', 'Enums_PDFType', 'Enums.PDFType');
RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfEnums_PDFType),
  'http://isisbilisim.com.tr/core/enums', 'ArrayOfEnums_PDFType',
  'ArrayOfEnums.PDFType');
RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfstring),
  'http://schemas.microsoft.com/2003/10/Serialization/Arrays', 'ArrayOfstring');
RemClassRegistry.RegisterXSInfo(TypeInfo(Contracts_DirectionType),
  'http://isisbilisim.com.tr/data/einvoice', 'Contracts_DirectionType',
  'Contracts.DirectionType');
RemClassRegistry.RegisterXSClass(Contracts_ResponseType,
  'http://isisbilisim.com.tr/data/einvoice', 'Contracts_ResponseType',
  'Contracts.ResponseType');

end.
