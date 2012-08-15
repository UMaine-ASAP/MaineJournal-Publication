//
//  ViewController.m
//  DatabaseConnection
//
//  Created by admin on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
// Need to import the classes that defined and filled the array with data
#import "EmployeeList.h"
#import "ASAPEmployeeList.h"

@implementation ViewController

@synthesize imageView;
@synthesize employeePosition;
@synthesize employeeName;
@synthesize employees;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	// When the view loads it is populated with the first database table item
	// Initialize the list of employees
	ASAPEmployeeList *employeeList = [[ASAPEmployeeList alloc]init];
	
	//Grabs the data in the table
	self.employees = [employeeList getEmployees];
	
	// Populate initial view on the app (one image and two labels in this case)
	[self.imageView setImage:((EmployeeList *) [self.employees objectAtIndex:0]).image];
	[self.employeeName setText:((EmployeeList *) [self.employees objectAtIndex:0]).employeeName];
	[self.employeePosition setText:((EmployeeList *) [self.employees objectAtIndex:0]).employeePosition];
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	// Deallocate EVERYTHING!!!!!! (if everything should be deallocated at least)
	[self setEmployeeName:nil];
	[self setEmployeePosition:nil];
	[self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// The action that occurs when "Next Employee" is clicked
- (IBAction)GetEmployeeList:(id)sender {
	
	// Defines currentIndex which will track progress through the array
	static NSInteger currentIndex = 0;
	
	// If the employee list reaches the end, go back to the beginning
	if(++currentIndex == [self.employees count]) {
		currentIndex = 0;
		
		// This works like the code explained above in viewDidLoad
		EmployeeList *anEmployee = (EmployeeList *) [self.employees objectAtIndex:currentIndex];
		[self.employeeName setText:anEmployee.employeeName];
		[self.employeePosition setText:anEmployee.employeePosition];
		[self.imageView setImage:anEmployee.image];
	}
	// If employeelist does not equal the end, keep progressing through array
	else {
		// NOTE: I'm going to try and modify this so that this block of code only has
		// to show up in the else (removed from the if)
		EmployeeList *anEmployee = (EmployeeList *) [self.employees objectAtIndex:currentIndex];
		[self.employeeName setText:anEmployee.employeeName];
		[self.employeePosition setText:anEmployee.employeePosition];
		[self.imageView setImage:anEmployee.image];
	}
}

// Standard shiz from here on out
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
