//
//  Task.m
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "Task.h"
#import "Printer.h"
#import "Text.h"
#import "Page.h"
#import "Document.h"

@implementation Task

/* MAIN TASK:

 Fix all memory management issues.

 What is allowed to do:
 - add retain, release, autolease calls;
 - implement dealloc method;
 - change property ownership attributes;
 - modify property setters;
 - contact lecturer/mentor if the task description is unclear for you or
   if you have any difficulties, tried to figure out youself and tried to
   find answers in the lecture/documentation but without success.

 What is forbidden to do:
 - move existing code from one place to another;
 - delete existing code;
 - change app logic;

 Check yourself using special instruments and by crosscheck :)

 Good luck!

*/

- (void)execute {
    Printer *printer = [[Printer alloc] init];

    Text *welcomeText = [Text textWithContent:@"Hello, welcome to the first MRC task"];

    [printer printObject:welcomeText];

    Page *titlePage = [self getTitlePage];
    Page *mainPage = [self getMainPage];
    Page *lastPage = [self getLastPage];

    Text *documentTitle = [[Text alloc] initWithContent:@"Very useful document"];

    Document *document = [[Document alloc] initWithTitle: documentTitle];

    [documentTitle release];

    [document addPage:titlePage];
    [document addPage:mainPage];
    [document addPage:lastPage];

    titlePage.document = document;
    mainPage.document = document;
    lastPage.document = document;

    [printer printObject:document];
}

- (Page *)getTitlePage {
    NSString *title = [[NSString alloc] initWithUTF8String:"How to become the best iOS developer?"];
    Text *text = [[Text alloc] initWithContent:title];

    Page *page = [[Page alloc] init];
    page.number = 1;
    page.text = text;

    return page;
}

- (Page *)getMainPage {
    NSString *title = [[NSString alloc] initWithUTF8String:"You need to learn the materials, practice a lot and believe in yourself!"];
    Text *text = [[Text alloc] initWithContent:title];

    Page *page = [Page pageWithText:text];
    page.number = 2;
    page.text = text;

    return page;
}

- (Page *)getLastPage {
    NSString *title = [[NSString alloc] initWithUTF8String:"Good luck!"];
    Text *text = [Text textWithContent:title];
    Text *hiddenText = [[Text alloc] initWithContent:@"With love from RSSchool :)"];

    Page *page = [[Page alloc] init];
    page.number = 3;
    page.text = text;
    page.hiddenText = hiddenText;

    [hiddenText release];

    return page;
}

@end
