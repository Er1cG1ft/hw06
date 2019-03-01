# Hw06

## Design Choices

Users: 
Fields: First Name, Last Name, Email, Admin
Log in with email. Anyone can make an account on register page, only admins can view and add new users.  
admin@gmail.com is provided to log in as an admin.  user@gmail.com is provided as a regular user.

Tasks:
Fields: Title, Description, Completed, Assigned_user
Assigned_user is a FK to Users, to assign a task to a user.  Is nullable, so a task can be unassigned.
Assignee can be set on creation or on the edit page.

TaskTime:
Fields: Time, User_id, Task_id
User_id is a FK to Users. Task_id is a FK to Tasks.  This allows the logged time to be listed on the show page of a task, with the User who logged it.
This allows different users to log time, as long as they are assigned.  The timestamp of when the work is logged is also listed
so people looking at the task can see when work was logged and by whom.
