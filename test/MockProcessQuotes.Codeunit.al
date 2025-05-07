namespace Vjeko.Demos.Test;

using Vjeko.Demos;
using Microsoft.Sales.Document;

codeunit 50100 "MockProcessQuotes" implements IProcessQuotes
{
    var
        _findQuotesInvoked: Boolean;
        _findQuotesResult: Boolean;
        _makeAndPostOrdersInvoked: Boolean;

    procedure SetResult_FindQuotes(Result: Boolean)
    begin
        _findQuotesResult := Result;
    end;

    procedure IsInvoked_MakeAndPostOrders(): Boolean
    begin
        exit(_makeAndPostOrdersInvoked);
    end;

    procedure FindQuotes(var SalesQuote: Record "Sales Header"): Boolean
    begin
        _findQuotesInvoked := true;
        exit(_findQuotesResult);
    end;

    procedure MakeAndPostOrders(var SalesQuote: Record "Sales Header")
    begin
        _makeAndPostOrdersInvoked := true;
    end;
}
