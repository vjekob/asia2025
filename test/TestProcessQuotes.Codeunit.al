namespace Vjeko.Demos.Test;

using Vjeko.Demos;
using System.TestLibraries.Utilities;
using Microsoft.Sales.Document;

codeunit 60003 "Test - ProcessQuotes"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit "Library Assert";
        LibrarySales: Codeunit "Library - Sales";
        LibraryInventory: Codeunit "Library - Inventory";
        SUT: Codeunit ProcessQuotes;

    // Test code goes here

    [Test]
    procedure ProcessQuotes_FindsNothing_DoesNothing()
    var
        Mock: Codeunit "MockProcessQuotes";
        SalesQuote: Record "Sales Header";
    begin
        // Assemble
        Mock.SetResult_FindQuotes(false);

        // Act
        SUT.ProcessQuotes(Mock);

        // Assert
        Assert.IsFalse(Mock.IsInvoked_MakeAndPostOrders(), 'MakeAndPostOrders should not be invoked');
    end;

    [Test]
    procedure ProcessQuotes_FindsQuotes_MakesAndPostsOrders()
    var
        Mock: Codeunit "MockProcessQuotes";
        SalesQuote: Record "Sales Header";
    begin
        // Assemble
        Mock.SetResult_FindQuotes(true);

        // Act
        SUT.ProcessQuotes(Mock);

        // Assert
        Assert.IsTrue(Mock.IsInvoked_MakeAndPostOrders(), 'MakeAndPostOrders should be invoked');
    end;

}
