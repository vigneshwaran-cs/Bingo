public with sharing class loginController {
    public String userEmail {get; set;}
    public boolean getInput {get; set;}
    public List<Customer__c> customerObjList {get; set;}
    public loginController() {
        getInput = True;
        customerObjList = new List<Customer__c>();
    }
    public void searchUserName() {
        getInput = False;
        customerObjList = [SELECT Name, UserEmail_ID__c FROM Customer__c WHERE UserEmail_ID__c =: userEmail];
    }
}