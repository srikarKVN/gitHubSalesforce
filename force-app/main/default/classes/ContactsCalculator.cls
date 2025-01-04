public with sharing class ContactsCalculator {
    // public ContactsCalculator() {
    // }

    @future
    public static void calculateContacts(List<Id> accIds) {
        List<Account>accRecs=[SELECT ID,(SELECT ID FROM Contacts) FROM Account WHERE ID in : accIds];
        for(Account a :accRecs){
           a.Number_Of_Contacts__c=a.Contacts.size();
        }
        update accRecs;
    }

}