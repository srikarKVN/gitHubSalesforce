@isTest
public with sharing class OppProcessorTest {
    public OppProcessorTest() {

    }
    @isTest
    public static void MethodTest() {
        
        List<Account> acc=new List<Account>();
        List<Account> acc2=new List<Account>();
        List<Id> accId=new List<Id>();
        for(Integer i=0;i<10;i++){
            Account a=new Account(Name='Test' + i);
            acc.add(a);
        }
        insert acc;
        for(Account a:acc){
            accId.add(a.Id);
        }
        Test.startTest();
        OppProcessor op=new OppProcessor();
        Id batchId=Database.executeBatch(op);
        Test.stopTest();
        List<Account>accUp=[SELECT ID,(SELECT ID from Contacts) FROM Account WHERE ID IN :accId];
        System.assertEquals(true,accUp[0].Contacts.size()>0);
    }
}