# Instructions and Useful Commands
You will find instructions and useful commands below

## Generate GitHub Personal Access Token
Create personal access token to authenticate with GitHub. The minimum required scopes needed for this: repo, read:org, and workflow. Warning: Keep your tokens safe and protect them like passwords.
 $ gh auth login
- If working in the terminal becomes difficult because the command prompt is very long, you can shorten the prompt using the following command:
$ export PS1="[\[\033[01;32m\]\u\[\033[00m\]: \[\033[01;34m\]\W\[\033[00m\]]\$ "

## Create a Workflow
 $ mkdir -p .github/workflows
 $ touch .github/workflows/workflow.yml
Once you configure your workflow.yml The pipeline will run automatically when you commit your code to the GitHub repository based on the events described in the workflow.

### Explanation: 
- flake8 service --count --select=E9,F63,F7,F82 --show-source --statistics
--count : shows the count of all warnings and errors in the result of the command
--select=E9,F63,F7,F82 : limits the checks to syntax errors
--show-source : adds the actual line number where the error/warning is found
--statistics : shows the count of each type of error and warning in the result
- flake8 service --count --max-complexity=10 --max-line-length=127 --statistics
Unlike the first command that checks for syntax errors only, the second command will run all the available checks on the service folder of your repository.

