#!/bin/bash

# Puppet Task Name: killprocess
#
# This is where you put the shell code for your task.
#
# You can write Puppet tasks in any language you want and it's easy to
# adapt an existing Python, PowerShell, Ruby, etc. script. Learn more at:
# https://puppet.com/docs/bolt/0.x/writing_tasks.html
#
# Puppet tasks make it easy for you to enable others to use your script. Tasks
# describe what it does, explains parameters and which are required or optional,
# as well as validates parameter type. For examples, if parameter "instances"
# must be an integer and the optional "datacenter" parameter must be one of
# portland, sydney, belfast or singapore then the .json file
# would include:
#   "parameters": {
#     "instances": {
#       "description": "Number of instances to create",
#       "type": "Integer"
#     },
#     "datacenter": {
#       "description": "Datacenter where instances will be created",
#       "type": "Enum[portland, sydney, belfast, singapore]"
#     }
#   }
# Learn more at: https://puppet.com/docs/bolt/0.x/writing_tasks.html#ariaid-title11
#

# Set the varibles
process=$PT_processid
signal=$PT_signal


ps -q $process
if [ $? -ne 0 ]
then
    echo "Process $process does not exist"
    exit 1
else
    echo "Process $process exits going to kill now"
fi

echo kill -$signal $process

`kill -$signal $process`

if [ $? -ne 0 ]
then
    echo "failed to kill process, maybe you do not have the requried permissions"
    exit 1
else
    echo "Kill process successfully :)"
    exit 0
fi