//
//  XYZAddNewEventViewController.m
//  MomentNotice
//
//  Created by LiuLeon on 10/25/2013.
//  Copyright (c) 2013 LiuLeon. All rights reserved.
//

#import "XYZAddNewEventViewController.h"


#define DBNAME    @"moment.sqlite"
#define TITLE      @"title"
#define EVENT      @"event"
#define TABLENAME @"EVENTS"

@interface XYZAddNewEventViewController ()
@property (weak, nonatomic) IBOutlet UITextField *EventTitle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation XYZAddNewEventViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if(sender != self.doneButton)
        return;
    if(self.EventTitle.text.length > 0)
    {
        self.addEventItem = [[XYZEventItem alloc] init];
        self.addEventItem.eventName = self.EventTitle.text;
        self.addEventItem.completed = NO;
    }
        
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
	// Do any additional setup after loading the view.
    [super viewDidLoad];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"open fails");
    }
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS EVENTS (ID INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT)";
    [self execSql:sqlCreateTable];
    NSString *sql1 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@') VALUES ('%@')",
                      TABLENAME, TITLE,self.EventTitle.text];
    [self execSql:sql1];
    sqlite3_close(db);

}
-(void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"fails operating data");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
