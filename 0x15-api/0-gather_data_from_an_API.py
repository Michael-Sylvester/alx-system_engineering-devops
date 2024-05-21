#!/usr/bin/python3
"""Module on using APIs"""
import requests
import sys


def todo_list_progress(employee_id):
    # Fetch the employee's TODO list
    todos = requests.get(
        f'https://jsonplaceholder.typicode.com/users/{employee_id}/todos'
    ).json()

    # Fetch the employee's details
    employee = requests.get(
        f'https://jsonplaceholder.typicode.com/users/{employee_id}'
    ).json()

    # Calculate the progress
    total_tasks = len(todos)
    done_tasks = len([todo for todo in todos if todo['completed']])
    employee_name = employee['name']

    # Display the progress
    print(f'Employee {employee_name} is done with\
 tasks({done_tasks}/{total_tasks}):')
    for todo in todos:
        if todo['completed']:
            print('    ' + todo['title'])


# Test the function with an example employee ID
if len(sys.argv) > 1 and sys.argv[1].isdigit():
    todo_list_progress(int(sys.argv[1]))
else:
    todo_list_progress(1)
