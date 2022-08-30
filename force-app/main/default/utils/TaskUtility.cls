public with sharing class TaskUtility {
    public static void createTask(Case cs) {
        Date today = Date.today();
        Task newTask = new Task();
        newTask.Status = 'Not Started';
        newTask.Subject = 'Welcome call for ';
        newTask.Priority = 'Normal';
        
        switch on cs.Priority {
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
        newTask.OwnerId = cs.Id;
    }
}
