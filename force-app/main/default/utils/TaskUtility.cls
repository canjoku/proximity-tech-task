public with sharing class TaskUtility implements Queueable {
    private Contact cn;

    public TaskUtility(Contact cn) {
        this.cn = cn;
    }
    public void execute(QueueableContext context) {
        Task newTask = new Task();
        List<Task> newTaskList = new List<Task>();
        Date today = Date.today();
        List<Contact> insertedContact = [SELECT Id, Name, OwnerId, (Select Id, Status, Priority, CaseNumber From Cases) FROM Contact WHERE Id = :cn.Id];
        newTask.Status = 'Not Started';
        newTask.Subject = 'Welcome call for ' + insertedContact[0].Cases[0].CaseNumber;
        newTask.Priority = 'Normal';
        
        switch on insertedContact[0].Cases[0].Priority {
            when 'High' {
                newTask.ActivityDate = today + 7;
            }
            when 'Medium' {
                newTask.ActivityDate = today + 14;
            }
            when 'Low' {
                newTask.ActivityDate = today + 21;
            }
        }
        newTask.OwnerId = insertedContact[0].OwnerId;
        newTaskList.add(newTask);
        try {
            insert newTaskList;
        } catch (DmlException ex){
            throw ex;
        }
                
    }

}

