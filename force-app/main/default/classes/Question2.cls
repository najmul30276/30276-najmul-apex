public with sharing class Question {
    //A
    /**
     * Four technical problems are:
     * 1.We use SOQL inside Loop.
     * 2. We can get opportunity also with the account so we don't need anothe SOQL to retrive opportunity.
     * 3. We are trying to perform DML operation inside trigger which is not recommended and can create infinite loop.
     * 4. We are using after event but doint before event things. Only we use after if we are creating another object record like auditLog etc.
     */

    //B
    //It will violate apex governor limit because of multiple DB call and DML operation. We call SOQL inside loop which will create governor issue it hold 100 for normal and 200 for async call limit. Also DML operation will create issue can create infinite loop. So we cann;t process data or transaction properly.

    //C
    trigger OpportunityTrigger on Opportunity (before insert, before update) {
        Set<Id> Ids = new<Id>();

        for (Opportunity opp : Trigger.new) {
            Ids.add(opp.Id);
        }

        List<Opportunity> opportunities = [
            SELECT Id, Amount
            FROM Opportunity
            WHERE Account.AccountId IN :Ids
        ];

        Decimal totalAmount = 0;
        for (Opportunity item : opportunities) {
                if (item.Amount != null) {
                totalAmount += item.Amount;
          }
        }

        if (totalAmount >= 5000000) {
            acc.Strategic__c = true;
        }

    }

//D
// Here I will organize the trigger to keep it simple. I will write all the business login inside a resuable handler method and i will call that and pass the value to perform the business logic. It's good if we make our trigger simple it's help us to understand the trigger easily. Also i will add few check before execute like will check IsBefore, IsAfter, IsIntsert with this builtin method to keep safe the trigger multiple operation.


}