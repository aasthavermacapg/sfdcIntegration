@RestResource(urlMapping='/studentsInfo/*')
global class StudentInformationService
{
  global class StudentInfo
  {
      String studentName{get;set;}
      String studentAddress{get;set;}
      String studentEmail{get;set;}
      String schoolName{get;set;}
      
  
  }
  
  @httpGet
  global static StudentInfo getStudent()
  {
      RestRequest request=RestContext.Request;
        String studentId= request.requestURI.substring(request.RequestURI.lastIndexOf('/')+1);
        student__c student=[select id, Name, Address__c,Email__c,School__r.Name from Student__c where id=:studentId];
         StudentInfo stdInfo=new StudentInfo();
         stdInfo.studentName=student.Name;
         stdInfo.studentAddress=student.Address__c;
         stdInfo.studentEmail=student.Email__c;
         stdInfo.schoolName=student.school__r.Name;
         
         return stdInfo;
  }
}