public class simplewizard{

public List<Account> accts{get; set;}
private ApexPages.StandardController sc;
public Account acct {get; set;}
 public simplewizard(ApexPages.StandardController standardController)
 {
 // store a reference to the standard controller
 sc = standardController;
 acct=new Account();
 accts= new List<Account>();

 }
 
 public PageReference ToPage2()
{
 
         if( acct.AccountNumber ==null || (acct.AccountNumber !=null && acct.AccountNumber.isNumeric() ==false ))
         {
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid account number'));
           return null;
          }
          
         else if(acct.Phone == null || ( acct.Phone != null && acct.Phone.isNumeric() ==false ))
         {
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter valid phone number'));
             return null;
          }
          
            
          else
          {
        
        PageReference rep= new PageReference('/apex/secondpage');
        rep.setRedirect(false);
        return rep; 
        }
        
    return null;
    
}
public PageReference ToPage3()
{
      if(  (acct.BillingPostalCode !=null && acct.BillingPostalCode.isNumeric() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid billing postal code'));
      return null;
      }
      
      else if(  (acct.ShippingPostalCode!=null && acct.ShippingPostalCode.isNumeric() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid shipping postal code'));
       return null;
      }
      
      else if(  (acct.BillingCity!=null && acct.BillingCity.isAlpha() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid billing City name'));
       return null;
      }
      
     else if(  (acct.BillingState!=null && acct.BillingState.isAlpha() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid billing State name'));
       return null;
      }
      
     else if( (acct.BillingCountry!=null && acct.BillingCountry.isAlpha() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid billing Country name'));
      return null;
      }
      
       else if(  (acct.ShippingCity!=null && acct.ShippingCity.isAlpha() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid shipping City name'));
      return null;
      }
      
      else if(  (acct.ShippingState!=null && acct.ShippingState.isAlpha() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid shipping State name'));
       return null;
      }
      
    if( (acct.ShippingCountry!=null && acct.ShippingCountry.isAlpha() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid  shipping Country name'));
       return null;
      } 
      
      else if( (acct.BillingStreet!=null && acct.BillingStreet.isAlphanumericSpace() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid billing street name'));
       return null;
      } 
      else if(  (acct.ShippingStreet!=null && acct.ShippingStreet.isAlphanumericSpace() ==false ))
     {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid shipping street name'));
       return null;
      } 
      
      else{
      PageReference rep= new PageReference('/apex/thirdpage');
      rep.setRedirect(false);
     return rep;
    }
    
    return null;
  }
    
  public PageReference tsave(){
  insert acct;
  PageReference rep= new PageReference('/'+acct.id);
      rep.setRedirect(true);
     return rep;
  
  }

 
    
}