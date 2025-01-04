@isTest
public with sharing class ContactCalculatorTest {
    public ContactCalculatorTest() {

    }
    @isTest
    public static void Method() {
        List<Account> TestAccounts=new List<Account>();
        List<Account> TestAccounts2=new List<Account>();
        List<Contact> contacts=new List<Contact>();
        List<Id> TestAccId=new List<Id>();
        for(Integer i=0;i<5;i++){
            Account a=new Account();
            a.Name='Test '+i;
            TestAccounts2.add(a);
            // TestAccId.add(a.Id);
            // Contact c=new Contact(LastName='Test'+a.Name,FirstName='Test',AccountId=a.id);
            // insert c;
        }
        insert TestAccounts2;
        for(Account a:TestAccounts2){
            Contact c=new Contact(LastName='Test'+a.Name,FirstName='Test',AccountId=a.id);
            contacts.add(c);
            TestAccId.add(a.Id);
        }
        insert contacts;
        Test.startTest();
        ContactsCalculator.calculateContacts(TestAccId);
        Test.stopTest();
        TestAccounts=[SELECT ID,Number_Of_Contacts__c FROM Account WHERE ID in :TestAccId];
        System.assertEquals(1,TestAccounts[0].Number_Of_Contacts__c,'Assertion Failed');
    }
}