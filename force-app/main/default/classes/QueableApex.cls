public with sharing class QueableApex implements Queueable {
    Private List<Account> accRec=new List<Account>();
    public QueableApex(List<Account> acc) {
        this.accRec=acc;
    }
    public void execute(QueueableContext qc){
        for(Account a:accRec){
            a.AnnualRevenue=122;
        }
        update accRec;
    }
}