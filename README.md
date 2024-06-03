## Issue: Creation of a couple remote branches, does not trigger the github actions workflow.

What our team has observed is that when we create a couple of branches (in a relatively short span of time)
Is that the branches get created on the remote origin, but not all of them trigger a GitHub-Actions workflow.


This document shows a step-by-step guide to reproduce the issue.
Please note that the issue behaves in a statistical fashion, so it might not be reproduced at the very first try.

### install the ix-cli gem:
```gem install ix-cli --no-doc```
<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/b645920c-2a2a-4021-b2d0-0b57d4b01a3c">

### note that there is a helper script-template called `c` that helps CREATE the branches:
```cat c```
<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/04a83b3d-c29b-432b-9d30-fcffaee32fa5">

### note that there is a helper script-template called `d` that helps DELETE the branches:
```cat d```
<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/357fc374-ce41-4e8c-815a-0d373121e448">

### use the ix-template command to interpolate the values in the script-templates `c` and `d`
<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/ec16536c-8cb6-42d4-b98d-b6c7873e712b">

### we first check the existing branches in repo (local and remote).
```git pull```

```git fetch --prune```

```git branch -a```

<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/f1193ef9-66ce-41ef-8aef-f0cc2cee0d96">

### we will run a generated-script by using our script-template, that will create 5 branches:
```seq 1 5 | ix template c | bash -x```

The script will create 5 branches (from 1 to 5) named `feature/test-1` ~ `feature/test-5`

<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/56a27f46-f32e-40af-a424-1f9f4a75230b">

### we then go and check the status of our branches again.
And we can notice that all branches have been created successfully!
<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/3e87e3fc-2191-4f21-97eb-54160a84d594">

### the issue is that the workflows were only triggered for the first 3 branches.
The other two are missing!
<img width="897" alt="Screenshot 2024-06-03 at 15 30 32" src="https://github.com/placeit-envato/test-race/assets/30967/9fbc5790-8b45-43a5-9448-d84234a872df">

### we also went to check on GitHub if the existance of the other branches is reflected on the site. (they exist!)
<img width="841" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/0227aab0-0944-402e-9f2f-5815bd32f3c2">

### extra: you can use the `d` script to clean up after running some tests!
```seq 1 5 | ix template d | bash -x```
<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/46af5688-7de5-430c-8059-18b1c908831c">

### we validate by checking our local branches.
```git branch -a```
<img width="1040" alt="image" src="https://github.com/placeit-envato/test-race/assets/30967/07b74742-c013-43d9-b0fd-e83c18c9aa1d">


