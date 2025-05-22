namespace Vjeko.Demos.Test;

using Vjeko.Demos;
using System.TestLibraries.Utilities;

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
        MockProcessQuotes: Codeunit ProcessQuotesMock;
    begin
        // Assemble
        MockProcessQuotes.SetExpected_FindQuotes(false);

        // Act
        SUT.ProcessQuotes(MockProcessQuotes);

        // Assert
        Assert.IsFalse(MockProcessQuotes.IsInvoked_MakeAndPostOrders(), 'MakeAndPostOrders should not be invoked');
    end;

    [Test]
    procedure ProcessQuotes_FindsQuotes_MakesAndPostsOrders()
    var
        MockProcessQuotes: Codeunit ProcessQuotesMock;
    begin
        // Assemble
        MockProcessQuotes.SetExpected_FindQuotes(true);

        // Act
        SUT.ProcessQuotes(MockProcessQuotes);

        // Assert
        Assert.IsTrue(MockProcessQuotes.IsInvoked_MakeAndPostOrders(), 'MakeAndPostOrders should be invoked');
    end;

}
