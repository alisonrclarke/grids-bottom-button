//
//  ViewController.m
//  AddButtonGrid
//
//  Created by Chris Grant on 20/05/2013.
//  
//  Copyright 2013 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ViewController.h"
#import <ShinobiGrids/ShinobiDataGrid.h>
#import "AddButtonDataSource.h"

#define BUTTON_PADDING 10
#define BUTTON_HEIGHT 44

@interface ViewController () <SDataGridDelegate>
@end

@implementation ViewController {
    ShinobiDataGrid *_grid;
    AddButtonDataSource *_dataSource;
    UIScrollView *_scrollView;
    UIButton *_button;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _dataSource = [AddButtonDataSource new];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollView];
    
    _grid = [[ShinobiDataGrid alloc] initWithFrame:self.view.bounds];
    _grid.defaultColWidth = [NSNumber numberWithFloat:self.view.bounds.size.width / 5];
    _grid.defaultRowHeight = @40;
    
    // Add the columns
    for (int i=0; i<5; i++)
    {
        SDataGridColumn* column = [[SDataGridColumn alloc] initWithTitle:[NSString stringWithFormat:@"Column %d", (i+1)]];
        [_grid addColumn:column];
    }
    
    [_grid setDataSource:_dataSource];
    [_grid setDelegate:self];
    [_grid setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [_scrollView addSubview:_grid];
    
    // Add a button to use at the bottom of the grid.
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, BUTTON_HEIGHT)];
    [_button setBackgroundColor:[UIColor redColor]];
    [_button setTitle:@"Add Row" forState:UIControlStateNormal];
    [_button setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
    [_button addTarget:self action:@selector(addRow) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_button];
}

// Recalculate where the button should be positioned.
-(void)recalculateButtonPosition {
    [_button setCenter:CGPointMake(_grid.center.x, (-_grid.contentOffset.y) + _grid.contentSize.height + (BUTTON_HEIGHT / 2) + BUTTON_PADDING)];
    CGRect frame = _grid.frame;
    frame.size.height = _grid.contentSize.height;
    _grid.frame = frame;    
    [_scrollView setContentSize:CGSizeMake(frame.size.width, frame.size.height + BUTTON_HEIGHT + BUTTON_PADDING *2)];
}

// Tell the datasource to add a row to its data.
-(void)addRow {
    [_dataSource addRow];
    [_grid reload];
    [self recalculateButtonPosition];
}

#pragma mark - SGridDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView*)scrollView {
    [self recalculateButtonPosition];
}

#pragma mark - View Lifecycle Methods

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self recalculateButtonPosition];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self recalculateButtonPosition];
}

@end