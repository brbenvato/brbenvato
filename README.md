# Project Overview

This project involves creating multiple branches and executing workflows using GitHub Actions. However, due to race conditions that occur when multiple developers pu
sh their changes simultaneously, only a subset of the workflows are executed.

## File Structure

- **c**: This is a small script responsible for creating the branches. It triggers the execution of the create.yaml workflow.
- **create.yaml**: This workflow file is triggered by c script. It, in turn, executes another small script developed to address race condition issues.

## Race Condition Solution

To mitigate the race condition problem that arises when multiple developers push their changes concurrently, a custom script has been developed. This script is execu
ted by the create.yaml workflow and implements a solution to ensure that all necessary workflows are executed correctly.

## Usage

1. Run the c script to create the required branches.
2. The create.yaml workflow will be triggered automatically by c script.
3. The race condition solution script will be executed as part of the create.yaml workflow to handle concurrent branch creation and ensure proper execution of all wo
rkflows.
