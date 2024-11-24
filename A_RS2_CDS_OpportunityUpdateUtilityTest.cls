@isTest (seealldata = true)
public class A_RS2_CDS_OpportunityUpdateUtilityTest
{
   public static testMethod void testOppUpdateUtility6()
    {
     RS2_OpportunityUpdate.RS2_OpportunityRequestInfo OppRequestInfo = new RS2_OpportunityUpdate.RS2_OpportunityRequestInfo();
     Date mydate = Date.valueOf(system.today());
     Id devRecordTypeforAccount = Schema.SObjectType.account.getRecordTypeInfosByName().get('End Customer').getRecordTypeId(); 
     
     Account Acc = new Account(Name='Test1',partner_id__c = '123456',Partner_Type__c ='test PDS',RecordTypeId = devRecordTypeforAccount);
     Insert Acc;
    
    List<Opportunity> oppList=new List<Opportunity>();
      opportunity opp = new Opportunity(Name='Test1Opp',amount =146.00,Parent_Consolidated__c = true,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
      //Insert opp;
      oppList.add(opp);
      
      Opportunity opp1 = new Opportunity(Name='Test2Opp',amount =196.00,Parent_Consolidated__c = true,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
      //Insert opp1;
      oppList.add(opp1);
      
      Opportunity opp2 = new Opportunity(Name='Test3Opp',amount =180.00,Parent_Consolidated__c = true,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
      //Insert opp2;
      
      oppList.add(opp2);
      
      
      oppList=[select Opportunity_Id__c from opportunity where id in:oppList];
      
      String oppautono = oppList[0].Opportunity_Id__c;
      String opp1autono = oppList[1].Opportunity_Id__c; 
      String opp2autono = oppList[2].Opportunity_Id__c;
      
      List<string> childids = new List<string>{oppautono,opp1autono};
      OppRequestInfo.childOpportunityID = childids; 
      //system.debug('OppRequestInfo.childOpportunityID ...'+OppRequestInfo.childOpportunityID);
      OppRequestInfo.masterOpportunityID = opp2autono;
     
      RS2_OpportunityUpdate.RS2_OpportunityResponseInfo ROResp = new RS2_OpportunityUpdate.RS2_OpportunityResponseInfo();
     
     RS2_CDS_OpportunityUpdateUtility.OpportunityUpdate(OppRequestInfo,ROResp);
     //system.debug('OppRequestInfo..'+OppRequestInfo);
     }
     

   public static testMethod void testOppUpdateUtility1()
   {
   RS2_OpportunityUpdate.RS2_OpportunityRequestInfo OppRequestInfo = new RS2_OpportunityUpdate.RS2_OpportunityRequestInfo();
     Date mydate = Date.valueOf(system.today());
     Id devRecordTypeforAccount = Schema.SObjectType.account.getRecordTypeInfosByName().get('End Customer').getRecordTypeId(); 
     
     Account Acc = new Account(Name='Test1',partner_id__c = '123456',Partner_Type__c ='test PDS',RecordTypeId = devRecordTypeforAccount);
     Insert Acc;
    
    List<Opportunity> oppList=new List<Opportunity>();
      opportunity opp = new Opportunity(Name='Test1Opp',amount =146.00,Parent_Consolidated__c = false,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
      //Insert opp;
      oppList.add(opp);
      
      Opportunity opp1 = new Opportunity(Name='Test2Opp',amount =196.00,Parent_Consolidated__c = false,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
      //Insert opp1;
      oppList.add(opp1);
      
      Opportunity opp2 = new Opportunity(Name='Test3Opp',amount =180.00,Parent_Consolidated__c = false,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
      //Insert opp2;
      
      oppList.add(opp2);
      
      insert oppList;
      
      oppList=[select Opportunity_Id__c from opportunity where id in:oppList];
      
      String oppautono = oppList[0].Opportunity_Id__c;
      String opp1autono = oppList[1].Opportunity_Id__c; 
      String opp2autono = oppList[2].Opportunity_Id__c;
      
      List<string> childids = new List<string>{oppautono,opp1autono};
      OppRequestInfo.childOpportunityID = childids; 
      //system.debug('OppRequestInfo.childOpportunityID ...'+OppRequestInfo.childOpportunityID);
      OppRequestInfo.masterOpportunityID = opp2autono;
     
      RS2_OpportunityUpdate.RS2_OpportunityResponseInfo ROResp = new RS2_OpportunityUpdate.RS2_OpportunityResponseInfo();
     
     RS2_CDS_OpportunityUpdateUtility.OpportunityUpdate(OppRequestInfo,ROResp);
     //system.debug('OppRequestInfo..'+OppRequestInfo);
     }
     
    public static testMethod void testOppUpdateUtility2()
    {
     RS2_OpportunityUpdate.RS2_OpportunityRequestInfo ROReq1 = new RS2_OpportunityUpdate.RS2_OpportunityRequestInfo();
     
     try{
         List<string> st= new List<string>();
         ROReq1.childOpportunityID=st;
         ROReq1.masterOpportunityID='';         
         //RS2_OpportunityUpdate.updateOpportunityAmount(ROReq1);
         RS2_OpportunityUpdate.RS2_OpportunityResponseInfo ROResp1 = new RS2_OpportunityUpdate.RS2_OpportunityResponseInfo();
         ROResp1.responseCode='ABCD1234';
         ROResp1.responseMessage='QWERTY';
         RS2_CDS_OpportunityUpdateUtility.OpportunityUpdate(ROReq1,ROResp1);
     }catch(Exception e){
         System.debug('Error in Test Method');
     }
    }
  
  public static testMethod void testOppUpdateUtility3()
    {
     RS2_OpportunityUpdate.RS2_OpportunityRequestInfo ROReq1 = new RS2_OpportunityUpdate.RS2_OpportunityRequestInfo();
     
     try{
        Id devRecordTypeforAccount = Schema.SObjectType.account.getRecordTypeInfosByName().get('End Customer').getRecordTypeId(); 
        Account Acc = new Account(Name='Test1',partner_id__c = '123456',Partner_Type__c ='test PDS',RecordTypeId = devRecordTypeforAccount);
        Insert Acc;
        Date mydate = Date.valueOf(system.today());
        
        List<Opportunity> oppList=new List<Opportunity>();
        
        opportunity opp = new Opportunity(Name='Test1Opp',amount =146.00,Parent_Consolidated__c = false,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
        //Insert opp;
        oppList.add(opp);
        
        Opportunity opp1 = new Opportunity(Name='Test2Opp',amount =196.00,Parent_Consolidated__c = false,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
        //Insert opp1;
        oppList.add(opp1);
        
        insert oppList;
        
        oppList=[select Opportunity_Id__c from opportunity where id in :oppList];
        
        String oppautono = oppList[0].Opportunity_Id__c;
        String opp1autono = oppList[1].Opportunity_Id__c; 
        
         List<string> st= new List<string>{oppautono,opp1autono};
         ROReq1.childOpportunityID=st;
         ROReq1.masterOpportunityID='';         
         RS2_OpportunityUpdate.RS2_OpportunityResponseInfo ROResp1 = new RS2_OpportunityUpdate.RS2_OpportunityResponseInfo();
         ROResp1.responseCode='ABCD1234';
         ROResp1.responseMessage='QWERTY';
         RS2_CDS_OpportunityUpdateUtility.OpportunityUpdate(ROReq1,ROResp1);
     }catch(Exception e){
         System.debug('Error in Test Method');
     }
    }
  
  public static testMethod void testOppUpdateUtility4()
    {
     RS2_OpportunityUpdate.RS2_OpportunityRequestInfo ROReq1 = new RS2_OpportunityUpdate.RS2_OpportunityRequestInfo();
     
     try{
        Id devRecordTypeforAccount = Schema.SObjectType.account.getRecordTypeInfosByName().get('End Customer').getRecordTypeId(); 
        Account Acc = new Account(Name='Test1',partner_id__c = '123456',Partner_Type__c ='test PDS',RecordTypeId = devRecordTypeforAccount);
        Insert Acc;
        
        Date mydate = Date.valueOf(system.today());
        
        opportunity opp = new Opportunity(Name='Test1Opp',amount =146.00,Parent_Consolidated__c = false,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
        Insert opp;
      
        String oppautono = [select Opportunity_Id__c from opportunity where id=:opp.Id].Opportunity_Id__c;
      
        List<string> st =  new List<string>();
         ROReq1.childOpportunityID=st;
         ROReq1.masterOpportunityID=oppautono;         
         RS2_OpportunityUpdate.RS2_OpportunityResponseInfo ROResp1 = new RS2_OpportunityUpdate.RS2_OpportunityResponseInfo();
         ROResp1.responseCode='ABCD1234';
         ROResp1.responseMessage='QWERTY';
         RS2_CDS_OpportunityUpdateUtility.OpportunityUpdate(ROReq1,ROResp1);
     }catch(Exception e){
         System.debug('Error in Test Method');
     }
    }
  
  
  public static testMethod void testOppUpdateUtility5()
    {
     RS2_OpportunityUpdate.RS2_OpportunityRequestInfo ROReq1 = new RS2_OpportunityUpdate.RS2_OpportunityRequestInfo();
     
     try{
        Id devRecordTypeforAccount = Schema.SObjectType.account.getRecordTypeInfosByName().get('End Customer').getRecordTypeId(); 
        Account Acc = new Account(Name='Test1',partner_id__c = '123456',Partner_Type__c ='test PDS',RecordTypeId = devRecordTypeforAccount);
        Insert Acc;
        Date mydate = Date.valueOf(system.today());
        
        List<Opportunity> oppList=new List<Opportunity>();
        
        opportunity opp = new Opportunity(Name='Test1Opp',amount =146.00,Parent_Consolidated__c = false,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
        //Insert opp;
        oppList.add(opp);
        
        Opportunity opp1 = new Opportunity(Name='Test2Opp',amount =196.00,Parent_Consolidated__c = false,StageName='03-Validate',accountId=acc.id,closedate=mydate,CurrencyIsoCode= 'USD');
        //Insert opp1;
        oppList.add(opp1);
        insert oppList;
        
        oppList=[select Opportunity_Id__c from opportunity where id in:oppList];
        
        String oppautono = oppList[0].Opportunity_Id__c;
        String opp1autono = oppList[1].Opportunity_Id__c; 
        
         List<string> st= new List<string>{oppautono};
         ROReq1.childOpportunityID=st;
         ROReq1.masterOpportunityID= opp1autono;         
         RS2_OpportunityUpdate.RS2_OpportunityResponseInfo ROResp1 = new RS2_OpportunityUpdate.RS2_OpportunityResponseInfo();
         ROResp1.responseCode='ABCD1234';
         ROResp1.responseMessage='QWERTY';
         RS2_CDS_OpportunityUpdateUtility.OpportunityUpdate(ROReq1,ROResp1);
     }catch(Exception e){
         System.debug('Error in Test Method');
     }
    }
  
  
 

}
