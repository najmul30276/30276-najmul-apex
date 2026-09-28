public with sharing class Question1 {
    // A
    public static Account getAccountRelatedData(String Id){
        Account acc = [SELECT Id, Name, (SELECT Id, Name, Email, Phone FROM Contacts),(SELECT Id, Name, StageName, Amount, CloseDate FROM Opportunities) FROM Account WHERE Id = :Id];
        
        return acc;
    }

    //B
    [FIND Text In ALL FIELDS RETURNING (Name FROM Account),(Name FROM Contact) ]
    //The selected query mechanism is suitable beacause we don't know the exact field to query. We use SELECT .... FROM .... for the known query. Where we know we need exact this field and records but when we don't know we use SOSL to achieve the result.


    //C
    // To respect Record level and field lavel access we have to use WITH USER_MODE and with sharing like this. It will respect the access level before execute anything.

    //D
    //I will redesign the method with accepts List of ids. At firs we will take a Set<id> ids then store all the id inside it then I will modify the SOQL with IN :Ids.
}


/**
 

 */