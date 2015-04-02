public class convertQuoteintoOrder{


public convertQuoteintoOrder(){
}
public PageReference createOrder(){
system.debug('11111111111111111');

Id recordId = ApexPages.currentPage().getParameters().get('Id');

system.debug('22222222222222'+recordId );
quote qte= [select AdditionalName,Opportunity.Account.Name,Opportunity.Name,Description, Contact.FirstName,Contact.LastName,BillingName,Discount,Email,ExpirationDate,GrandTotal,Phone,Name,QuoteNumber,QuoteToName,ShippingHandling,ShippingName,Status,Subtotal,IsSyncing,Tax,TotalPrice from quote where id=:recordId];
system.debug('44444444444444'+qte );
//if(qte.size()>0){
system.debug('333333333333333');
Orders__c ord = new Orders__c();

ord.Additional_To_Name__c=qte.AdditionalName;
ord.Bill_To_Name__c=qte.BillingName;
ord.Discount__c=qte.Discount;
ord.Email__c=qte.Email;
ord.Expiration_Date__c=qte.ExpirationDate;
ord.Grand_Total__c=qte.GrandTotal;
ord.Phone__c=qte.Phone;
//ord.Quote_Number__c=qte.QuoteNumber;
ord.Quote_To_Name__c=qte.Name;
ord.Shipping_and_Handling__c=qte.ShippingHandling;
ord.Ship_To_Name__c=qte.ShippingName;
ord.Status__c=qte.Status;
ord.Subtotal__c=qte.Subtotal;
ord.Syncing__c=qte.IsSyncing;
ord.Tax__c=qte.Tax;
ord.Account_Name__c=qte.Opportunity.Account.Name;
ord.Opportunity_Name__c=qte.Opportunity.Name;
ord.Contact_Name__c=qte.Contact.FirstName+qte.Contact.LastName;
ord.Description__c=qte.Description;


insert ord;
system.debug('5555555555'+ord.Id);
//string url= 'https://ap1.salesforce.com/a0R/o';
PageReference pageRef = new PageReference('/'+ord.Id);
pageRef.setRedirect(true);
return pageRef;

}
}