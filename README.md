# Hw06

## Design Choices

Users: 
Fields: First Name, Last Name, Email, Admin, Manager_id
Log in with email. Anyone can make an account on register page, only admins can view and add new users.  
admin@gmail.com is provided to log in as an admin.  user@gmail.com is provided as a regular user.
Manager_id is a FK to another user record, if null, they don't have a manager.

Tasks:
Fields: Title, Description, Completed, Assigned_user
Assigned_user is a FK to Users, to assign a task to a user.  Is nullable, so a task can be unassigned.
Assignee can be set on creation or on the edit page.

TimeBlock:
Fields: User_id, Task_id, Start, End
User_id is a FK to Users. Task_id is a FK to Tasks.  This allows the logged time to be listed on the show page of a task, with the User who logged it.
This allows different users to log time, as long as they are assigned.  The start and end times are listed on a task
so everyone can see when the work was performed.  If a user hasn't listed a time, 'currently working' is displayed as the end time.
