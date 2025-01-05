@isTest
public with sharing class QueueableApexTest {
    public QueueableApexTest() {

    }
    @TestSetup
    static void makeData(){
        List<Account> accRecs=new List<Account>();
        for(Integer i=0;i<100;i++){
            Account a=new Account(Name='Test '+i);
            accRecs.add(a);
        }
        insert accRecs;
    }
    @isTest
    public static void testMethodq() {
        List<Account>accRecs=[SELECT ID,AnnualRevenue FROM Account WHERE Name LIKE '%Test%'];
        QueableApex qa=new QueableApex(accRecs);
        Test.startTest();
        Id queueId=System.enqueueJob(qa);
        Test.stopTest();
        System.assertEquals(122,[SELECT ID,AnnualRevenue FROM Account WHERE Name LIKE '%Test%'][0].AnnualRevenue,'Assertion Failed');
    }
}