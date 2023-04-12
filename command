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

## Tekton
- Create task and pipeline yaml then run
 $ kubectl apply -f tasks.yaml
 $ kubectl apply -f pipeline.yaml
 $ tkn pipeline start hello-pipeline \
    --showlog  \
    -p message="Hello Tekton!"
 $ tkn pipeline start cd-pipeline \
    --showlog \
    -p repo-url="https://github.com/yusuf-inci/github-actions-CICD_PracticeCode.git" \
    -p branch="main"

### lab2
- create eventlistener.yaml
- Apply the EventListener resource to the cluster:
 $ kubectl apply -f eventlistener.yaml
- Check that it was created correctly.
 $ tkn eventlistener ls

- create triggerbinding.yaml
- Apply the new TriggerBinding definition to the cluster:
 $ kubectl apply -f triggerbinding.yaml

- create triggertemplate.yaml
- Apply the new TriggerTemplate definition to the cluster:
 $ kubectl apply -f triggertemplate.yaml

- Start a Pipeline Run
- Terminal 1: Use the kubectl port-forward command to forward port 8090 to 8080.
 $ kubectl port-forward service/el-cd-listener  8090:8080
You will see the following output, but you will not get your cursor back.
Forwarding from 127.0.0.1:8090 -> 8080
Forwarding from [::1]:8090 -> 8080
-  Terminal 2: 
 $ curl -X POST http://localhost:8090 \
  -H 'Content-Type: application/json' \
  -d '{"ref":"main","repository":{"url":"https://github.com/yusuf-inci/github-actions-CICD_PracticeCode"}}'

- This should start a PipelineRun. You can check on the status with this command:
 $ tkn pipelinerun ls
- You should see something like this come back:
NAME                    STARTED          DURATION   STATUS
cd-pipeline-run-hhkpm   10 seconds ago   ---        Running
￼Copied!
- You can also examine the PipelineRun logs using this command (the -L means “latest” so that you do not have to look up the name for the last run):
 $ tkn pipelinerun logs --last
[clone : checkout] Cloning into 'wtecc-CICD_PracticeCode'...
[lint : echo-message] Calling Flake8 linter...
[tests : echo-message] Running unit tests with PyUnit...
[build : echo-message] Building image for https://github.com/ibm-developer-skills-network/wtecc-CICD_PracticeCode ...
[deploy : echo-message] Deploying master branch of https://github.com/ibm-developer-skills-network/wtecc-CICD_PracticeCode ...



