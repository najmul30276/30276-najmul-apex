public with sharing class Question4 {
    //A
    // In this context the developer didn't ensure the class and SOQL query access or sharinng things. for the field level FLS we use WITH USER_MODE with the SOQL query and for the record level we write class with sharing or without sharing context. So here both things are missing thats why any user can access.

    //B
    public with sharing class void getData(){
        //rest of the code
    }

    //C
    //For CRUD and field-level security when we are quering we can use WITH USER_MODE. It will ensure the user permissions first if the user have the permission to access that or not and then if not found it will see the parent label the permission is inherited or not. It check like that to ensure the security of FLS and for the CRUD we have to use the Database.insert(acc, AccessLevel.access) like this. Here i mentioned insert but any kind of CRUD operation we have to use like this.

    //D
    //For the class currently executes it's query and DML operation without user's access it will create inconsistency and data anomalies like other users data update, create etc. He can change the value of an important field like annualRevenue so it is very dangerous for a business where 0.001 cents also matters. So we must have to ensure that we are using with sharing, for DML AccessLevel.access, WITH USER_MODE to ensure the user permissons and security.