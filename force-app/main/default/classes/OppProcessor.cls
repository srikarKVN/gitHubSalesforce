public with sharing class OppProcessor implements Database.Batchable<SObject>,Database.stateful {
    public OppProcessor() {

    }
    public Integer recordCount=0;
    public Database.QueryLocator start (Database.BatchableContext bc){
           return Database.getQueryLocator([SELECT ID,Name FROM Account]);
    }
    public void execute(Database.BatchableContext bc,List<Account> acc){
           List<Contact> conList=new List<Contact>();
           for(Account a:acc){
             Contact c=new Contact(LastName=recordCount+'Test'+a.Name,AccountId=a.Id);
             conList.add(c);
             recordCount=recordCount+acc.size();
           }
           insert conList;
    }
    public void finish(Database.BatchableContext bc){
            
    }
}
