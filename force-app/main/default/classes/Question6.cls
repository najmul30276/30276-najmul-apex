//A
//We will create a batch apex for the given requirements where the start method will be responsible for find the data and return it to the execute method. here we will using start method insted of direct query beacuse of start method usr QueryLocator which can process or retrive 50 millions data. And then our execute method will handle our logic for the tier update logic and dml operation and last finish method for now we will log that our batch processing is done.



//B
global class Question6 implements Database.Batchable<Account> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, AnnualRevenue FROM Account');

    }

    global void execute(Database.BatchableContext bc, List<Account> accounts) {
       for(Account acc:accounts){
        if (acc.AnnualRevenue >= 10000000) {
            acc.Customer_Tier__C = 'Enterprise';
        } else if (acc.AnnualRevenue >= 1000000 && acc.AnnualRevenue < 10000000) {
            acc.Customer_Tier__C = 'Medium';
        }else{
             acc.Customer_Tier__C = 'Small';
        }
       }

       update accounts;

    }

    global void finish(Database.BatchableContext bc) {
        System.debug('Sucessfully Updated');
        
    }
}

//C
//Batch apex is a async process where salesforce already given some extra operation limit like for normal the query/transction is 100 but async its 200 and the cpu is 10000 to 60000ms for the async operation. Here the every batch operation this limit is reset to default for that it can execute more operation on data without violating the governor rules. Also we can control it how much records we want to process at a time as a second parameter we pass that. SO it can handle the governor limit, transaction size and overall processing.
