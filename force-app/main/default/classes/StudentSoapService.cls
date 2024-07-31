global class StudentSoapService
{
    webservice static Student__c getStudent(String studentId)
    {
        Student__c student=[SELECT Id, Name, Contact_Number__c, School__c, Email__c FROM Student__c WHERE Id =: studentId];
        return student;
    }
}